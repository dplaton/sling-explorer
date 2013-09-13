<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%><%
%>
<%@page session="false" contentType="text/html; charset=utf-8" %>
<%
%>
<%@page import="java.io.*,
                java.net.*,
                java.util.*,
                javax.jcr.*,
                org.apache.sling.api.resource.*,
                utils.*"
        %>
<%!
%>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<%
%><sling:defineObjects/><%

%>

<sling:include resource="<%=resource%>" replaceSelectors="errorbar"/>


<form style="margin-bottom:2px" id="DELETE_PROPERTY_FORM" method="POST" action="<%= resource.getPath() %>"
      enctype="multipart/form-data">
    <input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURL()%>"/>
    <input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>"/>
</form>

<div class="panel">
    <div class="panel-heading">
        <h3 class="panel-title">Properties</h3>
        <div class="panel-body">
            <sling:include resource="<%= resource%>" replaceSelectors="properties-custom"/>
        </div>
    </div>
</div>




