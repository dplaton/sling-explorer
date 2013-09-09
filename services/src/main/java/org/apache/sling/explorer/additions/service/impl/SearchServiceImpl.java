package org.apache.sling.explorer.additions.service.impl;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.explorer.additions.service.SearchService;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.Node;
import javax.jcr.NodeIterator;
import javax.jcr.RepositoryException;
import javax.jcr.Session;
import javax.jcr.query.Query;
import javax.jcr.query.QueryManager;
import javax.jcr.query.QueryResult;
import java.util.Iterator;

/**
 * Concrete implementation of the {@link SearchService}
 *
 * @author Daniel Platon (dplaton@gmail.com)
 */
@Component
@Service(SearchService.class)
public class SearchServiceImpl implements SearchService {

    private static final Logger LOGGER = LoggerFactory.getLogger(SearchServiceImpl.class);


    /**
     * Queries the repo and returns a list of nodes.
     * The queryString can be anything - path or arbitrary text.
     *
     * @param resourceResolver
     * @param query      the query term
     * @return a {@link NodeIterator} object
     * @throws RepositoryException in case something goes wrong
     */
    public Iterator<Resource> searchNodes(final ResourceResolver resourceResolver,
                                          String query) throws RepositoryException {
        LOGGER.debug("Executing query: {}", query);
        String queryType = Query.JCR_SQL2;
        Session jcrSession = resourceResolver.adaptTo(Session.class);
        QueryManager queryManager = jcrSession.getWorkspace().getQueryManager();
        Query queryObject = queryManager.createQuery(query, queryType);

        QueryResult result = queryObject.execute();
        final NodeIterator iterator = result.getNodes();
        return new Iterator<Resource>() {

            public boolean hasNext() {
                return iterator.hasNext();
            }

            public Resource next() {
                Node theNode = iterator.nextNode();
                Resource res = null;
                try {
                    res = resourceResolver.getResource(theNode.getPath());
                } catch (RepositoryException e) {
                    LOGGER.error(e.getMessage(), e);
                }
                return res;
            }

            public void remove() {
                iterator.remove();
            }
        };
    }
}
