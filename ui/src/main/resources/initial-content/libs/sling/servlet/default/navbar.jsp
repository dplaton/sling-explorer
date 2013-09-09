<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%><%
%>
<%@page session="false" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<%@taglib prefix="sec" uri="http://sling.apache.org/taglibs/security" %>
<sling:defineObjects/>
<div class="navbar navbar-inverse navbar-static-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <span class="navbar-brand" href="#">Sling Explorer</span>
            <ul class="nav navbar-nav">
                <li class="">
                    <a href="/.edit.html">Home</a>
                </li>
                <li class="">
                    <a href="/system/console" target="_blank">Console</a>
                </li>
                <li class="">
                    <a href="/.search.html">Search</a>
                </li>
            </ul>
            <div class="pull-right">
                <ul class="nav navbar-nav">
                    <li class="">
                        <a href="#"><i class="glyphicon glyphicon-user"></i>&nbsp;<sec:currentUser/></a>
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
