package com.training.domain;

public class AutomobileServiceCompany {
	
	private Employee employee;
	private CustomerDetails customer;
	private Service service;
	public AutomobileServiceCompany() {
		super();
		
	}
	public AutomobileServiceCompany(Employee employee) {
		super();
		this.employee = employee;
	}
	public AutomobileServiceCompany(CustomerDetails customer) {
		super();
		this.customer = customer;
	}
	public AutomobileServiceCompany(Service service) {
		super();
		this.service = service;
	}
	public AutomobileServiceCompany(CustomerDetails customer, Service service) {
		super();
		this.customer = customer;
		this.service = service;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public CustomerDetails getCustomer() {
		return customer;
	}
	public void setCustomer(CustomerDetails customer) {
		this.customer = customer;
	}
	public Service getService() {
		return service;
	}
	public void setService(Service service) {
		this.service = service;
	}
	
	
	

}
