package com.brba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.brba.helpers.Room;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

public class RoomDao 
{
	public static int addRoom(String roomID, String buildingID, String capacity, String info, String active)
	{
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		int status = 0;
		try {
        	pst = conn.prepareStatement("SELECT * FROM rooms WHERE roomNumber=? AND buildingNumber=?");
        	pst.setString(1, roomID);
        	pst.setString(2, buildingID);
        	rs = pst.executeQuery();
        	if(rs.next()){
        		status = 1;
        	} else {

        		if (pst != null) { 
	                try {
	                    pst.close();
	                    pst = null;
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
        		
                pst = conn.prepareStatement("insert into rooms (roomNumber, buildingNumber, capacity, info, active) values (?, ?, ?, ?, ?)");
                pst.setString(1, roomID);
                pst.setString(2, buildingID);
                pst.setString(3, capacity);
                pst.setString(4, info);
                pst.setString(5, active);
                
                pst.executeUpdate();
                
        	}
        	    
        } catch (MySQLIntegrityConstraintViolationException IEX){
        	
        }catch (Exception e) {
        	status =-1;
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
	}//End of RoomDao
	
	public static ArrayList<Room> getRoomsForBuilding(String buildingID)
	{
		Connection conn = Dao.getConnection();
        PreparedStatement pst = null;
        ArrayList<Room> rooms = new ArrayList<Room>();
        Room room = null;						//Used to store data of current ResultSet row
        ResultSet rs = null;
        
        try {
        	pst = conn.prepareStatement("SELECT * FROM rooms rm where rm.buildingNumber='" + buildingID + "'");
        	rs = pst.executeQuery();
        	
        	//Stores the results
        	while(rs.next())
        	{
        		room = new Room();
        		room.setCapacity(rs.getString("capacity"));
        		room.setInfo(rs.getString("info"));
        		room.setActive(rs.getString("active"));
        		room.setRoomID(rs.getString("roomNumber"));
        		room.setBuildingID(rs.getString("buildingNumber"));
        		rooms.add(room);
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
		return rooms;
	}//End of getRoomList
	
	public static Room getRoomDetails(String buildingID, String roomNum)
	{
		Connection conn = Dao.getConnection();
        PreparedStatement pst = null;
        
        Room room = null;						//Used to store data of current ResultSet row
       
        ResultSet rs = null;
        
        try {
        	pst = conn.prepareStatement("SELECT * FROM rooms rm where rm.buildingNumber='" + buildingID + "' AND rm.roomNumber='"+roomNum+"'");
        	rs = pst.executeQuery();
        	
        	//Stores the results
        	if(rs.next())
        	{
        		room = new Room();
        		room.setCapacity(rs.getString("capacity"));
        		room.setInfo(rs.getString("info"));
        		room.setActive(rs.getString("active"));
        		room.setRoomID(rs.getString("roomNumber"));
        		room.setBuildingID(rs.getString("buildingNumber"));
        		
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
		return room;
	}//End of getRoomList
	
	public static int deleteRoom(String buildingID, String roomNum){
		
		Connection conn = Dao.getConnection();
        PreparedStatement pst = null;
        int status= 0;
        
       
        try{
        	pst = conn.prepareStatement("DELETE FROM rooms WHERE buildingNumber=? AND roomNumber=?");
        	pst.setString(1, buildingID);
            pst.setString(2, roomNum);
            pst.executeUpdate();
           
        	
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
            
        }	
        return status;
	}
	
	public static int editRoom(String roomNumOld, String roomID, String buildingID, String capacity, String info, String active){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs =null;
		int status = 0;
		try{
//			pst = conn.prepareStatement("SELECT * FROM rooms WHERE roomNumber !=? AND buildingNumber !=?");
//        	pst.setString(1, roomID);
//        	pst.setString(2, buildingID);
//        	rs = pst.executeQuery();
//        	if(rs.next()){
//        		status = 1;
//        	} else {
//        		if (pst != null) { 
//	                try {
//	                    pst.close();
//	                    pst = null;
//	                } catch (SQLException e) {
//	                    e.printStackTrace();
//	                }
//	            }
			/*pst = conn.prepareStatement("UPDATE bookings SET roomNumber=? WHERE roomNumber=?");
			pst.setString(1, roomID);
			pst.setString(2, roomNumOld);
			pst.executeUpdate();
			if (pst != null) { 
                try {
                    pst.close();
                    pst = null;
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }*/
			pst = conn.prepareStatement("UPDATE rooms SET roomNumber=?, buildingNumber=?, capacity=?, info=?, active=? WHERE roomNumber=? AND buildingNumber=?");
			pst.setString(1, roomID);
			pst.setString(2, buildingID);
			pst.setString(3, capacity);
			pst.setString(4, info);
			pst.setString(5, active);
			pst.setString(6, roomNumOld);
			pst.setString(7, buildingID);
			pst.executeUpdate();
        //}
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
	
	
}//End of RoomDao




