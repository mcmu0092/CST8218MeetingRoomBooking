package com.brba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.brba.helpers.Building;

public class BuildingDao 
{
	public static int addBuilding(String buildingNumber, String province, String city, String address, String active)
	{
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		int status =0;

		try {
        	pst = conn.prepareStatement("SELECT buildingNumber FROM buildings WHERE province=? AND city=? AND address=?");
        	pst.setString(1, province);
        	pst.setString(2, city);
        	pst.setString(3, address);
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
        		pst = conn.prepareStatement("insert into buildings (province, city, address, active) values (?, ?, ?, ?)");      
                pst.setString(1, province);
                pst.setString(2, city);
                pst.setString(3, address);
                pst.setString(4, active);
                
                pst.executeUpdate();
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
	}//End of addBuilding
	
	public static ArrayList<Building> getBuildingList()
	{
        Connection conn = Dao.getConnection();
        ArrayList<Building> buildings = new ArrayList<Building>();
        PreparedStatement pst = null;
        Building building;							
        ResultSet rs = null;
        
        try {
        	pst = conn.prepareStatement("SELECT * FROM buildings");
        	rs = pst.executeQuery();
        	
        	//Stores the results
        	while(rs.next())
        	{
        		building = new Building();
        		building.setProvince(rs.getString("province"));
        		building.setCity(rs.getString("city"));
        		building.setAddress(rs.getString("address"));
        		building.setActive(rs.getString("active"));
        		building.setID(rs.getString("buildingNumber"));
        		buildings.add(building);
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
		return buildings;		
	}//End of getBuildingList
	
	public static Building getBuilding(String buildingID)
	{
        Connection conn = Dao.getConnection();
        PreparedStatement pst = null;
        Building building = null;						
        ResultSet rs = null;
        
        try {
        	pst = conn.prepareStatement("SELECT * FROM buildings WHERE buildingNumber='" + buildingID + "'");
        	rs = pst.executeQuery();
        	
        	//Stores the results
        	if(rs.next())
        	{
        		building = new Building();
        		building.setProvince(rs.getString("province"));
        		building.setCity(rs.getString("city"));
        		building.setAddress(rs.getString("address"));
        		building.setActive(rs.getString("active"));
        		building.setID(rs.getString("buildingNumber"));
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
		return building;
	}//End of getBuilding
	public static int editBuilding(String buildingID, String address, String city, String province, String active){
		Connection conn = Dao.getConnection();
		ResultSet rs =null;
		int status=0;
		PreparedStatement pst = null;
		
		try{
			pst = conn.prepareStatement("SELECT buildingNumber FROM buildings WHERE province=? AND city=? AND address=? AND buildingNumber !=?");
			
        	pst.setString(1, province);
        	pst.setString(2, city);
        	pst.setString(3, address);
        	pst.setString(4, buildingID);
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
			
			
			pst = conn.prepareStatement("UPDATE buildings SET address=?, city=?, province=?, active=? WHERE buildingNumber=?");
			pst.setString(1, address);
			pst.setString(2, city);
			pst.setString(3, province);
			pst.setString(4, active);
			pst.setString(5, buildingID);
			pst.executeUpdate();
			if (pst != null) {
                try {
                    pst.close();
                    pst = null;
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
			// if building is disable, make all rooms in that building disable as well
			if(active.equals("0")){
				pst = conn.prepareStatement("UPDATE rooms SET active=? WHERE buildingNumber=?");
				pst.setString(1, active);
				pst.setString(2, buildingID);
				pst.executeUpdate();
			}
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
		return status;
	}
	
public static int deleteBuilding(String buildingID){
		
		Connection conn = Dao.getConnection();
        PreparedStatement pst = null;
        int status= 0;
        
       
        try{
        	pst = conn.prepareStatement("DELETE FROM buildings WHERE buildingNumber=?");
        	pst.setString(1, buildingID);
            
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
}//End of AddBuildingDao



