package com.training.domain;

public class Address {
	private String carRegNumber;
	private String addressLane1;
	private String addressLane2;
	private String city;
	private String pincode;
	
	public Address() {
		super();
		
	}

	public Address(String carRegNumber, String addressLane1, String addressLane2, String city, String pincode) {
		super();
		this.carRegNumber = carRegNumber;
		this.addressLane1 = addressLane1;
		this.addressLane2 = addressLane2;
		this.city = city;
		this.pincode = pincode;
	}

	public String getCarRegNumber() {
		return carRegNumber;
	}

	public void setCarRegNumber(String carRegNumber) {
		this.carRegNumber = carRegNumber;
	}

	public String getAddressLane1() {
		return addressLane1;
	}

	public void setAddressLane1(String addressLane1) {
		this.addressLane1 = addressLane1;
	}

	public String getAddressLane2() {
		return addressLane2;
	}

	public void setAddressLane2(String addressLane2) {
		this.addressLane2 = addressLane2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	
	
	
	

}
