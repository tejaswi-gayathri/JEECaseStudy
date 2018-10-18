package com.training.resources;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;

import com.training.domain.Address;
import com.training.domain.Car;
import com.training.domain.CustomerDetails;
import com.training.domain.Service;
import com.training.ifaces.DAO;
import com.training.impl.EmployeeDAOImpl;

@Path("/customer")
public class CustomerResource {

	double insuranceClaim = 0.0;
	String carRegNumber = null;
	String[] services;
	DAO dao = new EmployeeDAOImpl();
	@POST
	@Path("addCustomerDetails")
	@Consumes(MediaType.APPLICATION_JSON)
	public int addCustomer(CustomerDetails custDetails) {
		System.out.println("i am in add method");
		int rowsAdded = 0;
		int rowsAdded2 = 0;
		int rowsAdded3 = 0;
		Car car = custDetails.getCar();
		Address address = custDetails.getAddress();
		String carRegNumber=car.getCarRegNumber();
		String customerName = custDetails.getCustomerName();
		String phoneNumber = custDetails.getPhoneNumber();
		String emailId = custDetails.getEmailId();
		String addressLane1 = address.getAddressLane1();
		String addressLane2 = address.getAddressLane2();
		String city = address.getCity();
		String pincode =  address.getPincode();
		String carModel = car.getCarModel();
		String carName = car.getcarName();
		String insuranceId = car.getInsuranceId();
		System.out.println(carRegNumber);
		System.out.println("im in function");
		DAO dao = new EmployeeDAOImpl();
		try {
			rowsAdded = dao.addCustomerDetails(carRegNumber, customerName, phoneNumber, emailId);
			rowsAdded2 = dao.addAddress(carRegNumber, addressLane1, addressLane2, city, pincode);
			rowsAdded3 = dao.addCarDetails(carRegNumber, carModel, carName, insuranceId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(rowsAdded+"Rows Added");
		return rowsAdded+rowsAdded2+rowsAdded3;
		
	}
	
	@POST
	@Path("getAmount")
	@Consumes(MediaType.APPLICATION_JSON)
	public double calculate(Service service) {
		String carModel = null;
		double serviceCost = 0.0;
		double grossAmount=0.0;
		insuranceClaim = service.getInsuranceClaim();
		carRegNumber = service.getCarRegNumber();
		services = service.getServiceSelected();
		try {
			carModel =	dao.getCarModel(carRegNumber);
			System.out.println("car model is:"+carModel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(String currentService:services) {
			try {
				serviceCost=serviceCost+dao.getServiceCost(carModel, currentService);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		grossAmount=Math.abs(serviceCost-insuranceClaim);
		System.out.println("Insurance Amount is:"+insuranceClaim);
		System.out.println("Net amount for services is:"+serviceCost);
		System.out.println("Total cost is:"+grossAmount);
		Logger log = Logger.getLogger("second");
		Service logObj = new Service(carRegNumber,insuranceClaim);
		logObj.setCarRegNumber(carRegNumber);
		logObj.setInsuranceClaim(insuranceClaim);
		log.info("One Response from InsuranceCompany server"+"@"+new Date()+"Received.");
		log.info(logObj);
		
		return grossAmount;
	}
	
	@POST
	@Path("addService")
	@Consumes(MediaType.APPLICATION_JSON)
	public double addToService(Service service) {
		System.out.println("in add service");
		double netAmount=0.0;
		double grandTotal =0.0;
		int rowAdded = 0;
		int rowAdded2 = 0;
		String carModel=null;
		double serviceCost=0.0;
		insuranceClaim = service.getInsuranceClaim();
		carRegNumber = service.getCarRegNumber();
		services = service.getServiceSelected();
		try {
			carModel =	dao.getCarModel(carRegNumber);
			System.out.println("car model is:"+carModel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(String serviceSelected:services) {
			try {
				serviceCost = dao.getServiceCost(carModel, serviceSelected);
				rowAdded = dao.addService(carRegNumber, serviceSelected, serviceCost);
				netAmount = netAmount+serviceCost;
				System.out.println("No of rows added are"+rowAdded);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		grandTotal = netAmount-insuranceClaim;
		try {
			rowAdded2 = dao.addHistory(carRegNumber, insuranceClaim, grandTotal);
			System.out.println("history table rows added:"+rowAdded2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0.0;
	}
	
	@POST
	@Path("editCustomer")
	@Consumes(MediaType.APPLICATION_JSON)
	public double editCustomer(CustomerDetails customer) {
		int rowsUpdated=0;
		System.out.println("i am in  edit");
		Car car = customer.getCar();
		String field = customer.getField();
		String newValue = customer.getNewValue();
		String carRegNumber = car.getCarRegNumber();
		System.out.println("field is:"+field+"value is:"+newValue+"car number is:"+carRegNumber);
		try {
			rowsUpdated = dao.updateCustomer(field, newValue, carRegNumber);
			System.out.println("rows updated are:"+rowsUpdated);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return 0.0;
		}
	
	
	}
