
<%@ page import="grello.Document" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="list-document" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="documentName" title="${message(code: 'document.documentName.label', default: 'Document Name')}" />
					
						<th><g:message code="document.task.label" default="Task" /></th>
					
						<g:sortableColumn property="document" title="${message(code: 'document.document.label', default: 'Document')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${documentList}" status="i" var="document">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${document.id}">${fieldValue(bean: document, field: "documentName")}</g:link></td>
					
						<td>${fieldValue(bean: document, field: "task")}</td>
					
						<td>${fieldValue(bean: document, field: "document")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${documentCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
