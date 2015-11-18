
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
			
				<g:if test="${listInstance?.listName}">
				<li class="fieldcontain">
					<span id="listName-label" class="property-label"><g:message code="list.listName.label" default="List Name" /></span>
					
						<span class="property-value" aria-labelledby="listName-label"><g:fieldValue bean="${listInstance}" field="listName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${listInstance?.board}">
				<li class="fieldcontain">
					<span id="board-label" class="property-label"><g:message code="list.board.label" default="Board" /></span>
					
						<span class="property-value" aria-labelledby="board-label"><g:link controller="board" action="show" id="${listInstance?.board?.id}">${listInstance?.board?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${listInstance?.task}">
				<li class="fieldcontain">
					<span id="task-label" class="property-label"><g:message code="list.task.label" default="Task" /></span>
					
						<span class="property-value" aria-labelledby="task-label"><g:link controller="task" action="show" id="${listInstance?.task?.id}">${listInstance?.task?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:listInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${listInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
