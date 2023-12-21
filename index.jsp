<%@page import="com.entites.User"%>
<%@page import="com.entites.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.helper.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBooks.com</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<style type="text/css">
.back-img {
	background: url("img/book.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background: #fcf7f7;
}
</style>
<body style="background-color: #f0f7f7;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">
			<i class="fa-solid fa-book"></i>EBook Management System
		</h2>
	</div>
	<br>

	<!-- start Recent Book -->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDaoImpl dao1 = new BookDaoImpl(DBConnect.getCon());
			List<BookDtls> list1 = dao1.getRecentBook();
			for (BookDtls bd : list1) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=bd.getPhoto()%>"
							style="width: 150px; height: 200px;" />
						<p><%=bd.getBookName()%></p>
						<p><%=bd.getAuthore()%></p>
						<p>
							Categories:<%=bd.getBookCategory()%></p>
						<%
						if ((bd.getBookCategory()).equals("Old")) {
						%>

						<div class="row ml-3">
							<a href="view_books.jsp?bid=<%=bd.getBookId()%>"
								class="btn btn-danger btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"> <i
								class="fa-solid fa-indian-rupee-sign"></i><%=bd.getPrice()%>
							</a>
						</div>

						<%
						} else {
						%>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="Login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add Cart</a>
							<%
							} else {
							%>

							<a href="cartServlet?bid=<%=bd.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add Cart</a>

							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=bd.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"> <i
								class="fa-solid fa-indian-rupee-sign"></i><%=bd.getPrice()%>
							</a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>


			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="All_Recent_Book.jsp" class="btn btn-danger btn-sm">View
				All</a>
		</div>
	</div>
	<br>
	<!-- End Recent Book -->
	<hr>
	<!-- start new Book -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<br>
		<div class="row">

			<%
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getCon());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;" />
						<p><%=b.getBookName()%>
						</p>
						<p><%=b.getAuthore()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>

							<a href="Login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add Cart</a>
							<%
							} else {
							%>
							<a href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add Cart</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-danger btn-sm ml-1"> <i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>



		</div>
		<div class="text-center mt-2">
			<a href="All_New_Books.jsp" class="btn btn-danger btn-sm">View
				All</a>
		</div>
	</div>
	<br>
	<!-- End new Book -->
	<hr>
	<!-- start old Book -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<br>
		<div class="row">

			<%
			BookDaoImpl dao2 = new BookDaoImpl(DBConnect.getCon());
			List<BookDtls> list2 = dao2.getOldBook();
			for (BookDtls b2 : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b2.getPhoto()%>"
							style="width: 150px; height: 200px;" />
						<p><%=b2.getBookName()%></p>
						<p><%=b2.getAuthore()%></p>
						<p>
							Categories:<%=b2.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b2.getBookId()%>"
								class="btn btn-danger btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-2"> <i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b2.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="All_Old_Books.jsp" class="btn btn-danger btn-sm">View
				All</a>
		</div>
	</div>
	<!-- End old Book -->
	<%@include file="AllComponent/footer.jsp"%>
</body>
</html>