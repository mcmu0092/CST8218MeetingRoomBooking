package com.brb.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.brb.dao.BookingDao;

public class BookingServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {
		int ava = 0;
		 
		Date startDateTime = null;
		try {
			startDateTime = sdf.parse(request.getParameter("StartDateTime"));
				
		String duration = request.getParameter("duration");
		String info = request.getParameter("Info");
		Calendar startTime = Calendar.getInstance();
		startTime.setTime(startDateTime);
		startTime.set(Calendar.SECOND, 00);
		
		Calendar endTime = Calendar.getInstance();
		endTime.setTime(startDateTime);
		endTime.add(Calendar.MINUTE, Integer.parseInt(duration));
		endTime.set(Calendar.SECOND, 00);
		HttpSession session = request.getSession(false);
		//ava = BookingDao.checkRoomAvailability(request.getParameter("BuildingNum"),  request.getParameter("RoomNum"), sdf.format(startTime.getTime()));
		session.setAttribute("error", ava);
		if(ava == 0){
			
			
			BookingDao.bookRoom(session.getAttribute("userID").toString(),  request.getParameter("BuildingNum"),  request.getParameter("RoomNum"), sdf.format(startTime.getTime()), sdf.format(endTime.getTime()), info);			
			 response.sendRedirect("Booking.jsp?rowOffSet=1"); 
		} else {
			
			RequestDispatcher rd=request.getRequestDispatcher("Booking.jsp?rowOffSet=1");  
            rd.include(request,response);
		}
		
		
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		 
	}


}
