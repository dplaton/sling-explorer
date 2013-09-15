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
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<%
%><sling:defineObjects/><%
%><!DOCTYPE html>
<html>
<sling:include resource="${resource}" replaceSelectors="head"/>
<body>
<div class="navbar navbar-inverse navbar-static-top">
    <div class="navbar-header">
        <a class="navbar-brand" href="/">Sling Explorer</a>
    </div>
</div>
<%
    String returnTo = slingRequest.getParameter("returnTo");
    if (returnTo == null || "".equals(returnTo)) {
        returnTo = resource.getPath() + ".edit.html";
    }
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-5"></div>
        <div class="col-lg-2" style="padding-top:25px">
            <form method="post" action="/j_security_check" enctype="MULTIPART/FORM-DATA" accept-charset="UTF-8">
                <fieldset>
                    <legend><h3>Login</h3></legend>

                    <input type="hidden" name="_charset_" value="UTF-8">
                    <input type="hidden" name="resource" value="<%=returnTo%>">
                    <input type="hidden" name="selectedAuthType" value="form">

                    <div class="form-group">
                        <label class="control-label" for="j_username">User name:</label>

                        <div class="controls">
                            <input id="j_username" class="form-control" name="j_username" type="text" accesskey="u">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="j_password">Password</label>

                        <div class="controls">
                            <input id="j_password" name="j_password" class="form-control" type="password" accesskey="p">
                        </div>
                    </div>
                    <button class="btn btn-primary" type="submit">Login</button>
                </fieldset>
            </form>
        </div>
        <div class="col-lg-6"></div>
    </div>
</div>
</body>
</html>
