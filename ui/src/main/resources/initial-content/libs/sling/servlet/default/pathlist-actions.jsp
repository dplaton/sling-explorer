<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%><%
%><%@page session="false" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects />
<a class="btn btn-sm" href="${resource.path}.properties.html/" title="Edit properties" ><i class="glyphicon glyphicon-edit"></i></a>
<a class="btn btn-sm" href="${resource.path}.moveto.html/" title="Move to..."><i class="glyphicon glyphicon-arrow-right"></i></a>
<a class="btn btn-sm" href="${resource.path}.copyto.html/" title="Copy to..."><i class="glyphicon glyphicon-plus"></i></a>
<a class="btn btn-sm" href="${resource.path}.remove.html" title="Delete"><i class="glyphicon glyphicon-trash"></i></a>