<%@page import="java.util.List"%>
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
<title>User: Old Book</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMSG}">
		<div class="alert alert-success text-center">${succMSG}</div>
		<c:remove var="succMSG" scope="session" />
	</c:if>

	<c:if test="${empty FaildMSG}">
		<div class="alert alert-danger text-center">${succMSG}</div>
		<h4 class="text-danger text-center">${FaildMSG}</h4>
		<c:remove var="FaildMSG" scope="session" />
	</c:if>
	<div class="container p-5">
		<h3 class="text-center">Old Book</h3>
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();

				BookDaoImpl dao = new BookDaoImpl(DBConnect.getCon());
				List<BookDtls> list = dao.getBookByOld(email, "Old");
				for (BookDtls b : list) {
				%>

				<tr>
					<th><%=b.getBookName()%></th>
					<td><%=b.getAuthore()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a
						href="delete_old_book?em=<%=b.getEmail()%>&&idb=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>

				<%
				}
				%>

			</tbody>
		</table>
	</div>
	<div style="margin-top: 40px;">
		<%@include file="AllComponent/footer.jsp" %>
	</div>
</body>
</html>