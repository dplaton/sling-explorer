<%--
    Main page for the edit
--%>
<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects/>
<!DOCTYPE html>
<html>
    <head>
        <sling:include resource="${resource}" replaceSelectors="head"/>
    </head>
    <body>
    <sling:include resource="${resource}" replaceSelectors="navbar"/>
    <div class="subnavbar">
        <sling:include resource="${resource}" replaceSelectors="edit-breadcrumb"/>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <h3>${resource.name}</h3>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <sling:include resource="${resource}" replaceSelectors="edit-toolbar"/>
            </div>
        </div>
            <div class="row-fluid">
                <sling:include resource="${resource}" replaceSelectors="errorbar"/>
                <sling:include resource="${resource}" replaceSelectors="edit-body"/>
            </div>
        </div>
    </div>
    </body>
</html>
