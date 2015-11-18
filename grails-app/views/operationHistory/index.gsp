
<%@ page import="grello.OperationHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'operationHistory.label', default: 'OperationHistory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-operationHistory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><a href="${createLink(uri: '/user/logout')}">Logout</a></li>
				<li><a href="${createLink(uri: '/board/index')}">Board</a></li>
			</ul>
		</div>
		<div id="list-operationHistory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="operationName" title="${message(code: 'operationHistory.operationName.label', default: 'Operation Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${operationHistoryInstanceList}" status="i" var="operationHistoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${operationHistoryInstance.id}">${fieldValue(bean: operationHistoryInstance, field: "operationName")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${operationHistoryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
