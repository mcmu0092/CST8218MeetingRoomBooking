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
			for(i = 0; i < listSize; i++){
				
				out.print("<div  class=\"form-horizontal\">");
				
				out.print("<div class=\"form-group\">");
				
				out.print("<label class=\"control-label col-sm-2\"> Address: </label>");
				out.print("<label class=\"control-label \">"+roomList.get(i).getBuilding().getAddress()+"&nbsp </label>");
				out.print("<label class=\"control-label \">"+roomList.get(i).getBuilding().getCity()+",</label>");
				out.print("<label class=\"control-label \">"+roomList.get(i).getBuilding().getProvince()+"</label>");
				
				out.print("</div>");
				
				out.print("<div class=\"form-group\">");
				
				out.print("<label class=\"control-label col-sm-2\"> Room Number: </label>");
				out.print("<label class=\"control-label \">"+roomList.get(i).getRoomID()+"</label>");
				
				out.print("<label class=\"control-label \">&nbsp Capacity:&nbsp </label>");
				out.print("<label class=\"control-label \">"+roomList.get(i).getCapacity()+"</label>");
				
				out.print("</div>");
				
				out.print("<div class=\"form-group\">");
				
				out.print("<label class=\"control-label col-sm-2\"> Additional Info </label>");
				out.print("<label class=\"control-label \">"+ roomList.get(i).getInfo()+"</label>");
				
				out.print("</div>");
				
				out.print("<div class=\"form-group\">");
				out.print("<div class=\"col-sm-offset-2 col-sm-4\">");
				out.print("<button class=\"btn btn-default\" data-toggle=\"collapse\" data-target=\"#roomListing"+i+"\" >Book Now</button>");
				out.print("</div>");
				out.print("</div>");
				
				
				out.print("<div id=\"roomListing"+i+"\" class=\"collapse\">");
				
				if(session.getAttribute("name") == null) {
					out.print("<a  href=\"login.jsp\">PLEASE LOGIN TO MAKE A BOOKING</a>");
				} else {
					out.print("<form action=\"BookingServlet\" method=\"post\" class=\"form-horizontal\">");
					out.print("<fieldset>");
					
					out.print("<input type=\"hidden\" id=\"bNumb\" name=\"BuildingNum\" value=\""+roomList.get(i).getBuildingID()+"\" />");
					out.print("<input type=\"hidden\" id=\"rNumb\" name=\"RoomNum\" value=\""+roomList.get(i).getRoomID()+"\" />");
					
					%> 
<!-- Date and Time picker code from http://www.malot.fr/bootstrap-datetimepicker -->

<div class="form-group">
                <label for="dtp_input1" class="col-md-2 control-label">Booking Date and Time:</label>
                <div class="input-group date form_datetime col-md-5" data-date="" data-date-format="yyyy/mm/dd hh:ii" data-link-field="dtp_input1">
                    <input class="form-control" size="16" type="text" value="" required="required" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="dtp_input1" name="StartDateTime" value="" /><br/>
            </div>
            					
				
				
<script src="./resource/js/bootstrap.min.js"></script>
<script src="./resource/js/bootstrap-datetimepicker.js"></script>

<script type="text/javascript">
var startDate = new Date();
startDate.setDate(startDate.getDate()+7);
$('.form_datetime').datetimepicker({
   
    weekStart: 1,
    startDate: startDate,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	forceParse: 0,
    showMeridian: 1
});


    </script>
    
    <div class="form-group">       
			                    <label class="control-label col-sm-2" >Duration:</label>	
			                    <div class ="col-sm-2">		                    
			                    <input type="number" class="form-control" name="duration" max="240" step="10" required placeholder="Duration in minutes" />
			                    </div>
			                </div>
			                
			                <div class="form-group">       
			                    <label class="control-label col-sm-2" for="info">Info:</label>
			                    <div class ="col-sm-9">
			                    	<textarea class="form-control" id="info" name="Info"  required="required"  ></textarea>
			                    </div>
			                   </div>
					<%
					
					
					
					
					
					out.print("<div class=\"form-group\">");				
					out.print("<div class=\"col-sm-offset-2 col-sm-4\">");
					out.print("<input type=\"submit\" value=\"Book\" class=\"btn btn-default\"    />");
					out.print("</div>");
					out.print("</div>");
					
					out.print("</fieldset>");
					out.print("</form>");
				}
				
				
				out.print("</div>");
				
				
				
				out.print("</div>");
				
				
				
			}
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