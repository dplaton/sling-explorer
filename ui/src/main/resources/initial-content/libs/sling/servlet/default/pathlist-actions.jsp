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
<a class="btn btn-mini" href="${resource.path}.properties.html/" title="Edit properties" ><i class="icon-edit icon-black"></i></a>
<a class="btn btn-mini" href="${resource.path}.moveto.html/" title="Move to..."><i class="icon-arrow-right icon-black"></i></a>
<a class="btn btn-mini" href="${resource.path}.copyto.html/" title="Copy to..."><i class="icon-plus icon-black"></i></a>
<a class="btn btn-mini" href="${resource.path}.remove.html" title="Delete"><i class="icon-trash icon-black"></i></a>