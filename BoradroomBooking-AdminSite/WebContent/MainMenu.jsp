<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Main Menu</title>
</head>
<body class="hideOverFlow">
<%@include file="Header.jsp" %>
	<div class="container formContent">
			<h1><%=resource.getString("menu.label.Admin")%></h1>
			<div class="list-group">
				<span class="list-group-item active"><%=resource.getString("menu.label.options")%></span>
				<a class="list-group-item" href="AdminManagement.jsp"><%=resource.getString("menu.label.AdminManagement")%></a>
				<a class="list-group-item" href="BuildingManagement.jsp"><%=resource.getString("menu.label.BuildingManagement")%></a>
				<a class="list-group-item" href="ViewBookings.jsp"><%=resource.getString("menu.label.Bookings")%></a>
				<a class="list-group-item" href="Logout.jsp"><%=resource.getString("menu.label.logout")%></a>
			</div>
			<label class= "control-label col-sm-2"><a href="ChangeLanguage.jsp"><%=langToChangeTo%></a></label>
	</div>
</body>
</html>