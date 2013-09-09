<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%><%
%><%@page session="false" contentType="text/html; charset=utf-8" %><%
%><%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%

	String error = request.getParameter("error");
	if (error != null) {
		%>
		<div class="alert alert-danger">
		    <a href="<%=slingRequest.getRequestURL()%>" class="close">&times;</a>
		    <strong>Error while saving data!</strong>
		    <%= error %>
	    	<p>
		        You may have to <a href="<%= resource.getPath() %>.authenticate.html?returnTo=<%=slingRequest.getPathInfo()%>">login</a> before making any changes.
		    </p>
        </div>
		<%
	}
%>
