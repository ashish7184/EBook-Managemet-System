package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.cartDaoImpl;
import com.entites.cart;
import com.helper.DBConnect;

@WebServlet("/remove_book")
public class remove_bookCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public remove_bookCart() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int bid = Integer.parseInt(request.getParameter("bid"));
			int uid=Integer.parseInt(request.getParameter("uid"));
			int cid=Integer.parseInt(request.getParameter("cid"));
			cartDaoImpl dao = new cartDaoImpl(DBConnect.getCon());
			boolean f = dao.deleteBook(bid,uid,cid);
			HttpSession session = request.getSession();
			if (f) {
				session.setAttribute("succMsg", "Remove Book from Cart");
				response.sendRedirect("checkout.jsp");
			} else {
				session.setAttribute("FeildMsg", "Something wrong on server");
				response.sendRedirect("checkout.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
