
<%@ page import="grello.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'list.label', default: 'List')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-list" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><a href="${createLink(uri: '/user/logout')}">Logout</a></li>
				<li><a href="${createLink(uri: '/board/index')}">Board</a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-list" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list list">
			
				<g:if test="${lists?.listName}">
				<li class="fieldcontain">
					<span id="listName-label" class="property-label"><g:message code="list.listName.label" default="List Name" /></span>
					
						<span class="property-value" aria-labelledby="listName-label"><g:fieldValue bean="${lists}" field="listName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lists?.board}">
				<li class="fieldcontain">
					<span id="board-label" class="property-label"><g:message code="list.board.label" default="Board" /></span>
					
						<span class="property-value" aria-labelledby="board-label"><g:link controller="board" action="show" id="${lists?.board?.id}">${lists?.board?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${lists?.tasks}">
				<li class="fieldcontain">
					<span id="tasks-label" class="property-label"><g:message code="list.tasks.label" default="Tasks" /></span>
					
						<g:each in="${lists.tasks}" var="t">
						<span class="property-value" aria-labelledby="tasks-label"><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:lists, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${lists}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
