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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String Name = request.getParameter("fName");
			String Email = request.getParameter("Email");
			String Phone = request.getParameter("Phone");
			String password = request.getParameter("Password");
			String check = request.getParameter("check");

			User us = new User();
			us.setName(Name);
			us.setEmail(Email);
			us.setPhone(Phone);
			us.setPassword(password);

			HttpSession session = request.getSession();

			if (check != null) {

				UserDaoImp dao = new UserDaoImp(DBConnect.getCon());
				boolean f2=dao.checkUser(Email);
				if(f2){
					
					boolean f = dao.userRegister(us);
					if (f) {
						session.setAttribute("SuccMsg", "Registration Successfully..");
						response.sendRedirect("Login.jsp");
					} else {
						session.setAttribute("FildMsg", "Something wrong on server..");
						response.sendRedirect("Register.jsp");
					}
                   					
				}else {
					session.setAttribute("FildMsg", "This email is alrady exist ");
					response.sendRedirect("Register.jsp");					
				}
			} else {
				session.setAttribute("FildMsg", "Please check the check Box...");
				response.sendRedirect("Register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
