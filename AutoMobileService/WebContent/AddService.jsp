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
		var carRegNumber=$("#carRegNumber").val();
		var insuranceClaim = 0.0;
		$("#ClaimInsurance").change(function() {
		    if( this.checked ){
			
			obj={
				 "carRegNumber":carRegNumber
				 };
		
		$.ajax({
			
			url:"http://localhost:8080/InsuranceCompany/rest/insurance/getInsuranceDetails",
			type:'POST',
			dataType:'html',
			data:JSON.stringify(obj),
			contentType:'application/json;charset=utf-8',
			success:function(data,textStatus,jqXHR){
				insuranceClaim = data;
				$('#insuranceshow').show();
				$('#insurancespan').text(insuranceClaim);
				
				},
			error:function(jqXHR,textStatus,errorThrown){
					console.log(errorThrown);
				}
		});
		}
		    });
		
		$("#addbtn").on('click',function(){
			
			var serviceSelected = [];
			$('div#services input[type=checkbox]').each(function() {
			 if ($(this).is(":checked")) {
				 serviceSelected.push($(this).attr('name'));
			}
			});
		 
			obj={
				 "carRegNumber":carRegNumber,
				 "serviceSelected":serviceSelected,
				 "insuranceClaim":insuranceClaim
				 };
		
		$.ajax({
			
			url:"http://localhost:8080/AutoMobileService/rest/customer/getAmount",
			type:'POST',
			dataType:'html',
			data:JSON.stringify(obj),
			contentType:'application/json;charset=utf-8',
			success:function(data,textStatus,jqXHR){
				console.log(data);
				var valuecost = data;
				var actualamount = parseFloat(insuranceClaim)+parseFloat(valuecost);
				$('#actualshow').show();
				$('#actualspan').text(actualamount);
				$('#amountshow').show();
				$('#amountspan').text(valuecost);
				$('#confirmbtn').show();
				$('#cancelbtn').show();
				
				
			},
			error:function(jqXHR,textStatus,errorThrown){
					console.log(errorThrown);
				}
		});
	});
		$("#confirmbtn").on('click',function(){
			var serviceSelected = [];
			$('div#services input[type=checkbox]').each(function() {
			 if ($(this).is(":checked")) {
				 serviceSelected.push($(this).attr('name'));
			}
			});
		 
			obj={
				 "carRegNumber":carRegNumber,
				 "serviceSelected":serviceSelected,
				 "insuranceClaim":insuranceClaim
				 };
			
			$.ajax({
				
				url:"http://localhost:8080/AutoMobileService/rest/customer/addService",
				type:'POST',
				dataType:'html',
				data:JSON.stringify(obj),
				contentType:'application/json;charset=utf-8',
				success:function(data,textStatus,jqXHR){
					
					$('#billbtn').show();
					},
				error:function(jqXHR,textStatus,errorThrown){
						console.log(errorThrown);
					}
			});
			
		});
		
		$("#cancelbtn").on('click',function(){
			window.location.href='CheckCustDetails.jsp';
		});
		
		//$("#billbtn").on('click',function(){
			//	$.ajax({
				
				//url:"bill",
				//type:'POST',
				//dataType:'html',
				//data:JSON.stringify(obj),
				//contentType:'application/json;charset=utf-8',
				//success:function(data,textStatus,jqXHR){
					//console.log(data);
					
				//	},
				//error:function(jqXHR,textStatus,errorThrown){
					//	console.log(errorThrown);
					//}
			//});
			
		//});
	
});
</script>
</head>
<body background="images/fin1.png">
<c:set value='${sessionScope["carRegNumber"]}' var="carRegNumber"></c:set>
<div><%@include file="Header.html" %></div>
<div style="width: 50%;margin-left:1%;">
<p><c:out value="${grossAmount}"/></p>
<form id="serviceform" class="form">
	<label for="carRegNumber">CarRegistratioNumber</label>
	<input type="text" name="carRegNumber" id="carRegNumber" value=<c:out value="${carRegNumber}"/> class="form-control" required/><br/>
	<label for="service1">Select service(s)</label><br>
	<div id="services">
	<input type="checkbox" name="WheelBalancing" id="WheelBalancing" value="WheelBalancing">Wheel balancing<br>
	<input type="checkbox" name="Polishing" id="Polishing" value="Polishing">Polishing<br>
	<input type="checkbox" name="SuspensionSystems" id="SuspensionSystems" value="SuspensionSystems">Suspension Systems<br>
	<input type="checkbox" name="Decor" id="Decor" value="Decor">Decor<br>
	<input type="checkbox" name="ACCompressorReplacement" id="ACCompressorReplacement" value="ACCompressorReplacement">AC Compressor Replacement<br>
	</div>
	<label for="ClaimInsurance">Select this if you have insurance</label>
	<input type="checkbox" name="ClaimInsurance" id="ClaimInsurance" value="ClaimInsurance">ClaimInsurance<br/>
	<p id="insuranceshow" name="insuranceshow" style="display:none;">Insurance Amount:<span id="insurancespan"></span></p>
	<input type="button" value="Calculate Total" id="addbtn" class="btn btn-success">
	<p id="actualshow" name="actualshow" style="display:none;">Actual service amount is:<span id="actualspan"></span></p>
	<p id="amountshow" name="amountshow" style="display:none;">Total Amount is(Actual service-InsuranceClaim):<span id="amountspan"></span></p>
	<input type="button" value="Confirm Order" id="confirmbtn" style="display:none;" class="btn btn-success"><br/><br/>
	<input type="button" value="Cancel Order" id="cancelbtn" style="display:none;" class="btn btn-danger"><br/><br/>
</form><br/>
<form action="bill" method="post">
<input type="submit" value="Generate Bill" id="billbtn" style="display:none;" class="btn btn-success">
</form>
</div>
<div><jsp:include page="Footer.jsp"></jsp:include></div>
</body>
</html>