<!doctype html>
<html>
<head>
    <meta name="layout" content="mainLayout"/>
</head>

<body>

    <div id="operations">
        <g:link class="btn btn-default" controller="project" action="create">Create Project</g:link>
    </div>

    <h4>Available Projects:</h4>
    <g:if test="${!projects || projects.isEmpty()}">
        <span style="color: red">There are no available projects.</span>
    </g:if>
    <g:else>
        <table class="table" style="width: 500px">
            <thead>
            <tr>
                <th>#</th>
                <th style="text-align: center; width: 60%">Project Title</th>
                <th style="text-align: center">Operations</th>
            </tr>
            </thead>
            <g:each var="project" in="${projects}" status="index">
                <tr>
                    <td>${index + 1}</td>
                    <td><g:link controller="project" action="show" class="projectNameLink"
                                params="[id: project.id]">${project.name}</g:link></td>
                    <td>
                        <div style="display: flex">
                            <g:link class="btn" controller="project" action="edit" params="[id: project.id]">
                                Edit
                            </g:link>
                            <g:form controller="project" action="delete" params="[id: project.id]">
                                <button type="submit" style="outline: none" class="btn btn-link">Delete</button>
                            </g:form>
                        </div>
                    </td>
                </tr>
            </g:each>
        </table>
    </g:else>

</body>
</html>
