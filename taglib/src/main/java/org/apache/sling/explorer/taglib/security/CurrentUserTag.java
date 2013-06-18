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
import javax.servlet.jsp.JspWriter;
import java.io.IOException;

/**
 * Shows various attributes of the current user
 * @author platon
 */
public class CurrentUserTag extends SecurityTag {

    private static final Logger LOGGER = LoggerFactory.getLogger(CurrentUserTag.class);

    @Override
    public int doEndTag() throws JspException {

        String userId = getJcrSession().getUserID();
        try {
            JspWriter out = pageContext.getOut();
            out.print(userId);
        } catch (IOException e) {
            LOGGER.error(e.getMessage(),e);
        }
        return SKIP_BODY;

    }
}
