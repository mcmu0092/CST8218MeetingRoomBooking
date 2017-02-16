package com.brba.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import com.brba.dao.*;
import com.brba.helpers.Row_Building;
import com.brba.helpers.Row_Room;

public class BuildingDao 
{
	public static int addBuilding(String province, String city, String address, String active)
	{
		int added = -1; 		/* added is used for three return conditions. Building is already in database = 1, 
		   						   building was just added to database = 0, some error occurred = -1 */
		int update;
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
        	pst = conn.prepareStatement("SELECT * FROM buildings WHERE province='" + province + "' AND city='" + city
        								+ "' AND address='" + address + "'");
        	rs = pst.executeQuery();
        	
        	//There are no matches, therefore unique building
        	if(!rs.next())
        	{
        		pst.close();
                pst = conn.prepareStatement("insert into buildings (province, city, address, active) values (?, ?, ?, ?)");
                pst.setString(1, province);
                pst.setString(2, city);
                pst.setString(3, address);
                pst.setString(4, active);
                
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
	}//End of addBuilding
	
	public static ArrayList<Row_Building> getBuildingList()
	{
        Connection conn = Dao.getConnection();
        ArrayList<Row_Building> rows = new ArrayList<Row_Building>();
        PreparedStatement pst = null;
        Row_Building row;							//Used to store data of current ResultSet row
        ResultSet rs = null;
        
        try {
        	pst = conn.prepareStatement("SELECT * FROM buildings");
        	rs = pst.executeQuery();
        	
        	//Stores the results
        	while(rs.next())
        	{
        		row = new Row_Building();
        		row.setProvince(rs.getString("province"));
        		row.setCity(rs.getString("city"));
        		row.setAddress(rs.getString("address"));
        		row.setActive(rs.getString("active"));
        		row.setID(rs.getString("buildingNumber"));
        		rows.add(row);
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
		return rows;		
	}//End of getBuildingList
	
	public static Row_Building getBuilding(String buildingID)
	{
        Connection conn = Dao.getConnection();
        PreparedStatement pst = null;
        Row_Building row = null;						//Used to store data of current ResultSet row
        ResultSet rs = null;
        
        try {
        	pst = conn.prepareStatement("SELECT * FROM buildings WHERE buildingNumber='" + buildingID + "'");
        	rs = pst.executeQuery();
        	
        	//Stores the results
        	if(rs.next())
        	{
        		row = new Row_Building();
        		row.setProvince(rs.getString("province"));
        		row.setCity(rs.getString("city"));
        		row.setAddress(rs.getString("address"));
        		row.setActive(rs.getString("active"));
        		row.setID(rs.getString("buildingNumber"));
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
		return row;
	}//End of getBuilding
	
	public static ArrayList<Row_Room> getRoomList(String buildingID)
	{
		Connection conn = Dao.getConnection();
        PreparedStatement pst = null;
        ArrayList<Row_Room> rows = new ArrayList<Row_Room>();
        Row_Room row = null;						//Used to store data of current ResultSet row
        ResultSet rs = null;
        
        try {
        	pst = conn.prepareStatement("SELECT * FROM rooms WHERE buildingNumber='" + buildingID + "'");
        	rs = pst.executeQuery();
        	
        	//Stores the results
        	if(rs.next())
        	{
        		row = new Row_Room();
        		row.setCapacity(rs.getString("province"));
        		row.setInfo(rs.getString("city"));
        		row.setActive(rs.getString("active"));
        		row.setRoomID(rs.getString("roomNumber"));
        		row.setBuildingID(rs.getString("buildingNumber"));
        		rows.add(row);
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
		return rows;
	}//End of getRoomList
	
}//End of AddBuildingDao



