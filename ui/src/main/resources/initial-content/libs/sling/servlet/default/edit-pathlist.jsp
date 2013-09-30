<%@ page import="org.apache.sling.api.request.RequestUtil" %>
<%@ page import="org.apache.sling.api.servlets.ServletResolver" %>
<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@ include file="/apps/sling-explorer/components/utils.jsp" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling" %>
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

<table class="table table-striped table-condensed pathlist">
    <thead>
    <th class="nodetype"></th>
    <th>Name</th>
    <th>Type</th>
    <th>ResourceType</th>
    <th></th>
    </thead>
    <tbody>
    <%
        ServletResolver servletResolver = sling.getService(ServletResolver.class);
        if (q != null) {
    %> <q:searchByName basePath="${resource.path}" baseType="nt:base" nodeName="${q}" resultVar="children"/>
    <%
    } else {
    %> <sling:listChildren resource="${resource}" var="children"/> <%
        }
    %>
    <c:forEach items="${children}" var="item">
        <sling:adaptTo adaptable="${item}" adaptTo="org.apache.sling.api.resource.ValueMap" var="valueMap"/>
        <sling:getProperty properties="${valueMap}" key="jcr:primaryType" var="type"/>
        <sling:getProperty properties="${valueMap}" key="sling:resourceType" var="resourceType"/>
        <sling:getProperty properties="${valueMap}" key="sling:resourceSuperType" var="resourceSuperType"/>
        <tr>
            <td>
                <i class="glyphicon <%= iconForType((String)pageContext.getAttribute("type"))%>"></i>
            </td>
            <td>
                <a href="${item.path}.${requestSelector}">${item.name}<%= (isFolder((String)pageContext.getAttribute("type")) ? "/":"")%> </a>
            </td>
            <td>${type}</td>
            <td>
                <c:if test="${not empty resourceType}">
                    ${resourceType} <a href="/.edit.html?q=${resourceType}"><i class="glyphicon glyphicon-search"></i></a>
                </c:if>
            </td>
            <td>
                <div class="btn-group pull-right">
                    <c:if test="${resourceSuperType != 'sling/bundle/resource'}">
                        <sling:include path="${item.path}" replaceSelectors="pathlist-actions"/>
                    </c:if>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

