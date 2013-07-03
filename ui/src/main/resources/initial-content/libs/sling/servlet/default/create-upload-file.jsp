<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects/>
<form id="UPLOADFORM" method="post" action="<%= currentNode.getPath() %>" enctype="multipart/form-data"
      class="modal-form">
    <fieldset>
        <legend>Choose a file to upload:</legend>
        <input class="btn" type="file" name="*"/>
        <input type="hidden" name=":redirect" value="<%=resource.getPath()%>.edit.html"/>
        <input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>"/>
    </fieldset>
</form>
