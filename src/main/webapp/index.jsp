
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Jenkins Test Page</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
    </head>
<body>

<div class="layout">
    <section class="hero">
        <span class="kicker">Jenkins / Tomcat</span>
        <h1>Jenkins Automation Test Page</h1>
        <p class="lead">This page is deployed to Tomcat by Jenkins to verify a CI/CD pipeline. Use the form to submit test data — the handler will display it safely.</p>

        <div style="height:18px"></div>

        <div class="card">
            <form action="process.jsp" method="post">
                <div>
                    <label for="username">Your Name</label>
                    <input id="username" name="username" type="text" placeholder="Enter name" required />
                </div>

                <div>
                    <label for="environment">Select Environment</label>
                    <select id="environment" name="environment">
                        <option value="dev">Development</option>
                        <option value="qa">QA</option>
                        <option value="prod">Production</option>
                    </select>
                </div>

                <div>
                    <label for="comments">Comments</label>
                    <textarea id="comments" name="comments" placeholder="Any message (optional)"></textarea>
                </div>

                <div class="row">
                    <button type="submit" class="btn-primary">SUBMIT</button>
                    <button type="reset" class="btn-secondary" style="background:transparent;border:1px solid rgba(255,255,255,0.04);color:var(--muted);border-radius:10px;padding:10px 14px;">RESET</button>
                </div>

                <div class="meta">Tip: Each deploy will change the server info displayed in the right column.</div>
            </form>
        </div>
    </section>

    <aside class="side">
        <div class="info card">
            <h3 style="margin:0 0 8px 0">Server Info</h3>
            <p class="small"><b>Current Time:</b> <%= new java.util.Date() %></p>
            <p class="small"><b>Server:</b> <%= request.getServerName() %>:<%= request.getServerPort() %></p>
            <p class="small"><b>JSP Reload Counter:</b> <%= Math.round(Math.random() * 100000) %></p>
            <a class="back" href="#">Refresh</a>
        </div>

        <div class="info card">
            <h4 style="margin:0 0 6px 0">About This App</h4>
            <p class="small">Simple sample WAR to exercise CI/CD. The submit button posts to <code>process.jsp</code> which echoes sanitized input back for validation.</p>
        </div>
    </aside>
</div>
</body>
</html>

