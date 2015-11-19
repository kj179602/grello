
<%@ page import="grello.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'list.label', default: 'List')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-list" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><a href="${createLink(uri: '/user/logout')}">Logout</a></li>
				<li><a href="${createLink(uri: '/board/index')}">Board</a></li>

				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-list" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="listName" title="${message(code: 'list.listName.label', default: 'List Name')}" />
					
						<th><g:message code="list.board.label" default="Board" /></th>
					

					</tr>
				</thead>
				<tbody>
				<g:each in="${listsList}" status="i" var="lists">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${lists.id}">${fieldValue(bean: lists, field: "listName")}</g:link></td>
					
						<td>${fieldValue(bean: lists, field: "board")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>

		</div>
	</body>
</html>
