<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.brba.dao.*"%>
<%@ page import="com.brba.helpers.*"%>
<%
String bookingID = request.getParameter("BookingId");
Booking booking = BookingDao.getBookingDetails(bookingID);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Details</title>
</head>
<body class="hideOverFlow">
<%@include file="Header.jsp" %>
	<div id="myTab" class="container formContent">
		<h1><%=resource.getString("booking.menu.booking")%></h1>
		<div  class="container-fluid">	
			<ul class="nav nav-pills">
				<li class="active"><a href="#booking" data-toggle="tab"><%=resource.getString("booking.menu.tab")%></a></li>
				<li><a href="ViewBookings.jsp"><%=resource.getString("booking.menu.return")%></a></li>
				<li><a href="MainMenu.jsp"><%=resource.getString("booking.menu.returnM")%></a></li>
			</ul>
			
			<div class="tab-content clearfix">
				
				<div class="tab-pane active" id="booking">
			   		<div class="container-fluid">
						<form class="form-horizontal">
							<fieldset>
						    	<div class="form-group">       
				                    <label class="control-label col-sm-2" ><%=resource.getString("booking.label.MadeBy")%> </label>
				                    <label class="control-label"><%=booking.getUser().getFirstName()%> <%=booking.getUser().getLastName() %></label>
				                </div>
				                <div class="form-group">
				                	<label class="control-label col-sm-2" ><%=resource.getString("booking.label.Email")%></label>
				                	<label class="control-label" ><%=booking.getUser().getEmail()%></label>
				                </div>
				                <div class="form-group">
				                	<label class="control-label col-sm-2" ><%=resource.getString("booking.label.RoomNum")%></label>
				                	<label class="control-label" ><%=booking.getRoomNumber()%></label>
				                </div>
				                 <div class="form-group">
				                	<label class="control-label col-sm-2" ><%=resource.getString("booking.label.Address")%></label>
				                	<label class="control-label" ><%=booking.getBuilding().getAddress()%></label>
				                	<label class="control-label" ><%=booking.getBuilding().getCity()%></label>
				                	<label class="control-label" ><%=booking.getBuilding().getProvince()%></label>
				                </div>
				                <div class="form-group">
				                	<label class="control-label col-sm-2" ><%=resource.getString("booking.label.Date")%></label>
				                	<label class="control-label" ><%=resource.getString("booking.label.Start")%> <%=booking.getStartBooking()%></label>
				                	<label class="control-label" ><%=resource.getString("booking.label.End")%> <%=booking.getEndBooking()%></label>
				                	
				                </div>
				                 <div class="form-group">
				                	<label class="control-label col-sm-2" ><%=resource.getString("booking.label.Info")%></label>
				                	<label class="control-label" ><%=booking.getInfo() %></label>
				                	
				                	
				                </div>
							</fieldset>
						</form>	
					</div>
				</div>
				
			</div>
			<br>
		</div>	
	</div>
</body>
</html>