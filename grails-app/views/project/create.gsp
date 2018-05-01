<!doctype html>
<html>
<head>
    <meta name="layout" content="mainLayout"/>
    <asset:javascript src="app.js"/>

</head>

<body>
    <span class="linkToList"><g:link controller="project" action="list">Back to List</g:link></span>
    <h4>Project Information</h4>

    <input type="hidden" id="editable" value="true">

    <g:render template="../errors" />
    <g:render template="projectForm" model="[project: project, editable: true, mode: 'save']"/>
</body>
</html>
