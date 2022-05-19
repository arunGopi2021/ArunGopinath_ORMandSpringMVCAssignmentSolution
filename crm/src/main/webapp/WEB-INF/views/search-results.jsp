<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- Adding the JSTL tags -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!DOCTYPE html>
<html>
<head>

<!-- Add the meta tags -->
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Add the bootstrap css -->
<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet"> 


<title>search-result</title>
</head>
<body>

<div class="container">



<c:choose>

<c:when test="${not empty listCustomers}">

	<br>
	<h3>The search returned the results below:</h3>
	<hr>
	<table class="table table-bordered table-striped">
		<thead class="">
			
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${listCustomers}" var="tempCustomer">
				<tr>
					<td><c:out value="${tempCustomer.firstName}"></c:out></td>
					<td><c:out value="${tempCustomer.lastName}"></c:out></td>
					<td><c:out value="${tempCustomer.email}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:when>

<c:otherwise>
	<br>
	<h3>The search returned no results.</h3>
	<hr>

</c:otherwise>

</c:choose>


<a href="/crm/customers/list" class="link-info">Back to customers directory</a>

</div>

<!-- Add the bootstrap js, jquery and  popper -->
<script src="<c:url value="/static/js/jquery.min.js" />"></script>
<script src="<c:url value="/static/js/popper.min.js" />"></script>
<script src="<c:url value="/static/js/bootstrap.min.js" />"></script>
</body>
</html>