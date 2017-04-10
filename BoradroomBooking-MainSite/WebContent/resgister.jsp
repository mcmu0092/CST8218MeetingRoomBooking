<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="Header.jsp" %>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title><%=resource.getString("register.label.title") %></title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="soStyle.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="hideOverFlow">
	<div class="container">
		<div class="formContent">
			<h1 class="col-sm-offset-1"><%=resource.getString("register.header.register") %></h1>
			<form action="Registerservlet" method="post" class="form-horizontal">
				<fieldset>
			    	<div class="form-group">
			    		<label class= "control-label col-sm-2" for="user"><%=resource.getString("register.label.user") %></label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="user" name="username" required="required" placeholder="<%=resource.getString("register.placeholder.user") %>"/>
			            </div>       
			        </div>
			        <div class="form-group">       
	                    <label class="control-label col-sm-2" for="pwd"><%=resource.getString("register.label.password") %></label>
	                    <div class ="col-sm-9">
	                    	<input type="password" class="form-control" id="pwd" name="userpass" required="required" placeholder="<%=resource.getString("register.placeholder.password") %>" />
	                    </div>
	                </div>  
	                 <div class="form-group">       
	                    <label class="control-label col-sm-2" for="email"><%=resource.getString("register.label.email") %></label>
	                    <div class ="col-sm-9">
	                    	<input type="email" class="form-control" id="email" name="email" required="required" placeholder="<%=resource.getString("register.placeholder") %>" />
	                    </div>
	                </div>
	                <div class="form-group">
			    		<label class= "control-label col-sm-2" for="fName"><%=resource.getString("register.label.firstName") %></label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="fName" name="firstname" required="required" placeholder="<%=resource.getString("register.placeholder.firstName") %>"/>
			            </div>       
			        </div>  
			        <div class="form-group">
			    		<label class= "control-label col-sm-2" for="lName"><%=resource.getString("register.label.lastName") %></label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="lName" name="lastname" required="required" placeholder="<%=resource.getString("register.placeholder.lastName") %>"/>
			            </div>       
			        </div> 
			        <div class="form-group">
			    		<label class= "control-label col-sm-2" for="city"><%=resource.getString("register.label.city") %></label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="city" name="city" required="required" placeholder="<%=resource.getString("register.placeholder.cty") %>"/>
			            </div>       
			        </div>
			        <div class="form-group">
			    		<label class= "control-label col-sm-2" for="comp"><%=resource.getString("register.label.company") %></label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="comp" name="company" placeholder="<%=resource.getString("register.placeholder.company") %>"/>
			            </div>       
			        </div>
			        <div class="form-group">
			    		<label class= "control-label col-sm-2" for="prov"><%=resource.getString("register.label.province") %></label>
			            <div class ="col-sm-9">
			            	<select name="province" class="form-control" id="prov">
								<option value="ontario"><%=resource.getString("register.option.ontario") %></option>
								<option value="quebec"><%=resource.getString("register.option.quebec") %></option>
								
							</select>
			            </div>       
			        </div>	
			        <div class="form-group">        
	      				<div class="col-sm-offset-2 col-sm-4">       
		                    <input type="submit" value="<%=resource.getString("register.button.register") %>" class="btn btn-default" />
		                    <a href="login.jsp"><%=resource.getString("register.link.login") %></a>
			        	</div>
			        	
			        </div>   
				</fieldset>
			</form>
		</div>
	</div>	

</body>
</html>