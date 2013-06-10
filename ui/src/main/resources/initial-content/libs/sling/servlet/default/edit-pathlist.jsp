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
									javax.jcr.query.QueryResult,
                  javax.jcr.query.QueryManager,
                  javax.jcr.query.Query,
									org.apache.sling.api.resource.*,
									org.apache.sling.api.*,
                  utils.*"
%>
<%@ page import="org.apache.sling.additions.service.SearchService" %>
<%@ include file="/apps/sling-explorer/components/utils.jsp" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects />
<%
    String requestPath = getRequestPath(slingRequest);
    String requestSelector = getRequestSelectorExtension(slingRequest);
    String suffix = slingRequest.getRequestPathInfo().getSuffix();
    String q = request.getParameter("q");
%>

	<table class="table table-condensed pathlist">
		<thead>
			<th class="nodetype"></th>
			<th>name</th>
			<th>type</th>
			<th>rtype</th>
			<th></th>
		</thead>
		<tbody>
        <%
            if (q != null) {
                %> <%
            } else {
                %> <%
            }
        %>

	<%
		NodeIterator children = null;

        SearchService searchService = sling.getService(SearchService.class);

        if (q != null) {
            children = searchService.searchNodes((SlingHttpServletRequest)request,q);
        } else {
            children = listNodes(currentNode);
        }
		
		while (children.hasNext ()) {
			Node node = children.nextNode();
			String type = node.getProperty("jcr:primaryType").getString();
			String name = node.getName();
			String path = node.getPath();
			Node parent = node.getParent();

			String ppath = "/";
			if (parent != null) ppath = parent.getPath();

			String rtype = null;
			if (node.hasProperty("sling:resourceType")) rtype = node.getProperty("sling:resourceType").getString();

			if (suffix != null) path = requestPath + path;
			else path = path + "." + requestSelector;
	%>
			<tr>
				<td><i class="<%=iconForType(type)%>"></i></td>
				<td><a href="<%=path%>"><%=name + (isFolder(type)?"/":"")%></a>
					<% if (q != null) { %>
						<br/><%=ppath%> <a href="<%=ppath%>.edit.html"><i class="icon-circle-arrow-right"></i></a>
					<% } %>
				</td>
				<td><%=type%></td>
				<td>
					<% if (rtype != null && rtype.indexOf('/') > 0) { %>
						<%=rtype%> <a href="/.edit.html?q=<%=rtype%>"><i class="icon-search"></i></a>
					<% } %>
				</td>
				<td>
					<div class="btn-group pull-right">
						<sling:include path="<%=node.getPath()%>" replaceSelectors="edit-pathlist-actions"/>
					</div>
				</td>
			</tr>
	<%
		}
	%>
		</tbody>
	</table>

