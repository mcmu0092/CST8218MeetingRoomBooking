<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.brb.dao.*"%>
<%@ page import="com.brb.helpers.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bookings</title>
<%@include file="Header.jsp" %>

<link href="./resource/datetimepickercss/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

 <%
 int limit =5;
 int rowOffSet = Integer.parseInt(request.getParameter("rowOffSet"));
 int maxRows = RoomDao.getTotalNumberofRooms();
 %>
</head>
<body >


	<div class="container-fluid">
	<div class="roomContent">
	<h2 class="col-sm-offset-1" >Click on Book Room under the room you want to Book</h2>
		<%
		ArrayList<Room> roomList = RoomDao.getRoomList(limit, rowOffSet);
		int listSize = roomList.size();	
		int i;
		if(listSize != 0){
			for(i = 0; i < listSize; i++){%>
				<div  class="form-horizontal">
				
					<div class="form-group">
						<label class="control-label col-sm-2"> Address: </label>
						<label class="control-label "><%=roomList.get(i).getBuilding().getAddress()%></label>
						<label class="control-label "><%=roomList.get(i).getBuilding().getCity()%>,</label>
						<label class="control-label "><%=roomList.get(i).getBuilding().getProvince()%></label>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2"> Room Number: </label>
						<label class="control-label "><%=roomList.get(i).getRoomID()%></label>
						
						<label class="control-label  col-sm-2">Capacity</label>
						<label class="control-label "><%=roomList.get(i).getCapacity()%></label>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2"> Additional Info: </label>
						<label class="control-label "><%=roomList.get(i).getInfo()%></label>
					</div>
			<%}
			if(rowOffSet > 1 ){
				out.print("<a href=\"Booking.jsp?rowOffSet="+(rowOffSet-limit)+"\" >Previous Page</a>");
			}
			
			if((rowOffSet+i) != maxRows){
				out.print("<a href=\"Booking.jsp?rowOffSet="+(rowOffSet+limit)+"\" >Next Page</a>");
			}
			
			
			
			
			
		}
		
		
		
		
		%>
		</div>
	</div>		
</body>
</html>