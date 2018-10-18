package com.trainin.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.training.ifaces.DAO;
import com.training.impl.EmployeeDAOImpl;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rowsRetrieved = 0;
		RequestDispatcher dispatcher;
		DAO dao = new EmployeeDAOImpl();
		String carRegNumber = request.getParameter("carRegNumber");
		HttpSession session = request.getSession();
		session.setAttribute("carRegNumber", carRegNumber);
		try {
			rowsRetrieved=dao.checkCarDetails(carRegNumber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(rowsRetrieved>0) {
			dispatcher = request.getRequestDispatcher("ChooseOption.jsp");
			//System.out.println("rows are retrieved");
		}else {
			dispatcher = request.getRequestDispatcher("AddCustomer.jsp");
			//System.out.println("record doesnt exist");
		}
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean result=false;
		int rowsAdded=0;
		String msg = "Invalid employee credentials";
		String regMsg = null;
		HttpSession session = request.getSession();
		String check = (String) session.getAttribute("check");
		//System.out.println(check);
		RequestDispatcher dispatcher;
		DAO dao = new EmployeeDAOImpl();
		if(check.equals("login")) {
		String employeeId = request.getParameter("employeeId");
		String password = request.getParameter("password");
		try {
			result = dao.employeeValidation(employeeId, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result) {
			dispatcher = request.getRequestDispatcher("CheckCustDetails.jsp");
			
		}else {
			request.setAttribute("msg", msg);
			dispatcher = request.getRequestDispatcher("index.jsp");
		}
		
		
		dispatcher.forward(request, response);
		}
		if(check.equals("register")){
			String employeeId = request.getParameter("employeeId");
			String password = request.getParameter("password");
			try {
				rowsAdded = dao.addEmployee(employeeId, password);
				
			} catch (Exception e) {
				//e.printStackTrace();
			}
			if(rowsAdded==1) {
				request.setAttribute("regMsg", "You have registered successfully");
			}else {
				request.setAttribute("regMsg", "Username already exists,please register again");	
			}
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
	}

}
