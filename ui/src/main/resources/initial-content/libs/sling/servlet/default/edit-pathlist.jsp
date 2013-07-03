<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@ include file="/apps/sling-explorer/components/utils.jsp" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.3" %>
<%@taglib prefix="q" uri="http://sling.apache.org/taglibs/q" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sling:defineObjects/>
<%
    String requestPath = getRequestPath(slingRequest);
    String requestSelector = getRequestSelectorExtension(slingRequest);
    pageContext.setAttribute("requestSelector", requestSelector);
    String suffix = slingRequest.getRequestPathInfo().getSuffix();
    String q = request.getParameter("q");
    pageContext.setAttribute("q", q);
%>

<table class="table table-condensed pathlist">
    <thead>
    <th class="nodetype"></th>
    <th>Name</th>
    <th>Type</th>
    <th>ResourceType</th>
    <th></th>
    </thead>
    <tbody>
    <%
        if (q != null) {
    %> <q:searchByName basePath="/apps|/libs" baseType="nt:base" nodeName="${q}" resultVar="children"/>
    <%
    } else {
    %> <sling:listChildren resource="${resource}" var="children"/> <%
        }
    %>
    <c:forEach items="${children}" var="item">
        <sling:adaptTo adaptable="${item}" adaptTo="org.apache.sling.api.resource.ValueMap" var="valueMap"/>
        <sling:getProperty properties="${valueMap}" key="jcr:primaryType" var="type"/>
        <sling:getProperty properties="${valueMap}" key="sling:resourceType" var="resourceType"/>
        <tr>
            <td>
                <i class="<%=iconForType((String)pageContext.getAttribute("type"))%>"></i>
            </td>
            <td>
                <a href="${item.path}.${requestSelector}">${item.name}<%=(isFolder((String)pageContext.getAttribute("type")) ? "/":"")%> </a>
            </td>
            <td>${type}</td>
            <td>
                <c:if test="${not empty resourceType}">
                    ${resourceType} <a href="/.edit.html?q=${resourceType}"><i class="icon-search"></i></a>
                </c:if>
            </td>
            <td>
                <div class="btn-group pull-right">
                    <sling:include path="${resource.path}" replaceSelectors="pathlist-actions"/>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

