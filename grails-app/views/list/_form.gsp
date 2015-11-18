<%@ page import="grello.List" %>



<div class="fieldcontain ${hasErrors(bean: lists, field: 'listName', 'error')} required">
	<label for="listName">
		<g:message code="list.listName.label" default="List Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="listName" required="" value="${lists?.listName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: lists, field: 'board', 'error')} required">
	<label for="board">
		<g:message code="list.board.label" default="Board" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="board" name="board.id" from="${grello.Board.list()}" optionKey="id" required="" value="${lists?.board?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: lists, field: 'tasks', 'error')} ">
	<label for="tasks">
		<g:message code="list.tasks.label" default="Tasks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${lists?.tasks?}" var="t">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['list.id': lists?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>


</div>

