package com.training.domain;

import java.util.HashMap;
import java.util.List;

public class InsuranceDetails {
	private String carRegNumber;
	private String insuranceId;
	private double insuranceAmount;
	
	
	public InsuranceDetails() {
		super();
		
	}


	public InsuranceDetails(String carRegNumber, String insuranceId, double insuranceAmount) {
		super();
		this.carRegNumber = carRegNumber;
		this.insuranceId = insuranceId;
		this.insuranceAmount = insuranceAmount;
	}


	public String getCarRegNumber() {
		return carRegNumber;
	}


	public void setCarRegNumber(String carRegNumber) {
		this.carRegNumber = carRegNumber;
	}


	public String getInsuranceId() {
		return insuranceId;
	}


	public void setInsuranceId(String insuranceId) {
		this.insuranceId = insuranceId;
	}


	public double getInsuranceAmount() {
		return insuranceAmount;
	}


	public void setInsuranceAmount(double insuranceAmount) {
		this.insuranceAmount = insuranceAmount;
	}


	public InsuranceDetails(String carRegNumber) {
		super();
		this.carRegNumber = carRegNumber;
	}


	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Car Registration Number:"+carRegNumber;
	}


		
	
}
