<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.training.domain.*"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body background="images/fin1.png">
<div><%@include file="Header.html" %></div>
<div style="width: 50%;margin-left:1%;">
<h3 style="text-align:center;">Bill</h3>
<p>Customer Name:<% out.print(request.getAttribute("customerName")); %></p>
<p>Customer NumberL<% out.print(request.getAttribute("phoneNumber")); %>
<p>Customer email ID:<% out.print(request.getAttribute("emailId"));%></p>
<table class="table table-striped">
<tr>
<th>Service</th>
<th>Service Cost</th>
</tr>
<%
List<Service> serviceList=(List<Service>)request.getAttribute("serviceAmountDetails");

for(Service eachService:serviceList){
%>
<tr>
<td><%=eachService.getServiceName() %></td>
<td><%=eachService.getServiceAmount() %></td>
</tr>
<%} %>
</table>
<p><b>Insurance Amount:</b><b><% out.print(request.getAttribute("insuranceAmount")); %></b></p>
<p><b>Grand Total:</b><b><% out.print(request.getAttribute("grandTotal")); %></b></p>
<p><b>Thank you for visiting us!</b></p>
</div>
<form action="CheckCustDetails.jsp" class="form">
<input type="submit" value="New Service" class="btn btn-success"/>
</form>
<div><jsp:include page="Footer.jsp"></jsp:include></div>
</body>
</html>