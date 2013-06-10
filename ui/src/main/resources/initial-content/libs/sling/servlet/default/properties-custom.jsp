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

	PropertyIterator properties = null;

	String requestPath = slingRequest.getRequestPathInfo().getResourcePath();
	String content = requestPath;
	if (resource instanceof NonExistingResource) {
		content = requestPath.substring (0, requestPath.indexOf ('.'));
	}
	else {
		properties = currentNode.getProperties();
	}

%>
		<% 
			if (properties != null) {
				for (;properties.hasNext();) {
					Property p = properties.nextProperty();
					String name = p.getName();
					String value = null;

					if (name.startsWith("jcr:")) continue;
					if (name.startsWith("sling:")) continue;

					if (p.isMultiple() == true) {
						Value v[] = p.getValues();
						continue;
					}
					else {
						value = p.getString();
					}

		%>
		<div class="control-group">
		 <label class="control-label" for="<%=name%>"><%=name%></label>
		 <div class="controls">
				<input id="<%=name%>" type="text" name="<%=name%>" value="<%=value%>" />
				<span class="help-inline">
					<div class="btn-group">
					<button class="btn btn-danger" type="submit" name="<%=name%>" value="" form="DELETE_PROPERTY_FORM"><i class="icon-trash icon-white"></i></button>
					</div>
				</span>
		 </div>
		</div>
		<%  
				}
			}
		%>
