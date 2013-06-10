<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%><%
%><%@page session="false" contentType="text/html; charset=utf-8" %><%
%><%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%
%><!DOCTYPE html>
<html>
	<sling:include resource="${resource}" replaceSelectors="edit-head"/>
	<body style="background-color:gray">
		<div class="container-fluid">
			<form method="post" action="/j_security_check" enctype="MULTIPART/FORM-DATA" accept-charset="UTF-8" class="form-horizontal">
				<div class="modal">
					<div class="modal-header">
						<a href="${resource.path}.edit.html" class="close">&times;</a>
						<h3>Login</h3>
					</div>

					<div class="modal-body">
							<input type="hidden" name="_charset_" value="UTF-8">
							<input type="hidden" name="resource" value="${resource.path}.edit.html">
							<input type="hidden" name="selectedAuthType" value="form">

							<div class="control-group">
								<label class="control-label" for="j_username">name</label>
								<div class="controls">
									<input id="j_username" name="j_username" type="text" accesskey="u">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="j_password">password</label>
								<div class="controls">
									<input id="j_password" name="j_password" type="password" accesskey="p">
								</div>
							</div>
					</div>

					<div class="modal-footer">
						<a class="btn" href="system/sling/logout.html">Logout</a>
						<button class="btn btn-primary" type="submit">Login</button>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>
