<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Register</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center">
						<h4>Register page</h4>
						<c:if test="${not empty SuccMsg}">
						 <p class="text-center text-success">${SuccMsg}</p>
						 <c:remove var="SuccMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty FildMsg}">
						 <p class="text-center text-danger">${FildMsg}</p>
						 <c:remove var="FildMsg" scope="session"/>
						</c:if>
					</div>
					<div class="card-body">
						<form action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter full name</label> <input
									required type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" name="fName">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									required type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" name="Email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <input
									required type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" name="Phone">
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									required type="password" class="form-control" name="Password"
									id="exampleInputPassword1">
							</div>
							<div class="form-group form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms & Condition</label>
							</div>
							<button type="submit" class="btn btn-primary">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="AllComponent/footer.jsp"%>

</body>
</html>