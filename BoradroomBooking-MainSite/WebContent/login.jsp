<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="Header.jsp" %>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title><%=resource.getString("login.label.title") %></title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="soStyle.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="hideOverFlow">
	<div class="container">
		<div class="formContent">
			<h1 class="col-sm-offset-1"><%=resource.getString("login.header.login") %></h1>
			<form action="loginServlet" method="post" class="form-horizontal">
				<fieldset>
			    	<div class="form-group">
			    		<label class= "control-label col-sm-2" for="user"><%=resource.getString("login.label.user") %></label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="user" name="username" required="required" placeholder="<%=resource.getString("login.placeholder.user") %>"/>
			            </div>       
			        </div>
			        <div class="form-group">       
	                    <label class="control-label col-sm-2" for="pwd"><%=resource.getString("login.label.password") %></label>
	                    <div class ="col-sm-9">
	                    	<input type="password" class="form-control" id="pwd" name="userpass" required="required" placeholder="<%=resource.getString("login.placeholder.password") %>" />
	                    </div>
	                </div>    
			        <div class="form-group">        
	      				<div class="col-sm-offset-2 col-sm-10">       
		                    <input type="submit" value="<%=resource.getString("login.button.login") %>" class="btn btn-default" />
		                    <a href="resgister.jsp"><%=resource.getString("login.link.register") %></a>
			        	</div>
			        </div>   
			        <%if (session.getAttribute("errorMessage") != null) {%>
			        	<div class="form-group">    
			        	<p style="color:red">	<%= session.getAttribute("errorMessage") %></p>
	                    
	                    
	                </div>  
	                <%} %>
				</fieldset>
			</form>
		</div>	
	</div>		
</body>
</html>