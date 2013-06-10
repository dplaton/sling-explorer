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
									org.apache.sling.api.*,
                  utils.*"
%><%@ include file="/apps/rested/components/utils.jsp" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%

String requestPath = getRequestPath(slingRequest);
String requestSelector = getRequestSelectorExtension(slingRequest);
String suffix = slingRequest.getRequestPathInfo().getSuffix();

%>

	<table class="table table-condensed pathlist">
		<tbody>
	<%
		NodeIterator children = currentNode.getNodes();
		while (children.hasNext ()) {
			Node node = children.nextNode();
			String type = node.getProperty("jcr:primaryType").getString();
			String name = node.getName();
			String path = node.getPath();
			String rtype = "";
			if (node.hasProperty("sling:resourceType")) rtype = node.getProperty("sling:resourceType").getString();

			if (suffix != null) path = requestPath + path;
			else path = path + "." + requestSelector;
	%>
			<tr>
				<td><i class="<%=iconForType(type)%>"></i></td>
				<td><a href="<%=path%>"><%=name + (isFolder(type)?"/":"")%></a></td>
				<td><%=type%></td>
			</tr>
	<% } %>
		</tbody>
	</table>
