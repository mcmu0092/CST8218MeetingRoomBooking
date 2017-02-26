<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Registration</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="soStyle.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="hideOverFlow">
	<div class="container">
		<div class="formContent">
			<h1 class="col-sm-offset-1">REGISTER</h1>
			<form action="Registerservlet" method="post" class="form-horizontal">
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
			    		<label class= "control-label col-sm-2" for="fName">First Name:</label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="fName" name="firstname" required="required" placeholder="First name"/>
			            </div>       
			        </div>  
			        <div class="form-group">
			    		<label class= "control-label col-sm-2" for="lName">Last Name:</label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="lName" name="lastname" required="required" placeholder="Last name"/>
			            </div>       
			        </div> 
			        <div class="form-group">
			    		<label class= "control-label col-sm-2" for="city">City:</label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="city" name="city" required="required" placeholder="City"/>
			            </div>       
			        </div>
			        <div class="form-group">
			    		<label class= "control-label col-sm-2" for="comp">Company:</label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="comp" name="company" placeholder="Company(Optional)"/>
			            </div>       
			        </div>
			        <div class="form-group">
			    		<label class= "control-label col-sm-2" for="prov">Province:</label>
			            <div class ="col-sm-9">
			            	<select name="province" class="form-control" id="prov">
								<option value="ontario">Ontario</option>
								<option value="quebec">Quebec</option>
								<option value="other">Other</option>
							</select>
			            </div>       
			        </div>	
			        <div class="form-group">        
	      				<div class="col-sm-offset-2 col-sm-4">       
		                    <input type="submit" value="Register" class="btn btn-default" />
		                    <a href="login.jsp">Already Registered?</a>
			        	</div>
			        	
			        </div>   
				</fieldset>
			</form>
		</div>
	</div>	

</body>
</html>