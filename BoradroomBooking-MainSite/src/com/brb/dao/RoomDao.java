package com.brb.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.brb.helpers.Building;
import com.brb.helpers.Room;
public class RoomDao {

	public static ArrayList<Room> getRoomList(int limit, int rowOffSet){
		Connection conn =Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs =null;
		ArrayList<Room> rooms = new ArrayList<Room>();
	    Room room = null;	
	    Building building=null;
	    
	    try {
        	pst = conn.prepareStatement("SELECT rm.roomNumber, rm.capacity, rm.info, bd.buildingNumber, bd.address, bd.city, bd.province FROM rooms rm INNER JOIN buildings bd ON rm.buildingNumber = bd.buildingNumber WHERE rm.active = 1 LIMIT ? OFFSET ?");
        	pst.setInt(1, limit);
        	pst.setInt(2, rowOffSet);
        	rs = pst.executeQuery();
        	
        	//Stores the results
        	while(rs.next())
        	{
        		room = new Room();
        		room.setRoomID(rs.getString("rm.roomNumber"));
        		room.setBuildingID(rs.getString("bd.buildingNumber"));
        		room.setCapacity(rs.getString("rm.capacity"));
        		room.setInfo(rs.getString("rm.info"));
        		building = new Building();
        		building.setID(rs.getString("bd.buildingNumber"));
        		building.setAddress(rs.getString("bd.address"));
        		building.setCity(rs.getString("bd.city"));
        		building.setProvince(rs.getString("bd.province"));
        		room.setBuilding(building);
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
	}
	
	public static Room getRoomDetailsForBooking(String buildingID, String roomNum){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs =null;
		Building building = null;
		Room room = null;
		
		try {
			pst = conn.prepareStatement("SELECT rm.capacity, rm.info, bd.address, bd.city, bd.province FROM rooms rm INNER JOIN buildings bd ON rm.buildingNumber = bd.buildingNumber where rm.buildingNumber=? AND rm.roomNumber=?");
			pst.setString(1, buildingID);
			pst.setString(2, roomNum);
			rs = pst.executeQuery();
			if(rs.next()){
				room = new Room();
				room.setRoomID(rs.getString("rm.roomNumber"));
        		room.setBuildingID(rs.getString("bd.buildingNumber"));
        		room.setCapacity(rs.getString("rm.capacity"));
        		room.setInfo(rs.getString("info"));
        		building = new Building();
        		building.setID(rs.getString("bd.buildingNumber"));
        		building.setAddress(rs.getString("bd.address"));
        		building.setCity(rs.getString("bd.city"));
        		building.setProvince(rs.getString("bd.province"));
        		room.setBuilding(building);
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
		
		
		return room;
	}
	
	public static int getTotalNumberofRooms(){
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs =null;
		int count = 0;
		
		try {
			pst = conn.prepareStatement("SELECT COUNT(*) FROM rooms WHERE active = 1");
			rs = pst.executeQuery();
			if (rs.next()){
				count = rs.getInt(1);
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
		return count;
	}
	
}
