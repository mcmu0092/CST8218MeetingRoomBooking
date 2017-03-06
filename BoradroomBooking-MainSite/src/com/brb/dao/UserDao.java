package com.brb.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.brb.helpers.User;
import com.brb.utilities.Encryption;
import java.sql.Connection;

public class UserDao {
	public static User login(String username, String password){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		User user = null;
		password = Encryption.decrypt(password);
		
		try{
			pst = conn.prepareStatement("select userNumber, username, firstName, lastName from userTable where username=? and password=?");
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if(rs.next()){
				user= new User();
				user.setUserNumber(rs.getString("userNumber"));
				user.setUserName(rs.getString("username"));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
			}
		}catch (Exception e) {
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
		return user;
	}
	
	public static User register(String username, String password, String firstName, String lastName, String email, String company, String city, String province){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		User user = null;
		password = Encryption.decrypt(password);
		
		try{
			pst = conn.prepareStatement("SELECT userNumber FROM usertable WHERE username=? OR email=?");
			pst.setString(1, username);
			pst.setString(2, email);
			rs = pst.executeQuery();
			if(!rs.next()){
				if (rs != null) {
	                try {
	                    rs.close();
	                    rs = null;
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
				if (pst != null) { 
	                try {
	                    pst.close();
	                    pst = null;
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
				pst = conn.prepareStatement("INSERT into usertable (firstName, lastName, username, password, email, province, city, company) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
				pst.setString(1, firstName);
				pst.setString(2, lastName);
				pst.setString(3, username);
				pst.setString(4, password);
				pst.setString(5, email);
				pst.setString(6, province);
				pst.setString(7, city);
				pst.setString(8, company);
				pst.executeUpdate();
				if (pst != null) { 
	                try {
	                    pst.close();
	                    pst = null;
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
				pst = conn.prepareStatement("SELECT userNumber FROM usertable WHERE username=?");
				pst.setString(1, username);
				rs = pst.executeQuery();
				rs.next();
				user = new User();
				user.setUserNumber(rs.getString("userNumber"));
				user.setUserName(username);
				user.setFirstName(firstName);
				user.setLastName(lastName);
			}
		}catch (Exception e) {
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
		return user;
	}
}
