package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class logoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public logoutServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
			session.removeAttribute("userobj");
			HttpSession session2=request.getSession();
			session2.setAttribute("succMsg","Logout Successfully");		
			response.sendRedirect("Login.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
