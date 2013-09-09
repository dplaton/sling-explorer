<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%><%
%>
<%@page session="false" contentType="text/html; charset=utf-8" %>
<%
%>
<%@page import="java.io.*,
                java.net.*,
                javax.jcr.*,
                javax.jcr.nodetype.*,
                org.apache.sling.api.resource.*,
                utils.*"
        %>
<%
%>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<%@ taglib prefix="sec" uri="http://sling.apache.org/taglibs/security"%>
<%
%><sling:defineObjects/><%

    ValueMap map = resource.adaptTo(ValueMap.class);
    Object values[] = (Object[]) map.get("jcr:mixinTypes");
    if (values == null) {
        values = new Object[0];
    }
    NodeTypeIterator types = currentNode.getSession().getWorkspace().getNodeTypeManager().getMixinNodeTypes();

%>
    <form class="form-horizontal" method="POST" enctype="multipart/form-data" action="<%=resource.getPath()%>">
        <input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURL()%>"/>
        <input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>"/>
    <fieldset>
        <div class="row">
            <div class="col-lg-4">

                <input type="hidden" name="jcr:mixinTypes@Delete" value="true"/>
                <% for (int i = 0; i < values.length; i++) { %>
                <div class="input-group">
                    <input type="hidden" name="jcr:mixinTypes" value="<%=values[i]%>"/>
                    <input class="form-control" value="<%= values[i]%>" readonly="readonly">
                        <span class="input-group-btn">
                            <button class="btn btn-danger" type="submit" name="jcr:mixinTypes@DeleteValue"
                                    value="<%=values[i]%>">
                                <i class="glyphicon glyphicon-trash"></i>
                            </button>
                        </span>
                </div>
                <% } %>
            </div>
            <div class="col-lg-8">
                <div class="form-group">
                    <label for=":mixin_type" class="control-label col-sm-2">jcr:mixinType</label>

                    <div class="col-sm-5">
                        <select name=":mixin_type" class="form-control">
                            <% for (; types.hasNext(); ) {
                                NodeType nt = types.nextNodeType();
                            %>
                            <option value="<%=nt.getName()%>"><%=nt.getName()%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <sec:isAuthenticated>
                    <div class="col-sm-5">
                        <button class="btn btn-success" type="submit" name="jcr:mixinTypes@ValueFrom"
                                value=":mixin_type">
                            <i class="glyphicon glyphicon-plus glyphicon-white"></i></button>
                    </div>
                    </sec:isAuthenticated>
                </div>
            </div>
        </div>
    </fieldset>
</form>