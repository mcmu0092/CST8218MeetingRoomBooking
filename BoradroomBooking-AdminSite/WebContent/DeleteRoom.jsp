<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.brba.dao.*"%>

<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String buildingID =request.getParameter("buildingID");
String roomNum = request.getParameter("roomID");
int status;
status = RoomDao.deleteRoom(buildingID, roomNum);
if(status == 0){
	response.sendRedirect("RoomManagement.jsp?buildingID="+buildingID);	
} else {
	out.print("<p style=\"color:red\">An error happened</p>"); 
	RequestDispatcher rd=request.getRequestDispatcher("RoomManagement.jsp?buildingID="+buildingID);  
	rd.include(request,response);
}	
%>
</body>
</html>