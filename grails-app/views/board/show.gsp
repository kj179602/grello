
<%@ page import="grello.Board" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'board.label', default: 'Board')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-board" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a href="${createLink(uri: '/user/logout')}">Logout</a></li>
				<li><a href="${createLink(uri: '/operationHistory/index')}">History</a></li>
				<li><a href="${createLink(uri: '/team/index')}">Team</a></li>
				<li><a href="${createLink(uri: '/board/index')}">Board</a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-board" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list board">
			
				<g:if test="${board?.boardName}">
				<li class="fieldcontain">
					<span id="boardName-label" class="property-label"><g:message code="board.boardName.label" default="Board Name" /></span>
					
						<span class="property-value" aria-labelledby="boardName-label"><g:fieldValue bean="${board}" field="boardName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${board?.boardAuthor}">
				<li class="fieldcontain">
					<span id="boardAuthor-label" class="property-label"><g:message code="board.boardAuthor.label" default="Board Author" /></span>
					
						<span class="property-value" aria-labelledby="boardAuthor-label"><g:link controller="user" action="show" id="${board?.boardAuthor?.id}">${board?.boardAuthor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${board?.lists}">
				<li class="fieldcontain">
					<span id="lists-label" class="property-label"><g:message code="board.lists.label" default="Lists" /></span>
					
						<g:each in="${board.lists}" var="l">
						<span class="property-value" aria-labelledby="lists-label"><g:link controller="list" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:board, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${board}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
