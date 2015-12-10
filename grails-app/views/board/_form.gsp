<%@ page import="grello.Board" %>



<div class="fieldcontain ${hasErrors(bean: board, field: 'boardName', 'error')} required">
	<label for="boardName">
		<g:message code="board.boardName.label" default="Board Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="boardName" required="" value="${board?.boardName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: board, field: 'boardAuthor', 'error')} required">
	<label for="boardAuthor">
		<g:message code="board.boardAuthor.label" default="Board Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="boardAuthor" name="boardAuthor.id" from="${grello.User.list()}" optionKey="id" required="" value="${board?.boardAuthor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: board, field: 'lists', 'error')} ">
	<label for="lists">
		<g:message code="board.lists.label" default="Lists" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${board?.lists?}" var="l">
    <li><g:link controller="list" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="list" action="create" params="['board.id': board?.id]">${message(code: 'default.add.label', args: [message(code: 'list.label', default: 'List')])}</g:link>
</li>
</ul>


</div>

