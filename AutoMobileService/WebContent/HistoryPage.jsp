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
<table class="table table-striped">
<tr>
<th>Car reg number</th>
<th>Date of service</th>
<th>Service</th>
<th>Service Cost</th>
</tr>
<%
List<Service> serviceList=(List<Service>)request.getAttribute("serviceList");

for(Service eachService:serviceList){
%>
<tr>
<td><%=eachService.getCarRegNumber() %></td>
<td><%=eachService.getDateOfService() %></td>
<td><%=eachService.getServiceName() %></td>
<td><%=eachService.getServiceAmount() %></td>
</tr>
<%} %>
</table>
</div>
<form action="ChooseOption.jsp">
<input type="submit" value="Go Back" class="btn btn-success">
</form>
<div><jsp:include page="Footer.jsp"></jsp:include></div>
</body>
</html>