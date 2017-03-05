<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.brba.dao.*"%>
<%@ page import="com.brba.helpers.*"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administrative Account Management</title>
</head>
<body class="hideOverFlow">
<%@include file="Header.jsp" %>
	<div id="myTab" class="container formContent">
		<h1>Administrative Account Management</h1>
		<div class="container-fluid">
			<ul class="nav nav-pills">
				<li class="active"><a href="#account" data-toggle="tab">Add Account</a></li>
				<li><a href="MainMenu.jsp">RETURN TO MAIN MENU</a></li>
			</ul>
			<div class="tab-content clearfix">
				<div class="tab-pane active" id="account">
					<h2 class="col-sm-offset-1">Add Administrative Account</h2>
					<form action="RegisterservletAdmin" method="post" class="form-horizontal">
					<fieldset>
			    	<div class="form-group">
			    		<label class= "control-label col-sm-2" for="user">UserName:</label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="user" name="username" required="required" placeholder="Username"/>
			            </div>       
			        </div>
			        <div class="form-group">       
	                    <label class="control-label col-sm-2" for="pwd">Password:</label>
	                    <div class ="col-sm-9">
	                    	<input type="password" class="form-control" id="pwd" name="userpass" required="required" placeholder="Password" />
	                    </div>
	                </div>  
	                 <div class="form-group">       
	                    <label class="control-label col-sm-2" for="email">Email:</label>
	                    <div class ="col-sm-9">
	                    	<input type="email" class="form-control" id="email" name="email" required="required" placeholder="Email" />
	                    </div>
	                </div>
			        <div class="form-group">        
	      				<div class="col-sm-offset-2 col-sm-4">       
		                    <input type="submit" value="Register" class="btn btn-default" />
			        	</div>
			        </div>   
				</fieldset>
				</form>
				<%
				ArrayList<AdminUser> aUserList = AdminDao.getAdminUsers();
				int listSize = aUserList.size();
				if(listSize !=0){
					out.print("<h3 >Listing of Admin Accounts</h3>");
					out.print("<table>");
					/****************Row One****************/
					out.print("<tr>");
					out.print("<td> AdminID </td>");
					out.print("<td> Username </td>");
					out.print("<td> Email </td>");
					
					out.print("<td> Active</td>");
					out.print("<td> ResetPassword </td>");
					out.print("</tr>");
					for(int i = 0; i < listSize; i++){
						
						/****************Row Two****************/
						out.print("<tr>");
						out.print("<td>" + aUserList.get(i).getAdminNumber() + "</td>");
						out.print("<td>" + aUserList.get(i).getUserName() + "</td>");
						out.print("<td>" + aUserList.get(i).getEmail() + "</td>");
						
						if(aUserList.get(i).getActive().equals("1")){
							out.print("<td>Yes</td>");
						} else if (aUserList.get(i).getActive().equals("0")){
							out.print("<td>No</td>");
						}
						if(aUserList.get(i).getResetPassword().equals("1")){
							out.print("<td>Yes</td>");
						} else if (aUserList.get(i).getResetPassword().equals("0")){
							out.print("<td>No</td>");
						}
						//out.print("</tr>");
						/***************Row Three***************/
						//out.print("<tr>");
						
						out.print("<td><a href=\"EditAdminUser.jsp?adminID=" + aUserList.get(i).getAdminNumber() + "\">Edit Admin Account &nbsp</a></td>");
						
						out.print("<td><a href=\"resetPassword.jsp?adminID=" + aUserList.get(i).getAdminNumber() + "\">Reset Password &nbsp</a></td>");
						
						
						out.print("</tr>");
									
					}
					out.print("</table>");
				}
				
				%>
				
				
				
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>