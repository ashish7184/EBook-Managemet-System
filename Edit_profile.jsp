<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile jsp</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #f0f7f7;">

	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>
	<%@include file="AllComponent/navbar.jsp"%><br>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header">
						<h4 class="text-primary text-center">Edit Profile</h4>


						<c:if test="${not empty faildMSG}">
							<h5 class="text-center text-danger">${faildMSG}</h5>
							<c:remove var="faildMSG" scope="session" />
						</c:if>

						<c:if test="${not empty succMSG}">
							<h5 class="text-center text-success">${succMSG}</h5>
							<c:remove var="succMSG" scope="session" />
						</c:if>

					</div>
					<div class="card-body">
						<form action="UpdateProfileServlet" method="post">

							<input type="hidden" value="${userobj.id}" name="ID">
							<div class="form-group">
								<label for="exampleInputEmail1">Name*</label> <input required
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="fName"
									value="${userobj.name}">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email*</label> <input required
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="Email"
									value="${userobj.email}">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number*</label> <input
									required type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="Phone" value="${userobj.phone}">
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password*</label> <input
									required type="password" class="form-control" name="Password"
									id="exampleInputPassword1">
							</div>
							<div class="text-center text-primary">
								<button type="submit" class="btn btn-primary"
									style="width: 100%;">Update</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- this is a footer not write  -->
	<div style="margin-top: 5vh;">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>