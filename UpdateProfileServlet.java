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

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateProfileServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("ID"));
			String name = request.getParameter("fName");
			String email = request.getParameter("Email");
			String phno = request.getParameter("Phone");
			String Password = request.getParameter("Password");

			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phno);

			HttpSession session = request.getSession();

			UserDaoImp dao = new UserDaoImp(DBConnect.getCon());
			boolean f = dao.checkPassword(id, Password);
			if (f) {
				boolean f2 = dao.updateProfile(us);
				if (f2) {
					session.setAttribute("succMSG", "Update Profile Successfully");
					response.sendRedirect("Edit_profile.jsp");
				} else {
					session.setAttribute("faildMSG", "Something wrong on server");
					response.sendRedirect("Edit_profile.jsp");
				}	
            
			} else {
				session.setAttribute("faildMSG", "Your Password is Incorrect");
				response.sendRedirect("Edit_profile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
