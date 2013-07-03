<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects />
<form id="IMPORTFORM" method="post" action="<%= currentNode.getPath() %>" enctype="multipart/form-data">
    <fieldset>
        <legend>Import JSON</legend>
        <input type="hidden" name=":operation" value="import" />
        <input type="hidden" name=":contentType" value="json" />

        <input id="node_name" type="text" name=":name" value="" required placeholder="node name"/>
        <textarea name=":content"></textarea>

        <input type="hidden" name=":redirect" value="<%=resource.getPath()%>.edit.html" />
        <input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>" />
    </fieldset>
</form>