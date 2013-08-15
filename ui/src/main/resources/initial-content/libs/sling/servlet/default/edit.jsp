<%@ page import="org.apache.sling.api.resource.ValueMap" %>
<%--
    Main page for the edit
--%>
<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<sling:defineObjects/>
<!DOCTYPE html>
<%
    String title = resource.getName();

    //retrieve the resource title, since the taglib for that is still in development
    ValueMap properties = resource.adaptTo(ValueMap.class);
    if (properties != null && properties.containsKey("jcr:title")) {
        title = properties.get("jcr:title").toString();
    }
%>
<html>
    <head>
        <sling:include resource="${resource}" replaceSelectors="head"/>
    </head>
    <body>
    <sling:include resource="${resource}" replaceSelectors="navbar"/>
    <div class="subnav">
        <sling:include resource="${resource}" replaceSelectors="edit-breadcrumb"/>
    </div>
    <div class="container-fluid">
        <h3>
            <%= title%>
        </h3>
        <div class="row-fluid">
            <div class="span12">
                <sling:include resource="${resource}" replaceSelectors="errorbar"/>
            </div>
        </div>
            <div class="row-fluid">
                <sling:include resource="${resource}" replaceSelectors="edit-body"/>
            </div>
        </div>
    </div>
    </body>
</html>
