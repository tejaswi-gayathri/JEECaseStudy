<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Employee Registration</title>
</head>
<body background="images/fin1.png">
<div><%@include file="Header.html" %></div>
<c:set value="register" var="check" scope="session"></c:set>
<c:set value="${requestScope.regMsg}" var="regMsg"></c:set>
<div class="col-md-4">
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
		<input type="submit" value="Register" class="btn btn-info"/>
		</div>
		<span style="color:black;"><b><c:out value="${regMsg}"></c:out></b></span>
	</form>
	<a href="index.jsp">Go to Login page</a>
</div>
<div><jsp:include page="Footer.jsp"></jsp:include></div>
</body>
</html>