<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Add Books</title>
<%@include file="Allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../Login.jsp" />
	</c:if>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header">
						<h4 class="text-center">Add Books</h4>

						<c:if test="${not empty succMSG}">
							<p class="text-center text-success">${succMSG}</p>
							<c:remove var="succMSG" scope="session" />
						</c:if>

						<c:if test="${not empty faildMSG}">
							<p class="text-center text-danger">${faildMSG}</p>
							<c:remove var="faildMSG" scope="session" />
						</c:if>

					</div>
					<div class="card-body">
						<form action="../add_book" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									required type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="bname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									required type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="author">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input required
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="price">
							</div>


							<div class="form-group">
								<label class="inputState">Book Categories</label> <select
									id="inputState" name="bCat" Class="form-control">
									<option selected>--select--</option>
									<option value="New">New Book</option>

								</select>
							</div>
							<div class="form-group">
								<label class="inputState">Book Status</label> <select
									id="inputState" name="bstatus" Class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label class="exampleFormControlFile1">Upload Photo</label> <input
									type="file" name="bimg" class="form-control-file"
									id="exampleFormControlFile1"></input>
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>