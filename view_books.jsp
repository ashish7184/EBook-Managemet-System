<%@page import="com.entites.User"%>
<%@page import="com.entites.BookDtls"%>
<%@page import="com.helper.DBConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Books Jsp</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #f0f7f7;">
	<%@include file="AllComponent/navbar.jsp"%><br>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDaoImpl dao = new BookDaoImpl(DBConnect.getCon());
	BookDtls b = dao.getBookbyId(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="" src="Book/<%=b.getPhoto()%>"
					style="height: 150px; width: 120px;"><br>
				<h5 class="mt-3">
					Book Name: <span class="text-success"><%=b.getBookName()%></span>
				</h5>
				<h5>
					Author Name: <span class="text-success"><%=b.getAuthore()%></span>
				</h5>
				<h5>
					Category: <span class="text-success"><%=b.getBookCategory()%></span>
				</h5>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>
				<%
				if (b.getBookCategory().equals("New")) {
				%>
				<div class="row pt-2">
					<div class="col-md-4 text-danger text-center p-2 mt-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2 mt-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2 mt-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				<div class="text-center pt-4">
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-cart-plus"></i>Add Cart</a> <a
						href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i>200</a>
				</div>
				<%
				} else {
				%>

				<h5 class="text-primary">Contact to seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i>EMail :${userobj.email}
				</h5>
				<div class="row pt-2">
					<div class="col-md-4 text-danger text-center p-2 mt-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2 mt-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2 mt-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				<div class="text-center pt-4">
					<a href="index.jsp" class="btn btn-success">Continue Shopping..</a> <a
						href="" class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i>200</a>
				</div>

				<%
				}
				%>

			</div>
		</div>
	</div>
	<div style="margin-top: 8vh;">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>