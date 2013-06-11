package org.apache.sling.explorer.taglib;

/*************************************************************************
 *
 * ADOBE CONFIDENTIAL
 * __________________
 *
 *  Copyright 2012 Adobe Systems Incorporated
 *  All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Adobe Systems Incorporated and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to Adobe Systems Incorporated and its
 * suppliers and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Adobe Systems Incorporated.
 **************************************************************************/


import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.api.scripting.SlingBindings;
import org.apache.sling.api.scripting.SlingScriptHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.NodeIterator;
import javax.jcr.RepositoryException;
import javax.jcr.Session;
import javax.jcr.query.Query;
import javax.jcr.query.QueryManager;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author platon
 */
public class XpathQueryTag extends TagSupport {

    private static final Logger LOGGER = LoggerFactory.getLogger(XpathQueryTag.class);
    private String query;
    private String var;

    //todo: implement using SearchService
    @Override
    public int doEndTag() throws JspException {
        LOGGER.debug("Executing xpath query {}", query);

        Session session = getSession();
        String language = Query.XPATH;

        try {
            QueryManager queryManager = session.getWorkspace().getQueryManager();
            Query queryObject = queryManager.createQuery(query, language);
            LOGGER.debug("Returning query results to variable {}",var);
            NodeIterator results = queryObject.execute().getNodes();
            pageContext.setAttribute(var,results);
        } catch (RepositoryException e) {
            LOGGER.error(e.getMessage(), e);
        }

        return EVAL_PAGE;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public String getVar() {
        return var;
    }

    public void setVar(String resultsVar) {
        this.var = resultsVar;
    }

    /**
     * Method for retrieving the ResourceResolver from the page context.
     *
     * @return the resource resolver
     */
    protected Session getSession() {
        final SlingBindings bindings = (SlingBindings) pageContext.getRequest().getAttribute(SlingBindings.class.getName());
        final SlingScriptHelper scriptHelper = bindings.getSling();
        final ResourceResolver resolver = scriptHelper.getRequest()
                .getResourceResolver();
        return resolver.adaptTo(Session.class);
    }

}
