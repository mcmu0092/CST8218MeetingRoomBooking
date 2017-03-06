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
<%
String buildingID =request.getParameter("buildingID");
String roomNum = request.getParameter("roomID");
Room room = RoomDao.getRoomDetails(buildingID, roomNum);	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="hideOverFlow">
<%@include file="Header.jsp" %>
	<div id="myTab" class="container formContent">
		<h1>Edit Room </h1>
		<div  class="container-fluid">	
			<ul class="nav nav-pills">
				<li class="active"><a href="#rooms" data-toggle="tab">ROOMS</a></li>
				<li><a href="RoomManagement.jsp?buildingID=<%=buildingID%>">RETURN TO Room Management</a></li>
				<li><a href="MainMenu.jsp">RETURN TO MAIN MENU</a></li>
			</ul>
			
			<div class="tab-content clearfix">
				
				<div class="tab-pane active" id="rooms">
	          		<h2 class="col-sm-offset-1" >Edit ROOM</h2>
					<form action="RoomEditServlet" method="post" class="form-horizontal">
						<fieldset>
						<input type="hidden" id="bNumb" name="BuildingNum" value="<%=buildingID %>" />
						<input type="hidden" id="bNumb" name="RoomNumOld" value="<%=roomNum %>" />
					    	<div class="form-group">
					    		<label class= "control-label col-sm-2" for="rNumb">Room:</label>
					            <div class ="col-sm-9">
					            	<input type="text" class="form-control" id="rNumb" name="RoomNum"  value="<%=room.getRoomID() %>" required="required" placeholder="Room number"/>
					            </div>       
					        </div>
			                 <div class="form-group">       
			                    <label class="control-label col-sm-2" for="pNumb">Capacity:</label>
			                    <div class ="col-sm-9">
			                    	<input type="text" class="form-control" id="pNumb" name="Capacity" value="<%=room.getCapacity() %>" required="required" placeholder="Capacity" />
			                    </div>
			                </div>
							  <div class="form-group">       
			                    <label class="control-label col-sm-2" for="info">Info:</label>
			                    <div class ="col-sm-9">
			                    	<textarea class="form-control" id="info" name="Info"  required="required" placeholder="optional" ><%=room.getInfo() %></textarea>
			                    </div>
			                </div>
			                <div class="form-group">        
					        	<label class="control-label col-sm-2" for="active">Active:</label>
			      				<div class ="col-sm-9">       
			      				<%if(room.getActive().equals("1")){%>
			      						<input type="checkbox"  id="active" name="Active" checked="checked" />
			      				<%} else {%>
			      				
				                   <input type="checkbox"  id="active" name="Active" value="true" />
				                   <%} %>
					        	</div>				        	
					        </div>   
					        <div class="form-group">        
			      				<div class="col-sm-offset-2 col-sm-4">       
				                    <input type="submit" value="Edit" class="btn btn-default" />
					        	</div>
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