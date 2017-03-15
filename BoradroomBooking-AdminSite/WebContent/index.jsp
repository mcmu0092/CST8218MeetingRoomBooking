<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.ResourceBundle" %>
    <%@page import="java.util.Locale"%>
<%
ResourceBundle resource;
if (session.getAttribute("lang") != null){
	resource = ResourceBundle.getBundle("app", new Locale(session.getAttribute("lang").toString()));
} else {
	resource = ResourceBundle.getBundle("app");
	session.setAttribute("lang", "en");
}
String langToChangeTo;
if(session.getAttribute("lang").equals("en")){
	langToChangeTo = "Fran\u00E7ais";
} else {
	langToChangeTo= "English";
}
session.setAttribute("URL", "index.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="adminStyle.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="hideOverFlow">
	<div class="container-fluid">
			<div class="formContent">
				<h1 class="col-sm-offset-1"><%=resource.getString("login.label.Admin")%></h1>
				
				<form action="LoginServletAdmin" method="post" class="form-horizontal">
					<fieldset>
				    	<div class="form-group">
				    		<label class= "control-label col-sm-2" for="user"><%=resource.getString("login.label.Username")%></label>
				            <div class ="col-sm-9">
				            	<input type="text" class="form-control" id="user" name="username" required="required" placeholder="<%=resource.getString("login.textholder.username")%>"/>
				            </div>       
				        </div>
				        <div class="form-group">       
		                    <label class="control-label col-sm-2" for="pwd"><%=resource.getString("login.label.Password")%></label>
		                    <div class ="col-sm-9">
		                    	<input type="password" class="form-control" id="pwd" name="userpass" required="required" placeholder="<%=resource.getString("login.textholder.password")%>" />
		                    </div>
		                </div>    
				        <div class="form-group">        
		      				<div class="col-sm-offset-2 col-sm-10">       
			                    <input type="submit" value="<%=resource.getString("login.button.Login")%>" class="btn btn-default" />
				        	</div>
				        	<label class= "control-label col-sm-2"><a href="ChangeLanguage.jsp"><%=langToChangeTo%></a></label>
				        </div>   
					</fieldset>
				</form>
			</div>	
		</div>	
</body>
</html>