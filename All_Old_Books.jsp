<%@page import="com.entites.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.DBConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All_Old_Books.jsp</title>
<%@include file="AllComponent/Allcss.jsp"%>
<style>
.crd-ho:hover {
	background: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f0f7f7;">
	<%@include file="AllComponent/navbar.jsp"%>
	
	  <c:if test="${empty userobj}">
	    <c:redirect url="Login.jsp"></c:redirect>
	  </c:if>
	  
	<br>
	<h3 class="text-center">All Old Books</h3>
	<div class="container-fluid">
		<div class="row">
			<%
			BookDaoImpl dao2 = new BookDaoImpl(DBConnect.getCon());
			List<BookDtls> list2 = dao2.getAllOldBook();
			for (BookDtls b2 : list2) {
			%>

			<div class="col-md-3 mt-3">
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
	</div>
	<div style="margin-top: 5vh;">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>