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
<!-------------------------- Table to add buildings --------------------------->
	<form name="addBuilding" action="BuildingServlet" method="post">
		<table>
            <tr>
                    <td>Province</td>
                    <td><input type="text" name="province" required="required" /></td>
            </tr>
            <tr>
                    <td>City</td>
                    <td><input type="text" name="city" required="required" /></td>
            </tr>
            <tr>
                    <td>Address</td>
                    <td><input type="text" name="address" required="required" /></td>
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
	
<!-------------------------- Prints out all current buildings --------------------------->
	<%
		BuildingServlet buildings = new BuildingServlet();
		ArrayList<Row_Building> buildingList = buildings.getBuildingList();
		int listSize = buildingList.size();
		
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
			out.print("<td> Province: " + buildingList.get(i).getProvince() + "</td>");
			out.print("<td> City: " + buildingList.get(i).getCity() + "</td>");
			out.print("<td> Address: " + buildingList.get(i).getAddress() + "</td>");
			out.print("<td> Active: " + buildingList.get(i).getActive() + "</td>");
			out.print("</tr>");
			/***************Row Three***************/
			out.print("<tr>");
			out.print("<td><a href=\"deleteBuilding.jsp\">Delete Building</a></td>");
			out.print("<td><a href=\"RoomManagement.jsp?buildingID=" + buildingList.get(i).getID() + "\">Add Room</a></td>");
			//out.print("<td><a href=\"editBuilding.jsp\">Edit Building</a></td>");
			out.print("</tr>");
			out.print("</table>");			
		}
	%>
</body>
</html>