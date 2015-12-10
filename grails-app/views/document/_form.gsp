<%@ page import="grello.Document" %>



<div class="fieldcontain ${hasErrors(bean: document, field: 'documentName', 'error')} required">
	<label for="documentName">
		<g:message code="document.documentName.label" default="Document Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="documentName" required="" value="${document?.documentName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: document, field: 'task', 'error')} required">
	<label for="task">
		<g:message code="document.task.label" default="Task" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="task" name="task.id" from="${grello.Task.list()}" optionKey="id" required="" value="${document?.task?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: document, field: 'document', 'error')} required">
	<label for="document">
		<g:message code="document.document.label" default="Document" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="document" name="document" />

</div>

