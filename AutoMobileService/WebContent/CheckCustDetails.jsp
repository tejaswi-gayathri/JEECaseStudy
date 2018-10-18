<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body background="images/fin1.png">
<div><%@include file="Header.html" %></div>
<p style="color: white;">Enter Car Registration Number to proceed.You will be redirected to page where service details should be entered</p>
<p style="color: white;">If car number doesn't exist you will be redirected to customer registration page</p>
<form class="form" action="login" method="get">
<label for="carRegNumber">Enter Car registration Number:</label>
<input type="text" name="carRegNumber" id="carRegNumber" class="form-control" required/><br/>
<input type="submit" value="Check for details" class="btn btn-primary">
</form><br/>
<form action="history" class="form">
<input type="submit" value="Get Service History" class="btn btn-primary"/>
</form>
<div><jsp:include page="Footer.jsp"></jsp:include></div>
</body>
</html>