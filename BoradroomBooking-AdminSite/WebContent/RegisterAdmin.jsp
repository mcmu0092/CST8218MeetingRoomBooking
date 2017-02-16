<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body class="hideOverFlow">
<%@include file="Header.jsp" %>
	<div class="container">
		<div class="formContent">
			<h1 class="col-sm-offset-1">ADMIN REGISTER</h1>
			<form action="RegisterservletAdmin" method="post" class="form-horizontal">
				<fieldset>
			    	<div class="form-group">
			    		<label class= "control-label col-sm-2" for="user">User ID:</label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="user" name="username" required="required" placeholder="Username"/>
			            </div>       
			        </div>
			        <div class="form-group">       
	                    <label class="control-label col-sm-2" for="pwd">Password:</label>
	                    <div class ="col-sm-9">
	                    	<input type="password" class="form-control" id="pwd" name="userpass" required="required" placeholder="Password" />
	                    </div>
	                </div>  
	                 <div class="form-group">       
	                    <label class="control-label col-sm-2" for="email">Email:</label>
	                    <div class ="col-sm-9">
	                    	<input type="text" class="form-control" id="email" name="email" required="required" placeholder="Email" />
	                    </div>
	                </div>
			        <div class="form-group">        
	      				<div class="col-sm-offset-2 col-sm-4">       
		                    <input type="submit" value="Register" class="btn btn-default" />
		                    <a href="MainMenu.jsp">Return to main menu</a>
			        	</div>
			        </div>   
				</fieldset>
			</form>
		</div>
	</div>	
</body>
</html>