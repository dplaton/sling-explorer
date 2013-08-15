<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@page import="java.io.*,
                java.net.*,
                javax.jcr.*,
                org.apache.sling.api.resource.*,
                utils.*"
        %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects/><%

    ValueMap map = resource.adaptTo(ValueMap.class);
    String rtype = map.get("sling:resourceType", "");
    String rstype = map.get("sling:resourceSuperType", "");
    String ptype = map.get("jcr:primaryType", "");

%>
<FORM ID="EDIT_RENDERING_PROPERTIES_FORM" class="form-horizontal" METHOD="POST" ACTION="<%= resource.getPath() %>"
      ENCTYPE="MULTIPART/FORM-DATA">
    <input type="hidden" name=":redirect" value="<%=slingRequest.getRequestURL()%>"/>
    <input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>"/>

    <div class="form-group">
        <label class="col-lg-3 control-label" for="sling:resourceType">sling:resourceType</label>

        <div class="input-group col-lg-9">
            <input id="sling:resourceType" class="form-control" type="text" name="sling:resourceType"
                   value="<%= rtype %>"/>

            <span class="input-group-btn">
             <button class="btn" type="submit" name=":redirect"
                     VALUE="<%= resource.getPath() %>.create-selector.html?type=sling:resourceType"><i
                     class="glyphicon glyphicon-pencil"></i></button>
            </span>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-lg-3" for="sling:resourceSuperType">sling:resourceSuperType</label>

        <div class="input-group col-lg-9">
            <input id="sling:resourceSuperType" class="form-control" type="text" name="sling:resourceSuperType"
                   value="<%= rstype %>"/>
		    <span class="input-group-btn">
                <button class="btn" type="submit" name=":redirect"
                        VALUE="<%= resource.getPath() %>.create-selector.html?type=sling:resourceSuperType">
                    <i class="glyphicon glyphicon-pencil"></i>
                </button>
		    </span>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-lg-3" for="jcr:primaryType">jcr:primaryType</label>

        <div class="input-group col-lg-9">
            <input class="form-control" value="<%=ptype%>" readonly="readonly">
            <span class="input-group-btn">
            <button class="btn" type="submit" name=":redirect"
                    VALUE="<%= resource.getPath() %>.create-selector.html?type=jcr:primaryType"><i
                    class="glyphicon glyphicon-pencil"></i></BUTTON>
             </span>
        </div>
    </div>
</form>
