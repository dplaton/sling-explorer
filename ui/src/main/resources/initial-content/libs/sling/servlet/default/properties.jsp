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

String parentPath = "/";
if (resource.getParent() != null) parentPath = resource.getParent().getPath();

%><!DOCTYPE html>
<html>
	<sling:include resource="<%=resource%>" replaceSelectors="edit-head"/>
	<body style="background-color:gray">
		<div class="container-fluid">
			<div class="modal">
				<div class="modal-header">
    			<a class="close" href="<%= resource.getPath() + ".edit.html" %>">&times;</a>
					<h3>Edit Properties</h3>
  			</div>

  			<div class="modal-body">
					<div class="alert alert-info"><i class="icon-folder-open"></i> <%= resource.getPath() %></div>
					<sling:include resource="<%=resource%>" replaceSelectors="properties-body"/>
				</div>
				<div class="modal-footer">
					<a href="<%= parentPath + ".edit.html" %>" class="btn">Cancel</a>
					<button class="btn btn-primary" type="submit" form="EDIT_PROPERTIES_FORM"><i class="icon-edit icon-white"></i> Save</button>
				</div>
			</div>
		</div>
	</body>
</html>
