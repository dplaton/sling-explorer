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
%><!DOCTYPE html>
<html>
	<head>
		<sling:include resource="${resource}" replaceSelectors="edit-head"/>
	</head>
	<body>
		<sling:include resource="${resource}" replaceSelectors="edit-navbar"/>
		<div class="subnavbar">
			<sling:include resource="${resource}" replaceSelectors="edit-breadcrumb"/>
		</div>
    <div class="container-fluid">
			<sling:include resource="${resource}" replaceSelectors="errorbar"/>
			<sling:include resource="${resource}" replaceSelectors="edit-toolbar"/>
			<sling:include resource="${resource}" replaceSelectors="edit-body"/>

		</div>
	</body>
</html>
