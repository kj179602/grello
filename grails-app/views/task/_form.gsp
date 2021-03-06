<%@ page import="grello.Task" %>



<div class="fieldcontain ${hasErrors(bean: task, field: 'taskName', 'error')} required">
	<label for="taskName">
		<g:message code="task.taskName.label" default="Task Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="taskName" required="" value="${task?.taskName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: task, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="task.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${task?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: task, field: 'taskUser', 'error')} ">
	<label for="taskUser">
		<g:message code="task.taskUser.label" default="Task User" />
		
	</label>
	<g:select id="taskUser" name="taskUser.id" from="${grello.User.list()}" optionKey="id" value="${task?.taskUser?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: task, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="task.comments.label" default="Comments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${task?.comments?}" var="c">
    <li><g:link controller="comments" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comments" action="create" params="['task.id': task?.id]">${message(code: 'default.add.label', args: [message(code: 'comments.label', default: 'Comments')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: task, field: 'documents', 'error')} ">
	<label for="documents">
		<g:message code="task.documents.label" default="Documents" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${task?.documents?}" var="d">
    <li><g:link controller="document" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="document" action="create" params="['task.id': task?.id]">${message(code: 'default.add.label', args: [message(code: 'document.label', default: 'Document')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: task, field: 'list', 'error')} required">
	<label for="list">
		<g:message code="task.list.label" default="List" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="list" name="list.id" from="${grello.List.list()}" optionKey="id" required="" value="${task?.list?.id}" class="many-to-one"/>

</div>

