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
<meta  charset=ISO-8859-1">
<title>BuildingManagement</title>
</head>
<body class="hideOverFlow">
<%@include file="Header.jsp" %>
	<div id="myTab" class="container formContent">
		<h1>Building Managment</h1>
		<div  class="container-fluid">	
			<ul class="nav nav-pills">
				<!--  <li class="active"><a href="#rooms" data-toggle="tab">ROOMS</a></li>-->
				<li class="active"><a href="#buildings" data-toggle="tab">BUILDING</a></li>
				<li><a href="MainMenu.jsp">RETURN TO MAIN MENU</a></li>
			</ul>
			
			<div class="tab-content clearfix">
				
				<div class="tab-pane active" id="buildings">
			        <h2 class="col-sm-offset-1">ADD A BUILDING</h2>
					<form action="BuildingServlet" method="post" class="form-horizontal">
						<fieldset>
					    	<div class="form-group">       
			                    <label class="control-label col-sm-2" for="addr">Address:</label>
			                    <div class ="col-sm-9">
			                    	<input type="text" class="form-control" id="addr" name="Address" required="required" placeholder="Address" />
			                    </div>
			                </div>
			                 <div class="form-group">       
			                    <label class="control-label col-sm-2" for="city">City:</label>
			                    <div class ="col-sm-9">
			                    	<input type="text" class="form-control" id="city" name="City" required="required" placeholder="City" />
			                    </div>
			                </div>
					        
					        <div class="form-group">       
			                    <label class="control-label col-sm-2" for="prov">Province:</label>
			                    <div class ="col-sm-9">
			                    	<select name="Province" class="form-control" id="prov">
										<option value="ontario">Ontario</option>
										<option value="quebec">Quebec</option>										
									</select>
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
		
		ArrayList<Building> buildingList = BuildingDao.getBuildingList();
		int listSize = buildingList.size();
		//out.print("<h3 >Listing of Buildings</h3>");
		if(listSize !=0){
			out.print("<h3 >Listing of Buildings</h3>");
			out.print("<table>");
			/****************Row One****************/
			out.print("<tr>");
			out.print("<td> BuildingId </td>");
			out.print("<td> Address </td>");
			out.print("<td> City </td>");
			out.print("<td> Province </td>");
			out.print("<td> Active</td>");
			out.print("</tr>");
			for(int i = 0; i < listSize; i++)
			{
			
				/****************Row Two****************/
				out.print("<tr>");
				out.print("<td>" + buildingList.get(i).getID() + "</td>");
				out.print("<td>" + buildingList.get(i).getAddress() + "</td>");
				out.print("<td>" + buildingList.get(i).getCity() + "</td>");
				out.print("<td>" + buildingList.get(i).getProvince() + "</td>");
				if(buildingList.get(i).getActive().equals("1")){
					out.print("<td>Yes</td>");
				} else if (buildingList.get(i).getActive().equals("0")){
					out.print("<td>No</td>");
				}
				//out.print("</tr>");
				/***************Row Three***************/
				//out.print("<tr>");
				
				out.print("<td><a href=\"RoomManagement.jsp?buildingID=" + buildingList.get(i).getID() + "\">Add Room &nbsp</a></td>");
				
				out.print("<td><a href=\"EditBuilding.jsp?buildingID=" + buildingList.get(i).getID() + "\">Edit Building &nbsp</a></td>");
				
				out.print("<td><a href=\"DeleteBuilding.jsp?buildingID=" + buildingList.get(i).getID() + "\">Delete Building</a></td>");
				out.print("</tr>");
							
			}
			out.print("</table>");
		} else {
			out.print("<h3>No buildings currently exist!</h3>");
		}
		
	%>	
				</div>
				
			</div>
			<br>
		</div>	
	</div>
</body>
</html>