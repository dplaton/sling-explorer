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
<%@page import="java.io.*,
                java.net.*,
                javax.jcr.*,
                java.util.*,
                org.apache.sling.api.resource.*,
                utils.*"
        %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects/>
<%
    String parentPath = "/";
    if (resource.getParent() != null) {
        parentPath = resource.getParent().getPath();
    }
%>

<form class="form-inline" id="RENAME_NODE_FORM" method="POST" action="<%=resource.getPath() %>"
      enctype="MULTIPART/FORM-DATA">
    <input type="hidden" name=":redirect" value="<%=parentPath%>.edit.html"/>
    <input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>"/>

    <ul class="breadcrumb">
        <li><i class="icon-home"></i></li>
        <%

            ArrayList<Resource> v = new ArrayList<Resource>();
            Resource parent = resource.getParent();

            while (parent != null) {
                v.add(0, parent);
                parent = parent.getParent();
            }

            for (Iterator<Resource> it = v.iterator(); it.hasNext(); ) {
                Resource r = it.next();
                String path = r.getPath();
                String title = r.getName();

                if (path.equals("/")) {
                    title = "root";
                }

                if (r != resource) {
        %>
        <li><a href="<%=path%>.edit.html"><%=title%>
        </a></li>
        <%
                }
            }

            if (resource.getPath().equals("/")) { %>
        <li><a href="/.edit.html">root</a></li>
        <% } else { %>
        <li>
            <input type="text" class="form-control input-small" name="new_node_name" value="<%=resource.getName()%>"/>
            <button class="btn btn-success btn-small" type="submit"><i class="glyphicon glyphicon-ok"></i></button>
            <a href="<%= resource.getPath()+".remove.html"%>" class="btn btn-small btn-danger">
                <i class="glyphicon glyphicon-trash"></i>
            </a>
            <input type="hidden" name=":dest@ValueFrom" value="new_node_name"/>
            <input type="hidden" name=":operation" value="move"/>
        </li>
        <% } %>
    </ul>
</form>
