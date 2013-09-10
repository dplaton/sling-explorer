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
<%!
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
    }

%>
<form class="form-horizontal" id="EDIT_CUSTOM_PROPERTIES_FORM" method="POST" enctype="multipart/form-data" action="<%=resource.getPath()%>">
    <input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURL()%>"/>
    <input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>"/>
    <%
        if (properties != null) {
            for (; properties.hasNext(); ) {
                Property p = properties.nextProperty();
                String name = p.getName();
                String value = null;

                if (name.startsWith("jcr:")) continue;
                if (name.startsWith("sling:")) continue;

                if (p.isMultiple() == true) {
                    Value v[] = p.getValues();
                    continue;
                } else {
                    value = p.getString();
                }

    %>


    <div class="form-group">
        <label class="control-label col-lg-3" for="<%=name%>"><%=name%>
        </label>

        <div class="input-group col-lg-9">
            <input id="<%=name%>" type="text" class="form-control" name="<%=name%>" value="<%=value%>"/>
				<span class="input-group-btn">
                    <button class="btn btn-success" type="submit" form="EDIT_CUSTOM_PROPERTIES_FORM">
                        <i class="glyphicon glyphicon-ok"></i>
                    </button>
                        <button class="btn btn-danger" type="submit" name="<%=name%>" value=""
                                form="DELETE_PROPERTY_FORM"><i class="glyphicon glyphicon-trash"></i></button>
				</span>
        </div>
    </div>
    <%
            }
        }
    %>
</form>

<FORM ID="ADD_PROPERTY_FORM" class="form-inline" METHOD="POST" ACTION="<%= resource.getPath() %>"
      ENCTYPE="MULTIPART/FORM-DATA">
    <INPUT TYPE="HIDDEN" NAME=":redirect" VALUE="<%=slingRequest.getRequestURL()%>"/>
    <INPUT TYPE="HIDDEN" NAME=":errorpage" VALUE="<%=slingRequest.getRequestURL()%>"/>
    <div class="form-group">
        <INPUT class="form-control" TYPE="TEXT" placeholder="new property name" NAME=":property_name" VALUE=""/>
    </div>
    <div class="form-group">
        <INPUT class="form-control" TYPE="TEXT" placeholder="value"
               NAME=":property_name@NameFrom" VALUE=""/>
    </div>
    <div class="form-group">
        <BUTTON class="btn btn-success" TYPE="SUBMIT"><i class="glyphicon glyphicon-plus"></i>
        </BUTTON>
    </div>
</FORM>
