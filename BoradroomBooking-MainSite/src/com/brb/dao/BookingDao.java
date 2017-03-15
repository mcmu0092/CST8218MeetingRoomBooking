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
	
	public static void checkRoomAvailability(){
		
	}
}
