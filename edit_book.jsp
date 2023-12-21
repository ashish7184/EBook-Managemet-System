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
<title>Admin : Edits Books</title>
<%@include file="Allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header">
						<h4 class="text-center">Edits Books</h4>						

					</div>
					<div class="card-body">

						<%
						int id = Integer.parseInt(request.getParameter("ID"));
						BookDaoImpl dao = new BookDaoImpl(DBConnect.getCon());
						BookDtls bd = dao.getBookbyId(id);
						%>

						<form action="../EditsServletBook" method="post">
						<input type="hidden" name="Bid" value="<%=bd.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									required type="text" class="form-control" value="<%=bd.getBookName() %>"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="bname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									required type="text" class="form-control" value="<%=bd.getAuthore()%>"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="author">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input required
									type="number" class="form-control" id="exampleInputEmail1" value="<%=bd.getPrice()%>"
									aria-describedby="emailHelp" name="price">
							</div>

							<div class="form-group">
								<label class="inputState">Book Status</label> <select
									id="inputState" name="bstatus" Class="form-control">
									<%if("Active".equals(bd.getStatus())){%>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
										<%}else{%>
										<option value="Inactive">Inactive</option>
										<option value="Active">Active</option>
										<%} %>
								</select>
							</div>							
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>