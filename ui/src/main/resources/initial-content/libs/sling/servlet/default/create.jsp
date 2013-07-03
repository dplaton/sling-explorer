<%--
    Node creation page.

--%>
<%@page session="false" contentType="text/html; charset=utf-8" %><%
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects />
%><!DOCTYPE html>
<html>
	<sling:include resource="${resource}" replaceSelectors="head"/>
	<body style="background-color:gray">
		<div class="container-fluid">
			<div class="modal">
				<div class="modal-header">
    			<a class="close" href="${resource.path}.edit.html">&times;</a>
					<h3>Create Node</h3>
 				</div>

  			<div class="modal-body">
					<div class="alert alert-info"><i class="icon-folder-open"></i> ${resource.path}</div>
					<sling:include resource="${resource}" replaceSelectors="create-body"/>
				</div>
			</div>
		</div>
	</body>
</html>
