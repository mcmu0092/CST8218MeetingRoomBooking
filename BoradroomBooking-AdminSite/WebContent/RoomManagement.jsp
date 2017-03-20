
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
		<h1><%=resource.getString("room.label.title")%></h1>
		<div  class="container-fluid">	
			<ul class="nav nav-pills">
				<li class="active"><a href="#roomDetails" data-toggle="tab"><%=resource.getString("room.menu.list")%></a></li>
				<li><a href="#rooms" data-toggle="tab"><%=resource.getString("room.menu.add")%></a></li>
				
				<li><a href="BuildingManagement.jsp"><%=resource.getString("room.menu.returnB")%></a></li>
				<li><a href="MainMenu.jsp"><%=resource.getString("room.menu.returnM")%></a></li>
			</ul>
			
			<div class="tab-content clearfix">
				<div class="tab-pane" id="rooms">
	          		<h2 class="col-sm-offset-1" ><%=resource.getString("room.form.title")%></h2>
					<form action="RoomServlet" method="post" class="form-horizontal">
						<fieldset>
						<input type="hidden" id="bNumb" name="BuildingNum" value="<%=buildingID %>" />
					    	<div class="form-group">
					    		<label class= "control-label col-sm-2" for="rNumb"><%=resource.getString("room.form.room")%></label>
					            <div class ="col-sm-9">
					            	<input type="text" class="form-control" id="rNumb" name="RoomNum" required="required" placeholder="Room number"/>
					            </div>       
					        </div>
			                 <div class="form-group">       
			                    <label class="control-label col-sm-2" for="pNumb"><%=resource.getString("room.form.capacity")%></label>
			                    <div class ="col-sm-9">
			                    	<input type="text" class="form-control" id="pNumb" name="Capacity" required="required" placeholder="Capacity" />
			                    </div>
			                </div>
							  <div class="form-group">       
			                    <label class="control-label col-sm-2" for="info"><%=resource.getString("room.form.info")%></label>
			                    <div class ="col-sm-9">
			                    	<textarea class="form-control" id="info" name="Info" required="required" placeholder="optional" ></textarea>
			                    </div>
			                </div>
			                <div class="form-group">        
					        	<label class="control-label col-sm-2" for="active"><%=resource.getString("room.form.active")%></label>
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
					</div>
				<div class='tab-pane active' id='roomDetails'>
					<div class="container-fluid">
					<%
						ArrayList<Room> buildingRoomList = RoomDao.getRoomsForBuilding(buildingID);
						int listSize = buildingRoomList.size();
						
						if(listSize !=0){
							out.print("<h2 class='col-sm-offset-1'>"+ resource.getString("room.table.title")+ " " +buildingID+"</h2>");
							out.print("<div class='table-responsive table-hover'><table class='table'> <thead>");
							/****************Row One****************/
							out.print("<tr>");
							out.print("<th>"+ resource.getString("room.table.rNum")+ "</th>");
							out.print("<th>"+ resource.getString("room.table.capacity")+ "</th>");
							out.print("<th>"+ resource.getString("room.table.info")+ "</th>");
							out.print("<th>"+ resource.getString("room.table.active")+ "</th>");
							out.print("<th></th>");
							out.print("<th></th>");
							out.print("</tr></thead>");
							out.print("<tbody>");
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
								out.print("<td><a href=\"EditRoom.jsp?buildingID=" + buildingRoomList.get(i).getBuildingID() + "&roomID="+buildingRoomList.get(i).getRoomID()+"\">"+ resource.getString("room.table.edit")+ "</a></td>");
								out.print("<td><a href=\"DeleteRoom.jsp?buildingID=" + buildingRoomList.get(i).getBuildingID() + "&roomID="+buildingRoomList.get(i).getRoomID()+"\">"+ resource.getString("room.table.delete")+ "</a></td>");
								out.print("</tr>");
									
							}
							out.print("</tbody></table></div>");		
						} else {
							out.print("<h3>"+ resource.getString("room.table.none")+ "</h3>");
						}
					%>	
				</div>
				</div>
			</div>
		</div>	
	</div>
</body>
</html>