package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Daos.RegisterDao;
import Servlets.Registerservlet;

public class Registerservlet extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String username = request.getParameter("username");
		String password = request.getParameter("userpass");
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String email = request.getParameter("email");
		String company = request.getParameter("company");
		String city = request.getParameter("city");
		String province = request.getParameter("province");
		
		RegisterDao.register(username, password, firstName, lastName, email, company, city, province);
		
        if (session!=null){
        	 session.setAttribute("name", username);
        }
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
        rd.forward(request,response);
		
		
		/*
		//Checks variable validity
		if(checkValidity(username, password, firstName, lastName, email, company, city, province))
		{//Variables valid
			
		}else
		{//Variables invalid
			
		}
		*/
		
		
		
	}//End of doPost
	
	protected boolean checkValidity(String username, String password, String firstName, String lastName, 
									String email, String company, String city, String province)
	{
		boolean valid = false;
		
		
		
		
		return valid;
	}//End of checkValidity method
}//End of Registerservlet class
