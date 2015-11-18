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

<div class="fieldcontain ${hasErrors(bean: task, field: 'list', 'error')} required">
	<label for="list">
		<g:message code="task.list.label" default="List" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="list" name="list.id" from="${grello.List.list()}" optionKey="id" required="" value="${task?.list?.id}" class="many-to-one"/>

</div>

