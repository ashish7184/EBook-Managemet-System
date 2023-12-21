package com.user.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.BookDaoImpl;
import com.entites.BookDtls;
import com.helper.DBConnect;

@WebServlet("/AddOldBook")
@MultipartConfig
public class AddOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddOldBook() {
		super();

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String BookName = request.getParameter("bname");
			String Author = request.getParameter("author");
			String price = request.getParameter("price");
			String Category ="Old";
			String Status = "Active";
			Part part = request.getPart("bimg");
			String filename = part.getSubmittedFileName();
			String userEmail=request.getParameter("userE");
			BookDtls bd = new BookDtls(BookName, Author, price, Category, Status, filename, userEmail);

			BookDaoImpl dao = new BookDaoImpl(DBConnect.getCon());
			boolean f = dao.addBooks(bd);
			HttpSession session = request.getSession();
			if (f) {

				String path = getServletContext().getRealPath("") + "book";
				File fs = new File(path);
				part.write(path + File.separator + filename);

				session.setAttribute("succMSG", "Book Add Successfully");
				response.sendRedirect("Sell_book.jsp");
			} else {
				session.setAttribute("faildMSG", "Something wrong on server");
				response.sendRedirect("Sell_book.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
