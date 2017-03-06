package com.brba.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.brba.dao.*;
import com.brba.helpers.AdminUser;
import com.brb.utilities.*;

public class LoginServletAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  

        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
        
        String n= request.getParameter("username");  
        String p= Encryption.encrypt(request.getParameter("userpass")); 
        
        AdminUser aUser = AdminDao.login(n, p);
        if(aUser != null){
        	if (aUser.getActive().equals("1")){
        		HttpSession session = request.getSession(false);
        		if (session != null){
        			session.setAttribute("name", n);
        		}
        		if(aUser.getResetPassword().equals("1")){
        			  response.sendRedirect("resetPassword.jsp?adminID="+aUser.getAdminNumber()+"&resetFlag="+aUser.getResetPassword()); 
        		} else {
        			  response.sendRedirect("MainMenu.jsp"); 
        		}
        	} else {
        		 out.print("<p style=\"color:red\">This account is no longer active</p>"); 
        		 RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
                 rd.include(request,response);
        	}
        	
        	
        } else{  
            out.print("<p style=\"color:red\">Sorry username or password error</p>");  
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
            rd.include(request,response);  
        }  

        out.close();
        
    }
}
