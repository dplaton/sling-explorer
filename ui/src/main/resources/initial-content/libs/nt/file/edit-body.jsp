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
									org.apache.sling.api.resource.*,
                  utils.*" 
%><%
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%
	String type = "unknown";
	if (currentNode.hasProperty("jcr:content/jcr:mimeType")) {
		String path = currentNode.getPath();
		String mimetype = currentNode.getProperty("jcr:content/jcr:mimeType").getString();

		if      (mimetype.equalsIgnoreCase("plain/text")) type = "text";
		else if (mimetype.equalsIgnoreCase("text/plain")) type = "text";
		else if (mimetype.equalsIgnoreCase("text/html")) type = "text";
		else if (path.endsWith(".jsp")) type = "text";
		else if (path.endsWith(".html"))type = "text";
		else if (path.endsWith(".css")) type = "text";
		else if (path.endsWith(".js"))  type = "text";
		else if (path.endsWith(".png")) type = "image";
		else if (path.endsWith(".jpg")) type = "image";
		else if (path.endsWith(".jpeg")) type = "image";
		else if (path.endsWith(".gif")) type = "image";
		else if (path.endsWith(".zip")) type = "archive";
		else if (path.endsWith(".jar")) type = "archive";
		else if (path.endsWith(".pdf")) type = "other";
		else                            type = "text";
	}
%>
			<% if ("text".equalsIgnoreCase(type)) { %>
				<DIV style="width:100%">
					<sling:include resource="<%=resource%>" replaceSelectors="editor-text"/>
				</DIV>
			<% } else if ("image".equalsIgnoreCase(type)) { %>
				<DIV style="width:100%">
					<img src="<%=resource.getPath()%>"></img>
				</DIV>
			<% } else { %>
				<a href="<%=resource.getPath()%>"><%=resource.getName()%></a>
				<!-- IFRAME width="100%" src="<%=currentNode.getPath()%>"></IFRAME -->
			<% } %>
