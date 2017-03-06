package com.brb.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.brb.dao.*;
import com.brb.helpers.User;
import com.brb.utilities.*;

public class LoginServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  

        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
        
        String n= request.getParameter("username");  
        
        String p= Encryption.encrypt(request.getParameter("userpass"));  //stores encrypted password
        
        User user = UserDao.login(n, p);
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
        	out.print("<p style=\"color:red\">Sorry username or password error</p>");  
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
            rd.include(request,response);
        }

        out.close();  
    }  
} 