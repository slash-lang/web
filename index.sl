<%

require("highlighter");

def class_name_to_underscores(name) {
    name.split("::").map(\part {
        part.replace(%r{(?<=[a-z])([A-Z])}, \match { "_" + match[0] }).lower
    }).join("/");
}

def unescape_html(html) {
    html.replace("&lt;", "<").replace("&gt;", ">").replace("&quot;", "\"");
}

def highlight_code_segments(markdown) {
    markdown.replace(%r{<pre><code>((.|\n)*?)</code></pre>}, \md {
        # hacky unescaping lol:
        if md[1].index("&lt;%") {
            "<pre><code>" + md[1].replace(%r{&lt;%((.|\n)*?)%&gt;}, \md {
                "&lt;%" + Highlighter.new(unescape_html(md[1])).to_html + "%&gt;"
            }) + "</pre></code>";
        } else {
            "<pre><code>" + Highlighter.new(unescape_html(md[1])).to_html + "</code></pre>";
        }
    });
}

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
html = highlight_code_segments(Markdown.compile(markdown_source));

documented_classes = [Comparable, Error, Error::Frame, Object, String, Method, BoundMethod, Class, Nil, False, True, Int];

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
            <% for klass in documented_classes.sort(\(a, b) { a.to_s <=> b.to_s }) { %>
                <li><a href="/index.sl/doc/<%= class_name_to_underscores(klass.to_s) %>"><%= klass.to_s %></a></li>
            <% } %>
        </ul>
    </nav>
    <section>
        <%!! html %>
    </section>
</body>
</html>