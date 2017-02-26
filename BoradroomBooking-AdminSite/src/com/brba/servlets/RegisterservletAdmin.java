package com.brba.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.brba.dao.RegisterDao;
import com.brba.servlets.RegisterservletAdmin;
import com.brb.utilities.*;
public class RegisterservletAdmin extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		int registered = -1; 		/* registered is used for three return conditions. User is already in database = 1, 
										user was just added to database = 0, some error occurred = -1 */
		response.setContentType("text/html");
		
		String username = request.getParameter("username");
		String password = Encryption.encrypt(request.getParameter("userpass")); //store encrypted password
		String email = request.getParameter("email");
		
		registered = RegisterDao.register(username, password, email);
		
		//Checks results of registering
		switch(registered)
		{
		case -1:
			break;
		case 0:
	        if (session!=null){
	        	 session.setAttribute("name", username);
	        }
			break;
		case 1:
			break;
			
		}
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
        //rd.forward(request,response);
        response.sendRedirect("index.jsp");

		
	}//End of doPost
	
	protected boolean checkValidity(String username, String password, String email)
	{
		boolean valid = false;
		
		
		
		
		return valid;
	}//End of checkValidity method
}//End of Registerservlet class
