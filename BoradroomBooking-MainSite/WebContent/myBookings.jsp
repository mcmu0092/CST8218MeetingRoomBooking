<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.brb.servlets.*"%>
<%@ page import="com.brb.dao.*"%>
<%@ page import="com.brb.helpers.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Bookings</title>
</head>
<body>
	<a href="profile.jsp">Profile</a>
	<%
		//Makes sure user is actually logged in
		if(session.getAttribute("name") == null)
		{
			out.print("You are not logged in. To log in click <a href=\"login.jsp\">Here</a>");	
		}else
		{
			ArrayList<Booking> Bookings = BookingDao.getUserBookings((String)session.getAttribute("userID"));
			int listSize = Bookings.size();
			
			if(listSize != 0)
			{
				out.print("<h3>My Bookings</h3>");
				
				//Prints all the bookings

				for(int i = 0; i < listSize; i++)
				{
					out.print("<table>");
					/****************Row One****************/
					out.print("<tr>");
					out.print("<td> Building: " + Bookings.get(i).getBuildingNumber() + "</td>");
					out.print("<td> Room: " + Bookings.get(i).getRoomNumber() + "</td>");
					out.print("</tr>");
					
					/****************Row Two****************/
					out.print("<tr>");
					out.print("<td> Date/Time:</td>");
					out.print("<td>" + Bookings.get(i).getStartBooking()+ "</td>");
					out.print("</tr>");
					
					/***************Row Three***************/
					out.print("<tr>");
					out.print("<td></td>");
					out.print("<td>" + Bookings.get(i).getEndBooking() + "</td>");
					out.print("</tr>");
					
					/***************Row Four****************/
					out.print("<tr>");
					out.print("<td> Information: </td>");
					out.print("</tr>");
					
					/***************Row Five****************/
					out.print("<tr>");
					out.print("<td>" + Bookings.get(i).getInfo() + "</td>");
					out.print("</tr>");
					out.print("</table>");
					out.print("<br><br><br>");
				}
			}
	
		}
	%>


</body>
</html>