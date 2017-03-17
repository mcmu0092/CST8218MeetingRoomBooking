package com.brba.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.brba.helpers.AdminUser;
import com.brb.utilities.*;
public class AdminDao {
	
	public static AdminUser login(String username, String password){
		Connection conn = Dao.getConnection();
		PreparedStatement pst =null;
		ResultSet rs = null;
		AdminUser aUser = null;
		//password = Encryption.decrypt(password); not required
		
		
		try {
			pst = conn.prepareStatement("SELECT adminNumber, userName, email, active, resetPassword FROM admin where userName=? AND password=? ");
			pst.setString(1, username);
			pst.setString(2, password);
			rs =pst.executeQuery();
			if(rs.next()){
				aUser = new AdminUser();
				aUser.setAdminNumber(rs.getString("adminNumber"));
				aUser.setUserName(rs.getString("userName"));
				aUser.setEmail(rs.getString("email"));
				aUser.setActive(rs.getString("active"));
				aUser.setResetPassword(rs.getString("resetPassword"));
			}
		} catch (Exception e) {
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
		
		return aUser;
	}
	
	public static int addAdminUser(String username, String email, String password){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;;
		int status = 0;
		//password = Encryption.decrypt(password); not required
		
		try {
			pst = conn.prepareStatement("SELECT adminNumber FROM admin WHERE userName=?");
			pst.setString(1, username);
			rs = pst.executeQuery();
			if(rs.next()){
				status =1; // Already Exist in table
			} else {
				if (pst != null) { 
	                try {
	                    pst.close();
	                    pst = null;
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
				pst = conn.prepareStatement("INSERT INTO admin (userName, password, email, active, resetPassword) VALUES (?,?,?,?,?)");
				pst.setString(1, username);
				pst.setString(2, password);
				pst.setString(3, email);
				pst.setString(4, "1");
				pst.setString(5, "1");
				pst.executeUpdate();
			}
			
			
		}catch (Exception e) {
			status = -1;
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
		return status;
	}
	
	public static ArrayList<AdminUser> getAdminUsers(){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<AdminUser> aUsers = new ArrayList<AdminUser>();
		AdminUser aUser = null;
		
		try{
			pst = conn.prepareStatement("SELECT adminNumber, userName, email, active, resetPassword FROM admin");
			rs = pst.executeQuery();
			while(rs.next()){
				aUser = new AdminUser();
				aUser.setAdminNumber(rs.getString("adminNumber"));
				aUser.setUserName(rs.getString("userName"));
				aUser.setEmail(rs.getString("email"));
				aUser.setActive(rs.getString("active"));
				aUser.setResetPassword(rs.getString("resetPassword"));
				aUsers.add(aUser);
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
		return aUsers;
	}
	
	public static AdminUser getAdminUserDetails(String adminNumber){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs =null;
		AdminUser aUser = null;
		
		try {
			pst = conn.prepareStatement("SELECT adminNumber, userName, email, active, resetPassword FROM admin WHERE adminNumber=?");
			pst.setString(1, adminNumber);
			rs = pst.executeQuery();
			if(rs.next()){
				aUser = new AdminUser();
				aUser.setAdminNumber(rs.getString("adminNumber"));
				aUser.setUserName(rs.getString("userName"));
				aUser.setEmail(rs.getString("email"));
				aUser.setActive(rs.getString("active"));
				aUser.setResetPassword(rs.getString("resetPassword"));
				
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
		return aUser;
	}
	
	public static int editAdminUser(String adminNumber, String username, String email, String active){
		Connection conn = Dao.getConnection();
		ResultSet rs =null;
		int status = 0;
		PreparedStatement pst = null;
		
		try {
			pst = conn.prepareStatement("SELECT adminNumber FROM admin WHERE userName=? AND adminNumber!=?");
			pst.setString(1, username);
			pst.setString(2, adminNumber);
			rs = pst.executeQuery();
			if(rs.next()){
				status =1; // Already Exist in table
			} else {
				if (pst != null) { 
	                try {
	                    pst.close();
	                    pst = null;
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
			pst = conn.prepareStatement("UPDATE admin SET userName=?, email=?, active=? WHERE adminNumber=?");
			pst.setString(1, username);
			pst.setString(2, email);
			pst.setString(3, active);
			pst.setString(4, adminNumber);
			pst.executeUpdate();
			}
		}catch (Exception e) {
			status = -1;
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
		return status;
	}
	
	public static void resetAdminUserPassword(String adminNumber, String password, String resetFlag){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		password= Encryption.decrypt(password);
		try {
			pst = conn.prepareStatement("UPDATE admin SET password=?, resetPassword=? WHERE adminNumber=?");
			pst.setString(1, password);
			pst.setString(2, resetFlag);
			pst.setString(3, adminNumber);
			pst.executeUpdate();
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
           
        }
	}

}
