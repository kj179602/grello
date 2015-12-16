
<%@ page import="grello.Comments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comments.label', default: 'Comments')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-comments" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-comments" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list comments">
			
				<g:if test="${comments?.commentCreater}">
				<li class="fieldcontain">
					<span id="commentCreater-label" class="property-label"><g:message code="comments.commentCreater.label" default="Comment Creater" /></span>
					
						<span class="property-value" aria-labelledby="commentCreater-label"><g:link controller="user" action="show" id="${comments?.commentCreater?.id}">${comments?.commentCreater?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${comments?.commentContent}">
				<li class="fieldcontain">
					<span id="commentContent-label" class="property-label"><g:message code="comments.commentContent.label" default="Comment Content" /></span>
					
						<span class="property-value" aria-labelledby="commentContent-label"><g:fieldValue bean="${comments}" field="commentContent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${comments?.task}">
				<li class="fieldcontain">
					<span id="task-label" class="property-label"><g:message code="comments.task.label" default="Task" /></span>
					
						<span class="property-value" aria-labelledby="task-label"><g:link controller="task" action="show" id="${comments?.task?.id}">${comments?.task?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:comments, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${comments}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
