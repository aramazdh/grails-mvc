<tr id="${rowId}">
    <td>
        <g:if test="${editableMode}">
            <a class="${tableId}DeleteLink">
                <span class="glyphicon glyphicon-trash"></span>
            </a>
        </g:if>
        <g:else>
            <span>#</span>
        </g:else>
    </td>
    <td><g:textField name="${propertyName}[${index}].name" value="${contact?.name}" class="contactInput" required="true"/></td>
    <td><g:textField name="${propertyName}[${index}].email" value="${contact?.email}" class="contactInput" required="true"/></td>
    <td><g:textField name="${propertyName}[${index}].phone" value="${contact?.phone}" class="contactInput"/></td>
</tr>