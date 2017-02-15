<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="soStyle.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="hideOverFlow">
	<div class="container">
		<div class="formContent">
			<h1 class="col-sm-offset-1">LOGIN</h1>
			<form action="loginServlet" method="post" class="form-horizontal">
				<fieldset>
			    	<div class="form-group">
			    		<label class= "control-label col-sm-2" for="user">User ID:</label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="user" name="username" required="required" placeholder="Enter username"/>
			            </div>       
			        </div>
			        <div class="form-group">       
	                    <label class="control-label col-sm-2" for="pwd">Password:</label>
	                    <div class ="col-sm-9">
	                    	<input type="password" class="form-control" id="pwd" name="userpass" required="required" placeholder="Enter password" />
	                    </div>
	                </div>    
			        <div class="form-group">        
	      				<div class="col-sm-offset-2 col-sm-10">       
		                    <input type="submit" value="Login" class="btn btn-default" />
		                    <a href="resgister.jsp">Need to register?</a>
			        	</div>
			        </div>   
				</fieldset>
			</form>
		</div>	
	</div>		
</body>
</html>