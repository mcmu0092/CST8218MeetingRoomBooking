<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.brb.servlets.*"%>
<%@ page import="com.brb.dao.*"%>
<%@ page import="com.brb.helpers.*"%>
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
<title>Profile</title>
</head>
<body>
<%@include file="Header.jsp" %>
<div id="myTab" class="formContent">
	<br>
	<h1 class="col-sm-offset-1"><%=resource.getString("profile.label.title")%></h1>
		<div class="container-fluid">	
			<ul class="nav nav-pills">	
				<li class="active"><a href="#profile" data-toggle="tab"><%=resource.getString("profile.menu.details")%></a></li>
				<li><a href="#edit" data-toggle="tab"><%=resource.getString("profile.menu.edit")%></a></li>
				<li><a href="#view" data-toggle="tab"><%=resource.getString("profile.menu.view")%></a></li>
			</ul>
			<div class="tab-content clearfix">
				<div class="tab-pane active" id="profile">
					<div class="container-fuild">
						<form class="form-horizontal">
							<fieldset>
								<% 
									User curUser = UserDao.getUser((String)session.getAttribute("userID"));
									out.print("<div class='form-group'>");
									out.print("<label class='control-label col-sm-2'>Username:</label>");
									out.print("<label class='control-label'>" + curUser.getUserName() + "</label>");
									out.print("</div>");
									
									out.print("<div class='form-group'>");
									out.print("<label class='control-label col-sm-2'>Name:</label>");
									out.print("<label class='control-label'>" + curUser.getFirstName() + " " + curUser.getLastName() + "</label>");
									out.print("</div>");
									
									out.print("<div class='form-group'>");
									out.print("<label class='control-label col-sm-2'>Location:</label>");
									out.print("<label class='control-label'>" + curUser.getCity() + ", " + curUser.getProvince() + "</label>");
									out.print("</div>");
									
									out.print("<div class='form-group'>");
									out.print("<label class='control-label col-sm-2'>Company:</label>");
									out.print("<label class='control-label'>" + curUser.getCompany() + "</label>");
									out.print("</div>");
									
									out.print("<div class='form-group'>");
									out.print("<label class='control-label col-sm-2'>Email:</label>");
									out.print("<label class='control-label'>" + curUser.getEmail() + "</label>");
									out.print("</div>");
								%>
							</fieldset>
						</form>
					</div>
				</div>
				<div class="tab-pane" id="edit">
					<div class="container-fuild">
					<h2 class="col-sm-offset-1">Update Info</h2>
					<form action="EditProfileServlet" method="post" class="form-horizontal">
						<fieldset>
							<%
							out.print("<div class='form-group'>");
							out.print("<label class='control-label col-sm-2'>Username:</label >");
							out.print("<div class ='col-sm-9'><input type=\"text\" name=\"username\" class='form-control' value=\"" + curUser.getUserName() + "\"></div>");
							out.print("</div>");
							
							out.print("<div class='form-group'>");
							out.print("<label class='control-label col-sm-2'>Password:</label>");
							out.print("<div class ='col-sm-9'><input type=\"password\" class='form-control' name=\"password\"></div>");
							out.print("</div>");
							
							out.print("<div class='form-group'>");
							out.print("<label class='control-label col-sm-2'>First Name:</label>");
							out.print("<div class ='col-sm-9'><input type=\"text\" name=\"firstName\" class='form-control' value=\"" + curUser.getFirstName() + "\"></div>");
							out.print("</div>");
							
							out.print("<div class='form-group'>");
							out.print("<label class='control-label col-sm-2'>Last Name:</label>");
							out.print("<div class ='col-sm-9'><input type=\"text\" name=\"lastName\" class='form-control' value=\"" + curUser.getLastName() + "\"></div>");
							out.print("</div>");
							
							out.print("<div class='form-group'>");
							out.print("<label class='control-label col-sm-2'>Province:</label>");
							out.print("<div class ='col-sm-9'><input type=\"text\" name=\"province\" class='form-control' value=\"" + curUser.getProvince() + "\"></div>");
							out.print("</div>");
							
							out.print("<div class='form-group'>");
							out.print("<label class='control-label col-sm-2'>City</label>");
							out.print("<div class ='col-sm-9'><input type=\"text\" name=\"city\" class='form-control' value=\"" + curUser.getCity() + "\"></div>");
							out.print("</div>");
							
							out.print("<div class='form-group'>");
							out.print("<label class='control-label col-sm-2'>Company:</label>");
							out.print("<div class ='col-sm-9'><input type=\"text\" name=\"company\" class='form-control' value=\"" + curUser.getCompany() + "\"></div>");
							out.print("</div>");
							
							out.print("<div class='form-group'>");
							out.print("<label class='control-label col-sm-2'>Email:</label>");
							out.print("<div class ='col-sm-9'><input type=\"email\" name=\"email\" class='form-control' value=\"" + curUser.getEmail() + "\"></div>");
							out.print("</div>");
							
							out.print("<div class='form-group'>");
							out.print("<label class='col-sm-offset-2 col-sm-4'><input type=\"submit\" value=\"Apply Changes\" class=\"btn btn-default\" ></label>");
							out.print("</div>");
							%>
						</fieldset>
					</form>
					</div>
				</div>
				<div class="tab-pane" id="view">
					<% 
					ArrayList<Booking> Bookings = BookingDao.getUserBookings((String)session.getAttribute("userID"));
					int listSize = Bookings.size();
					
					if(listSize != 0)
					{
						out.print("<h2 class='col-sm-offset-1'>My Bookings</h2>");
						out.print("<div class='table-responsive table-hover'><table class='table'> <thead>");
						//table Headers
						out.print("<tr>");
						out.print("<th>Building</th>");
						out.print("<th>Room</th>");
						out.print("<th>Date/Time Start</th>");
						out.print("<th>Date/Time End</th>");
						out.print("<th>Info</th>");
						out.print("</tr></thead>");
						out.print("<tbody>");
						for(int i = 0; i < listSize; i++)
						{
							
							out.print("<tr>");
							out.print("<td>" + Bookings.get(i).getBuildingNumber() + "</td>");
							out.print("<td>" + Bookings.get(i).getRoomNumber() + "</td>");
							out.print("<td>" + Bookings.get(i).getStartBooking()+ "</td>");
							out.print("<td>" + Bookings.get(i).getEndBooking() + "</td>");
							out.print("<td>" + Bookings.get(i).getInfo() + "</td>");
							out.print("</tr>");
						}
						out.print("</tbody></table></div>");
					}
					else {
						out.print("<h2 class='col-sm-offset-1>No Bookings Yet!</h2>");
					}
					%>
				</div>
			</div>
		</div>
</div>
</body>
</html>