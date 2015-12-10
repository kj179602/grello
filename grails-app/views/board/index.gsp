
<%@ page import="grello.Board" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'board.label', default: 'Board')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-board" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a href="${createLink(uri: '/user/logout')}">Logout</a></li>
				<li><a href="${createLink(uri: '/operationHistory/index')}">History</a></li>
				<li><a href="${createLink(uri: '/team/index')}">Team</a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-board" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="boardName" title="${message(code: 'board.boardName.label', default: 'Board Name')}" />
					
						<th><g:message code="board.boardAuthor.label" default="Board Author" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${boardList}" status="i" var="board">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${board.id}">${fieldValue(bean: board, field: "boardName")}</g:link></td>
					
						<td>${fieldValue(bean: board, field: "boardAuthor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${boardCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
