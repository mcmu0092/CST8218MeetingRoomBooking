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
<title>Insert title here</title>
</head>
<body>
<!----------------------- Prints Current Building Selected ------------------------>
	<% 
	BuildingServlet buildings = new BuildingServlet();
	Row_Building building = null;
	ArrayList<Row_Room> roomList = null;
	
	if(session != null){
		building = buildings.getBuilding((String)session.getAttribute("buildingID"));
		roomList = buildings.getRoomList(building.getID());
		
		out.print("<table>");
		/****************Row One****************/
		out.print("<tr>");
		out.print("<td>");
		out.print("</td>");
		out.print("</tr>");
		/****************Row Two****************/
		out.print("<tr>");
		out.print("<td> Province: " + building.getProvince() + "</td>");
		out.print("<td> City: " + building.getCity() + "</td>");
		out.print("<td> Address: " + building.getAddress() + "</td>");
		out.print("<td> Active: " + building.getActive() + "</td>");
		out.print("</tr>");
		/***************Row Three***************/
		out.print("<tr>");
		out.print("<td></td>");
		out.print("</tr>");
		out.print("</table>");
	}
	%>	
	<!-------------------------- Table to add rooms ------------------------------->
	<form name="addRoom" action="RoomServlet" method="post">
		<table>
		    <tr>
                    <td>Room Number</td>
                    <td><input type="text" name="roomNumber" required="required" /></td>
                    <td><input type="hidden" name="buildingNumber" required="required" value="<%building.getID();%>">
            </tr>
            <tr>
                    <td>Capacity</td>
                    <td><input type="text" name="capacity" required="required" /></td>
            </tr>
            <tr>
                    <td>Info</td>
                    <td><input type="text" name="info" required="required" /></td>
            </tr>
            <tr>
                    <td>Active</td>
                    <td>
                    <select name="active">
						<option value=""></option>
						<option value="0">No</option>
						<option value="1">Yes</option>
					</select>
					</td>
            </tr>
            <tr>
                    <td><input type="submit" value="Add Building" /></td>
            </tr>
        </table>		
	</form>	
<!-------------------------- Prints out all current Rooms ------------------------------->
	<%
		int listSize = roomList.size();

		for(int i = 0; i < listSize; i++)
		{
			out.print("<table>");
			/****************Row One****************/
			out.print("<tr>");
			out.print("<td>");
			out.print("</td>");
			out.print("</tr>");
			/****************Row Two****************/
			out.print("<tr>");
			out.print("<td> Capacity: " + roomList.get(i).getCapacity() + "</td>");
			out.print("<td> Info: " + roomList.get(i).getInfo() + "</td>");
			out.print("<td> Active: " + roomList.get(i).getActive() + "</td>");
			out.print("</tr>");
			/***************Row Three***************/
			out.print("<tr>");
			//out.print("<td><a href=\"deleteRoom.jsp\">Delete Room</a></td>");
			//out.print("<td><a href=\"editRoom.jsp\">Edit Room</a></td>");
			out.print("</tr>");
			out.print("</table>");	
		}
	%>
</body>
</html>