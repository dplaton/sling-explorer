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
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="sec" uri="http://sling.apache.org/taglibs/security" %>
<sling:defineObjects/>
<div class="row">
    <div class="col-lg-4">
        <ul class="nav nav-pills">
            <sec:isAuthenticated>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" id="create-label" data-toggle="dropdown"><i
                            class="glyphicon glyphicon-plus"></i>
                        Create Node <b class="caret"></b></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="create-label">
                        <li><a role="menuitem" data-toggle="modal" data-target="#create-modal" href="${resource.path}.create.html">Manual</a></li>
                        <li><a role="menuitem" href="${resource.path}.create-import-json.html" data-toggle="modal"
                               data-target="#import-json-modal">Import JSON file</a></li>
                    </ul>
                </li>
                <li>
                    <a href="${resource.path}.create-upload-file.html" data-toggle="modal"
                       data-target="#upload-file-modal"
                       role="menuitem"><i class="glyphicon glyphicon-upload"></i> Upload file</a>
                </li>
            </sec:isAuthenticated>
            <%
                if (!"/".equals(resource.getPath())) {
            %>
            <li>
                <a href="${resource.path}.properties.html"><i class="glyphicon glyphicon-edit"></i> Properties</a>
            </li>
            <% } %>
        </ul>
    </div>
    <div class="col-lg-8">
		<span class="pull-right">
        <!-- the search box for the current folder -->
        <form class="form-search form-inline">
            <div class="input-append">
                <input type="text" class="form-control" name="q" class="input-small search-query" value="${param.q}">
                <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
            </div>
        </form>
		</span>
    </div>
</div>

<div id="create-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <!-- RETRIEVED REMOTELY FROM create.jsp -->
</div>

<div id="import-json-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <!-- RETRIEVED REMOTELY FROM create-import-json.jsp -->
</div>

<div id="upload-file-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <!-- RETRIEVED REMOTELY FROM create-upload-file.jsp -->
</div>

