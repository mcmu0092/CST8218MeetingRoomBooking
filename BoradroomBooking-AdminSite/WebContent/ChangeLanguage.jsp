<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% if (session.getAttribute("lang").equals("fr")){
	session.setAttribute("lang", "en");	
} else if (session.getAttribute("lang").equals("en")){
	session.setAttribute("lang", "fr");
}
response.sendRedirect(session.getAttribute("URL").toString());
%>

</body>
</html>