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
		<h1><%=resource.getString("building.label.title")%></h1>
		<div  class="container-fluid">	
			<ul class="nav nav-pills">
				<!--  <li class="active"><a href="#rooms" data-toggle="tab">ROOMS</a></li>-->
				<li class="active"><a href="#buildingDetails" data-toggle="tab"><%=resource.getString("building.menu.details")%></a></li>
				<li><a href="#buildings" data-toggle="tab"><%=resource.getString("building.menu.add")%></a></li>
				<li><a href="MainMenu.jsp"><%=resource.getString("building.menu.return")%></a></li>
			</ul>
			
			<div class="tab-content clearfix">
				<div class="tab-pane" id="buildings">
			        <h2 class="col-sm-offset-1"><%=resource.getString("building.form.title")%></h2>
					<form action="BuildingServlet" method="post" class="form-horizontal" id="buildingForm">
						<fieldset>
					    	<div class="form-group">       
			                    <label class="control-label col-sm-2" for="addr"><%=resource.getString("building.form.address")%></label>
			                    <div class ="col-sm-9">
			                    	<input type="text" class="form-control" id="addr" name="Address" required="required" placeholder="Address" />
			                    </div>
			                </div>
			                 <div class="form-group">       
			                    <label class="control-label col-sm-2" for="city"><%=resource.getString("building.form.city")%></label>
			                    <div class ="col-sm-9">
			                    	<input type="text" class="form-control" id="city" name="City" required="required" placeholder="City" />
			                    </div>
			                </div>
					        
					        <div class="form-group">       
			                    <label class="control-label col-sm-2" for="prov"><%=resource.getString("building.form.province")%></label>
			                    <div class ="col-sm-9">
			                    	<select name="Province" class="form-control" id="prov">
										<option value="ontario"><%=resource.getString("building.form.ON")%></option>
										<option value="quebec"><%=resource.getString("building.form.QC")%></option>										
									</select>
			                    </div>
			                </div> 
					        <div class="form-group">        
					        	<label class="control-label col-sm-2" for="active"><%=resource.getString("building.form.active")%></label>
			      				<div class ="col-sm-9">       
				                   <input type="checkbox"  id="active" name="Active" checked="checked" />
					        	</div>				        	
					        </div>   
					        <div class="form-group">        
			      				<div class="col-sm-offset-2 col-sm-4">       
				                   <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal"><%=resource.getString("building.form.add")%></button>
					        	</div>
					        	
					        </div>   
						</fieldset>
					</form>	
					</div>
				<div class='tab-pane active' id='buildingDetails'>
					<div class="container-fluid">
					<%
						ArrayList<Building> buildingList = BuildingDao.getBuildingList();
						int listSize = buildingList.size();
						//out.print("<h3 >Listing of Buildings</h3>");
						if(listSize !=0){
							out.print("<h2 class='col-sm-offset-1'>"+resource.getString("building.table.title")+"</h2>");
							out.print("<div class='table-responsive table-hover'><table class='table'> <thead>");
							/****************Row One****************/
							out.print("<tr>");
							out.print("<th>"+resource.getString("building.table.id")+"</th>");
							out.print("<th>"+resource.getString("building.table.address")+"</th>");
							out.print("<th>"+resource.getString("building.table.city")+"</th>");
							out.print("<th>"+resource.getString("building.table.province")+"</th>");
							out.print("<th>"+resource.getString("building.table.active")+"</th>");
							out.print("<th></th>");
							out.print("<th></th>");
							out.print("<th></th>");
							out.print("</tr></thead>");
							out.print("<tbody>");
							for(int i = 0; i < listSize; i++)
							{
							
								/****************Row Two****************/
								out.print("<tr>");
								out.print("<td>" + buildingList.get(i).getID() + "</td>");
								out.print("<td>" + buildingList.get(i).getAddress() + "</td>");
								out.print("<td>" + buildingList.get(i).getCity() + "</td>");
								out.print("<td>" + buildingList.get(i).getProvince() + "</td>");
								if(buildingList.get(i).getActive().equals("1")){
									out.print("<td>"+resource.getString("building.table.yes")+"</td>");
								} else if (buildingList.get(i).getActive().equals("0")){
									out.print("<td>"+resource.getString("building.table.no")+"</td>");
								}
								//out.print("</tr>");
								/***************Row Three***************/
								//out.print("<tr>");
								
								out.print("<td><a href=\"RoomManagement.jsp?buildingID=" + buildingList.get(i).getID() + "\">"+resource.getString("building.table.add")+"</a></td>");
								
								out.print("<td><a href=\"EditBuilding.jsp?buildingID=" + buildingList.get(i).getID() + "\">"+resource.getString("building.table.edit")+"</a></td>");
								
								out.print("<td><a href=\"DeleteBuilding.jsp?buildingID=" + buildingList.get(i).getID() + "\">"+resource.getString("building.table.delete")+"</a></td>");
								out.print("</tr>");
											
							}
							out.print("</tbody></table></div>");
						} else {
							out.print("<h3>"+resource.getString("building.table.noBuilding")+"</h3>");
						}
					%>	
				</div>
			</div>
				
			</div>
			<br>
		</div>	
	</div>
		<div class="modal" id="myModal" role="dialog" data-keyboard="false" data-backdrop="static">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title"><%=resource.getString("building.modal.title")%></h4>
		        </div>
		        <div class="modal-body">
		          <p><%=resource.getString("building.modal.description")%></p>
		        </div>
		        <div class="modal-footer">
		        	<a href="#accountDetails" data-toggle="tab"><input type="button" id="registerBtn" form="registerForm" onclick='$("#buildingForm").submit();' value="<%=resource.getString("building.btn.confirm")%>" class="btn btn-default"  /></a>
		          	<button type="button" class="btn btn-default" data-dismiss="modal"><%=resource.getString("building.btn.cancel")%></button>
		        </div>
		      </div>
		      
		    </div>
		</div>
	<!--  script to ensure popup dialog goes to the top -->
	<script>
	$('#myModal').appendTo("body")
	</script>
</body>
</html>