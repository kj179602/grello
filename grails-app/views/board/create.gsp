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
	
	<g:form action="handleCreate" >
		<table>
			<tr class="prop" >
				<td class="name" ><label for="nazwaTab" >Nazwa tablicy:</label></td>
				<td class="value" ><input type="text" id="nazwaTab" name="nazwaTab" value="" ></td>
			</tr>
			<tr>
			<td></td>
			<td><input type="submit" value="Utworz" /></td>
			</tr>
		</table>
	</g:form>
	
	</body>
</html>
