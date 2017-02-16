package com.brba.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.brba.dao.BuildingDao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

import com.brba.dao.RoomDao;
import com.brba.helpers.Row_Building;
import com.brba.helpers.Row_Room;

public class RoomServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		int added = -1; 		/* added is used for three return conditions. Room is already in database = 1, 
								   room was just added to database = 0, some error occurred = -1 */
		response.setContentType("text/html");
		
		String roomID = request.getParameter("roomNumber");
		String buildingID = request.getParameter("buildingNumber");
		String capacity = request.getParameter("capacity");
		String info = request.getParameter("info");
		String active = request.getParameter("active");
		
		added = RoomDao.addRoom(roomID, buildingID, capacity, info, active);
		
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
        response.sendRedirect("RoomManagement.jsp");	
	}//End of doPost

}//End of RoomServlet
