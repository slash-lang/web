<%

page = "/home";

if Request.path_info != "" {
    if %r{^(/[a-z_]+)+/?$}.match(Request.path_info) {
        page = Request.path_info;
    } else {
        Response.status = 404;
        page = "/404";
    }
}

markdown_source = File.read("pages" + page + ".md");
title = %r{# (.*)\n}.match(markdown_source)[1];
html = Markdown.compile(markdown_source);

%>
<!DOCTYPE html>
<html>
<head>
    <title><%= title %></title>
    <link href="/style.css" rel="stylesheet" />
    <style>
        <%#= Pygments.css %>
    </style>
</head>
<body>
    <nav>
        <h2>Slash</h2>
        <ul>
            <li><a href="/">Home</a></li>
        </ul>
        <h2>Documentation</h2>
        <ul>
            <li><a href="/index.sl/doc/comparable">Comparable</a></li>
            <li><a href="/index.sl/doc/error">Error</a></li>
            <li><a href="/index.sl/doc/object">Object</a></li>
            <li><a href="/index.sl/doc/string">String</a></li>
        </ul>
    </nav>
    <section>
        <%!! html %>
    </section>
</body>
</html>