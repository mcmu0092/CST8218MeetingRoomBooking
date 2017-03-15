<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.brba.dao.*"%>
<%@ page import="com.brba.helpers.*"%>
<%
String adminID = request.getParameter("adminID");
AdminUser aUser = AdminDao.getAdminUserDetails(adminID);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Admin User</title>
</head>
<body class="hideOverFlow">
<%@include file="Header.jsp" %>
	<div id="myTab" class="container formContent">
		<h1><%=resource.getString("edit.label.title")%></h1>
		<div class="container-fluid">
			<ul class="nav nav-pills">
				<li class="active"><a href="#account" data-toggle="tab"><%=resource.getString("edit.label.account")%></a></li>
				<li ><a href="AdminManagement.jsp"><%=resource.getString("edit.label.returnA")%></a></li>
				
				<li><a href="MainMenu.jsp"><%=resource.getString("edit.label.returnM")%></a></li>
			</ul>
			<div class="tab-content clearfix">
				<div class="tab-pane active" id="account">
					<h2 class="col-sm-offset-1"><%=resource.getString("edit.form.title")%></h2>
					<form action="AdminEditServlet" method="post" class="form-horizontal">
					<fieldset>
					<input type="hidden" id="aNumb" name="AdminNum" value="<%=adminID %>" />
			    	<div class="form-group">
			    		<label class= "control-label col-sm-2" for="user"><%=resource.getString("edit.form.user")%></label>
			            <div class ="col-sm-9">
			            	<input type="text" class="form-control" id="user" name="username" value="<%=aUser.getUserName() %>" required="required" placeholder="Username"/>
			            </div>       
			        </div>
			        
	                 <div class="form-group">       
	                    <label class="control-label col-sm-2" for="email"><%=resource.getString("edit.form.email")%></label>
	                    <div class ="col-sm-9">
	                    	<input type="email" class="form-control" id="email" name="email" value="<%=aUser.getEmail() %>" required="required" placeholder="Email" />
	                    </div>
	                </div>
	                <div class="form-group">        
					        	<label class="control-label col-sm-2" for="active"><%=resource.getString("edit.form.active")%></label>
			      				<div class ="col-sm-9">       
				                   <%if(aUser.getActive().equals("1")){%>
			      						<input type="checkbox"  id="active" name="Active" checked="checked" />
			      				<%} else {%>
			      				
				                   <input type="checkbox"  id="active" name="Active"  />
				                   <%} %>
					        	</div>				        	
					        </div> 
			        <div class="form-group">        
	      				<div class="col-sm-offset-2 col-sm-4">       
		                    <input type="submit" value="<%=resource.getString("edit.form.update")%>" class="btn btn-default" />
			        	</div>
			        </div>   
				</fieldset>
				</form>

				</div>
			</div>
			
		</div>
	</div>
</body>
</html>