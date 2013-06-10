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
%>
<a class="btn btn-mini" href="${resource.path}.properties.html/"><i class="icon-edit icon-white"></i></a>
<a class="btn btn-mini" href="${resource.path}.moveto.html/"><i class="icon-arrow-right icon-white"></i></a>
<a class="btn btn-mini" href="${resource.path}.copyto.html/"><i class="icon-plus icon-white"></i></a>
<a class="btn btn-mini" href="${resource.path}.remove.html"><i class="icon-trash icon-white"></i></a>
