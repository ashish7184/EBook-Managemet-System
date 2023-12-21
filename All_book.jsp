<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.helper.DBConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entites.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Books</title>
<%@include file="Allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../Login.jsp" />
	</c:if>
	<h4 class="text-center">Hello Admin</h4>

	<c:if test="${not empty succMSG}">
		<h5 class="text-center text-success">${succMSG}</h5>
		<c:remove var="succMSG" scope="session" />
	</c:if>

	<c:if test="${not empty faildMSG}">
		<h5 class="text-center text-danger">${faildMSG}</h5>
		<c:remove var="faildMSG" scope="session" />
	</c:if>

	<table class="table table-striped">
		<thead class="bg-primary">
			<tr>
				<th scope="col">BookId</th>
				<th scope="col">Images</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Book Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getCon());
			List<BookDtls> list = dao.getAllBook();
			for (BookDtls bd : list) {
			%>

			<tr>
				<th><%=bd.getBookId()%></th>
				<td><img src="../Book/<%=bd.getPhoto()%>"
					style="width: 50px; height: 50px;" /></td>
				<td><%=bd.getBookName()%></td>
				<td><%=bd.getAuthore()%></td>
				<td><%=bd.getPrice()%></td>
				<td><%=bd.getBookCategory()%></td>
				<td><%=bd.getStatus()%></td>
				<td><a href="edit_book.jsp?ID=<%=bd.getBookId()%>"
					class="btn btn-sm btn-primary"><i
						class="fa-solid fa-pen-to-square"></i>Update</a> <a
					href="../delete?id=<%=bd.getBookId()%>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i>Delete</a></td>
			</tr>

			<%
			}
			%>
		</tbody>
	</table>


	<div style="margin-top: 40px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>