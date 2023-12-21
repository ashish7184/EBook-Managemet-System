<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Address</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #f0f7f7;">
	<%@include file="AllComponent/navbar.jsp"%><br>
	<div class="container">
		<div class="row pt-4">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header">
					 <h4 class="text-center text-primary">Edit Address</h4>
					</div>
					<div class="card-body">
					<form>
					   <div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
							</div>

							<div class="form-row">
							    <div class="form-group col-md-4">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">Zip/Pin</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="text-center">
							   <button type="submit" class="btn btn-warning">Add Address</button>
							</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
   <div style="margin-top: 15vh;">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>