package org.apache.sling.explorer.taglib.security;

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

import javax.jcr.GuestCredentials;
import javax.jcr.Repository;
import javax.jcr.RepositoryException;
import javax.jcr.Session;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * @author platon
 */
public class SecurityTag extends BodyTagSupport {

    protected Session  jcrSession;

    protected Session getJcrSession() {
        return jcrSession;
    }

    protected void setJcrSession(Session jcrSession) {
        this.jcrSession = jcrSession;
    }


    protected String getAnonRepositoryUser() {
        Repository currentRepo = jcrSession.getRepository();
        Session tempSession = null;
        try {
            tempSession = currentRepo.login(new GuestCredentials());
            return tempSession.getUserID();
        } catch (RepositoryException e) {
            return "";
        } finally {
            if (tempSession != null) {
                tempSession.logout();
            }
        }

    }

    @Override
    public void setPageContext(PageContext pageContext) {
        super.setPageContext(pageContext);

        final SlingBindings bindings = (SlingBindings) pageContext.getRequest().getAttribute(SlingBindings.class.getName());
        final SlingScriptHelper scriptHelper = bindings.getSling();
        ResourceResolver resourceResolver = scriptHelper.getRequest().getResourceResolver();
        jcrSession = resourceResolver.adaptTo(Session.class);

    }
}
