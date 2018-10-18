package com.training.domain;

public class Car {
	private String carRegNumber;
	private String carModel;
	private String carName;
	private String insuranceId;
	public Car() {
		super();
		
	}
	public Car(String carRegNumber, String carModel, String carName, String insuranceId) {
		super();
		this.carRegNumber = carRegNumber;
		this.carModel = carModel;
		this.carName = carName;
		this.insuranceId = insuranceId;
	}
	public String getCarRegNumber() {
		return carRegNumber;
	}
	public void setCarRegNumber(String carRegNumber) {
		this.carRegNumber = carRegNumber;
	}
	public String getCarModel() {
		return carModel;
	}
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	public String getcarName() {
		return carName;
	}
	public void setcarName(String carName) {
		this.carName = carName;
	}
	public String getInsuranceId() {
		return insuranceId;
	}
	public void setInsuranceId(String insuranceId) {
		this.insuranceId = insuranceId;
	}
	
	public Car(String carRegNumber) {
		super();
		this.carRegNumber = carRegNumber;
	}
	@Override
	public String toString() {
		
		return "Registration Number:"+carRegNumber+" Model:"+carModel+" Car type(SUV/Sedan):"+carName+" Insurance ID:"+insuranceId;
	}
	
	
	
	
}
