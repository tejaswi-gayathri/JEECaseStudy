package com.training.domain;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class Service {
	private String carRegNumber;
	private String dateOfService;
	private String[] serviceSelected;
	private String serviceName;
	private double serviceAmount;
	private double insuranceClaim;
	private double netAmount;
	private double grandTotal;
	
	
	public Service() {
		super();
		
	}


	public Service(String carRegNumber, String dateOfService, String[] serviceSelected, String serviceName,
			double serviceAmount, double insuranceClaim, double netAmount, double grandTotal) {
		super();
		this.carRegNumber = carRegNumber;
		this.dateOfService = dateOfService;
		this.serviceSelected = serviceSelected;
		this.serviceName = serviceName;
		this.serviceAmount = serviceAmount;
		this.insuranceClaim = insuranceClaim;
		this.netAmount = netAmount;
		this.grandTotal = grandTotal;
	}


	public Service(String serviceName, double serviceAmount) {
		super();
		this.serviceName = serviceName;
		this.serviceAmount = serviceAmount;
	}


	public Service(String carRegNumber, String dateOfService, String[] serviceSelected, double insuranceClaim,
			double netAmount, double grandTotal) {
		super();
		this.carRegNumber = carRegNumber;
		this.dateOfService = dateOfService;
		this.serviceSelected = serviceSelected;
		this.insuranceClaim = insuranceClaim;
		this.netAmount = netAmount;
		this.grandTotal = grandTotal;
	}


	public String getCarRegNumber() {
		return carRegNumber;
	}


	public void setCarRegNumber(String carRegNumber) {
		this.carRegNumber = carRegNumber;
	}


	public String getDateOfService() {
		return dateOfService;
	}


	public void setDateOfService(String dateOfService) {
		this.dateOfService = dateOfService;
	}


	public String[] getServiceSelected() {
		return serviceSelected;
	}


	public void setServiceSelected(String[] serviceSelected) {
		this.serviceSelected = serviceSelected;
	}


	public String getServiceName() {
		return serviceName;
	}


	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}


	public double getServiceAmount() {
		return serviceAmount;
	}


	public void setServiceAmount(double serviceAmount) {
		this.serviceAmount = serviceAmount;
	}


	public double getInsuranceClaim() {
		return insuranceClaim;
	}


	public void setInsuranceClaim(double insuranceClaim) {
		this.insuranceClaim = insuranceClaim;
	}


	public double getNetAmount() {
		return netAmount;
	}


	public void setNetAmount(double netAmount) {
		this.netAmount = netAmount;
	}


	public double getGrandTotal() {
		return grandTotal;
	}


	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}


	public Service(double insuranceClaim, double grandTotal) {
		super();
		this.insuranceClaim = insuranceClaim;
		this.grandTotal = grandTotal;
	}


	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "CarRegNumber:"+carRegNumber+"Insurance Claim:"+insuranceClaim;
	}


	public Service(String carRegNumber, String dateOfService, String serviceName, double serviceAmount) {
		super();
		this.carRegNumber = carRegNumber;
		this.dateOfService = dateOfService;
		this.serviceName = serviceName;
		this.serviceAmount = serviceAmount;
	}


	
	
	
	
	
}
