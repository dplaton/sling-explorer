<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects/>

<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <a class="close" href="${resource.path}.edit.html">&times;</a>
            <h3>Upload file</h3>
        </div>
        <form id="UPLOADFORM" method="post" action="<%= currentNode.getPath() %>" enctype="multipart/form-data"
              class="modal-form">
            <div class="modal-body">
                <fieldset>
                    <legend>Choose a file to upload:</legend>
                    <input class="btn" type="file" class="form-control" name="*"/>
                    <input type="hidden" name=":redirect" value="<%=resource.getPath()%>.edit.html"/>
                    <input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>"/>
                </fieldset>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal">Cancel</button>
                <button class="btn btn-primary" type="submit" id="upload-file-button">Upload file</button>
            </div>
        </form>
    </div>
</div>
