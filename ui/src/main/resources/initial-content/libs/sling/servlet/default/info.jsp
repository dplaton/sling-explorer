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
                  java.util.*,
                javax.jcr.*,
                org.apache.sling.api.resource.*"
%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.3" %>
<sling:defineObjects />
<!DOCTYPE html>
<html>
	<head>
	</head>
	<body>
		<table>
			<tr>
				<td>request</td>
				<td><%= request %></td>
			</tr>
			<tr>
				<td>slingResponse</td>
				<td><%= slingResponse %></td>
			</tr>
			<tr>
				<td>slingRequest</td>
				<td><%= slingRequest %></td>
			</tr>
			<tr>
				<td>resource</td>
				<td><%= resource %></td>
			</tr>
			<tr>
				<td>resourceResolver</td>
				<td><%= resourceResolver %></td>
			</tr>
			<tr>
				<td>log</td>
				<td><%= log %></td>
			</tr>
			<tr>
				<td>currentNode</td>
				<td><%= currentNode %></td>
			</tr>
		</table>

        <c:forEach var="child" items="${sling:listChildren(resource)}">
            ${child.path} ${child.resourceType}<br/>
        </c:forEach>

        <sling:getProperties var="properties" resource="${resource}"/>
        <c:forEach var="prop" items="${properties}">
            ${prop.key} = ${prop.value}<br/>
        </c:forEach>

	</body>
</html>
