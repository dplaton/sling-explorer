<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%>
<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@page import="java.io.*,
                java.net.*,
                javax.jcr.*,
                org.apache.sling.api.resource.*,
                utils.*"
        %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects/><%

    String parentPath = "/";
    if (resource.getParent() != null) {
        parentPath = resource.getParent().getPath();
    }

%><!DOCTYPE html>
<html>
<sling:include resource="<%=resource%>" replaceSelectors="head"/>
<body>
<div class="container">
    <h3>Edit Properties</h3>
    <div class="alert alert-info">
        <i class="icon-folder-open"></i> <%= resource.getPath() %>
    </div>
    <sling:include resource="<%=resource%>" replaceSelectors="properties-body"/>
    <a href="<%= resource.getPath() + ".edit.html" %>" class="btn btn-primary">Back to navigation</a>
</div>
</body>
</html>
