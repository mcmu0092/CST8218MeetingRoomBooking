package com.brba.helpers;

public class Room 
{
	private String roomID;
	private String buildingID;
	private Building building;
	private String Capacity;
	private String Info;
	private String Active;
	
	public String getRoomID()
	{
		return roomID;
	}//End of getRoomID
	public String getBuildingID()
	{
		return buildingID;
	}//End of getBuildingID
	public Building getBuilding(){
		return building;
	}
	public void setBuilding(Building building){
		this.building = building;
	}
	public String getCapacity()
	{
		return Capacity;
	}//End of getCapacity
	public String getInfo()
	{
		return Info;
	}//End of getInfo
	public String getActive()
	{
		return Active;
	}//End of getActive
	
	
	public void setRoomID(String rID)
	{
		roomID = rID;
	}//End of setRoomID
	public void setBuildingID(String bID)
	{
		buildingID = bID;
	}//End of setBuildingID
	public void setCapacity(String c)
	{
		Capacity = c;
	}//End of setCapacity
	public void setInfo(String i)
	{
		Info = i;
	}//End of setInfo
	public void setActive(String a)
	{
		Active = a;
	}//End of setActive
	

}//End of Row_Room class
