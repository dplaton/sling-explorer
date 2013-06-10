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
									javax.jcr.*,
									org.apache.sling.api.resource.*,
                  utils.*" 
%><%
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%
	
	ValueMap map = resource.adaptTo(ValueMap.class);
	String rtype = map.get("sling:resourceType", "");
	String rstype = map.get("sling:resourceSuperType", "");
	String ptype = map.get("jcr:primaryType", "");

%>
<div class="control-group">
 <label class="control-label" for="sling:resourceType">sling:resourceType</label>
 <div class="controls">
		<input id="sling:resourceType" type="text" name="sling:resourceType" value="<%= rtype %>" />
		<span class="help-inline">
			<div class="btn-group">
				<button class="btn" type="submit" name=":redirect" VALUE="<%= resource.getPath() %>.create-selector.html?type=sling:resourceType"><i class="icon-pencil icon-white"></i></BUTTON>
			</div>
		</span>
 </div>
</div>

<div class="control-group">
 <label class="control-label" for="sling:resourceSuperType">sling:resourceSuperType</label>
 <div class="controls">
		<input id="sling:resourceSuperType" type="text" name="sling:resourceSuperType" value="<%= rstype %>" />
		<span class="help-inline">
			<div class="btn-group">
				<button class="btn" type="submit" name=":redirect" VALUE="<%= resource.getPath() %>.create-selector.html?type=sling:resourceSuperType"><i class="icon-pencil icon-white"></i></BUTTON>
			</div>
		</span>
 </div>
</div>

<div class="control-group">
 <label class="control-label" for="jcr:primaryType">jcr:primaryType</label>
 <div class="controls">
		<span style="vertical-align:middle;padding:4px;display:inline-block;border:solid 1px lightgray"><%=ptype%></span>
				<button class="btn" type="submit" name=":redirect" VALUE="<%= resource.getPath() %>.create-selector.html?type=jcr:primaryType"><i class="icon-pencil icon-white"></i></BUTTON>
 </div>
</div>
