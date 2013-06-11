<%@ page import="org.apache.sling.additions.service.SearchService" %>
<%@ page import="org.apache.sling.api.resource.Resource" %>
<%@ page import="java.util.Iterator" %>
<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<%@taglib prefix="q" uri="http://sling.apache.org/taglibs/q/1.0" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sling:defineObjects/>
<!DOCTYPE html>
<html>
<head>
    <sling:include resource="${resource}" replaceSelectors="edit-head"/>
</head>
<body>
<form id="searchForm" method="GET" action=".search.html" class="form-horizontal">
    <div class="control-group">
        <label class="control-label" for="query">Search query: </label>

        <div class="controls">
            <input id="query" type="text" name="q" value=""/>
            <button class="btn btn-success" type="submit">
                Search
            </button>
        </div>
    </div>
</form>
<c:if test="${not empty param.q}">
    <ul>
        <%
            SearchService searchService = (SearchService) sling.getService(SearchService.class);
            Iterator<Resource> nodeList = searchService.searchNodes(resourceResolver, slingRequest.getParameter("q"));
            pageContext.setAttribute("nodeList", nodeList);
        %>
        <c:forEach items="${nodeList}" var="item">
            <li>${item.path}</li>
        </c:forEach>
    </ul>
</c:if>
</body>

</html>