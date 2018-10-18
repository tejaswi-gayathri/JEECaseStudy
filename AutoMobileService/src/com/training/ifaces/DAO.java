package com.training.ifaces;

import java.util.Date;
import java.util.List;
import com.training.domain.CustomerDetails;
import com.training.domain.Service;

public interface DAO {

	public boolean employeeValidation(String employeeId,String password) throws Exception;
	public int addEmployee(String employeeId,String password) throws Exception;
	public int addCustomerDetails(String carRegNumber,String customerName,String phoneNumber,String emailId) throws Exception;
	public int addCarDetails(String carRegNumber,String carModel,String carName,String insuranceId) throws Exception;
	public int addAddress(String carRegNumber,String addressLane1,String addressLane2,String city,String pincode) throws Exception;
	public int updateCustomer(String category,String newValue,String carRegNumber) throws Exception;
	public int checkCarDetails(String carRegNumber) throws Exception;
	public String getCarModel(String carRegNumber) throws Exception;
	public double getServiceCost(String carModel,String service) throws Exception;
	public int addService(String carRegNumber,String service,double serviceAmount) throws Exception;
	public int addHistory(String carRegNumber,double insuranceAmount, double grandTotal) throws Exception;
	public CustomerDetails getCustomerDetails(String carRegNumber) throws Exception;
	public Service getHistoryDetais(String carRegNumber) throws Exception;
	public List<Service> getServiceDetails(String carRegNumber) throws Exception;
	public List<Service> getHistory() throws Exception;
	
}
