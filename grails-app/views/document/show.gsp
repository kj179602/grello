
<%@ page import="grello.Document" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				
				<li><a href="${createLink(uri: '/user/logout')}">Logout</a></li>
				<li><a href="${createLink(uri: '/operationHistory/index')}">History</a></li>
				<li><a href="${createLink(uri: '/team/index')}">Team</a></li>
				<li><a href="${createLink(uri: '/board/index')}">Board</a></li>
				<li><a href="${createLink(uri: '/list/index')}">List</a></li>
				<li><a href="${createLink(uri: '/task/index')}">Task</a></li>
				<li><a href="${createLink(uri: '/comments/index')}">Comments</a></li>
				<li><a href="${createLink(uri: '/document/index')}">Document</a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-document" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list document">
			
				<g:if test="${document?.documentName}">
				<li class="fieldcontain">
					<span id="documentName-label" class="property-label"><g:message code="document.documentName.label" default="Document Name" /></span>
					
						<span class="property-value" aria-labelledby="documentName-label"><g:fieldValue bean="${document}" field="documentName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${document?.task}">
				<li class="fieldcontain">
					<span id="task-label" class="property-label"><g:message code="document.task.label" default="Task" /></span>
					
						<span class="property-value" aria-labelledby="task-label"><g:link controller="task" action="show" id="${document?.task?.id}">${document?.task?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${document?.document}">
				<li class="fieldcontain">
					<span id="document-label" class="property-label"><g:message code="document.document.label" default="Document" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:document, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${document}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
