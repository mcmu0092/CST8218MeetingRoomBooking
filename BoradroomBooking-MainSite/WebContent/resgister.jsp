<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
	<form name ="register" action="Registerservlet" method="post">
		<table>
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
            		<td>First Name</td>
            	    <td><input type="text" name="firstname" required="required" /></td>
            	    
    		</tr>
    		<tr>
            		<td>Last Name</td>
            	    <td><input type="text" name="lastname" required="required" /></td>
            	    
    		</tr>
    		<tr>
            		<td>City</td>
            	    <td><input type="text" name="city" required="required" /></td>
            	    
    		</tr>
    		<tr>
            		<td>Company</td>
            	    <td><input type="text" name="company" /></td>
    		</tr>
    		<tr>
    		        <td>Province</td>
            	    <td><select name="province">
						<option value="ontario">Ontario</option>
						<option value="quebec">Quebec</option>
						<option value="other">Other</option>
					</select></td>
    		</tr>
    		<tr>
            	    <td><input type="submit" value="Login" /></td>
    		</tr>
		</table>
	</form>
</body>
</html>