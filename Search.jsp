<%@page import="com.entites.User"%>
<%@page import="com.entites.BookDtls"%>
<%@page import="java.util.List"%>
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
<title>All_Recent_Book.jsp</title>
<%@include file="AllComponent/Allcss.jsp"%>
<style>
.crd-ho:hover {
	background: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f0f7f7;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="AllComponent/navbar.jsp"%><br>
	  
	   <c:if test="${empty userobj}">
	    <c:redirect url="Login.jsp"></c:redirect>
	  </c:if>
	  	
	<h3 class="text-center">All Recent Book</h3>
	<div class="container-fluid">
		<div class="row" style="margin-top: 10px;">
			<%
			String ch=request.getParameter("ch");
			BookDaoImpl dao1 = new BookDaoImpl(DBConnect.getCon());
			List<BookDtls> list1 = dao1.getBookbySearch(ch);
			for (BookDtls bd : list1) {
			%>

			<div class="col-md-3 mt-3">
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
								class="btn btn-danger btn-sm ml-5">View Details</a> <a href=""
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
	</div>
	<div style="margin-top: 5vh;">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>