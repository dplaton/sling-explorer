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
                  com.petebevin.markdown.*,
									org.apache.sling.api.resource.*,
                  utils.*" 
%><%
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%
	String path = resource.getPath();
	if (path.endsWith(".md") || path.endsWith("markdown")) {
		String text = currentNode.getProperty("jcr:content/jcr:data").getString();
		MarkdownProcessor proc = new MarkdownProcessor();
		String html = proc.markdown(text);
		%><%=html%><%
	}
	else if (path.endsWith(".html") || path.endsWith(".htm")) {
		String text = currentNode.getProperty("jcr:content/jcr:data").getString();
		%><%=text%><%
	}
	else if (path.endsWith(".png")) {
		%><img src="<%=path%>"><%
	}
%>
