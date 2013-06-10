package org.apache.sling.additions.service.impl;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.additions.service.SearchService;
import org.apache.sling.api.SlingHttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.NodeIterator;
import javax.jcr.RepositoryException;
import javax.jcr.Session;
import javax.jcr.query.Query;
import javax.jcr.query.QueryManager;
import javax.jcr.query.QueryResult;

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
     * Builds an SQL2 query from a query term.
     * The query term can be one of the following:
     * <ul>
     * <li>a relative path - <i>mysite/path/to/node</i> - in which case the query looks under <code>/apps/</code> and
     * <code>/libs/</code></li>
     * <li>an absolute path - <i>/content/mysite/path</i> </li>
     * <li>none of the above, in which case the query looks everywhere in the repo</li>
     * </ul>
     *
     * @param queryTerm
     * @return a SQL2 query
     */
    private String buildQuery(String queryTerm) {
        if (queryTerm.indexOf("/") > 1) { //assume this is relative path
            return "SELECT * FROM [nt:file] as N WHERE ISDESCENDANTNODE('/apps/" + queryTerm + "') or ISDESCENDANTNODE" +
                    "('/libs/" + queryTerm + "')";
        } else if (queryTerm.indexOf("/") == 0) { //assume this is absolute path
            return "SELECT * FROM [nt:base] as N WHERE ISDESCENDANTNODE('" + queryTerm + "')";
        } else {
            return "SELECT * FROM [nt:base] as N WHERE contains(N.*, '" + queryTerm + "') or LOCALNAME(N) LIKE '%" +
                    queryTerm + "%'";
        }
    }

    /**
     * Queries the repo and returns a list of nodes.
     * The queryString can be anything - path or arbitrary text.
     *
     * @param request   the {@link SlingHttpServletRequest}
     * @param queryTerm the query term
     * @return a {@link NodeIterator} object
     * @throws RepositoryException in case something goes wrong
     */
    public NodeIterator searchNodes(SlingHttpServletRequest request, String queryTerm) throws RepositoryException {
        LOGGER.debug("Search term is {}",queryTerm);
        String queryType = "JCR-SQL2";
        String statement = buildQuery(queryTerm);
        Session session = request.getResourceResolver().adaptTo(Session.class);
        QueryManager queryManager = session.getWorkspace().getQueryManager();
        Query query = queryManager.createQuery(statement, queryType);

        QueryResult result = query.execute();
        return result.getNodes();
    }
}
