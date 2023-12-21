package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDaoImpl;
import com.entites.BookDtls;
import com.helper.DBConnect;

@WebServlet("/EditsServletBook")
public class EditsServletBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public EditsServletBook() {
        super();
      
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(request.getParameter("Bid"));
			String BookName = request.getParameter("bname");
			String Author = request.getParameter("author");
			String price = request.getParameter("price");
			String Status = request.getParameter("bstatus");
			
			BookDtls b=new BookDtls();
			b.setBookId(id);
			b.setBookName(BookName);
			b.setAuthore(Author);
			b.setPrice(price);
			b.setStatus(Status);
			
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getCon());
			boolean f=dao.upadateEditBooks(b);
			HttpSession session=request.getSession();
			if(f) {
				session.setAttribute("succMSG","Book Update Successfully...");
				response.sendRedirect("Admin/All_book.jsp");
				
			}else {
				session.setAttribute("faildMSG","Something wrong on server");
				response.sendRedirect("Admin/All_book.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
