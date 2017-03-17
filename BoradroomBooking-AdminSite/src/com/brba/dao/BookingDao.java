package com.brba.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.brba.helpers.*;

public class BookingDao {
	public static ArrayList<Booking> getBookingList(){
		Connection conn = Dao.getConnection();
		ArrayList<Booking> bookings = new ArrayList<Booking>();
		PreparedStatement pst = null;
		Booking booking;
		User user;
		
		ResultSet rs = null;
		try{
			pst = conn.prepareStatement("SELECT bk.bookingNumber, ut.firstName, ut.lastName, bk.startBooking, bk.endBooking FROM bookings bk INNER JOIN usertable ut on bk.userNumber = ut.userNumber");
			rs = pst.executeQuery();
			
			while(rs.next()){
				booking = new Booking();
				booking.setBookingNumber(rs.getString("bookingNumber"));
				booking.setStartBooking(rs.getString("bk.startBooking").substring(0, rs.getString("bk.startBooking").lastIndexOf(":")));
				booking.setEndBooking(rs.getString("bk.endBooking").substring(0, rs.getString("bk.endBooking").lastIndexOf(":")));
				user = new User();
				user.setFirstName(rs.getString("ut.firstName"));
				user.setLastName(rs.getString("ut.lastName"));
				booking.setUser(user);
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
	}
	
	public static Booking getBookingDetails(String bookingNumber){
		Connection conn = Dao.getConnection();
		
		PreparedStatement pst = null;
		Booking booking = null;
		Building building = null;
		User user =null;
		ResultSet rs = null;
		try{
			pst = conn.prepareStatement("SELECT bk.buildingNumber, bk.roomNumber, bk.startBooking, bk.endBooking, bk.info,  bd.address, bd.city, bd.province, ut.firstName, ut.lastName, ut.username, ut.email, ut.company FROM bookings bk  INNER JOIN buildings bd on bk.buildingNumber = bd.buildingNumber INNER JOIN usertable ut on bk.userNumber = ut.userNumber WHERE bk.bookingNumber = ?");
			pst.setString(1, bookingNumber);
			rs = pst.executeQuery();
			
			if(rs.next()){
				booking = new Booking();
				building = new Building();
				user = new User();
				
				booking.setBookingNumber(bookingNumber);			
				booking.setRoomNumber(rs.getString("bk.roomNumber"));
				booking.setStartBooking(rs.getString("bk.startBooking").substring(0, rs.getString("bk.startBooking").lastIndexOf(":")));
				booking.setEndBooking(rs.getString("bk.endBooking").substring(0, rs.getString("bk.endBooking").lastIndexOf(":")));
				booking.setInfo(rs.getString("bk.info"));
				
				building.setID(rs.getString("bk.buildingNumber"));
				building.setAddress(rs.getString("bd.address"));
				building.setCity(rs.getString("bd.city"));
				building.setProvince(rs.getString("bd.province"));
				booking.setBuilding(building);
				
				user.setFirstName(rs.getString("ut.firstName"));
				user.setLastName(rs.getString("ut.lastName"));
				user.setUserName(rs.getString("ut.username"));
				user.setEmail(rs.getString("ut.email"));
				user.setCompany(rs.getString("ut.company"));
				booking.setUser(user);
				
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
		return booking;
	}
}
