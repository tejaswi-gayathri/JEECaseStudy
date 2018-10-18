package com.trainin.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.training.domain.CustomerDetails;
import com.training.domain.Service;
import com.training.ifaces.DAO;
import com.training.impl.EmployeeDAOImpl;

/**
 * Servlet implementation class BillServlet
 */
public class BillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BillServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerDetails custDetails=null;
		Service serviceDetails=null;
		List<Service> serviceAmountDetails=null;
		HttpSession session = request.getSession();
		String carRegNumber = (String) session.getAttribute("carRegNumber");
		//System.out.println("car number is"+carRegNumber);
		System.out.println("in servlet");
		DAO dao = new EmployeeDAOImpl();
		RequestDispatcher dispatcher = request.getRequestDispatcher("BillPage.jsp");	
		try {
			custDetails = dao.getCustomerDetails(carRegNumber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			serviceDetails = dao.getHistoryDetais(carRegNumber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			serviceAmountDetails = dao.getServiceDetails(carRegNumber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String customerName = custDetails.getCustomerName();
		String phoneNumber = custDetails.getPhoneNumber();
		String emailId = custDetails.getEmailId();
		double insuranceAmount = serviceDetails.getInsuranceClaim();
		double grandTotal = serviceDetails.getGrandTotal();
		System.out.println(customerName+phoneNumber+emailId+insuranceAmount+grandTotal);
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();  
		//serviceAmountDetails.forEach(System.out::println);
		request.setAttribute("customerName", customerName);
		request.setAttribute("phoneNumber", phoneNumber);
		request.setAttribute("emailId", emailId);
		request.setAttribute("serviceAmountDetails", serviceAmountDetails);
		request.setAttribute("insuranceAmount", insuranceAmount);
		request.setAttribute("grandTotal", grandTotal);
		request.setAttribute("dateOfDelivery", formatter.format(date)+7);
		dispatcher.forward(request, response);
		
	}

}
