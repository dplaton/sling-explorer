package org.apache.sling.explorer.additions.service;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;

import javax.jcr.NodeIterator;
import javax.jcr.RepositoryException;
import java.util.Iterator;

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
     * @param resourceResolver the {@link ResourceResolver}
     * @param query   the query term
     * @return a {@link NodeIterator} object
     * @throws RepositoryException in case something goes wrong
     */
    public Iterator<Resource> searchNodes(ResourceResolver resourceResolver, String query) throws RepositoryException;

}
