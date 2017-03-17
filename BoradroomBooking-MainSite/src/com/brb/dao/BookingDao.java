package com.brb.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;


public class BookingDao {
	
	public static void bookRoom(String userNum, String buildingNum, String roomNum, String startDate, String endTime, String info){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try{
			pst = conn.prepareStatement("INSERT INTO Bookings (userNumber, buildingNumber, roomNumber, startBooking, endBooking, info) VALUES(?,?,?,?,?,?)");
			pst.setString(1, userNum);
			pst.setString(2, buildingNum);
			pst.setString(3, roomNum);
			pst.setString(4, startDate);
			pst.setString(5, endTime);
			pst.setString(6, info);
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
	
	public static int checkRoomAvailability(String buildingNum, String roomNum, String startDate){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		int status = 0;
		
		try{
			pst = conn.prepareStatement("SELECT bookingNumber FROM bookings WHERE buildingNumber =? AND roomNumber = ? AND startBooking = ?");
			pst.setString(1, buildingNum);
			pst.setString(2, roomNum);
			pst.setString(3, startDate);
			
			rs = pst.executeQuery();
			if(rs.next()){
				status = rs.getInt(1);
			}
		} catch (Exception e) {
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
}