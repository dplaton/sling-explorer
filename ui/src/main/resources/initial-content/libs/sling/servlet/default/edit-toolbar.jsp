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
%><sling:defineObjects />
<div class="btn-toolbar">
	<form class="form-search form-inline">
		<div class="btn-group">
			<a class="btn" href="${resource.path}.create.html"><i class=" icon-plus"></i> new</a>
			<a class="btn" href="${resource.path}.properties.html"><i class="icon-edit"></i> properties</a>
		</div>
		<span class="pull-right">
        <!-- the search box for the current folder -->
		<div class="input-append">
			<input type="text" name="q" class="input-small search-query" value="${param.q}">
			<button class="btn" type="submit"><i class="icon-search"></i></button>
		</div>
		</span>
	</form>
</div>
