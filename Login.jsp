<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Login</title>
<%@include file="AllComponent/Allcss.jsp"%>
<style>
a:hover {
	font-weight: bold;
}
</style>
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center">
						<h4>Login page</h4>
						<!--  this is a jstl part of jsp-->
						<c:if test="${not empty FailedMsg}">
						 <h5 class="text-center text-danger">${FailedMsg}</h5>
						 <c:remove var="FailedMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty succMsg}">
						 <h5 class="text-center text-success">${succMsg}</h5>
						 <c:remove var="succMsg" scope="session"/>
						</c:if>
																	
					</div>
					<div class="card-body">
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									name="email" aria-describedby="emailHelp" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									required name="password" type="password" class="form-control"
									id="exampleInputPassword1">
							</div>
							<div class="form-group text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br> <a href="Register.jsp">Create a New Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="AllComponent/footer.jsp"%>
</body>
</html>