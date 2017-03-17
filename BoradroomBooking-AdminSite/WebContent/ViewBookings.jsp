<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.brba.servlets.*"%>
<%@ page import="com.brba.dao.*"%>
<%@ page import="com.brba.helpers.*"%>
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
<title>ViewBookings</title>
</head>
<body class="hideOverFlow">
<%@include file="Header.jsp" %>
	<div id="myTab" class="container formContent">
		<h1><%=resource.getString("bookings.menu.bookings")%></h1>
		<div  class="container-fluid">	
			<ul class="nav nav-pills">
				<li class="active"><a href="#bookings" data-toggle="tab"><%=resource.getString("bookings.menu.tab")%></a></li>
				<li><a href="MainMenu.jsp"><%=resource.getString("bookings.menu.returnM")%></a></li>
			</ul>
			
			<div class="tab-content clearfix">
				
				<div class="tab-pane active" id="bookings">
					<div class="container-fluid">
					    <% 
					    ArrayList<Booking> bookingList = BookingDao.getBookingList();
					    int listSize = bookingList.size();
					    if(listSize !=0){
							out.print("<div class='table-responsive table-hover'><table class='table'> <thead>");
							/****************Row One****************/
							out.print("<tr>");
							out.print("<th>" + resource.getString("bookings.list.ID")+"</th>");
							out.print("<th>" + resource.getString("bookings.list.MadeBy")+"</th>");
							out.print("<th>" + resource.getString("bookings.list.At")+"</th>");
							out.print("<th>" + resource.getString("bookings.list.Till")+"</th>");
							out.print("<th></th>");
							out.print("</tr></thead>");
							out.print("<tbody>");
							for(int i = 0; i < listSize; i++){
								out.print("<tr>");
								out.print("<td>" + bookingList.get(i).getBookingNumber() + "</td>");
								out.print("<td>" + bookingList.get(i).getUser().getFirstName() + bookingList.get(i).getUser().getLastName() + "</td>");
								out.print("<td>" + bookingList.get(i).getStartBooking()+ "</td>");
								out.print("<td>" + bookingList.get(i).getEndBooking() + "</td>");
								out.print("<td><a href=\"BookingDetails.jsp?BookingId=" +  bookingList.get(i).getBookingNumber() + "\">" + resource.getString("bookings.link.details")+"</a></td>");
								out.print("</tr>");
								
							}
							out.print("</tbody></table></div>");
					    } else {
					    	out.print("<h3>" + resource.getString("bookings.header.nobookings")+"</h3>");
					    }
					    %>
					</div>
				</div>
				
			</div>
			<br>
		</div>	
	</div>
</body>
</html>