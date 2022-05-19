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


<title>add new customer</title>
</head>
<body>

<div class="container">



<form action="/crm/customers/save" method="post">
	<p class="form-group h4 mb-4" >New Customer Form</p>
	<!-- Add hidden form field to handle update -->
	<input type="hidden" name="id" value="${newCustomer.id}" />
	
	<div class="form-inline ">
		<input type="text" name="firstName" value="${newCustomer.firstName}" class="form-control mb-4 col-4" placeholder="first name"/>
	</div>
	
	<div class="form-inline">
		<input type="text" name="lastName" value="${newCustomer.lastName}" class="form-control  mb-4 col-4" placeholder="last name"/>
	</div>
	
	<div class="form-inline">
		<input type="text" name="email" value="${newCustomer.email}" class="form-control  mb-4 col-4" placeholder="email"/>
	</div>
	
	<button type="submit" class="btn btn-info col-2">Save</button>
</form>
<hr>

<a href="/crm/customers/list" class="link-info">Back to customer directory</a>
</div>

<!-- Add the bootstrap js, jquery and  popper -->
<script src="<c:url value="/static/js/jquery.min.js" />"></script>
<script src="<c:url value="/static/js/popper.min.js" />"></script>
<script src="<c:url value="/static/js/bootstrap.min.js" />"></script>
</body>
</html>