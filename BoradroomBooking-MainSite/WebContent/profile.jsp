<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.brb.servlets.*"%>
<%@ page import="com.brb.dao.*"%>
<%@ page import="com.brb.helpers.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
</head>
<body>
	<%
		//Makes sure user is actually logged in
		if(session.getAttribute("name") == null)
		{
			out.print("You are not logged in. To log in click <a href=\"login.jsp\">Here</a>");	
		}else
		{
			User curUser = UserDao.getUser((String)session.getAttribute("userID"));
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>Username:</td>");
			out.print("<td>" + curUser.getUserName() + "</td>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td>Name:</td>");
			out.print("<td>" + curUser.getFirstName() + " " + curUser.getLastName() + "</td>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td>Location:</td>");
			out.print("<td>" + curUser.getCity() + ", " + curUser.getProvince() + "</td>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td>Company:</td>");
			out.print("<td>" + curUser.getCompany() + "</td>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td>Email:</td>");
			out.print("<td>" + curUser.getEmail() + "</td>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td><a href=\"myBookings.jsp\">My Bookings</a></td>");
			out.print("<td><a href=\"editProfile.jsp\">Edit Profile</a></td>");
			out.print("</tr>");
			out.print("</table>");
		}
	%>
	



</body>
</html>