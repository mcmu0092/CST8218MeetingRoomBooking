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
<title>Edit Profile</title>
</head>
<body>
	<form action="EditProfileServlet" method="post">
	<%
		//Makes sure user is actually logged in
		if(session.getAttribute("name") == null)
		{
			out.print("You are not logged in. To log in click <a href=\"login.jsp\">Here</a>");	
		}else
		{
			User curUser = UserDao.getUser((String)session.getAttribute("userID"));
			
			out.print("<input type=\"hidden\" name=\"userNumber\" value=\"" + curUser.getUserNumber() + "\">");
			
			out.print("<table>");
			
			out.print("<tr>");
			out.print("<td>Username:</td>");
			out.print("<td><input type=\"text\" name=\"username\" value=\"" + curUser.getUserName() + "\"></td>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td>Password:</td>");
			out.print("<td><input type=\"password\" name=\"password\"></td>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td>First Name:</td>");
			out.print("<td><input type=\"text\" name=\"firstName\" value=\"" + curUser.getFirstName() + "\"></td>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td>Last Name:</td>");
			out.print("<td><input type=\"text\" name=\"lastName\" value=\"" + curUser.getLastName() + "\"></td>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td>Province:</td>");
			out.print("<td><input type=\"text\" name=\"province\" value=\"" + curUser.getProvince() + "\"></td>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td>City</td>");
			out.print("<td><input type=\"text\" name=\"city\" value=\"" + curUser.getCity() + "\"></td>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td>Company:</td>");
			out.print("<td><input type=\"text\" name=\"company\" value=\"" + curUser.getCompany() + "\"></td>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td>Email:</td>");
			out.print("<td><input type=\"email\" name=\"email\" value=\"" + curUser.getEmail() + "\"></td>");
			out.print("</tr>");
			
			out.print("<tr>");
			out.print("<td><input type=\"submit\" value=\"Apply Changes\"></td>");
			out.print("</tr>");

			out.print("<tr>");
			out.print("<td><a href=\"myBookings.jsp\">My Bookings</a></td>");
			out.print("<td><a href=\"editProfile.jsp\">Edit Profile</a></td>");
			out.print("</tr>");
			out.print("</table>");
		}
	%>
	</form>
</body>
</html>