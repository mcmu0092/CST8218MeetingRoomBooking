package com.brba.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.brba.dao.RoomDao;

public class RoomEditServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		PrintWriter out = response.getWriter();
		
		response.setContentType("text/html");
		RequestDispatcher rd;
		 int status;
		 
		String roomNumOld = request.getParameter("RoomNumOld");
		String roomID = request.getParameter("RoomNum");
		String buildingID = request.getParameter("BuildingNum");
		String capacity = request.getParameter("Capacity");
		String info = request.getParameter("Info");
		String check = request.getParameter("Active");
		String active;
		if(check != null){
			active = "1";
		}else{
			active = "0";
		}
		status = RoomDao.editRoom(roomNumOld, roomID, buildingID, capacity, info, active);
		switch(status){
		case 0:// WOrked
			response.sendRedirect("RoomManagement.jsp?buildingID="+buildingID);		
			break;
		case 1: // Found existing data
			out.print("<p style=\"color:red\">This room already exist</p>"); 
   		     rd=request.getRequestDispatcher("EditRoom.jsp?buildingID="+buildingID+"&roomID="+roomNumOld);  
            rd.include(request,response);
			break;
		case -1:
		default: // An Expected error
			out.print("<p style=\"color:red\">An error happened</p>"); 
			    rd=request.getRequestDispatcher("EditRoom.jsp?buildingID="+buildingID+"&roomID="+roomNumOld);
            rd.include(request,response);
			break;
		}
			
	}

}
