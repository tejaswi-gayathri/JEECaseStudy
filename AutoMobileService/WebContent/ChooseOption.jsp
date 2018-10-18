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
<div>
<p style="color: white;text-align: center;">Select any of the services below</p>
<form action="AddService.jsp" class="form">
<input type="submit" value="Register car for service" class="btn btn-primary">
</form><br/>
<form action="EditDetails.jsp" class="form" style="margin-left:250px;margin-top:-52px;">
<input type="submit" value="Edit Customer Details" class="btn btn-primary">
</form><br/>
<form action="history" class="form" style="margin-left:460px;margin-top:-52px;">
<input type="submit" value="Get Service History" class="btn btn-primary"/>
</form>

</div><br>
<div><jsp:include page="Footer.jsp"></jsp:include></div>
</body>
</html>