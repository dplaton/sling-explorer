<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%><%
%><%@page session="false" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<sling:defineObjects />
<div class="navbar navbar-inverse navbar-static-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="brand" href="/">Sling Explorer</a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="">
                        <a href="/">Home</a>
                    </li>
                    <li class="">
                        <a href="/system/console" target="_blank">Console</a>
                    </li>
                    <li class="">
                        <a href="/.search.html">Search</a>
                    </li>
                </ul>
            </div>
            <%
                String userName = resource.getResourceResolver().getUserID();
            %>
            <div class="nav-collapse collapse" style="float:right">
                <ul class="nav">
                    <li class="">
                        <a href="#"><i class="icon-user icon-white"></i>&nbsp;<%=userName%></a>
                    </li>
                    <li class="">
                        <%
                            if ("anonymous".equals(userName.trim())) { %>
                                <a href="${resource.path}.authenticate.html">&nbsp;Login</a>
                                    <%} else { %>
                                <a href="system/sling/logout.html">Logout</a>
                        <% } %>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
