<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects/>
<form id="IMPORTFORM" method="post" action="<%= currentNode.getPath() %>" enctype="multipart/form-data">
    <fieldset>
        <legend>Import JSON data</legend>
        <input type="hidden" name=":operation" value="import"/>
        <input type="hidden" name=":contentType" value="json"/>

        <div class="control-group">
            <label for="node_name">Node name:</label>
            <input id="node_name" type="text" name=":name" value="" required/>
        </div>
        <div class="control-group">
            <label for="json-content">JSON string:</label>
            <textarea name=":content" id="json-content" rows="10" cols="25"></textarea>
        </div>

        <input type="hidden" name=":redirect" value="<%=resource.getPath()%>.edit.html"/>
        <input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>"/>
    </fieldset>
</form>