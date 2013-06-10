/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package org.apache.sling.additions.post;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Vector;
import java.util.Enumeration;
import java.util.Map;
import java.util.HashMap;
import java.util.LinkedHashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.sling.api.request.RequestParameterMap;
import org.apache.sling.api.request.RequestParameter;

import org.apache.felix.scr.annotations.Activate;
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Deactivate;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.wrappers.SlingHttpServletResponseWrapper;
import org.apache.sling.api.wrappers.SlingHttpServletRequestWrapper;
import org.apache.sling.engine.EngineConstants;
import org.apache.sling.settings.SlingSettingsService;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceUtil;
import org.osgi.framework.Constants;

@Component (metatype = false)
@Service
@Properties ( { @Property (name = EngineConstants.FILTER_NAME, value = "POSTServletFilter"),
                @Property (name = EngineConstants.SLING_FILTER_SCOPE, value = { EngineConstants.FILTER_SCOPE_REQUEST}),
                @Property (name = Constants.SERVICE_RANKING, intValue = Integer.MAX_VALUE)
              })

public class POSTServletFilter implements Filter {

	@Reference
	private SlingSettingsService settings;

	@SuppressWarnings ("unused")
	@Activate
	private void activate() throws IOException {
	}

	@SuppressWarnings ("unused")
	@Deactivate
	private void deactivate() throws IOException {
	}

	public void init (FilterConfig filterConfig) throws ServletException {
	}

	public void doFilter (ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
		ServletException {

		if (request instanceof SlingHttpServletRequest && ((HttpServletRequest)request).getMethod().equalsIgnoreCase("POST")) {
			SlingHttpServletRequest slingReq = (SlingHttpServletRequest) request;
			POSTRequestWrapper wrapper = new POSTRequestWrapper (slingReq);
			chain.doFilter (wrapper, response);
		}
		else {
			chain.doFilter (request, response);
		}
	}

	public void destroy() {
	}
}
