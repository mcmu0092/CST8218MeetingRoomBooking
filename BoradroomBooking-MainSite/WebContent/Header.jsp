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
	langToChangeTo = "FRANCAIS";
} else {
	langToChangeTo= "ENGLISH";
}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<link rel="stylesheet" type="text/css" href="soStyle.css">

</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation" >
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span> 
				</button>
				<%if(session.getAttribute("name") == null) {%>
					<a class="navbar-brand" href="login.jsp"><%=resource.getString("header.link.login") %> </a>
					<a class="navbar-brand" href="resgister.jsp"><%=resource.getString("header.link.register") %></a>
					
					<%} else { %>
				<span class="navbar-brand"><%=resource.getString("header.label.welcome") %>, <%=session.getAttribute("name") %> </span>
			<%} %>
			</div>
			
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp"><%=resource.getString("header.link.home") %></a></li>
					<li><a href="index.jsp#about"><%=resource.getString("header.link.about") %></a></li>
					<li><a href="Booking.jsp?rowOffSet=1"><%=resource.getString("header.link.booking") %></a></li>
					<li><a href="index.jsp#contact"><%=resource.getString("header.link.contact") %></a></li>
					<%if(session.getAttribute("name")!= null) { %>
					<li><a href="profile.jsp"><%=resource.getString("header.link.profile") %></a></li>  
					<li><a href="Logout.jsp"><%=resource.getString("header.link.logout") %></a></li> <% } %>
					<li><a href="ChangeLanguage.jsp"><%=langToChangeTo%></a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>