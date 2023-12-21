<%@page import="com.entites.BookOrd"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.DBConnect"%>
<%@page import="com.dao.BookOrderDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Orders</title>
<%@include file="Allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../Login.jsp" />
	</c:if>
	<h4 class="text-center">Hello Admin</h4>
	<table class="table table-striped">
		<thead class="bg-primary">
			<tr>
				<th scope="col">Order ID</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
		  <%
		   BookOrderDaoImpl dao=new BookOrderDaoImpl(DBConnect.getCon());
		   List<BookOrd>list= dao.getAllBook();
		   for(BookOrd od:list){
	      %>
	      
	      <tr>
				<th><%=od.getOrderId() %></th>
				<td><%=od.getUserName() %></td>
				<td><%=od.getEmail() %></td>
				<td><%=od.getFulladd() %></td>
				<td><%=od.getPhno() %></td>
				<td><%=od.getBook_name() %></td>
				<td><%=od.getAuthor() %></td>
				<td><%=od.getPrices()%></td>
				<td><%=od.getPayment() %></td>
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