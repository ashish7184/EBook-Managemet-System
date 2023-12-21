package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDaoImpl;
import com.helper.DBConnect;

@WebServlet("/delete_old_book")
public class delete_old_book extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public delete_old_book() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String email = request.getParameter("em");
			int id=Integer.parseInt(request.getParameter("idb"));
						
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getCon());
			boolean f=dao.OldBookDelete(email,"Old",id);
			HttpSession session=request.getSession();
			if(f) {
				session.setAttribute("succMSG", "Old Book Delete Successfully");
				response.sendRedirect("Old_book.jsp");
			}else {
				session.setAttribute("FaildMSG", "Something wrong on server");
				response.sendRedirect("Old_book.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
