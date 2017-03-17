package com.brb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.brb.dao.*;

public class RegisterDao 
{
	public static int register(String username, String pass, String firstName, String lastName,
									String email, String company, String city, String province)
	{
		/* registered is used for three return conditions. User is already in database = 1, 
		user was just added to database = 0, some error occurred = -1 */
		int registered = 0;
		int update;								//Used to see if changes were made to the database by executed query
		
        Connection conn = Dao.getConnection();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
        	pst = conn.prepareStatement("SELECT * FROM usertable WHERE email='" + email + "' AND username='" + username + "'");
        	rs = pst.executeQuery();
        	
        	//There are no matches, therefore unique email
        	if(!rs.next())
        	{
        		SendEmail.send("boardroombookingcst8218@gmail.com","WebApps300!",email,"Welcome to BoardRoom Bookings", "You have now registered with BoardRoom Bookings!");
        		pst.close();
                pst = conn.prepareStatement("insert into usertable (password, firstName, lastName, "
						+ "email, company, city, province, username) values (?, ?, ?, ?, ?, ?, ?, ?)");
                pst.setString(1, pass);
                pst.setString(2, firstName);
                pst.setString(3, lastName);
                pst.setString(4, email);
                pst.setString(5, company);
                pst.setString(6, city);
                pst.setString(7, province);
                pst.setString(8, username);
                
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
