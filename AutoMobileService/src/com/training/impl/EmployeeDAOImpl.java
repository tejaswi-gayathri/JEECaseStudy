package com.training.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.training.domain.CustomerDetails;
import com.training.domain.Service;
import com.training.ifaces.DAO;

public class EmployeeDAOImpl implements DAO {
	private Connection con;
	
		public EmployeeDAOImpl() {
		super();
		Context ctx;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/ds1");
			con = ds.getConnection();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		System.out.println(con);
	}



	@Override
	public boolean employeeValidation(String employeeId, String password) throws Exception {
		String sql = "select password from employeedts where employeeId=?";
		boolean result=false;
		String pass=null;
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, employeeId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			pass = rs.getString("password");
		}
		if(password.equals(pass)) {
			result=true;
		}
		pstmt.close();
		return result;
	}



	@Override
	public int addEmployee(String employeeId, String password) throws Exception {
		int rowsAdded=0;
		String sql = "insert into employeedts(employeeId,password) values(?,?)";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, employeeId);
		pstmt.setString(2, password);
		rowsAdded= pstmt.executeUpdate();
		return rowsAdded;
	}



	@Override
	public int checkCarDetails(String carRegNumber) throws Exception {
		int rowsRetrieved = 0;
		String sql = "select * from automobilecompanydts where carRegNumber=?";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, carRegNumber);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			rowsRetrieved = 1;
		}
		return rowsRetrieved;
	}



	@Override
	public int addCustomerDetails(String carRegNumber, String customerName, String phoneNumber, String emailId)
			throws Exception {
		int rowsAdded=0;
		String sql = "insert into automobilecompanydts(carRegNumber,customerName,phoneNumber,emailId) values(?,?,?,?)";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, carRegNumber);
		pstmt.setString(2, customerName);
		pstmt.setString(3, phoneNumber);
		pstmt.setString(4, emailId);
		rowsAdded= pstmt.executeUpdate();
		pstmt.close();
		return rowsAdded;
		
	}



	@Override
	public int addCarDetails(String carRegNumber, String carModel, String carName, String insuranceId)
			throws Exception {
		
		int rowsAdded=0;
		String sql = "insert into cardts(carRegNumber,carModel,carName,insuranceId) values(?,?,?,?)";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, carRegNumber);
		pstmt.setString(2, carModel);
		pstmt.setString(3, carName);
		pstmt.setString(4, insuranceId);
		rowsAdded= pstmt.executeUpdate();
		pstmt.close();
		return rowsAdded;
	}



	@Override
	public int addAddress(String carRegNumber, String addressLane1, String addressLane2, String city, String pincode)
			throws Exception {
		
		int rowsAdded=0;
		String sql = "insert into addressdts(carRegNumber,addressLane1,addressLane2,city,pincode) values(?,?,?,?,?)";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, carRegNumber);
		pstmt.setString(2, addressLane1);
		pstmt.setString(3, addressLane2);
		pstmt.setString(4, city);
		pstmt.setString(5, pincode);
		rowsAdded= pstmt.executeUpdate();
		pstmt.close();
		return rowsAdded;
	}



	@Override
	public int updateCustomer(String category, String newValue,String carRegNumber) throws Exception {
		int rowModified=0;
		String sql = "update automobilecompanydts set "+category+"=? where carRegNumber=?";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, newValue);
		pstmt.setString(2, carRegNumber);
		rowModified = pstmt.executeUpdate();
		pstmt.close();
		return rowModified;
	}



	@Override
	public String getCarModel(String carRegNumber) throws Exception {
		String carModel=null;
		String sql = "select carModel from cardts where carRegNumber=?";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, carRegNumber);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			carModel = rs.getString("carModel");
		}
		return carModel;
	}



	@Override
	public double getServiceCost(String carModel, String service) throws Exception {
		double serviceAmount=0.0;
		String sql = "select serviceAmount from serviceCostdts where carModel=? and service=?";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, carModel);
		pstmt.setString(2, service);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			serviceAmount = rs.getDouble("serviceAmount");
		}
		return serviceAmount;
	}



	@Override
	public int addService(String carRegNumber, String service, double serviceAmount)
			throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();  
	    //System.out.println("Date & Time:"+formatter.format(date));
		int rowsAdded=0;
		//SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyyy");
		//String date = sdf.format(new Date()); 
		String sql = "insert into servicedts(carRegNumber,dateOfService,service,serviceAmount) values(?,?,?,?)";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, carRegNumber);
		pstmt.setString(2, formatter.format(date));
		pstmt.setString(3, service);
		pstmt.setDouble(4, serviceAmount);
		rowsAdded= pstmt.executeUpdate();
		pstmt.close();
		return rowsAdded;
	}



	@Override
	public int addHistory(String carRegNumber, double insuranceAmount, double grandTotal) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();  
	    int rowsAdded=0;
		String sql = "insert into amountHistdts(carRegNumber,dateOfService,insuranceAmount,grandTotal) values(?,?,?,?)";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, carRegNumber);
		pstmt.setString(2, formatter.format(date));
		pstmt.setDouble(3, insuranceAmount);
		pstmt.setDouble(4, grandTotal);
		rowsAdded= pstmt.executeUpdate();
		pstmt.close();
		return rowsAdded;
	}



	@Override
	public CustomerDetails getCustomerDetails(String carRegNumber) throws Exception {
		String customerName=null;
		String phoneNumber = null;
		String emailId = null;
		String sql = "select customerName,phoneNumber,emailId from automobilecompanydts where carRegNumber=?";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, carRegNumber);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			customerName = rs.getString("customerName");
			phoneNumber = rs.getString("phoneNumber");
			emailId = rs.getString("emailId");
		}
		CustomerDetails custDetails = new CustomerDetails(customerName,phoneNumber,emailId);
		return custDetails;
	}



	@Override
	public Service getHistoryDetais(String carRegNumber) throws Exception {
		Service serviceList=null;
		double insuranceAmount=0.0;
		double grandTotal = 0.0;
		String sql = "select insuranceAmount,grandTotal from amountHistdts where carRegNumber=?";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, carRegNumber);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			insuranceAmount = rs.getDouble("insuranceAmount");
			grandTotal = rs.getDouble("grandTotal");
		}
		serviceList = new Service(insuranceAmount,grandTotal);
		return serviceList;
	}


	@Override
	public List<Service> getServiceDetails(String carRegNumber) throws Exception {
		String serviceName;
		double serviceAmount;
		List<Service> serviceList = new ArrayList<>();
		String sql="select service,serviceAmount from servicedts where carRegNumber=? and dateOfService=?";
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();  
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,carRegNumber);
		pstmt.setString(2,formatter.format(date));
		
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()) {
			serviceName = rs.getString("service");
			serviceAmount=rs.getDouble("serviceAmount");
			Service service=new Service(serviceName,serviceAmount);
			serviceList.add(service);
			
		}
		
		
		return serviceList;
	}



	@Override
	public List<Service> getHistory() throws Exception {
		String carRegNumber;
		String dateOfService;
		String service;
		double serviceAmount;
		List<Service> serviceList = new ArrayList<>();
		String sql="select * from servicedts";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()) {
			carRegNumber = rs.getString("carRegNumber");
			dateOfService = rs.getString("dateOfService");
			service = rs.getString("service");
			serviceAmount=rs.getDouble("serviceAmount");
			Service serviceObj=new Service(carRegNumber,dateOfService,service,serviceAmount);
			serviceList.add(serviceObj);
			
		}
		return serviceList;
	}



	

}
