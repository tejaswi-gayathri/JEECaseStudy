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
		var carRegNumber=$("#carRegNumber").val();
		var field = $("#attribute").val();
		var newValue=$("#newValue").val();
		
		obj={	
				
				"car":{"carRegNumber":carRegNumber
						},
				 "newValue":newValue,
				 "field":field
				 };
		$.ajax({
			
			url:"http://localhost:8080/AutoMobileService/rest/customer/editCustomer",
			type:'POST',
			dataType:'html',
			data:JSON.stringify(obj),
			contentType:'application/json;charset=utf-8',
			success:function(data,textStatus,jqXHR){
				console.log(data);
				},
			error:function(jqXHR,textStatus,errorThrown){
					console.log(errorThrown);
				}
		});
	});

});
</script>
</head>
<body background="images/fin1.png">
<div><%@include file="Header.html" %></div>
<div>
<form class="form">
	<label for="carRegNumber">CarRegistratioNumber</label>
	<input type="text" name="carRegNumber" id="carRegNumber" value=<c:out value="${carRegNumber}"/> class="form-control" required/><br/>
	<label for="attribute">Select the field to be updated</label>
	<select id="attribute" name="attribute">
	  <option>Select an option</option>
	  <option value="customerName">CustomerName</option>
	  <option value="phoneNumber">PhoneNumber</option>
	  <option value="emailId">EmailId</option>
	</select></br>
	<label for="updatedValue">Enter new value:</label>
	<input type="text" name="newValue" id="newValue"/><br/>
	
	<input type="button" value="Update Details" id="addbtn" class="btn btn-primary">
</form><br/>
<form action="ChooseOption.jsp">
<input type="submit" value="Back" class="btn btn-primary"/>
</form>
</div>
<div><jsp:include page="Footer.jsp"></jsp:include></div>
</body>
</html>