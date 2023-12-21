<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #f0f7f7;">
	<%@include file="AllComponent/navbar.jsp"%><br>
	
	<c:if test="${empty userobj}">
	   <c:redirect url="Login.jsp"></c:redirect>
	</c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header">
						<h4 class="text-center text-primary">Sell Book</h4>
						
						<c:if test="${not empty succMSG}">
						 <h4 class="text-center text-success">${succMSG}</h4>
						 <c:remove var="succMSG" scope="session"/>
						</c:if>
						
						<c:if test="${empty faildMSG}">
						  <h4 class="text-center text-danger">${faildMSG}</h4>
						  <c:remove var="faildMSG" scope="session"/>
						</c:if>
					</div>
					<div class="card-body">

						<form action="AddOldBook" method="post"
							enctype="multipart/form-data">

							<input type="hidden" value="${userobj.email}" name="userE" />
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
								<label class="exampleFormControlFile1">Upload Photo</label> <input
									type="file" name="bimg" class="form-control-file"
									id="exampleFormControlFile1"></input>
							</div>
							<button type="submit" class="btn btn-primary">Sell</button>
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