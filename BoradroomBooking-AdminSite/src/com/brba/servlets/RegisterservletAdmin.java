package com.brba.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.brba.dao.AdminDao;

import com.brba.servlets.RegisterservletAdmin;
import com.brb.utilities.*;
public class RegisterservletAdmin extends HttpServlet
{
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");  
        PrintWriter out = response.getWriter(); 
        RequestDispatcher rd;
		
		String username = request.getParameter("username");
		String password = Encryption.encrypt(request.getParameter("userpass")); //store encrypted password
		String email = request.getParameter("email");
		int status;
		
		status=AdminDao.addAdminUser(username, email, password);
		
		switch(status){
		case 0: // Worked
			response.sendRedirect("AdminManagement.jsp");
			break;
		case 1: // Found existing data
			out.print("<p style=\"color:red\">A user with this name already exist</p>"); 
   		     rd=request.getRequestDispatcher("AdminManagement.jsp");  
            rd.include(request,response);
			break;
		case -1:
		default:// An expected error
			out.print("<p style=\"color:red\">An error happened</p>"); 
   		     rd=request.getRequestDispatcher("AdminManagement.jsp");  
            rd.include(request,response);
			break;
		}
       
       

		
	}//End of doPost
	
	
}//End of Registerservlet class
