<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%String adminID = request.getParameter("adminID");
    String resetFlag = request.getParameter("resetFlag");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Password</title>
</head>
<body class="hideOverFlow">
<%@include file="Header.jsp" %>
<div class="container">
		<div class="formContent">
			<h1 class="col-sm-offset-1">Change Password</h1>
			<form action="PasswordUpdateServlet" method="post" class="form-horizontal">
				<fieldset>
				<input type="hidden" id="aNumb" name="AdminNum" value="<%=adminID %>" />
			    <input type="hidden" id="rFlag" name="rFlag" value="<%=resetFlag %>" />	
			        <div class="form-group">       
	                    <label class="control-label col-sm-2" for="pwd">Password:</label>
	                    <div class ="col-sm-9">
	                    	<input type="password" class="form-control" id="pwd" name="userpass" required="required" placeholder="Password" />
	                    </div>
	                </div>  
	                 
			        <div class="form-group">        
	      				<div class="col-sm-offset-2 col-sm-4">       
		                    <input type="submit" value="Update" class="btn btn-default" />
		                    
			        	</div>
			        </div>   
				</fieldset>
			</form>
		</div>
	</div>	
</body>
</html>