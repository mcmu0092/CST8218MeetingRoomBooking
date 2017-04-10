<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.brb.dao.*"%>
<%@ page import="com.brb.helpers.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="Header.jsp" %>
<title> <%=resource.getString("booking.label.title") %></title>
<link href="./resource/datetimepickercss/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script>
$(document).ready(function () {
    $('#roomBooking').on('shown.bs.modal', function (event) {
        var buildingNum = ($(event.relatedTarget).data('building_num'));
        var roomNum = ($(event.relatedTarget).data('room_num'));
        $(".modal-body #bNumb").val( buildingNum );
        $(".modal-body #rNumb").val( roomNum );  
    });
});
</script>
 <%
 int limit =5;
 int rowOffSet = Integer.parseInt(request.getParameter("rowOffSet"));
 int maxRows = RoomDao.getTotalNumberofRooms();
 %>
</head>
<body>
	<div class="container formContent">
		<h2 class="col-sm-offset-1" ><%=resource.getString("booking.label.header") %></h2>
		<%
		ArrayList<Room> roomList = RoomDao.getRoomList(limit, rowOffSet);
		int listSize = roomList.size();	
		int i;
		if(listSize != 0){
			out.print("<div class='table-responsive table-hover'><table class='table'> <thead>");
			out.print("<tr>");
				out.print("<th>"+ resource.getString("booking.label.address")+ "</th>");
				out.print("<th>"+ resource.getString("booking.label.roomNum")+ "</th>");
				out.print("<th>"+ resource.getString("booking.label.capacity")+ "</th>");
				out.print("<th>"+ resource.getString("booking.label.roominfo")+ "</th>");
				out.print("<th></th>");
				out.print("</tr></thead>");
				out.print("<tbody>");
			for(i = 0; i < listSize; i++){
				out.print("<tr>");
				out.print("<td>" +roomList.get(i).getBuilding().getAddress() +" " + roomList.get(i).getBuilding().getCity() +", " + roomList.get(i).getBuilding().getProvince() +"</td>");
				out.print("<td>" +roomList.get(i).getRoomID() +"</td>");
				out.print("<td>" +roomList.get(i).getCapacity() +"</td>");
				out.print("<td>" +roomList.get(i).getInfo() +"</td>");
				out.print("<td>");
				out.print("<button class='btn btn-default' id='showBookingModal' data-toggle='modal' data-target='#roomBooking' data-building_num='"+roomList.get(i).getBuildingID()+"' data-room_num='"+roomList.get(i).getRoomID()+"'>" +resource.getString("booking.button.book") +"</button>");
				out.print("</td>");
				out.print("</tr>");
			}
			out.print("</tbody></table></div>");
		}%>		
		</div>
		<div id="roomBooking" class="modal" role="dialog" data-backdrop="static">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times</button>
							<h4 class="modal-title" style="color:black;"><%=resource.getString("booking.button.bookRoom") %></h4>
						</div>
						<div class="modal-body">
							<%
								if (session.getAttribute("name") == null){%>
									<a style="color:black;" href="login.jsp"><%=resource.getString("booking.link.login") %></a>
							<%} else {%>
									<form action="BookingServlet" method="post" class="form-horizontal">
										<fieldset>
											<input type="hidden" id="bNumb" name="BuildingNum" value="" />
											<input type="hidden" id="rNumb" name="RoomNum" value="" />
											<!-- Date and Time picker code from http://www.malot.fr/bootstrap-datetimepicker -->
											<div class="form-group">
              										<label for="dtp_input1" style="color:black;" class="col-md-2 control-label"><%=resource.getString("booking.label.datetime") %></label>
             					 						<div class="input-group date form_datetime col-md-5" data-date="" data-date-format="yyyy/mm/dd hh:ii" data-link-field="dtp_input1">
                  										<input class="form-control" size="16" type="text" value=""  required="required" readonly>
                  										<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
													<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
              										</div>
												<input type="hidden" id="dtp_input1" name="StartDateTime" required="required" value="" /><br/>
          										</div>
          									<script type="text/javascript" src="./resource/js/bootstrap-datetimepicker.js"></script>	
											<script type="text/javascript" src="./resource/js/bootstrap.min.js"></script>
											<script type="text/javascript">
												var startDate = new Date();
												startDate.setDate(startDate.getDate()+7);
												$('.form_datetime').datetimepicker({
  													weekStart: 1,
  													startDate: startDate,
													autoclose: 1,
													startView: 2,
													forceParse: 0,
  													showMeridian: 1
												});
  											</script>
 											<div class="form-group">       
	                 							 <label style="color:black;" class="control-label col-sm-2" ><%=resource.getString("booking.label.duration") %></label>	
	                 							 <div class ="col-sm-2">		                    
	                  								<input type="number" class="form-control" width="50" name="duration" max="240" step="10" required placeholder="<%=resource.getString("booking.placeholder.duration") %>" />
	                  							</div>
	                						</div>
	                						<div class="form-group">       
	                   							<label class="control-label col-sm-2" style="color:black;" for="info"><%=resource.getString("booking.label.bookinginfo") %></label>
	                    						<div class ="col-sm-9">
	                    							<textarea class="form-control" id="info" name="Info"  required="required"  ></textarea>
	                    						</div>			                  
	                   						</div>
	                   						<div class="form-group">
	                   							<div class="col-sm-offset-2 col-sm-4">
	                   								<input type="submit" value="<%=resource.getString("booking.button.bookRoom") %>" class="btn btn-default"/>
	                   							</div>
	                   						</div>
	                   					</fieldset>
	                   				</form>
							<%} %>
						</div> <!-- end of modal body -->
					</div> <!-- end of modal content -->
				</div> <!-- end of modal dialogue -->
			</div> <!-- end of modal -->
		</div>
</body>
</html>