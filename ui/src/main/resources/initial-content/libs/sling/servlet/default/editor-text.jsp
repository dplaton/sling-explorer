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
	String text = currentNode.getProperty("jcr:content/jcr:data").getString();
%>
<form method="POST" action="<%=currentNode.getPath()+"/_jcr_content" %>" ENCTYPE="MULTIPART/FORM-DATA">
	<input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURL()%>" />
	<textarea name="jcr:data" style="width:100%" rows="20"><%=text%></textarea>
	<button class="btn" type="submit">save</button>
</form>
