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
	langToChangeTo = "Francais";
} else {
	langToChangeTo= "English";
}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="soStyle.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavBar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span> 
				</button>
				<%if(session.getAttribute("name") == null) {%>
					<a class="navbar-brand" href="login.jsp">LOGIN /</a>
					<a class="navbar-brand" href="resgister.jsp">REGISTER</a>
					
					<%} else { %>
				<span class="navbar-brand">Welcome, <%= session.getAttribute("name") %> </span>
			<%} %>
			</div>
			
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp">HOME</a></li>
					<li><a href="#about">ABOUT</a></li>
					<li><a href="#contact">CONTACT</a></li>
					<%if(session.getAttribute("name")!= null) { %> <li><a href="Logout.jsp">LOGOUT</a></li> <% } %>
					<li><a href="ChangeLanguage.jsp"><%=langToChangeTo%></a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>