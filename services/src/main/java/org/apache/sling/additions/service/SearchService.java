package org.apache.sling.additions.service;

import org.apache.sling.api.SlingHttpServletRequest;

import javax.jcr.NodeIterator;
import javax.jcr.RepositoryException;

/**
 * Service that implements various search features.
 *
 * @author Daniel Platon (dplaton@gmail.com)
 */
public interface SearchService {

    /**
     * Queries the repo and returns a list of nodes.
     * The queryString can be anything - path or arbitrary text.
     *
     * @param request   the {@link SlingHttpServletRequest}
     * @param queryTerm the query term
     * @return a {@link NodeIterator} object
     * @throws RepositoryException in case something goes wrong
     */
    public NodeIterator searchNodes(SlingHttpServletRequest request, String queryTerm) throws RepositoryException;

}
