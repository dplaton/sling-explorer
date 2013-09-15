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
<%@ page import="javax.jcr.nodetype.PropertyDefinition" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<%
%><sling:defineObjects/><%

    int[] propertyTypes = new int[]{
        PropertyType.STRING, PropertyType.BINARY, PropertyType.BOOLEAN, PropertyType.DATE, PropertyType.LONG, PropertyType.DOUBLE, PropertyType.DECIMAL, PropertyType.NAME, PropertyType.REFERENCE, PropertyType.WEAKREFERENCE, PropertyType.PATH, PropertyType.URI
    };


    PropertyIterator properties = null;

    String requestPath = slingRequest.getRequestPathInfo().getResourcePath();
    String content = requestPath;
    if (resource instanceof NonExistingResource) {
        content = requestPath.substring(0, requestPath.indexOf('.'));
    } else {
        properties = currentNode.getProperties();
    }

%>
<form class="form-horizontal" id="editForm" method="POST" enctype="multipart/form-data"
      action="<%=resource.getPath()%>">
    <input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURL()%>"/>
    <input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>"/>
    <%
        if (properties != null) {
            for (; properties.hasNext(); ) {
                Property p = properties.nextProperty();
                String name = p.getName();
                String value = null;

                if (p.isNode()) {
                    continue;
                }

                if (p.isMultiple()) {
                    Value[] values = p.getValues();
                    List<String> valString = new ArrayList<String>();
                    for (Value v : values) {
                        valString.add(v.getString());
                    }
                    value = "[" + StringUtils.join(valString, ',') + "]";
                } else {
                    value = p.getString();
                }

                PropertyDefinition definition = p.getDefinition();
    %>
    <div class="form-group">
        <label class="control-label col-md-2" for="<%=name%>"><%=name%>
        </label>

        <div class="input-group col-md-4">
            <% if (definition.isProtected()) { %>
            <p class="form-control-static">
                <%=value%>
            </p>
            <% } else { %>
            <input id="<%=name%>" type="text" class="form-control input-sm" name="<%=name%>" value="<%=value%>"/>
            <% } %>
        </div>
        <div class="input-group col-md-1">
            <div class="checkbox">
                <label>
                    <%
                        String disabled = definition.isProtected() ? "disabled=\"disabled\"" : "";
                        String multiple = p.isMultiple() ? "checked=\"checked\"" : "";
                    %>
                    <input type="checkbox" <%=disabled%> <%=multiple%> id="multi_<%=name.replace(":","")%>"> multiple
                </label>
            </div>
        </div>

        <div class="col-md-2">
            <% if (definition.isProtected()) { %>
            <p class="form-control-static"><%= PropertyType.nameFromValue(definition.getRequiredType())%>
            </p>
            <% } else {%>
            <select class="form-control input-sm" id="nodeType_<%=name.replace(":","")%>" name="./<%=name%>@TypeHint">
                <%
                    for (int type : propertyTypes) {
                        String selected = (type == p.getType()) ? "selected" : "";
                        String valueType = PropertyType.nameFromValue(type) + (p.isMultiple() ? "[]" : "");
                %>
                <option value="<%=valueType%>" <%=selected%>><%= valueType%>
                </option>
                <%
                    }
                %>
            </select>
            <% } %>
        </div>

        <p class="col-md-2 btn-group-md">
            <% if (!(definition.isProtected())) { %>
            <button class="btn btn-success btn-sm" type="submit" id="submit_<%= name.replace(":","")%>">
                <i class="glyphicon glyphicon-ok"></i>
            </button>
            <button class="btn btn-danger btn-sm" type="submit" name="<%=name%>" value=""
                    form="DELETE_PROPERTY_FORM">
                <i class="glyphicon glyphicon-trash"></i>
            </button>
            <% } %>
        </p>

    </div>
    <%
            }
        }
    %>
    <div id="hidden-container" style="display:none"></div>
</form>
<div class="col-md-12">
    <span class="help-block ">Enclose multiple values in square-brackets and separate the values by comma if you want to update fields with multiple values.</span>
</div>
<script type="text/javascript">

    $("#editForm input[type='checkbox']").change(function() {
        var theId = $(this).attr("id");
        var selectId = "#nodeType" + theId.substring(theId.indexOf("_"), theId.length);
        if (this.checked) {
            $(selectId + " option").each(function() {
                var newValue = this.value + "[]";
                $(this).val(newValue).text(newValue);
            });
        } else {
            $(selectId + " option").each(function() {
                var newValue = this.value.substring(0, this.value.indexOf("["));
                $(this).val(newValue).text(newValue);
            });
        }
    })

    $("#editForm button.btn-success").click(function() {
        var fieldToSubmit = this.id.substring(this.id.indexOf("_")+1, this.id.length);
        var multiCheck = $("#multi_"+fieldToSubmit);
        if (multiCheck.is(":checked")) {
            $("#editForm #" + fieldToSubmit).each(function(index) {
                console.log('Processing index ' + index);
                var value = this.value;
                if (value.indexOf("[") == 0 && value.indexOf("]") == value.length - 1) {
                    var valuesArray = value.substring(1, value.indexOf("]")).split(',');
                    var input = this;
                    $.each(valuesArray, function(index, value) {
                        console.log('Creating for ' + value);
                        $("<input>").attr({type: 'hidden', name: "./"+input.id, value: value}).appendTo("#editForm #hidden-container");
                    })
                }
                var that = $(this);
                that.attr({name:""});
            });
        } else {
            var input = $("#editForm #" + fieldToSubmit);
            var oldName = input.attr("name");
            input.attr({name: "./"+oldName});
        }

    });
</script>

<div style="margin-top:20px">
    <FORM ID="addPropertyForm" class="form-inline" METHOD="POST" ACTION="<%= resource.getPath() %>"
          ENCTYPE="MULTIPART/FORM-DATA">
        <INPUT TYPE="HIDDEN" NAME=":redirect" VALUE="<%=slingRequest.getRequestURL()%>"/>
        <INPUT TYPE="HIDDEN" NAME=":errorpage" VALUE="<%=slingRequest.getRequestURL()%>"/>

        <div class="form-group">
            <INPUT class="form-control input-sm" id="newPropertyName" TYPE="TEXT" placeholder="new property name"
                   NAME=":property_name"
                   VALUE=""/>
        </div>
        <div class="form-group">
            <INPUT class="form-control input-sm" TYPE="TEXT" placeholder="value"
                   NAME=":property_name@NameFrom" VALUE="" id="newProperty"/>
        </div>
        <div class="form-group">
            <select class="form-control input-sm" name=":property_name@TypeHint" id="typeHint">
                <%
                    for (int type : propertyTypes) {
                %>
                <option value="<%=PropertyType.nameFromValue(type)%>"><%= PropertyType.nameFromValue(type)%>
                </option>
                <%
                    }
                %>
            </select>
        </div>
        <div class="form-group">
            <div class="checkbox">
                <label><input type="checkbox" id="multi">multiple</label>
            </div>
        </div>

        <div class="form-group">
            <BUTTON class="btn btn-success btm-sm" TYPE="SUBMIT"><i class="glyphicon glyphicon-plus"></i>
            </BUTTON>
        </div>
        <div id="hidden-container"></div>
    </FORM>

    <script type="text/javascript">

        $("#addPropertyForm input[type='checkbox']").change(function() {
            if (this.checked) {
                $("#addPropertyForm #typeHint option").each(function(index) {
                    var newValue = this.value + "[]";
                    $(this).val(newValue).text(newValue);
                });
            } else {
                $("#addPropertyForm #typeHint option").each(function(index) {
                    var newValue = this.value.substring(0, this.value.indexOf("["));
                    $(this).val(newValue).text(newValue);
                });
            }
        });

        $("#addPropertyForm").submit(function() {
            var checkbox = $("#addPropertyForm input[type='checkbox']");
            if (!checkbox.is(":checked")) {
                return true;
            }
            var typeHint = $("#addPropertyForm #typeHint");
            var inputField = $("#newProperty");
            var newProperty = $("#newPropertyName");
            var value = inputField.val();


            if (value.indexOf("[") == 0 && value.indexOf("]") == value.length - 1) {
                var valuesArray = value.substring(1, value.indexOf("]")).split(',');
                $.each(valuesArray, function(index, value) {
                    console.log('Creating for ' + value);
                    $("<input>").attr({type: 'hidden', name: newProperty.val(), value: value}).appendTo("#addPropertyForm #hidden-container");
                })
            }

            inputField.remove();

        });
    </script>
</div>
