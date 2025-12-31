<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
    // simple HTML-escape helper to avoid echoing raw input (declaration block)
    public String escapeHtml(String s) {
        if (s == null) return "";
        return s.replace("&","&amp;")
                .replace("<","&lt;")
                .replace(">","&gt;")
                .replace("\"","&quot;")
                .replace("'","&#x27;");
    }
%>
<%
    String username = escapeHtml(request.getParameter("username"));
    String environment = escapeHtml(request.getParameter("environment"));
    String comments = escapeHtml(request.getParameter("comments"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Submission Result</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
</head>
<body>
<div class="panel">
    <h2>Submission Received</h2>
    <p class="meta">Below is the sanitized data your browser submitted to the server.</p>

    <div class="field"><strong>Your Name:</strong>
        <div><%= username %></div>
    </div>

    <div class="field"><strong>Environment:</strong>
        <div><%= environment %></div>
    </div>

    <div class="field"><strong>Comments:</strong>
        <div><pre style="white-space:pre-wrap;margin:0;font-family:inherit;color:inherit"><%= comments %></pre></div>
    </div>

    <div class="meta"><strong>Server:</strong> <%= request.getServerName() %>:<%= request.getServerPort() %></div>
    <div class="meta"><strong>Received At:</strong> <%= new java.util.Date() %></div>

    <a class="btn" href="index.jsp">Back</a>
</div>
</body>
</html>
