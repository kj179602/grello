<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'board.label', default: 'Board')}" />
		<title>Boards</title>
	</head>
	
	<body>
		<div class="nav" role="navigation">
			<ul>
                <li><g:link controller="board">Tablice</g:link></li>
                <li><a href="/grello/board/create">New board</a></li>
                <li><a href="/logout">Logout</a></li>
			</ul>
		</div>
	
	<g:form action="save" >
		<table>
			<tr class="prop" >
				<td class="name" ><label for="bName" >Nazwa tablicy:</label></td>
				<td class="value" ><input type="text" id="bName" name="bName" value="" ></td>
			</tr>
			<tr>
			<td></td>
			<td><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</tr>
		</table>
	</g:form>
	
	</body>
</html>
