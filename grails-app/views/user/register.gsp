<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="main" />
	<title>Login</title>
</head>
<body>
	<div class="errors">
		<g:renderErrors bean="${flash.user}" />
	</div>
	<g:if test="${flash.message}" >
		<div class="message" >${flash.message}</div>
	</g:if>
	<g:form action="handleRegistration" >
		<table>
			<tr class="prop" >
				<td class="name" ><label for="login" >User Name:</label></td>
				<td class="value" ><input type="text" id="login" name="login" value="" ></td>
			</tr>
			<tr class="prop" >
				<td class="name" ><label for="password" >Password:</label></td>
				<td class="value" ><input type="password" id="password" name="password" value="" ></td>
			</tr>
			<tr class="prop" >
				<td class="name" ><label for="confirm" > Confirm Password:</label></td>
				<td class="value" ><input type="password" id="confirm" name="confirm" value="" ></td>
			</tr>
			<tr class="prop" >
				<td class="name" ><label for="firstName" >First Name:</label></td>
				<td class="value" ><input type="text" id="firstName" name="firstName" value="" ></td>
			</tr>
			<tr class="prop" >
				<td class="name" ><label for="lastName" >Last Name:</label></td>
				<td class="value" ><input type="text" id="lastName" name="lastName" value="" ></td>
			</tr>
			<tr class="prop" >
				<td class="name" ><label for="email" >Email:</label></td>
				<td class="value" ><input type="text" id="email" name="email" value="" ></td>
			</tr>
			<tr>
			
			</tr>
			<tr>
			
				<td></td>
				<td><input type="submit" value="register" /></td>
			</tr>
		</table>
	</g:form>
</body>
</html>