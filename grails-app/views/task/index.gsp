<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Zadania</title>
</head>
<body>
  <div class="nav" role="navigation">
			<ul>
                <li><g:link controller="task">Zadania</g:link></li>
                 <li><a href="/grello/task/create">New Task</a></li>
               <!--   <li><a href="/logout">Logout</a></li> -->
			</ul>
		</div>
	
	<br>
		<table>
			<thead>
					<tr>
						
							<g:each in="${tasks}" var="task">
							<p>${task.taskName}</p>
							</g:each>		
					</tr>
			</thead>
		</table>
</body>
</html>