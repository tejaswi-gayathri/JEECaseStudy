package com.training.resources;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;

import com.training.domain.InsuranceDetails;
import com.training.ifaces.DAO;
import com.training.impl.InsuranceDAOImpl;

@Path("/insurance")
public class InsuranceResource {
	Double insuranceClaim = 0.0;
	
	@POST
	@Path("getInsuranceDetails")
	@Consumes(MediaType.APPLICATION_JSON)
	public double getInsuranceAmount(InsuranceDetails insurance){
		String carRegNumber = insurance.getCarRegNumber();
		System.out.println(carRegNumber);
		DAO dao = new InsuranceDAOImpl();
		try {
			insuranceClaim = dao.getInsuranceAmount(carRegNumber);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		//System.out.println("I am in server");
		Logger log = Logger.getLogger("second");
		InsuranceDetails logObj = new InsuranceDetails();
		logObj.setCarRegNumber(carRegNumber);
		log.info("One Request from AutoMobileServiceCompany server"+"@"+new Date()+"Received.");
		log.info(logObj);
		//System.out.println("Insurance amount is"+insuranceClaim);
		return insuranceClaim;
		
	}

}
