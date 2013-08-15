<%--
    Node creation page.

--%>
<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>

<!DOCTYPE html>
<sling:defineObjects/>
<html>
<sling:include resource="${resource}" replaceSelectors="head"/>
<body style="background-color:gray">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <a class="close" href="${resource.path}.edit.html">&times;</a>
            <h3>Create Node</h3>
        </div>

        <div class="modal-body">
            <div class="alert alert-info"><i class="icon-folder-open"></i> ${resource.path}</div>
            <sling:include resource="${resource}" replaceSelectors="create-body"/>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal">Cancel</button>
            <button class="btn btn-primary" type="submit" id="create-node-button">Save node</button>
            <script type="text/javascript">
                //todo This should be more generic.
                $("#create-node-button").on('click', function(event) {
                    event.preventDefault();
                    $("#CREATEFORM").submit();
                });
            </script>
        </div>
    </div>
</div>
</body>
</html>
