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
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%

	PropertyIterator properties = null;

	String requestPath = slingRequest.getRequestPathInfo().getResourcePath();
	String content = requestPath;
	if (resource instanceof NonExistingResource) {
		content = requestPath.substring (0, requestPath.indexOf ('.'));
	}
	else {
		properties = currentNode.getProperties();
		String ntype = currentNode.getProperty("jcr:primaryType").getString();
		String rtype = resource.getResourceType();
	}

%>
		<% 
			if (properties != null) {
				for (;properties.hasNext();) {
					Property p = properties.nextProperty();
					String name = p.getName();
					String value = null;
					boolean readonly = true;

					if (name.equals("sling:resourceType") || name.equals("sling:resourceSuperType")) {
						continue;
					}
					else if (name.equals("jcr:primaryType")) {
						continue;
					}
					else if (name.equals("jcr:mixinTypes")) {
						continue;
					}
					else if (name.startsWith("sling:")) {
						readonly = false;
					}
					else if (name.startsWith("jcr:")) {
						readonly = true;
					}
					else {
						continue;
					}

					if (readonly && p.isMultiple() == false) {
						if (name.equals("jcr:data")) value = "binary data";
						else value = p.getString();
		%>
		<div class="control-group">
		 	<label class="control-label" for="<%=name%>"><%=name%></label>
		 	<div class="controls">
				<span style="vertical-align:middle;padding:4px;display:inline-block;border:solid 1px lightgray"><%=value%></span>
			</div>
		</div>
		<%
					}
					else if (readonly && p.isMultiple()) {
						Value v[] = p.getValues();
						for (int i = 0; i < v.length; i++) {
							value = v[i].getString();
		%>
		<div class="control-group">
		 	<label class="control-label" for="<%=name%>"><%=name%></label>
		 	<div class="controls">
				<span style="vertical-align:middle;padding:4px;display:inline-block;border:solid 1px lightgray"><%=value%></span>
			</div>
		</div>
		<%
						}
					}
					else {
						value = p.getString();
		%>
		<div class="control-group">
		 <label class="control-label" for="<%=name%>"><%=name%></label>
		 <div class="controls">
				<INPUT id="<%=name%>" TYPE="TEXT" NAME="<%=name%>" VALUE="<%=value%>" />
				<span class="help-inline">
					<div class="btn-group">
					<BUTTON class="btn btn-danger" TYPE="SUBMIT" NAME="<%=name%>" VALUE="" FORM="DELETE_PROPERTY_FORM"><i class="icon-trash icon-white"></i></BUTTON>
					</div>
				</span>
		 </div>
		</div>
		<%  	}
				}
			}
		%>
