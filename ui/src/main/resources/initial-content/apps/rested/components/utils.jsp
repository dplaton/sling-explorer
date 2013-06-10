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

    NodeIterator searchNodes(SlingHttpServletRequest req, String q) throws Exception {
        String queryType = "JCR-SQL2";
        String statement = buildQuery(q);
        Session session = req.getResourceResolver().adaptTo(Session.class);
        QueryManager queryManager = session.getWorkspace().getQueryManager();
        Query query = queryManager.createQuery(statement, queryType);

        QueryResult result = query.execute();
        NodeIterator nodeIter = result.getNodes();
        return nodeIter;
    }

    String iconForType(String type) {
        if (type.equals("sling:Folder")) return "icon-folder-open";
        else if (type.equals("nt:file")) return "icon-file";
        else return "icon-minus";
    }

    boolean isFolder(String type) {
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
