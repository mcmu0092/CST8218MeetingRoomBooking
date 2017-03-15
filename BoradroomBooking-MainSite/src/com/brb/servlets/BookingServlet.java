package com.brb.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.brb.dao.BookingDao;

public class BookingServlet extends HttpServlet {
	
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {
		
		Date startDateTime = null;;
		try {
			startDateTime = sdf.parse(request.getParameter("StartDateTime"));
				
		String duration = request.getParameter("duration");
		String info = request.getParameter("Info");
		Calendar endTime = Calendar.getInstance();
		endTime.setTime(startDateTime);
		endTime.add(Calendar.MINUTE, Integer.parseInt(duration));
		HttpSession session = request.getSession(false);
		BookingDao.bookRoom(session.getAttribute("userID").toString(),  request.getParameter("BuildingNum"),  request.getParameter("RoomNum"), sdf.format(startDateTime), sdf.format(endTime.getTime()), info);
		
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		 response.sendRedirect("Booking.jsp?rowOffSet=1");  
	}


}
