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
<% String buildingID =request.getParameter("buildingID");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RoomManagement</title>
</head>
<body class="hideOverFlow">
<%@include file="Header.jsp" %>
	<div id="myTab" class="container formContent">
		<h1>Room Managements</h1>
		<div  class="container-fluid">	
			<ul class="nav nav-pills">
				<li class="active"><a href="#rooms" data-toggle="tab">ROOMS</a></li>
				<li><a href="BuildingManagement.jsp">RETURN TO Building Management</a></li>
				<li><a href="MainMenu.jsp">RETURN TO MAIN MENU</a></li>
			</ul>
			
			<div class="tab-content clearfix">
				
				<div class="tab-pane active" id="rooms">
	          		<h2 class="col-sm-offset-1" >ADD A ROOM</h2>
					<form action="RoomServlet" method="post" class="form-horizontal">
						<fieldset>
						<input type="hidden" id="bNumb" name="BuildingNum" value="<%=buildingID %>" />
					    	<div class="form-group">
					    		<label class= "control-label col-sm-2" for="rNumb">Room:</label>
					            <div class ="col-sm-9">
					            	<input type="text" class="form-control" id="rNumb" name="RoomNum" required="required" placeholder="Room number"/>
					            </div>       
					        </div>
			                 <div class="form-group">       
			                    <label class="control-label col-sm-2" for="pNumb">Capacity:</label>
			                    <div class ="col-sm-9">
			                    	<input type="text" class="form-control" id="pNumb" name="Capacity" required="required" placeholder="Capacity" />
			                    </div>
			                </div>
							  <div class="form-group">       
			                    <label class="control-label col-sm-2" for="info">Info:</label>
			                    <div class ="col-sm-9">
			                    	<textarea class="form-control" id="info" name="Info" required="required" placeholder="optional" ></textarea>
			                    </div>
			                </div>
			                <div class="form-group">        
					        	<label class="control-label col-sm-2" for="active">Active:</label>
			      				<div class ="col-sm-9">      
				                   <input type="checkbox"  id="active" name="Active" checked="checked" />
					        	</div>				        	
					        </div>   
					        <div class="form-group">        
			      				<div class="col-sm-offset-2 col-sm-4">       
				                    <input type="submit" value="ADD" class="btn btn-default" />
					        	</div>
					        </div>   
						</fieldset>
					</form>
					<%
		
		ArrayList<Room> buildingRoomList = RoomDao.getRoomsForBuilding(buildingID);
		int listSize = buildingRoomList.size();
		
		if(listSize !=0){
			out.print("<h3 >Listing of Rooms for BuildingId: "+buildingID+"</h3>");
			out.print("<table>");
			/****************Row One****************/
			out.print("<tr>");
			out.print("<td> RoomNum </td>");
			out.print("<td> Capacity </td>");
			out.print("<td> Info </td>");
			out.print("<td> Active</td>");
			out.print("</tr>");
			for(int i = 0; i < listSize; i++)
			{
				
				/****************Row Two****************/
				out.print("<tr>");
				out.print("<td>" + buildingRoomList.get(i).getRoomID() + "</td>");
				out.print("<td>" + buildingRoomList.get(i).getCapacity() + "</td>");
				out.print("<td>" + buildingRoomList.get(i).getInfo() + "</td>");
				if(buildingRoomList.get(i).getActive().equals("1")){
					out.print("<td>Yes</td>");
				} else if (buildingRoomList.get(i).getActive().equals("0")){
					out.print("<td>No</td>");
				}
				//out.print("</tr>");
				/***************Row Three***************/
				//out.print("<tr>");
				
				
				
				out.print("<td><a href=\"EditRoom.jsp?buildingID=" + buildingRoomList.get(i).getBuildingID() + "&roomID="+buildingRoomList.get(i).getRoomID()+"\">Edit Room &nbsp</a></td>");
				
				out.print("<td><a href=\"DeleteRoom.jsp?buildingID=" + buildingRoomList.get(i).getBuildingID() + "&roomID="+buildingRoomList.get(i).getRoomID()+"\">Delete Room</a></td>");
				out.print("</tr>");
					
			}
			out.print("</table>");		
		} else {
			out.print("<h3>No rooms currently exist!</h3>");
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