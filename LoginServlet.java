package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDaoImp;
import com.entites.User;
import com.helper.DBConnect;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			UserDaoImp dao = new UserDaoImp(DBConnect.getCon());
			HttpSession session = request.getSession();

			String email = request.getParameter("email");
			String Password = request.getParameter("password");
			System.out.println(email + " " + Password);
			if ("admin@gmail.com".equals(email) && "admin".equals(Password)) {
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				response.sendRedirect("Admin/home.jsp");
			} else {
				User us = dao.Login(email, Password);
				if (us != null) {
					session.setAttribute("userobj", us);
					response.sendRedirect("index.jsp");
				} else {
					session.setAttribute("FailedMsg", "Email & Password Invalid");
					response.sendRedirect("Login.jsp");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
