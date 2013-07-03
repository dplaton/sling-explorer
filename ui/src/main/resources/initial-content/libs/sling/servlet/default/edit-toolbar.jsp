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
<%@taglib prefix="sec" uri="http://sling.apache.org/taglibs/security" %>
<sling:defineObjects/>

<ul class="nav nav-pills">
    <sec:isAuthenticated>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" id="create-label" data-toggle="dropdown"><i class="icon-plus"></i> Create Node <b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu" aria-labelledby="create-label">
                <li><a role="menuitem" data-toggle="modal" href="${resource.path}.create-body.html"
                       data-target="#create-modal">Manual</a></li>
                <li><a role="menuitem" href="${resource.path}.create-upload-json.html" data-toggle="modal" data-target="#upload-modal">Import JSON file</a></li>
            </ul>
        </li>
    </sec:isAuthenticated>
    <li>
        <a href="${resource.path}.properties.html"><i class="icon-edit"></i> Properties</a>
    </li>
</ul>
		<span class="pull-right">
        <!-- the search box for the current folder -->
        <form class="form-search form-inline">
            <div class="input-append">
                <input type="text" name="q" class="input-small search-query" value="${param.q}">
                <button class="btn" type="submit"><i class="icon-search"></i></button>
            </div>
        </form>
		</span>
<div id="create-modal" class="modal hide fade" tabindex="-1" role="dialog">
    <div class="modal-header">
        <a class="close" href="${resource.path}.edit.html">&times;</a>
        <h3>Create Node</h3>
    </div>
    <div class="modal-body">
        Loading...
    </div>
</div>

<div id="upload-modal" class="modal hide fade" tabindex="-1" role="dialog">
    <div class="modal-header">
        <a class="close" href="${resource.path}.edit.html">&times;</a>
        <h3>Upload JSON file</h3>
        <div class="modal-body">
            Loading...
        </div>
    </div>
</div>

