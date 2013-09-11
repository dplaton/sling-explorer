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
                java.util.*,
                javax.jcr.*,
                org.apache.sling.api.resource.*,
                utils.*"
        %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<%
%><sling:defineObjects/><%

    PropertyIterator properties = null;

    String requestPath = slingRequest.getRequestPathInfo().getResourcePath();
    String content = requestPath;
    if (resource instanceof NonExistingResource) {
        content = requestPath.substring(0, requestPath.indexOf('.'));
    } else {
        properties = currentNode.getProperties();
        String ntype = currentNode.getProperty("jcr:primaryType").getString();
        String rtype = resource.getResourceType();
    }

%>
<FORM class="form-horizontal" role="form" ID="EDIT_SYS_PROPERTIES_FORM" METHOD="POST" ACTION="<%= resource.getPath() %>"
      ENCTYPE="MULTIPART/FORM-DATA">

    <input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURL()%>"/>
    <input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>"/>
    <%
        if (properties != null) {
            for (; properties.hasNext(); ) {
                Property p = properties.nextProperty();
                String name = p.getName();
                String value = null;
                boolean readonly = p.getDefinition().isProtected();

                // rendering properties are skipped
                if (name.equals("sling:resourceType") || name.equals("sling:resourceSuperType")) {
                    continue;
                // rendering properties are skipped
                } else if (name.equals("jcr:primaryType")) {
                    continue;
                // rendering properties are skipped
                } else if (name.equals("jcr:mixinTypes")) {
                    continue;
                // only accept sling: and jcr: properties as 'system' 
                } else if (!name.startsWith("sling:") && !name.startsWith("jcr:")) {
                    continue;
                }

                if (readonly && !p.isMultiple()) {
                    if (name.equals("jcr:data")) {
                        value = "binary data";
                    } else {
                        value = p.getString();
                    }
    %>
    <div class="form-group">
        <label class="col-lg-3 control-label" for="<%=name%>"><%=name%>
        </label>

        <p class="form-control-static col-lg-9"><%=value%>
        </p>
    </div>
    <%
    } else if (readonly && p.isMultiple()) {
        Value v[] = p.getValues();
        for (int i = 0; i < v.length; i++) {
            value = v[i].getString();
    %>
    <div class="form-group">
        <label class="col-lg-3 control-label" for="<%=name%>"><%=name%>
        </label>

        <p class="form-control-static col-lg-9"><%=value%>
        </p>
    </div>
    <%
        }
    } else {
        value = p.getString();
    %>
    <div class="form-group">
        <label class="col-lg-3 control-label" for="<%=name%>"><%=name%>
        </label>

        <div class="input-group col-lg-9">
            <INPUT id="<%=name%>" class="form-control" TYPE="TEXT" NAME="<%=name%>" VALUE="<%=value%>"/>
            <span class="input-group-btn">
                <BUTTON class="btn btn-danger" TYPE="SUBMIT" NAME="<%=name%>" VALUE=""
                          FORM="DELETE_PROPERTY_FORM"><i class="glyphicon glyphicon-trash icon-white"></i></BUTTON>
            </span>
        </div>

    </div>
    <% }
    }
    }
    %>
</form>