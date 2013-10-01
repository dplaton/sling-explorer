<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%>
<%
%><%@page 
    session="false" contentType="text/html; charset=utf-8" %>
<%@ page import="org.apache.sling.api.resource.ResourceUtil" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects />

<div class="row-fluid">
    <!--
    <div class="col-lg-4">
        <h3>Tree navigation goes here</h3>
    </div> -->
    <!-- <div class="col-lg-8"> -->
    <% if (!ResourceUtil.isSyntheticResource(resource)) { %>
        <sling:include resource="${resource}" replaceSelectors="edit-toolbar"/>
    <% }
    if (resource.getChildren().iterator().hasNext()) { %>
        <sling:include resource="<%=resource%>" replaceSelectors="edit-pathlist"/>
    <% } else { %>
     <div class="row-fluid">
        <div class="alert alert-info">
            <a href="#" class="close"><i class="glyphicon glyphicon-circle-arrow-left"></i></a>
            <p>
                <h4 class="text-center">This node has no children</h4>
            <p>
        </div>
     </div>
    <% } %>
</div>


