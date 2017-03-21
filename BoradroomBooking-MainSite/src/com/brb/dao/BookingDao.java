package com.brb.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.brb.helpers.Booking;
import com.brb.helpers.Building;
import com.brb.dao.Dao;

public class BookingDao {
	
	public static void bookRoom(){
		
	}//End of bookRoom
	
	public static void checkRoomAvailability(){
		
	}//End of checkRoomAvailability
	
	public static ArrayList<Booking> getUserBookings(String userID)
	{
		Connection conn = Dao.getConnection();
        ArrayList<Booking> bookings = new ArrayList<Booking>();
        PreparedStatement pst = null;
        Booking booking;							
        ResultSet rs = null;
        
        try {
        	pst = conn.prepareStatement("SELECT * FROM bookings WHERE userNumber='" + userID + "'");
        	rs = pst.executeQuery();
        	
        	//Stores the results
        	while(rs.next())
        	{
        		booking = new Booking();
        		booking.setBookingNumber(rs.getString("bookingNumber"));
        		booking.setUserNumber(rs.getString("userNumber"));
        		booking.setBuildingNumber(rs.getString("buildingNumber"));
        		booking.setRoomNumber(rs.getString("roomNumber"));
        		booking.setStartBooking(rs.getString("startBooking"));
        		booking.setEndBooking(rs.getString("endBooking"));
        		booking.setInfo(rs.getString("info"));
        		bookings.add(booking);
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
		return bookings;
	}//End of getMyBookings
}//End of BookingDao
