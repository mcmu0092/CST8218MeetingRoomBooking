package com.brb.helpers;

public class Booking {

	private String bookingNumber;
	private String userNumber;
	private User user;
	private String buildingNumber;
	private Building building;
	private String roomNumber;
	
	private String startBooking;
	private String endBooking;
	private String info;
	public String getBookingNumber() {
		return bookingNumber;
	}
	public void setBookingNumber(String bookingNumber) {
		this.bookingNumber = bookingNumber;
	}
	public String getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}
	public User getUser(){
		return user;
	}
	public void setUser(User user){
		this.user = user;
	}
	public String getBuildingNumber() {
		return buildingNumber;
	}
	public void setBuildingNumber(String buildingNumber) {
		this.buildingNumber = buildingNumber;
	}
	
	public Building getBuilding() {
		return building;
	}
	public void setBuilding(Building building) {
		this.building = building;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public String getStartBooking() {
		return startBooking;
	}
	public void setStartBooking(String startBooking) {
		this.startBooking = startBooking;
	}
	public String getEndBooking() {
		return endBooking;
	}
	public void setEndBooking(String endBooking) {
		this.endBooking = endBooking;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
}
