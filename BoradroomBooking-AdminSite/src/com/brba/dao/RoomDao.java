package com.brba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoomDao 
{
	public static int addRoom(String roomID, String buildingID, String capacity, String info, String active)
	{
		int added = -1; 		/* added is used for three return conditions. Room is already in database = 1, 
		   						   room was just added to database = 0, some error occurred = -1 */
		int update;
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
        	pst = conn.prepareStatement("SELECT * FROM rooms WHERE roomNumber='" + roomID + "' AND buildingNumber='" + buildingID + "'");
        	rs = pst.executeQuery();
        	
        	//There are no matches, therefore unique building
        	if(!rs.next())
        	{
        		pst.close();
                pst = conn.prepareStatement("insert into rooms (roomNumber, buildingNumber, capacity, info, active) values (?, ?, ?, ?, ?)");
                pst.setString(1, roomID);
                pst.setString(2, buildingID);
                pst.setString(3, capacity);
                pst.setString(4, info);
                pst.setString(5, active);
                
                update = pst.executeUpdate();
                
                //Updates were made
                if(update > 0) {
                	added = 0;
                }
            //Building already in database
        	}else
        	{
        		added = 1;
        	}
        } catch (Exception e) {
        	added = -1;
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
		return added;
	}//End of RoomDao
	
}//End of RoomDao




