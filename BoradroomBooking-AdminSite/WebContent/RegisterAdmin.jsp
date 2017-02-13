<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
<%@include file="Header.jsp" %>
	<form action="RegisterservletAdmin" method="post">
		<table>
			<tr>
				<td>ADMIN REGISTRATION</td>
			</tr>
            <tr>
                    <td>User ID</td>
                    <td><input type="text" name="username" required="required" /></td>
            </tr>
            <tr>
                    <td>Password</td>

                    <td><input type="password" name="userpass" required="required" /></td>
            </tr>
            <tr>
            		<td>Email</td>
            	    <td><input type="text" name="email" required="required" /></td>   
    		</tr>
    		<tr>
            	    <td><input type="submit" value="Register" /></td>
    		</tr>
		</table>
	</form>
</body>
</html>