<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Listy</title>
</head>
<body>
  
  <div class="nav" role="navigation">
			<ul>
                <li><g:link controller="list">Listy</g:link></li>
                 <li><a href="/grello/list/create">New List</a></li>
               <!--   <li><a href="/logout">Logout</a></li> -->
			</ul>
		</div>
	
	<br>
		<table>
			<thead>
					<tr>
						
							<g:each in="${list}" var="list">
							<p>${list.listName}</p>
							</g:each>		
					</tr>
			</thead>
		</table>
 
</body>
</html>