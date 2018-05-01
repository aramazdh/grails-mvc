<%@ page import="com.synergy.task.Status" %>

<div id="formContent" style="width: 50%">

    <g:form controller="project" action="${mode}" params="[id: project?.id]">
        <div class="form-group">
            <label class="${editable ? 'required' : ''}">
                1.1 Project Title
            </label>
            <g:textField name="name" class="form-control" value="${project?.name}" required="true"/>
        </div>

        <div class="form-group">
            <label class="${editable ? 'required' : ''}">
                1.2 Project Status
            </label>
            <g:select name="status" from="${Status.values()}" value="${project?.status}" required="true"
                      noSelection="['': '-Select status-']" class="form-control" />
        </div>

        <div class="form-group">
            <label>1.3 Project Contacts</label>

            <g:render template="/contact/contactTable" model="[project: project, editable: editable]" />

        </div>

        <g:if test="${editable}">
            <g:submitButton name="Save" class="btn btn-default"/>
        </g:if>
        <g:link controller="project" action="list" class="btn btn-default">Close</g:link>
    </g:form>

</div>
