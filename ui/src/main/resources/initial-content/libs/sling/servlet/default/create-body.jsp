<%--
/************************************************************************
**     $Date: $
**   $Source: $
**   $Author: $
** $Revision: $
************************************************************************/
--%>
<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects/>
<%
    String parentPath = "/";
    if (currentNode.getDepth() > 0) {
        parentPath = currentNode.getParent().getPath();
    }

    String newContent = currentNode.getPath();
    if (newContent.equals("/")) {
        newContent = "/";
    } else {
        newContent += "/";
    }
%>

<form ID="CREATEFORM" class="form-horizontal" method="post" action="<%= newContent %>" enctype="multipart/form-data">
    <fieldset>
        <legend>Node data</legend>
        <div class="form-group">
            <label class="control-label" for="node_name">Node name:</label>

            <div class="controls">
                <input id="node_name" class="form-control" type="text" name=":name" value="" required placeholder="node name"/>
            </div>
        </div>

        <input type="hidden" name=":operation" value="import"/>
        <input type="hidden" name=":contentType" value="json"/>

        <div class="form-group">
            <label class="control-label" for="resourceType">Resource type:</label>
            <input id="resourceType" name="./sling:resourceType" class="form-control" type="text"/>
        </div>

        <div class="form-group">
            <label class="control-label" for="node_type">Node type:</label>

            <div class="controls">
                <select name=":content" class="form-control">
                    <option value="{ 'jcr:primaryType':'sling:Folder' }">Sling Folder</option>
                    <option value="{ 'jcr:primaryType':'nt:unstructured' }">Unstructured Node</option>
                    <option value="{ 'jcr:primaryType':'nt:file','jcr:content':{'jcr:primaryType':'nt:resource','jcr:data':'','jcr:mimeType':'text/plain'} }">
                        Empty Text File
                    </option>
                </select>
            </div>

            <input type="hidden" name=":redirect" value="<%=resource.getPath()%>.edit.html"/>
            <input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>"/>
        </div>
    </fieldset>
</form>



<sling:include resource="<%=resource%>" replaceSelectors="errorbar"/>
