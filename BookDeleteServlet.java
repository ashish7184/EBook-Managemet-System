package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDaoImpl;
import com.helper.DBConnect;

@WebServlet("/delete")
public class BookDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public BookDeleteServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getCon());
			boolean f=dao.deleteBooks(id);
			HttpSession session=request.getSession();
			if(f){
				session.setAttribute("succMSG","Book Delete Successfully..");
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
