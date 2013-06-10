<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%><%
%><%@page session="false" contentType="text/html; charset=utf-8" %><%
%><%@page import="java.io.*,
                  java.net.*,
									javax.jcr.*,
									java.util.*,
									org.apache.sling.api.*,
									org.apache.sling.api.resource.*,
                  utils.*" 
%><%@ include file="/apps/rested/components/utils.jsp" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%
%><%

	String suffix = slingRequest.getRequestPathInfo().getSuffix();
	String requestPath = getRequestPath(slingRequest);
	String requestSelector = getRequestSelectorExtension(slingRequest);
	String parentPath = "/";
	if (resource.getParent() != null) parentPath = resource.getParent().getPath();

	Vector<Resource> v = new Vector<Resource>();
	v.add(resource);
	Resource parent = resource.getParent();

	while (parent != null) {
		v.insertElementAt(parent, 0);
		parent = parent.getParent();
	}

	for (Iterator<Resource> it = v.iterator();it.hasNext();) {
		Resource r = it.next();
		String path = r.getPath();
		String title = r.getName();

		if (suffix != null) path = requestPath + path;
		else path = path + "." + requestSelector;

		if (r.getPath().equals("/")) { %>
      <span><a href="<%=path%>">/</a></span>
		<% } else { %>
      <span><a href="<%=path%>"><%=title%> /</a></span>
		<% }
	}
%>
