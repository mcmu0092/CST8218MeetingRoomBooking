package com.brba.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.brba.dao.AdminDao;

public class AdminEditServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");  
        PrintWriter out = response.getWriter(); 
        RequestDispatcher rd;
		
		
		String adminID = request.getParameter("AdminNum");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String check = request.getParameter("Active");
		String active;
		int status;
		if(check != null){
			active = "1";
		}else{
			active = "0";
		}
		
		status = AdminDao.editAdminUser(adminID, username, email, active);
		switch(status){
		case 0:// WOrked
			 response.sendRedirect("AdminManagement.jsp");
			break;
		case 1: // Found existing data
			out.print("<p style=\"color:red\">A user with this name already exist</p>"); 
   		     rd=request.getRequestDispatcher("EditAdminUser.jsp?adminID="+adminID);  
            rd.include(request,response);
			break;
		case -1:
		default: // An Expected error
			out.print("<p style=\"color:red\">An error happened</p>"); 
			rd=request.getRequestDispatcher("EditAdminUser.jsp?adminID="+adminID);  
            rd.include(request,response);
			break;
		}
		
	}
}
