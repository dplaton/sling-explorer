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
									org.apache.sling.api.resource.*,
                  utils.*" 
%><%!
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%

%>

<form style="margin-bottom:2px" id="DELETE_PROPERTY_FORM" class="form-horizontal" method="POST" action="<%= resource.getPath() %>" enctype="multipart/form-data">
	<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURL()%>" />
	<input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>" />
</form>
	
<FORM style="margin-bottom:2px" ID="EDIT_PROPERTIES_FORM" class="form-horizontal" METHOD="POST" ACTION="<%= resource.getPath() %>" ENCTYPE="MULTIPART/FORM-DATA">
	<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURL()%>" />
	<input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>" />
		<fieldset>
			<legend>Mixins</legend>
			<sling:include resource="<%= resource %>" replaceSelectors="properties-mixins"/>
		</fieldset>

		<fieldset>
			<legend>Rendering</legend>
			<sling:include resource="<%= resource %>" replaceSelectors="properties-rendering"/>
		</fieldset>

		<fieldset>
			<legend>System</legend>
			<sling:include resource="<%= resource %>" replaceSelectors="properties-system"/>
		</fieldset>

		<fieldset>
			<legend>Custom</legend>
			<sling:include resource="<%= resource %>" replaceSelectors="properties-custom"/>
		</fieldset>

</FORM>
<FORM ID="ADD_PROPERTY_FORM" class="form-horizontal" METHOD="POST" ACTION="<%= resource.getPath() %>" ENCTYPE="MULTIPART/FORM-DATA">
	<fieldset>
		<div class="control-group">
			<INPUT TYPE="HIDDEN" NAME=":redirect" VALUE="<%=slingRequest.getRequestURL()%>" />
			<INPUT TYPE="HIDDEN" NAME=":errorpage" VALUE="<%=slingRequest.getRequestURL()%>" />
			<INPUT class="input-medium" TYPE="TEXT" placeholder="new property name" NAME=":propery_name" VALUE=""/>
			<INPUT style="margin-left:12px" TYPE="TEXT" placeholder="value" NAME=":propery_name@NameFrom" VALUE=""/>
			<BUTTON class="btn btn-success" style="margin-left:5px" TYPE="SUBMIT"><i class="icon-plus icon-white"></i></BUTTON>
		</div>
	</fieldset>
</FORM>

<sling:include resource="<%=resource%>" replaceSelectors="errorbar"/>
