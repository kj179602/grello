
<%@ page import="grello.OperationHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'operationHistory.label', default: 'OperationHistory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-operationHistory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
				
			</ul>
		</div>
		<div id="show-operationHistory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list operationHistory">
			
				<g:if test="${operationHistory?.operationName}">
				<li class="fieldcontain">
					<span id="operationName-label" class="property-label"><g:message code="operationHistory.operationName.label" default="Operation Name" /></span>
					
						<span class="property-value" aria-labelledby="operationName-label"><g:fieldValue bean="${operationHistory}" field="operationName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:operationHistory, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
