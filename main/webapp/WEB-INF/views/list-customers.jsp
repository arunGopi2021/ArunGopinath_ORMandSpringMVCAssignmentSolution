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


<title>customers</title>
</head>
<body>

<div class="container">

<h3>Customer Directory</h3>



<hr>
<form action="/crm/customers/search" method="post" class="form-group" >
	
	<input type="search" name="firstName" class="form-control-sm mr-2 mb-3 " placeholder="first name"/>	
	<input type="search" name="email" class="form-control-sm mr-2 mb-3" placeholder="email"/>	
	
	<button type="submit" class="btn btn-info btn-sm mb-1">Search</button>
</form>
<hr>



<table class="table table-bordered table-striped">
	<thead class="">
		<tr>
			<th colspan="4"><a href="/crm/customers/add" class="btn btn-primary btn-sm mb-3">Add Customer</a></th>
		</tr>
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${listCustomers}" var="tempCustomer">
			<tr>
				<td><c:out value="${tempCustomer.firstName}"></c:out></td>
				<td><c:out value="${tempCustomer.lastName}"></c:out></td>
				<td><c:out value="${tempCustomer.email}"></c:out></td>
				<td>
				<a href="/crm/customers/update?id=${tempCustomer.id}" class="btn btn-info btn-sm mb-2">Update</a>
				<a href="/crm/customers/delete?id=${tempCustomer.id }" class="btn btn-secondary btn-sm mb-2">Delete</a>	
				</td>
			</tr>
		</c:forEach>
	</tbody>



</table>
</div>

<!-- Add the bootstrap js, jquery and  popper -->
<script src="<c:url value="/static/js/jquery.min.js" />"></script>
<script src="<c:url value="/static/js/popper.min.js" />"></script>
<script src="<c:url value="/static/js/bootstrap.min.js" />"></script>
</body>
</html>