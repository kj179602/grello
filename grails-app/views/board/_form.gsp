<%@ page import="grello.Board" %>



<div class="fieldcontain ${hasErrors(bean: boardInstance, field: 'boardName', 'error')} required">
	<label for="boardName">
		<g:message code="board.boardName.label" default="Board Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="boardName" required="" value="${boardInstance?.boardName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: boardInstance, field: 'lists', 'error')} ">
	<label for="lists">
		<g:message code="board.lists.label" default="Lists" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${boardInstance?.lists?}" var="l">
    <li><g:link controller="list" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="list" action="create" params="['board.id': boardInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'list.label', default: 'List')])}</g:link>
</li>
</ul>


</div>

