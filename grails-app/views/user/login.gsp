<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<title>Login</title>
	</head>
	<body>
	<div class="nav" role="navigation">
			<ul>
				
				<li><a href="${createLink(uri: '/user/register')}">Register</a></li>
			</ul>
		</div>
		<div class="message">${flash.message}</div>
			<p>
			Welcome to Grello
			</p>
		<g:if test="${flash.message}" >
			<div class="message" >${flash.message}</div>
		</g:if>
		
		<g:form action="handleLogin" >
		<table>
			<tr class="prop" >
				<td class="name" >
				<label for="login" >Login:</label>
				</td>
				<td class="value" >
				<input type="text" id="login" name="login" value="" >
				</td>
			</tr>
				<tr class="prop" >
				<td class="name" >
				<label for="password" >Password:</label>
				</td>
				<td class="value" >
				<input type="password" id="password" name="password" value="" >
				</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="login" /></td>
			</tr>
		</table>
		</g:form>
	</body>
</html>