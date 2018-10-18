<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery1-7-2.js"></script>
<script type="text/javascript">

$(function(){
	
	
	$("#addbtn").on('click',function(){
		
		if($('#customerForm')[0].checkValidity()){
			
		var carRegNumber=$("#carRegNumber").val();
		var customerName=$("#customerName").val();
		var phoneNumber=$("#phoneNumber").val();
		var emailId=$("#emailId").val();
		var addressLane1=$("#addressLane1").val();
		var addressLane2=$("#addressLane2").val();
		var city=$("#city").val();
		var pincode=$("#pincode").val();
		var carModel=$("#carModel").val();
		var carName=$("#carName").val();
		var insuranceId=$("#insuranceId").val();
		
		 obj={
				 "customerName":customerName,
				 "phoneNumber":phoneNumber,
				 "emailId":emailId,
				 "address":{
					 "carRegNumber":carRegNumber,
				 "addressLane1":addressLane1,
				 "addressLane2":addressLane1,
				 "city":city,
				 "pincode":pincode},
		 		"car":{
		 			"carRegNumber":carRegNumber,
				 "carModel":carModel,
				 "carName":carName,
				 "insuranceId":insuranceId
		 		}};
		
		$.ajax({
			
			url:"http://localhost:8080/AutoMobileService/rest/customer/addCustomerDetails",
			type:'POST',
			dataType:'html',
			data:JSON.stringify(obj),
			contentType:'application/json;charset=utf-8',
			success:function(data,textStatus,jqXHR){
				
				$('#hidediv').show();
				
			},
			error:function(jqXHR,textStatus,errorThrown){
					console.log(errorThrown);
				}
		});
		
		}
		
	});
	
});
</script>
</head>
<body background="images/fin1.png">
<div><%@include file="Header.html" %></div>
<div style="width: 50%;margin-left:1%;">
<c:set value='${sessionScope["carRegNumber"]}' var="carRegNumber"></c:set>
<form id="customerForm" name="customerForm" class="form">
		<label for="carRegNumber">CarRegistratioNumber</label>
		<input type="text" name="carRegNumber" id="carRegNumber" value=<c:out value="${carRegNumber}"/> class="form-control" required/><br/>
		<label for="customerName">Customer Name:</label>
		<input type="text" name="customerName" id="customerName" class="form-control" required/><br/>
		<label for="phoneNumber">Phone Number:</label>
		<input type="text" name="phoneNumber" id="phoneNumber" class="form-control" required/><br/>
		<label for="emailId">Email ID:</label>
		<input type="email" name="emailId" id="emailId" class="form-control" required/><br/>
		<label for="addressLane1">Address Lane1:</label>
		<input type="text" name="addressLane1" id="addressLane1" class="form-control" required/><br/>
		<label for="addressLane2">Address Lane2:</label>
		<input type="text" name="addressLane2" id="addressLane2" class="form-control" required/><br/>
		<label for="city">City:</label>
		<input type="text" name="city" id="city" class="form-control" required/><br/>
		<label for="pincode">Pin code:</label>
		<input type="text" name="pincode" id="pincode" class="form-control" required/><br/>
		<label for="carModel">Car Model:</label>
		<input type="text" name="carModel" id="carModel" class="form-control" required/><br/>
		<label for="carName">Car Name:</label>
		<input type="text" name="carName" id="carName" class="form-control" required/><br/>
		<label for="insuranceId">Insurance ID:</label>
		<input type="text" name="insuranceId" id="insuranceId" class="form-control" required/><br/>
		<input type="submit" value="Add Details" id="addbtn" class="btn btn-success">
	</form><br/>
	<a id="hidediv" name="hidediv" style="display: none;" href="ChooseOption.jsp">Add service</a>
	<form action="CheckCustDetails.jsp">
	<input type="submit" value="Back" class="btn btn-success"/>
	</form><br/>
	
	</div>
<div><jsp:include page="Footer.jsp"></jsp:include></div>	
</body>
</html>