<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting jsp</title>
<%@include file="AllComponent/Allcss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f0f7f7;">
	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>
	<%@include file="AllComponent/navbar.jsp"%><br>
	<div class="container">
		<h3 class="text-center">Hello , ${userobj.name}</h3>
		<div class="row p-5">
			<div class="col-md-4">
				<a href="Sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h4 class="mt-2">Sell Old Book</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="Old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h4 class="mt-2">Old Book</h4>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-4">
				<a href="Edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-pen-to-square fa-3x"></i>
							</div>
							<h4 class="mt-2">Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6 mt-3 ">
				<a href="Order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h4 class="mt-2">My Order</h4>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6 mt-3 ">
				<a href="helpLine.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-regular fa-circle-user fa-3x"></i>
							</div>
							<h4 class="mt-2">Help Center</h4>
							<p>24 x 7 Service</p>
						</div>
					</div>
				</a>
			</div>

		</div>
	</div>
	<!-- this is a footer not write  -->
	<div style="margin-top: 5vh;">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>