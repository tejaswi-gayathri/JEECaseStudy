<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Employee Id</title>
</head>
<body background="images/fin1.png">
<c:set value="login" var="check" scope="session"></c:set>
<c:set value="${requestScope.msg}" var="msg"></c:set>
<div><%@include file="Header.html" %></div>
<div>
<p style="color: white;text-align: center;">Employee Login</p>
<p style="color: white;">Please enter username and password to continue</p>
<div class="col-md-4" style="width: 50%;">
	<form class="form" action="login" method="post">
		<div class="form-group">
		<label for="employeeId">EmployeeId:</label>
		<input type="text" name="employeeId" id="employeeId" class="form-control" required/><br/>
		</div>
		<div class="form-group">
		<label for="password">Password:</label>
		<input type="password" name="password" id="password" class="form-control" required/><br/>
		</div>
		<div class="form-group">
		<input type="submit" value="Login" class="btn btn-success"/>
		</div>
		<span style="color:red;"><c:out value="${msg}"></c:out></span>
	</form>
</div>
<div>
&nbsp;&nbsp;&nbsp;&nbsp;<a style="color:black;" href="registration.jsp">New User Registration</a>
</div>
<div><jsp:include page="Footer.jsp"></jsp:include></div>
</div>
</body>
</html>