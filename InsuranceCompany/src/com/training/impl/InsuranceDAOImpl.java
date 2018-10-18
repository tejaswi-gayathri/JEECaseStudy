package com.training.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.training.ifaces.DAO;

public class InsuranceDAOImpl implements DAO {
	private Connection con;

	public InsuranceDAOImpl() {
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
	public double getInsuranceAmount(String carRegNumber) throws Exception {
		double insuranceAmount=0.0;
		String sql = "select insuranceAmount from insurancedts where carRegNumber=?";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, carRegNumber);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			insuranceAmount = rs.getDouble("insuranceAmount");
		}
		pstmt.close();
		return insuranceAmount;
		
	}

	
}
