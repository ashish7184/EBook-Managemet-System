<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order success jsp</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%><br>
	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>
	<div class="container text-center mt-3">
		<i class="fa-regular fa-circle-check fa-5x text-center text-success"></i>
		<h1>Thank you</h1>
		<h2>Your Order successfully</h2>
		<h5>with in 7 Days Your Product will be Delivered Your Address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a> <a
			href="Order.jsp" class="btn btn-danger mt-3">View Order</a>

	</div>
	<div class="mt-5">
	<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>