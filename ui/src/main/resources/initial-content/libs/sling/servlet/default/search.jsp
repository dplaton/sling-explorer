<%@ page import="org.apache.sling.additions.service.SearchService" %>
<%@ page import="org.apache.sling.api.resource.Resource" %>
<%@ page import="javax.jcr.RepositoryException" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="javax.jcr.query.InvalidQueryException" %>

<%@ page session="false" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<%@ taglib prefix="q" uri="http://sling.apache.org/taglibs/q/1.0" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sling:defineObjects/>
<!DOCTYPE html>
<html>
<head>
    <sling:include resource="${resource}" replaceSelectors="edit-head"/>
</head>
<body>
    <sling:include resource="${resource}" replaceSelectors="navbar"/>

    <div class="container-fluid">
        <div class="search-form-container">
        <form id="searchForm" method="GET" action=".search.html" class="form-horizontal search-form">
            <div class="control-group">
                <label class="control-label" for="query">SQL2 query: </label>

                <div class="controls">
                    <input type="text" id="query" name="q" value="${param.q}" size="80"/>
                    <button class="btn btn-success" type="submit">
                        Execute query
                    </button>
                </div>
            </div>
        </form>
        </div>
        <c:if test="${not empty param.q}">
            <%
                try {
                    SearchService searchService = sling.getService(SearchService.class);
                    Iterator<Resource> nodeList = searchService.searchNodes(resourceResolver, slingRequest.getParameter("q"));
                    pageContext.setAttribute("nodeList", nodeList);

            %>
            <table class="table table-condensed pathlist">
                <thead>
                    <th>Path</th>
                    <th>Actions</th>
                </thead>
                <tbody>
                <c:forEach items="${nodeList}" var="item">
                    <tr>
                        <td><a href="${item.path}.edit.html">${item.path}</a></td>
                        <td>
                            <div class="btn-group">
                                <sling:include path="${resource.path}" replaceSelectors="pathlist-actions"/>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <% } catch (InvalidQueryException e) { %>

                <div class="alert alert-error">
                    <%= e.getMessage() %>
                </div>

            <% }   %>

        </c:if>
    </div>
</body>

</html>