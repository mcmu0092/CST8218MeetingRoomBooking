package com.brba.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.brba.dao.*;
import com.brb.utilities.*;
public class RegisterDao 
{
	public static int register(String username, String pass, String email)
	{
		/* registered is used for three return conditions. User is already in database = 1, 
		user was just added to database = 0, some error occurred = -1 */
		int registered = 0;
		int update;								//Used to see if changes were made to the database by executed query
		
        Connection conn = Dao.getConnection();
        PreparedStatement pst = null;
        ResultSet rs = null;
        pass = Encryption.decrypt(pass);
        try {
        	pst = conn.prepareStatement("SELECT * FROM admin WHERE email='" + email + "' AND userName='" + username + "'");
        	rs = pst.executeQuery();
        	
        	//There are no matches, therefore unique email
        	if(!rs.next())
        	{
        		pst.close();
                pst = conn.prepareStatement("insert into admin (password, "
						+ "email, username) values (?, ?, ?)");
                pst.setString(1, pass);
                pst.setString(2, email);
                pst.setString(3, username);
                
                update = pst.executeUpdate();
                
                //Updates were made
                if(update > 0) {
                	registered = 0;
                }
            //Email has already been used, or username already in use
        	}else
        	{
        		registered = 1;
        	}
        } catch (Exception e) {
        	registered = -1;
            System.out.println(e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }		
		return registered;
	}//End of register

}//End of RegisterDao
