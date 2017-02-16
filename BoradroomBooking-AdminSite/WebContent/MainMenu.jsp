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
			<h1>ADMIN OPTIONS</h1>
			<div class="list-group">
				<span class="list-group-item active">Select from the options below</span>
				<a class="list-group-item" href="RegisterAdmin.jsp">Add new Admin account</a>
				<a class="list-group-item" href="dataEntry.jsp">Add new rooms and locations</a>
				<a class="list-group-item" href="Logout.jsp">Logout</a>
			</div>
	</div>
</body>
</html>