<!doctype html>
<html>
<head>
    <meta name="layout" content="mainLayout"/>
    <asset:javascript src="app.js"/>
</head>

<body>
<div id="content">
    <span class="linkToList"><g:link controller="project" action="list">Back to List</g:link></span>
    <h4>Project Information</h4>


    <g:render template="projectForm" model="[project: project, editable: false]"/>

</div>

</body>
</html>
