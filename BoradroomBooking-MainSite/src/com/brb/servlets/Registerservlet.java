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
public class Registerservlet extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		User user;
		
		String username = request.getParameter("username");
		String password = Encryption.encrypt(request.getParameter("userpass")); //store encrypted password
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String email = request.getParameter("email");
		String company = request.getParameter("company");
		String city = request.getParameter("city");
		String province = request.getParameter("province");
		
		user = UserDao.register(username, password, firstName, lastName, email, company, city, province);


		if(user != null){
			HttpSession session = request.getSession(false);
            if (session!=null){
            	 session.setAttribute("name", user.getUserName());
            	 session.setAttribute("userID", user.getUserNumber());
            	 session.setAttribute("firstName", user.getFirstName());
            	 session.setAttribute("lastName", user.getLastName());
            }
            response.sendRedirect("index.jsp"); 
		} else {
		   out.print("<p style=\"color:red\">A user with this name/email already exist</p>"); 
		   RequestDispatcher rd=request.getRequestDispatcher("resgister.jsp");  
           rd.include(request,response);
		}
	}//End of doPost
	
	
}//End of Registerservlet class
