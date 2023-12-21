<%@page import="java.util.List"%>
<%@page import="com.entites.User"%>
<%@page import="com.entites.cart"%>
<%@page import="com.helper.DBConnect"%>
<%@page import="com.dao.cartDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart jsp</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #f0f7f7;">
	<%@include file="AllComponent/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>


	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty FeildMsg}">
		<div class="alert alert-danger text-center" role="alert">${FeildMsg}</div>
		<c:remove var="FeildMsg" scope="session" />
	</c:if>

	<div class="container">
		<div class="row p-3">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");
								cartDaoImpl dao = new cartDaoImpl(DBConnect.getCon());
								List<cart> list = dao.getBookbyUser(u.getId());
								Double totalPrice = 0.0;
								for (cart c : list) {
									totalPrice = c.getTotalPrice();
								%>

								<tr>
									<th><%=c.getBook_Name()%></th>
									<td><%=c.getCAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td>
										<div class="text-center">
											<a
												href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>"
												class="btn  btn-sm btn-danger">Remove</a>
										</div>
									</td>
								</tr>

								<%
								}
								%>
								<tr>
									<td>Total Price :-</td>
									<td></td>
									<td></td>
									<td style="font-weight: bold;"><u><%=totalPrice%></u></td>

								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-success text-center">Your Details for Order</h3>
						<form action="OrderServlet" method="post">
							<input type="hidden" value="<%=u.getId()%>" name="id">


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										name="uname" class="form-control" id="inputEmail4"
										value="<%=u.getName()%>" readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										name="email" class="form-control" id="inputPassword4"
										value="<%=u.getEmail()%>" readonly="readonly">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone No</label> <input type="number"
										name="Phone" class="form-control" id="inputEmail4"
										required="required" value="<%=u.getPhone()%>">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										name="add" required="required" class="form-control"
										id="inputPassword4">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										name="LandMark" required="required" class="form-control"
										id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										name="city" required="required" class="form-control"
										id="inputPassword4">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										name="state" required="required" class="form-control"
										id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Zip/Pin</label> <input type="text"
										name="pin" required="required" class="form-control"
										id="inputPassword4">
								</div>
							</div>

							<div class="form-group">
								<label for="Select">Payment mode</label> <select id="Select"
									name="select" class="form-control">
									<option value="NoSelect">--select--</option>
									<option value="Cash on Delivery">Cash On Delivery</option>
								</select>
							</div>
							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping..</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 5vh;">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>