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
		<table>
			<thead>
					<tr>
						<g:sortableColumn property="tableName" width="50" title="${message(code: 'board.boardName.label', default: 'Board Name')}" />
					    <th></th>
					</tr>
			</thead>
			</table>
	</body>
</html>
