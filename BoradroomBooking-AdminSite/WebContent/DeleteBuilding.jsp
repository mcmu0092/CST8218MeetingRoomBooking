<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.brba.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String buildingID =request.getParameter("buildingID");

int status;
status = BuildingDao.deleteBuilding(buildingID);
if(status == 0){
	response.sendRedirect("BuildingManagement.jsp");	
} else {
	out.print("<p style=\"color:red\">An error happened</p>"); 
	RequestDispatcher rd=request.getRequestDispatcher("BuildingManagement.jsp");  
	rd.include(request,response);
}

	
%>
</body>
</html>