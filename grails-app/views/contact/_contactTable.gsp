<%@ page import="com.synergy.task.Project; com.synergy.task.Contact" %>

<g:set var="contactPropertyName" value="contacts"/>
<g:set var="contactTableName" value="${contactPropertyName}Table"/>

<table id="${contactTableName}" class="table">

    <thead>
    <tr>
        <th style="width: 5%;">
            <g:if test="${editable}">
                <a id="${contactTableName}AddLink" class="btn btn-default">+</a>
            </g:if>
            <g:else>
                <span class="glyphicon glyphicon-user"></span>
            </g:else>
        </th>
        <th style="width: 30%;"><span class="${editable ? 'required' : ''}">Contact Name</span></th>
        <th style="width: 30%;"><span class="${editable ? 'required' : ''}">E-mail</span></th>
        <th style="width: 30%;">Phone</th>
    </tr>
    </thead>
    <tbody>
    <g:if test="${editable}">
        <g:render template="/contact/contactLine"
                  model="[rowId       : (contactTableName + 'TemplateRow'),
                          tableId     : contactTableName,
                          propertyName: contactPropertyName,
                          editableMode: true,
                          index       : 0,
                          contact     : new Contact(project: project as Project)
                  ]"/>
    </g:if>

    <g:each in="${project?.contacts}" var="contact" status="index">
        <g:render template="/contact/contactLine"
                  model="[rowId       : (contactTableName + 'Row'),
                          tableId     : contactTableName,
                          propertyName: contactPropertyName,
                          editableMode: editable,
                          index       : index,
                          contact     : contact]"/>
    </g:each>
    </tbody>
</table>