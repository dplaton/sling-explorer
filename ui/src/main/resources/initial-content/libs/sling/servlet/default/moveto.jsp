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

String cpath = slingRequest.getRequestPathInfo().getResourcePath();
String rpath = slingRequest.getRequestPathInfo().getSuffix();
Resource res = resource.getResourceResolver().resolve(rpath);
Node node = res.adaptTo(Node.class);

String parentPath = "/";
if (resource.getParent() != null) parentPath = resource.getParent().getPath();

%><!DOCTYPE html>
<html>
	<sling:include resource="<%=res %>" replaceSelectors="edit-head" />
	<body style="background-color:gray">
    <div class="container-fluid">
			<FORM ID="PATHSFORM" METHOD="POST" ACTION="<%=resource.getPath() %>" ENCTYPE="MULTIPART/FORM-DATA">
				<input type="hidden" name=":redirect" value="<%=res.getPath()%>.edit.html" />
				<input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>" />

				<div class="modal">
					<div class="modal-header">
						<h3>Move Node</h3>
					</div>

					<div class="modal-body">
						<div class="alert alert-info">
							<strong>from:</strong> <%= cpath %><br/>
							<strong>to:</strong><h5><sling:include resource="<%=res %>" replaceSelectors="moveto-breadcrumb" /></h5>
						</div>

				<% if (node.hasNodes()) { %>
					<p>change destination path</p>
					<sling:include resource="<%=res %>" replaceSelectors="moveto-pathlist" />
				<% }  %>

					</div>
						<div class="modal-footer">
							<a href="<%= parentPath + ".edit.html" %>" class="btn">Cancel</a>
							<input type="hidden" name=":operation" value="move" />
							<input type="hidden" name=":dest" value="<%=res.getPath()+"/"%>" />
							<button class="btn btn-primary" type="submit"><i class="glyphicon glyphicon-white glyphicon-arrow-right"></i> Move</button>
						</div>
				</div>
			</FORM>
		</div>
	</body>
</html>
