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
		<h1><%=resource.getString("account.label.title")%></h1>
		<div class="container-fluid">
			<ul class="nav nav-pills">
				<li class="active"><a href="#accountDetails" data-toggle="tab"><%=resource.getString("account.menu.detail")%></a></li>
				<li><a href="#account" data-toggle="tab"><%=resource.getString("account.menu.add")%></a></li>
				<li><a href="MainMenu.jsp"><%=resource.getString("account.menu.return")%></a></li>
			</ul>
			<div class="tab-content clearfix">
				<div class='tab-pane active' id='accountDetails'>
					<div class="container-fluid">
						<%
							ArrayList<AdminUser> aUserList = AdminDao.getAdminUsers();
							int listSize = aUserList.size();
							if(listSize !=0){
								out.print("<h2 class='col-sm-offset-1'>"+ resource.getString("account.table.title")+ "</h2>");
								out.print("<div class='table-responsive table-hover'><table class='table'> <thead>");
								/****************Row One****************/
								out.print("<tr>");
								out.print("<th>"+ resource.getString("account.table.AdminID")+ "</th>");
								out.print("<th>"+ resource.getString("account.table.Username")+ "</th>");
								out.print("<th>"+ resource.getString("account.table.Email")+ "</th>");
								
								out.print("<th>"+ resource.getString("account.table.Active")+ "</th>");
								out.print("<th>"+ resource.getString("account.table.ResetPassword")+ "</th>");
								out.print("<th></th>");
								out.print("<th></th>");
								out.print("</tr></thead>");
								out.print("<tbody>");
								for(int i = 0; i < listSize; i++){
									
									/****************Row Two****************/
									out.print("<tr>");
									out.print("<td>" + aUserList.get(i).getAdminNumber() + "</td>");
									out.print("<td>" + aUserList.get(i).getUserName() + "</td>");
									out.print("<td>" + aUserList.get(i).getEmail() + "</td>");
									
									if(aUserList.get(i).getActive().equals("1")){
										out.print("<td>" + resource.getString("account.table.Yes")+ "</td>");
									} else if (aUserList.get(i).getActive().equals("0")){
										out.print("<td>" + resource.getString("account.table.No")+ "</td>");
									}
									if(aUserList.get(i).getResetPassword().equals("1")){
										out.print("<td>" + resource.getString("account.table.Yes")+ "</td>");
									} else if (aUserList.get(i).getResetPassword().equals("0")){
										out.print("<td>" + resource.getString("account.table.No")+ "</td>");
									}
									//out.print("</tr>");
									/***************Row Three***************/
									//out.print("<tr>");
									
									out.print("<td><a href=\"EditAdminUser.jsp?adminID=" + aUserList.get(i).getAdminNumber() + "\">"+resource.getString("account.table.Edit")+"</a></td>");
									
									out.print("<td><a href=\"resetPassword.jsp?adminID=" + aUserList.get(i).getAdminNumber() + "\">"+resource.getString("account.table.Reset")+"</a></td>");
									
									
									out.print("</tr>");
												
								}
								out.print("</tbody></table></div>");
							}
						%>
					</div>
				</div> <!-- end of account details tab -->
				<div class="tab-pane" id="account">
					<h2 class="col-sm-offset-1"><%=resource.getString("account.form.title")%></h2>
					<form action="RegisterservletAdmin" method="post" class="form-horizontal" id="registerForm">
					<fieldset>
			    	<div class="form-group">
			    		<label class= "control-label col-sm-2" for="user"><%=resource.getString("account.form.user")%></label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="user" name="username" required="required" placeholder="Username"/>
			            </div>       
			        </div>
			        <div class="form-group">       
	                    <label class="control-label col-sm-2" for="pwd"><%=resource.getString("account.form.pass")%></label>
	                    <div class ="col-sm-9">
	                    	<input type="password" class="form-control" id="pwd" name="userpass" required="required" placeholder="Password" />
	                    </div>
	                </div>  
	                 <div class="form-group">       
	                    <label class="control-label col-sm-2" for="email"><%=resource.getString("account.form.email")%></label>
	                    <div class ="col-sm-9">
	                    	<input type="email" class="form-control" id="email" name="email" required="required" placeholder="Email" />
	                    </div>
	                </div>
			        <div class="form-group">   
	      				<div class="col-sm-offset-2 col-sm-4">       
		                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal"><%=resource.getString("account.form.register")%></button>
			        	</div>
			        </div>  
					</fieldset>
					</form>
				</div><!-- end of add account tab -->
			</div><!-- end tab content div-->
		</div> 
	</div>	
	
	<div class="modal" id="myModal" role="dialog" data-keyboard="false" data-backdrop="static">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title"><%=resource.getString("account.modal.title")%></h4>
		        </div>
		        <div class="modal-body">
		          <p><%=resource.getString("account.modal.description")%></p>
		        </div>
		        <div class="modal-footer">
		        	<a href="#accountDetails" data-toggle="tab"><input type="button" id="registerBtn" form="registerForm" onclick='$("#registerForm").submit();' value="<%=resource.getString("account.btn.confirm")%>" class="btn btn-default"  /></a>
		          	<button type="button" class="btn btn-default" data-dismiss="modal"><%=resource.getString("account.btn.cancel")%></button>
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