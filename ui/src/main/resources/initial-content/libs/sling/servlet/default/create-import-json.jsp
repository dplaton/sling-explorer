<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects/>

<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <a class="close" href="#" data-dismiss="modal">&times;</a>
            <h3>Import JSON</h3>
        </div>
        <form id="IMPORTFORM" method="post" action="<%= currentNode.getPath() %>" enctype="multipart/form-data">
            <div class="modal-body">
                <fieldset>
                    <legend>Import JSON data</legend>
                    <input type="hidden" name=":operation" value="import"/>
                    <input type="hidden" name=":contentType" value="json"/>

                    <div class="form-group">
                        <label for="node_name">Node name:</label>
                        <input id="node_name" class="form-control" type="text" name=":name" value="" required/>
                    </div>
                    <div class="form-group">
                        <label for="json-content">JSON string:</label>
                        <textarea name=":content" class="form-control" id="json-content" rows="10" cols="25"></textarea>
                    </div>

                    <input type="hidden" name=":redirect" value="<%=resource.getPath()%>.edit.html"/>
                    <input type="hidden" name=":errorpage" value="<%=slingRequest.getRequestURL()%>"/>
                </fieldset>

            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal">Cancel</button>
                <button class="btn btn-primary" type="submit" id="import-json-button">Import JSON</button>
        <!--        <script type="text/javascript">
                    //todo This should be more generic.
                    $("#import-json-button").on('click', function(event) {
                        event.preventDefault();
                        $("#IMPORTFORM").submit();
                    });
                </script> -->
            </div>
        </form>
    </div>
</div>
</div>

