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

	<c:choose>
		<c:when test="${isSuccess == true && update==false }">
			<h3>Form submitted successfully.</h3>
			<p>The customer, <b><c:out value="${firstName }"></c:out></b> <b><c:out value="${lastName }"></c:out></b>, 
			has been saved to database.</p>
		</c:when>
		<c:when test="${isSuccess == true && update==true }">
			<h3>Form submitted successfully.</h3>
			<p>The customer, <b><c:out value="${firstName }"></c:out></b> <b><c:out value="${lastName }"></c:out></b>, 
			has been updated in the database.</p>
		</c:when>
		<c:otherwise>
			<br>
			<h3>There was some error in form submission.</h3> 
			<p>Retry by clicking on this
			<a href="/crm/customers/add" class="link-info">link</a></p>
			
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