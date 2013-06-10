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
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%

	String parentPath = "/";
	if (resource.getParent() != null) parentPath = resource.getParent().getPath();

%><!DOCTYPE html>
<html>
	<sling:include resource="<%=resource%>" replaceSelectors="edit-head"/>
	<body style="background-color:gray">
		<form id="PATHSFORM" method="POST" action="<%=resource.getPath()%>" enctype="MULTIPART/FORM-DATA">
			<div class="container-fluid">
				<div class="modal">
					<div class="modal-header">
						<h3>Remove Node</h3>
					</div>

					<div class="modal-body">
						<div class="alert alert-info"><i class="icon-folder-open"></i><%=resource.getPath()%></div>
						<p>Are you really sure you want to remove this node?
						<sling:include resource="<%=resource%>" replaceSelectors="errorbar"/>
					</div>
					<div class="modal-footer">
						<input type="hidden" name=":operation" value="delete" />
						<input type="hidden" name=":redirect" value="<%=parentPath%>.edit.html" />
						<input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>" />

						<a href="<%= parentPath+".edit.html" %>" class="btn">Cancel</a>
						<button class="btn btn-danger" type="submit" name=":applyTo" value="<%=resource.getPath()%>"><i class="icon-trash icon-white"></i> Remove</button>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>
