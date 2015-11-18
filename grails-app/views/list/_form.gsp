<%@ page import="grello.List" %>



<div class="fieldcontain ${hasErrors(bean: listInstance, field: 'listName', 'error')} required">
	<label for="listName">
		<g:message code="list.listName.label" default="List Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="listName" required="" value="${listInstance?.listName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: listInstance, field: 'board', 'error')} required">
	<label for="board">
		<g:message code="list.board.label" default="Board" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="board" name="board.id" from="${grello.Board.list()}" optionKey="id" required="" value="${listInstance?.board?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: listInstance, field: 'task', 'error')} required">
	<label for="task">
		<g:message code="list.task.label" default="Task" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="task" name="task.id" from="${grello.Task.list()}" optionKey="id" required="" value="${listInstance?.task?.id}" class="many-to-one"/>

</div>

