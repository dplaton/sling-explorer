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
									javax.jcr.nodetype.*,
									org.apache.sling.api.resource.*,
                  utils.*" 
%><%
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%
	
	ValueMap map = resource.adaptTo(ValueMap.class);
	Object values[] = (Object[])map.get("jcr:mixinTypes");
	if (values == null) values = new Object[0];
	NodeTypeIterator types = currentNode.getSession().getWorkspace().getNodeTypeManager().getMixinNodeTypes();

%>
<div class="control-group">
    <label class="control-label" for="sling:resourceType">jcr:mixinTypes</label>
    <input type="hidden" name="jcr:mixinTypes@Delete" value="true"/>
    <% for (int i = 0; i < values.length; i++) { %>
        <div class="controls">
            <input type="hidden" name="jcr:mixinTypes" value="<%=values[i]%>" />
            <div style="vertical-align:middle;padding:4px;display:inline-block;border:solid 1px lightgray"><%= values[i]%></div>
            <button class="btn btn-danger" type="submit" name="jcr:mixinTypes@DeleteValue" value="<%=values[i]%>"><i class="icon-trash icon-white"></i></button>
        </div>
    <% } %>
    <div class="controls">
		<select name=":mixin_type" style="height:26px">
			<% for (;types.hasNext();) { 
				NodeType nt = types.nextNodeType();
			%>
			<option value="<%=nt.getName()%>"><%=nt.getName()%></option>
			<% } %>
		</select>
		<button class="btn btn-success" type="submit" name="jcr:mixinTypes@ValueFrom" value=":mixin_type"><i class="icon-plus icon-white"></i></button>
 </div>
</div>
