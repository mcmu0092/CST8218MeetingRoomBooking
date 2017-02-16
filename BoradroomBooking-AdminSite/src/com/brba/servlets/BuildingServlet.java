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
import com.brba.helpers.Row_Building;
import com.brba.helpers.Row_Room;

public class BuildingServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		int added = -1; 		/* added is used for three return conditions. Building is already in database = 1, 
								   building was just added to database = 0, some error occurred = -1 */
		response.setContentType("text/html");
		
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String address = request.getParameter("address");
		String active = request.getParameter("active");
		
		added = BuildingDao.addBuilding(province, city, address, active);
		
		/*//Checks results of adding building
		switch(added)
		{
		case -1:
			break;
		case 0:
			break;
		case 1:
			break;
			
		}
		*/
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
        //rd.forward(request,response);
        response.sendRedirect("BuildingManagement.jsp");	
	}//End of doPost
	
	public ArrayList<Row_Building> getBuildingList()
	{
		return BuildingDao.getBuildingList();	
	}//End of getBuildingList
	
	public Row_Building getBuilding(String buildingID)
	{
		return BuildingDao.getBuilding(buildingID);
	}//End of getBuilding
	
	public ArrayList<Row_Room> getRoomList(String buildingID)
	{
		return BuildingDao.getRoomList(buildingID);
	}//End of getRoomList
}//End of AddBuildingServlet
