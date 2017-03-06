package com.brba.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.brb.utilities.Encryption;
import com.brba.dao.AdminDao;

public class PasswordUpdateServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException{
		String adminID = request.getParameter("AdminNum");
		 String password = Encryption.encrypt(request.getParameter("userpass")); 
		 String rFlag = request.getParameter("rFlag");
		 
		 if(rFlag.equals("null")){
			 AdminDao.resetAdminUserPassword(adminID, password, "1");
			 response.sendRedirect("AdminManagement.jsp");
			  
		 } else {
			 AdminDao.resetAdminUserPassword(adminID, password, "0");
			 response.sendRedirect("MainMenu.jsp");
		 }
		 
		 
	}
}
