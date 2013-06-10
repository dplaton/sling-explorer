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
				<div class="btn-group">
					<a class="btn" href="<%=resource.getPath() + "/_jcr_content.edit.html"%>"><i class="icon-chevron-right"></i> view jcr:content</a>
					<a class="btn" href="<%=resource.getPath() + ".properties.html"%>"><i class="icon-edit"></i> properties</a>
				</div>
				<a class="btn" target="preview" href="<%=resource.getPath()%>.html">preview</a>
			</div>
