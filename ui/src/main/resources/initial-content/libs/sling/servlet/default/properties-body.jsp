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

<div class="panel ">
    <div class="panel-heading">
        <h4 class="panel-title">System properties</h4>
    </div>
    <div class="panel-body">
        <sling:include resource="<%= resource %>" replaceSelectors="properties-system"/>
    </div>
</div>

<div class="panel">
    <div class="panel-heading">
        <h4 class="panel-title">Mixins (jcr:mixinTypes)</h4>
    </div>
    <div class="panel-body">
        <sling:include resource="<%= resource %>" replaceSelectors="properties-mixins"/>
    </div>
</div>

<div class="panel">
    <div class="panel-heading">
        <h4 class="panel-title">Rendering</h4>
    </div>
    <div class="panel-body">
        <sling:include resource="<%= resource %>" replaceSelectors="properties-rendering"/>
    </div>
</div>

<div class="panel">
    <div class="panel-heading">
        <h4 class="panel-title">Custom properties</h4>
    </div>
    <div class="panel-body">
        <sling:include resource="<%= resource %>" replaceSelectors="properties-custom"/>
    </div>
</div>

<!--

<FORM style="margin-bottom:2px" ID="EDIT_PROPERTIES_FORM" METHOD="POST" ACTION="<%= resource.getPath() %>" ENCTYPE="MULTIPART/FORM-DATA">
<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURL()%>" />
<input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>" />
<fieldset>
<legend>Mixins (jcr:mixinTypes)</legend>

</fieldset>

<fieldset>
<legend>Rendering</legend>
</fieldset>

<fieldset>
<legend>System</legend>
</fieldset>

<fieldset>
<legend>Custom</legend>
</fieldset>

</FORM> -->



