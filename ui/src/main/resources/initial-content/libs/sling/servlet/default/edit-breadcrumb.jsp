<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%><%
%><%@page session="false" contentType="text/html; charset=utf-8" %><%
%><%@page import="java.io.*,
                  java.net.*,
									javax.jcr.*,
									java.util.*,
									org.apache.sling.api.resource.*,
                  utils.*"
%><%
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%
%><%
	
	String parentPath = "/";
	if (resource.getParent() != null) parentPath = resource.getParent().getPath();

%>

<form class="form-inline" id="RENAME_NODE_FORM" method="POST" action="<%=resource.getPath() %>" enctype="MULTIPART/FORM-DATA">
	<input type="hidden" name=":redirect" value="<%=parentPath%>.edit.html" />
	<input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>" />

	<ul class="breadcrumb">
		<li><i class="icon-home"></i></li>
	<%

		Vector<Resource> v = new Vector<Resource>();
		Resource parent = resource.getParent();

		while (parent != null) {
			v.insertElementAt(parent, 0);
			parent = parent.getParent();
		}

		for (Iterator<Resource> it = v.iterator();it.hasNext();) {
			Resource r = it.next();
			String path = r.getPath();
			String title = r.getName();
			
			if (path.equals("/")) title = "root";
			if (r != resource) {
				%><li><a href="<%=path%>.edit.html"><%=title%></a><span class="divider">/</span></li><%
			}
		}

		if (resource.getPath().equals("/")) { %>
			<li><a href="/.edit.html">root</a></li>
		<% } else { %>
			<li>
				<div class="btn-group">
					<input type="text" name="new_node_name" value="<%=resource.getName()%>" />

					<button class="btn btn-success" type="submit"><i class="icon-ok icon-white"></i></button>
					<a href="<%=resource.getPath()+".remove.html"%>" class="btn btn-danger"><i class="icon-trash icon-white"></i></a>

					<input type="hidden" name=":dest@ValueFrom" value="new_node_name" />
					<input type="hidden" name=":operation" value="move" />
				</div>
			</li>
		<% } %>
	</ul>
</form>
