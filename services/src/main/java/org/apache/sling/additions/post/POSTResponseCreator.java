/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements. See the NOTICE file distributed with this
 * work for additional information regarding copyright ownership. The ASF
 * licenses this file to You under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */

package org.apache.sling.additions.post;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.servlets.post.HtmlResponse;
import org.apache.sling.servlets.post.PostResponse;
import org.apache.sling.servlets.post.PostResponseCreator;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Component
@Service
public class POSTResponseCreator implements PostResponseCreator {

    public PostResponse createPostResponse (SlingHttpServletRequest req) {
        String errorpage = req.getParameter(":errorpage");
        if (errorpage != null) {
            return new EnhancedPOSTResponse (req);
        }
        else {
            return new HtmlResponse ();
        }
    }
}

class EnhancedPOSTResponse extends HtmlResponse {
	private SlingHttpServletRequest request;
	
	public EnhancedPOSTResponse (SlingHttpServletRequest req) {
		super();
		request = req;
	}

	@Override
	protected void doSend (HttpServletResponse response) throws IOException {
		String errorpage = request.getParameter(":errorpage");
		if (isSuccessful () == false && errorpage != null) {
		    //we are interested in errors only
			int status = getStatusCode();
			Throwable err = getError();
			String msg = "Unknown error: " + status;
			if (err != null) {
                msg = err.getMessage();
            }
			response.sendRedirect(errorpage + "?error=" + java.net.URLEncoder.encode(msg, "UTF-8"));
		}
		else {
			super.doSend (response);
		}
	}
}
