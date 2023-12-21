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
<title>All_New_Books.jsp</title>
<%@include file="AllComponent/Allcss.jsp"%>
<style>
.crd-ho:hover {
	background: #fcf7f7;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body style="background-color: #f0f7f7;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<c:if test="${not empty addCart}">
		<div id="toast">${addCart}</div>
	</c:if>
     <c:if test="${empty userobj}">
	    <c:redirect url="Login.jsp"></c:redirect>
	  </c:if>
	<%@include file="AllComponent/navbar.jsp"%><br>
	<h3 class="text-center">All New Books</h3>
	<br>
	<div class="container-fluid">
		<div class="row">
			<%
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getCon());
			List<BookDtls> list = dao.getAllNewBook();
			for (BookDtls b : list) {
			%>

			<div class="col-md-3 mt-3">
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
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
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
	</div>
	<div style="margin-top: 5vh;">
		<%@include file="AllComponent/footer.jsp"%>
	</div>

	<!-- Start the Script Tag -->
	<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
</body>
</html>