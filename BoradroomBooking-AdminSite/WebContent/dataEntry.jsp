<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DATA ENTRY</title>
</head>
<body class="hideOverFlow">
<%@include file="Header.jsp" %>
	<div id="myTab" class="container formContent">
		<h1>DATA ENTRY</h1>
		<div  class="container-fluid">	
			<ul class="nav nav-pills">
				<li class="active"><a href="#rooms" data-toggle="tab">ROOMS</a></li>
				<li><a href="#buildings" data-toggle="tab">BUILDINGS</a></li>
				<li><a href="MainMenu.jsp">RETURN TO MAIN MENU</a></li>
			</ul>
			
			<div class="tab-content clearfix">
				<div class="tab-pane active" id="rooms">
	          		<h2 class="col-sm-offset-1" >ADD A ROOM</h2>
					<form action="RoomServlet" method="post" class="form-horizontal">
						<fieldset>
					    	<div class="form-group">
					    		<label class= "control-label col-sm-2" for="rNumb">Room:</label>
					            <div class ="col-sm-9">
					            	<input type="text" class="form-control" id="rNumb" name="RoomNum" required="required" placeholder="Room number"/>
					            </div>       
					        </div>
					        <div class="form-group">       
			                    <label class="control-label col-sm-2" for="bNumb">Building:</label>
			                    <div class ="col-sm-9">
			                    	<input type="password" class="form-control" id="bNumb" name="BuildingNum" required="required" placeholder="Building number" />
			                    </div>
			                </div>  
			                 <div class="form-group">       
			                    <label class="control-label col-sm-2" for="pNumb">Capacity:</label>
			                    <div class ="col-sm-9">
			                    	<input type="text" class="form-control" id="pNumb" name="Capcity" required="required" placeholder="Capacity" />
			                    </div>
			                </div>
							  <div class="form-group">       
			                    <label class="control-label col-sm-2" for="info">Info:</label>
			                    <div class ="col-sm-9">
			                    	<textarea class="form-control" id="info" name="Info" required="required" placeholder="optional" ></textarea>
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
				<div class="tab-pane" id="buildings">
			        <h2 class="col-sm-offset-1">ADD A BUILDING</h2>
					<form action="BuildingServlet" method="post" class="form-horizontal">
						<fieldset>
					    	<div class="form-group">
					    		<label class= "control-label col-sm-2" for="bNumb">Building:</label>
					            <div class ="col-sm-9">
					            	<input type="text" class="form-control" id="bNumb" name="BuildingNum" required="required" placeholder="Building number"/>
					            </div>       
					        </div>
					        <div class="form-group">       
			                    <label class="control-label col-sm-2" for="prov">Province:</label>
			                    <div class ="col-sm-9">
			                    	<input type="password" class="form-control" id="prov" name="Province" required="required" placeholder="Province" />
			                    </div>
			                </div>  
			                 <div class="form-group">       
			                    <label class="control-label col-sm-2" for="city">City:</label>
			                    <div class ="col-sm-9">
			                    	<input type="text" class="form-control" id="city" name="City" required="required" placeholder="City" />
			                    </div>
			                </div>
							    <div class="form-group">       
			                    <label class="control-label col-sm-2" for="addr">Address:</label>
			                    <div class ="col-sm-9">
			                    	<input type="text" class="form-control" id="addr" name="Address" required="required" placeholder="Address" />
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
			</div>
			<br>
		</div>	
	</div>
</body>
</html>