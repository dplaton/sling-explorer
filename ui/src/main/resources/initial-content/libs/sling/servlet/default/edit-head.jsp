<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%><%
%><%@page session="false" contentType="text/html; charset=utf-8" %><%
%><%@page import="java.io.*,
                  java.net.*,
                  utils.*" 
%><%
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%
%>
    <title>RESTed::<%=resource.getPath()%></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="/apps/sling-explorer/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <!--script src="/libs/jquery/js/jquery.js"></script -->
    <!--script src="/libs/bootstrap/js/bootstrap.js"></script -->
		<style>
		.component {
			cursor: move;
		}

		.controls + .controls {
			margin-top: 2px;
		}

    .modal-body {
			max-height: 100%;
		}

		[draggable] {
			-moz-user-select: none;
			-khtml-user-select: none;
			-webkit-user-select: none;
			user-select: none;
		}

.subnavbar .breadcrumb {
	border: solid 1px lightgray;

	-webkit-border-radius: 0;
	   -moz-border-radius: 0;
	       -border-radius: 0;

  -webkit-box-shadow: inset 0 3px 10px rgba(0, 0, 0, 0.2);
     -moz-box-shadow: inset 0 3px 10px rgba(0, 0, 0, 0.2);
          box-shadow: inset 0 3px 10px rgba(0, 0, 0, 0.2);
}

			.breadcrumb input {
				margin-bottom: 0px;
			}
		</style>
