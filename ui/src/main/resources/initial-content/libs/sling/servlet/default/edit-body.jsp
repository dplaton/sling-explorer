<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%><%
%><%@page session="false" contentType="text/html; charset=utf-8" %><%
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><% 

	if (resource.getChildren().iterator().hasNext()) { %>
		<sling:include resource="<%=resource%>" replaceSelectors="edit-pathlist"/>
	<% } else { %>
		<div class="alert alert-info">
			<a href="#" class="close"><i class="icon-circle-arrow-left"></i></a>
			<p>
			<h4 class="text-center">this node has no children</h4>
			<p>
		</div>
	<% } %>
