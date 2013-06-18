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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.jsp.JspException;

/**
 * Wraps the content of the page available only if the user is authenticated.
 * @author platon
 */
public class IsAuthenticatedTag extends SecurityTag{

    private static final Logger LOGGER = LoggerFactory.getLogger(IsAuthenticatedTag.class);

    @Override
    public int doStartTag() throws JspException {
        LOGGER.debug("Starting tag. Let's see if the user's anon");

        String anonUser = getAnonRepositoryUser();
        if (getJcrSession().getUserID().equals(anonUser)) {
            return SKIP_BODY;
        } else {
            return EVAL_BODY_INCLUDE;
        }
    }

    @Override
    public int doEndTag() throws JspException {
        return super.doEndTag();
    }

}
