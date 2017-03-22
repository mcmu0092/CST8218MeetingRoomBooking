package com.brba.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

import com.brba.dao.BuildingDao;
import com.brba.helpers.Building;
import com.brba.helpers.Room;

public class BuildingServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		PrintWriter out = response.getWriter();
		RequestDispatcher rd;
		response.setContentType("text/html");
		int status;
		String buildingNumber = request.getParameter("BuildingNum");
		String province = request.getParameter("Province");
		String city = request.getParameter("City");
		String address = request.getParameter("Address");
		String check = request.getParameter("Active");
		String active;
		if(check != null){
			active = "1";
		}else{
			active = "0";
		}
		
		status = BuildingDao.addBuilding(buildingNumber, province, city, address, active);
		
		switch(status){
		case 0:// WOrked
			 response.sendRedirect("BuildingManagement.jsp");
			break;
		case 1: // Found existing data
			out.print("<p style=\"color:red\">A building at this location already exist</p>"); 
   		     rd=request.getRequestDispatcher("BuildingManagement.jsp");  
            rd.include(request,response);
			break;
		case -1:
		default: // An Expected error
			out.print("<p style=\"color:red\">An error happened</p>"); 
			rd=request.getRequestDispatcher("BuildingManagement.jsp");  
            rd.include(request,response);
			break;
		}
		
         
     }//End of doPost
	
	
	
	
}//End of AddBuildingServlet
