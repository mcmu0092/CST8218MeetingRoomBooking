package com.brb.servlets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.brb.dao.UserDao;
import com.brb.helpers.User;
import com.brb.servlets.Registerservlet;
import com.brb.utilities.*;

public class EditProfileServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{			
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String userNumber = request.getParameter("userNumber");
		String username = request.getParameter("username");
		String password = Encryption.encrypt(request.getParameter("password"));  //stores encrypted password
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String company = request.getParameter("company");
		String city = request.getParameter("city");
		String province = request.getParameter("province");
		
		
		
		if(username != null)
		{
			UserDao.editProfile(userNumber, username, password, firstName, lastName, email, company, city, province);
			response.sendRedirect("profile.jsp");
		}else
		{
		    response.sendRedirect("index.jsp"); 
		}
	}//End of doPost	
}//End of EditProfileServlet
