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
<%@taglib prefix="sec" uri="http://sling.apache.org/taglibs/security"%>
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
            <div class="nav-collapse collapse" style="float:right">
                <ul class="nav">
                    <li class="">
                        <a href="#"><i class="icon-user icon-white"></i>&nbsp;<sec:currentUser/></a>
                    </li>
                    <li class="">
                        <sec:isAnonymous>
                            <a href="${resource.path}.authenticate.html">&nbsp;Login</a>
                        </sec:isAnonymous>
                        <sec:isAuthenticated>
                            <a href="system/sling/logout.html">Logout</a>
                        </sec:isAuthenticated>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
