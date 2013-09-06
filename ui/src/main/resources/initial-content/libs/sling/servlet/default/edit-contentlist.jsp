<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@page import="java.io.*,
                java.net.*,
                javax.jcr.*,
                javax.jcr.query.QueryResult,
                javax.jcr.query.QueryManager,
                javax.jcr.query.Query,
                org.apache.sling.api.resource.*,
                org.apache.sling.api.*,
                utils.*"
        %>
<%@ include file="/apps/sling-explorer/components/utils.jsp" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<%
%><sling:defineObjects/><%

    String requestPath = getRequestPath(slingRequest);
    String requestSelector = getRequestSelectorExtension(slingRequest);
    String suffix = slingRequest.getRequestPathInfo().getSuffix();

%>

<%
    NodeIterator children = null;
    String q = request.getParameter("q");

    if (q != null) children = searchNodes((SlingHttpServletRequest) request, q);
    else children = listNodes(currentNode);

    while (children.hasNext()) {
        Node node = children.nextNode();
        String type = node.getProperty("jcr:primaryType").getString();
        String name = node.getName();
        String path = node.getPath();
        Node parent = node.getParent();

        Resource res = resource.getResourceResolver().resolve(node.getPath());
%>
<div>
    <hr/>
    <div>
        <div class="pull-right"><a href="<%=res.getPath()%>.edit.html"><i class="glyphicon glyphicon-pencil"></i></a></div>
    </div>
    <sling:include resource="<%=res%>" replaceSelectors="html"/>
</div>
<%
    }
%>
</tbody>
</table>

