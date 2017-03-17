<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.ResourceBundle" %>
    <%@page import="java.util.Locale"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="adminStyle.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
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
session.setAttribute("URL", "MainMenu.jsp");

if(session.getAttribute("name") == null) { 
	response.sendRedirect("Unauthorized.html");
} 
%>
	
	
</body>
</html>