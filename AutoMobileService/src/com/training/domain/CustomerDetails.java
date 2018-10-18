package com.training.domain;

public class CustomerDetails {
	private String customerName;
	private String phoneNumber;
	private String emailId;
	private String newValue;
	private String field;
	private Address address;
	private Car car;
	
	public CustomerDetails() {
		super();
		
	}

	public CustomerDetails(String customerName, String phoneNumber, String emailId, Address address, Car car) {
		super();
		this.customerName = customerName;
		this.phoneNumber = phoneNumber;
		this.emailId = emailId;
		this.address = address;
		this.car = car;
	}

	public CustomerDetails(String customerName, String phoneNumber, String emailId) {
		super();
		this.customerName = customerName;
		this.phoneNumber = phoneNumber;
		this.emailId = emailId;
	}

	public CustomerDetails(String customerName, String phoneNumber, String emailId, String newValue, String field,
			Address address, Car car) {
		super();
		this.customerName = customerName;
		this.phoneNumber = phoneNumber;
		this.emailId = emailId;
		this.newValue = newValue;
		this.field = field;
		this.address = address;
		this.car = car;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getNewValue() {
		return newValue;
	}

	public void setNewValue(String newValue) {
		this.newValue = newValue;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	

}
