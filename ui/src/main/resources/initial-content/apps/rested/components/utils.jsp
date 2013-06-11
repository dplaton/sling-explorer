<%@page import="java.net.*,
                java.util.*,
                javax.jcr.*,
                javax.jcr.query.QueryResult,
                javax.jcr.query.QueryManager,
                javax.jcr.query.Query,
                org.apache.sling.api.resource.*,
                org.apache.sling.api.*"%>
<%!

    String parentDir(String path) {
        if (path == null) return "/";
        int x = path.lastIndexOf('/');
        if (x > 0) return path.substring(0, x);
        else return path;
    }

    Iterator listResources(ResourceResolver rres, String path) throws Exception {
        Resource res = rres.resolve(path);
        if (res == null) return Collections.EMPTY_LIST.iterator();
        else return res.listChildren();
    }

    NodeIterator listNodes(Node currentNode) throws Exception {
        NodeIterator children = currentNode.getNodes();
        return children;
    }

    String iconForType(String type) {
        if (type == null) {
            return "icon-minus";
        }
        if (type.equals("sling:Folder")) return "icon-folder-open";
        else if (type.equals("nt:file")) return "icon-file";
        else return "icon-minus";
    }

    boolean isFolder(String type) {
        if (type == null) {
            return false;
        }
        if (type.equals("sling:Folder")) return true;
        else return false;
    }

    String getRequestPath(SlingHttpServletRequest slingRequest) throws Exception {
        URL u = new URL(slingRequest.getRequestURL().toString());
        String suffix = slingRequest.getRequestPathInfo().getSuffix();
        String path = u.getPath();

        if (suffix != null) return path.substring(0, path.length() - suffix.length());
        else return path;
    }

    String getRequestSelectorExtension(SlingHttpServletRequest slingRequest) throws Exception {
        String path = getRequestPath(slingRequest);
        int i = path.indexOf('.');
        if (i == -1) return "";
        else return path.substring(i + 1);
    }

%>
