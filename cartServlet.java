package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDaoImpl;
import com.dao.cartDaoImpl;
import com.entites.BookDtls;
import com.entites.cart;
import com.helper.DBConnect;

@WebServlet("/cartServlet")
public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public cartServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(request.getParameter("bid"));
			int uid = Integer.parseInt(request.getParameter("uid"));
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getCon());
			BookDtls b = dao.getBookbyId(bid);
			cart c = new cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBook_Name(b.getBookName());
			c.setCAuthor(b.getAuthore());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));

			cartDaoImpl dao1 = new cartDaoImpl(DBConnect.getCon());

			boolean f = dao1.addCart(c);
			HttpSession session = request.getSession();
			if (f) {
				
				session.setAttribute("addCart", "Book Added to cart");
				response.sendRedirect("All_New_Books.jsp");
			} else {
				
				session.setAttribute("notAdd", " Something wrong on server");
				response.sendRedirect("All_New_Books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
