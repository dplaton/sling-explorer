package org.apache.sling.explorer.taglib.query;

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

import org.apache.sling.additions.service.SearchService;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.api.scripting.SlingBindings;
import org.apache.sling.api.scripting.SlingScriptHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.RepositoryException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.text.MessageFormat;

/**
 * @author platon
 */
public class SearchByNameTag extends TagSupport {

    private static final Logger LOGGER = LoggerFactory.getLogger(SearchByNameTag.class);

    private static final String CONDITION_PATTERN = "ISDESCENDANTNODE({0})";

    private static final String BASE_PATH_DEFAULT = "/";
    private static final String BASE_TYPE_DEFAULT = "nt:base";

    private String basePath;
    private String baseType;
    private String resultVar;
    private String nodeName;

    /**
     * Builds the query from arguments and delegates the execution to the {@link org.apache.sling.additions.service.SearchService}
     * @return
     * @throws JspException
     */
    @Override
    public int doEndTag() throws JspException {
        LOGGER.debug("Starting search for node name {} (baseName={}, baseType={})", new String[]{nodeName, basePath,
                baseType});

        if (baseType == null || "".equals(baseType)) {
            baseType = BASE_TYPE_DEFAULT;
        }

        String[] basePaths = null;
        if (basePath == null || "".equals(basePath)) {
            basePaths = new String[]{BASE_PATH_DEFAULT};
        } else {
            basePaths = parseBasePaths();
        }

        StringBuilder query = new StringBuilder("SELECT * FROM ");
        query.append("[").append(baseType).append("] AS N ");
        query.append("WHERE ");

        int cntPaths = basePaths.length;
        int idx = 0;
        for (String basePath : basePaths) {
            query.append(buildCondition(basePath));
            if (idx < cntPaths - 1) {
                query.append(" OR ");
            }
            idx++;
        }

        LOGGER.debug("Query built: {}", query.toString());

        final SlingBindings bindings = (SlingBindings) pageContext.getRequest().getAttribute(SlingBindings.class.getName());
        final SlingScriptHelper scriptHelper = bindings.getSling();
        ResourceResolver resolver = scriptHelper.getRequest().getResourceResolver();
        SearchService searchService = scriptHelper.getService(SearchService.class);

        try {
            pageContext.setAttribute(resultVar, searchService.searchNodes(resolver,query.toString()));
        } catch(RepositoryException e) {
            LOGGER.error(e.getMessage(),e);
        }

        return EVAL_PAGE;
    }

    private String[] parseBasePaths() {
        if (basePath.indexOf('|') >= 0) {
            return basePath.split("\\|");
        } else {
            return new String[]{ basePath };
        }
    }

    private String buildCondition(String basePath) {
        return MessageFormat.format(CONDITION_PATTERN, quote(basePath+"/"+nodeName));
    }

    private String quote(String arg) {
        return "'" + arg + "'";
    }

    public String getBasePath() {
        return basePath;
    }

    public void setBasePath(String basePath) {
        this.basePath = basePath;
    }

    public String getBaseType() {
        return baseType;
    }

    public void setBaseType(String baseType) {
        this.baseType = baseType;
    }

    public String getResultVar() {
        return resultVar;
    }

    public void setResultVar(String resultVar) {
        this.resultVar = resultVar;
    }

    public String getNodeName() {
        return nodeName;
    }

    public void setNodeName(String nodeName) {
        this.nodeName = nodeName;
    }
}
