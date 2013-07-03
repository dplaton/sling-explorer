<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%>
<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects/>
<title>Sling Explorer::<%=resource.getPath()%></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="/apps/sling-explorer/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
<link href="/apps/sling-explorer/bootstrap/css/explorer.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="/apps/sling-explorer/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="/apps/sling-explorer/bootstrap/js/bootstrap.js"></script>