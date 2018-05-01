<!doctype html>
<html>
<head>
    <title>Page Not Found</title>
    <meta name="layout" content="mainLayout">
</head>

<body>

    <ul class="errors">
        <li>Error: Page Not Found (404)</li>
        <li>Path: ${request.forwardURI}</li>
    </ul>
    <span class="linkToList" style="float: left"><g:link controller="project" action="list">Back to List</g:link></span>
</body>
</html>
