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
Building building = BuildingDao.getBuilding(buildingID);	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EditBuilding</title>
</head>
<body class="hideOverFlow">
<%@include file="Header.jsp" %>
	<div id="myTab" class="container formContent">
		<h1><%=resource.getString("editBuilding.label.title")%></h1>
		<div  class="container-fluid">	
			<ul class="nav nav-pills">
				<li class="active"><a href="#buildings" data-toggle="tab"><%=resource.getString("editBuilding.tab.edit")%></a></li>
				<li><a href="BuildingManagement.jsp"><%=resource.getString("editBuilding.tab.returnB")%></a></li>
				<li><a href="MainMenu.jsp"><%=resource.getString("editBuilding.tab.returnM")%></a></li>
			</ul>
			
			<div class="tab-content clearfix">
				
				<div class="tab-pane active" id="buildings">
			        <h2 class="col-sm-offset-1"><%=resource.getString("editBuilding.form.title")%></h2>
					<form action="BuildingEditServlet" method="post" class="form-horizontal">
						<fieldset>
						<input type="hidden" id="bNumb" name="BuildingNum" value="<%=buildingID %>" />
					    	<div class="form-group">       
			                    <label class="control-label col-sm-2" for="addr"><%=resource.getString("editBuilding.form.address")%></label>
			                    <div class ="col-sm-9">
			                    	<input type="text" class="form-control" id="addr" name="Address" value="<%=building.getAddress() %>" required="required" placeholder="Address" />
			                    </div>
			                </div>
			                 <div class="form-group">       
			                    <label class="control-label col-sm-2" for="city"><%=resource.getString("editBuilding.form.city")%></label>
			                    <div class ="col-sm-9">
			                    	<input type="text" class="form-control" id="city" name="City" value="<%=building.getCity() %>" required="required" placeholder="City" />
			                    </div>
			                </div>
					        
					        <div class="form-group">       
			                    <label class="control-label col-sm-2" for="prov"><%=resource.getString("editBuilding.form.province")%></label>
			                    <div class ="col-sm-9">
			                    	<select name="Province" class="form-control" id="prov">
			                    		<option selected="selected" value="<%=building.getProvince() %>"></option>
										<option value="ontario"><%=resource.getString("editBuilding.form.ON")%></option>
										<option value="quebec"><%=resource.getString("editBuilding.form.QC")%></option>										
									</select>
			                    </div>
			                </div> 
					        <div class="form-group">        
					        	<label class="control-label col-sm-2" for="active"><%=resource.getString("editBuilding.form.active")%></label>
			      				<div class ="col-sm-9">       
				                   <%if(building.getActive().equals("1")){%>
			      						<input type="checkbox"  id="active" name="Active" checked="checked" />
			      				<%} else {%>
			      				
				                   <input type="checkbox"  id="active" name="Active" value="true" />
				                   <%} %>
					        	</div>				        	
					        </div>   
					        <div class="form-group">        
			      				<div class="col-sm-offset-2 col-sm-4">       
				                    <input type="submit" value="<%=resource.getString("editBuilding.form.update")%>" class="btn btn-default" />
					        	</div>
					        </div>   
						</fieldset>
					</form>	
					
				</div>
				
			</div>
			<br>
		</div>	
	</div>
</body>
</html>