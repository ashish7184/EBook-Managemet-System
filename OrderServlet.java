package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookOrderDaoImpl;
import com.dao.cartDaoImpl;
import com.entites.BookOrd;
import com.entites.cart;
import com.helper.DBConnect;


@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public OrderServlet() {
        super();
     
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
			 int id=Integer.parseInt(request.getParameter("id"));
			 String name=request.getParameter("uname");
			 String email=request.getParameter("email");
			 String Phno=request.getParameter("Phone");
			 String Address=request.getParameter("add");
			 String Landmark=request.getParameter("LandMark");
			 String City=request.getParameter("city");
			 String State=request.getParameter("state");
			 String Pin=request.getParameter("pin");
			 String PaymentType=request.getParameter("select");
			 
			 String fullAddress=Address+","+Landmark+","+City+","+State+","+Pin;
			 
	         HttpSession session=request.getSession();
			 cartDaoImpl dao=new cartDaoImpl(DBConnect.getCon());
			 List<cart> blist= dao.getBookbyUser(id);
			if(blist.isEmpty()) {
				session.setAttribute("FeildMsg", "Cart is empty");
			    response.sendRedirect("checkout.jsp");
				
			}else {
				
				 BookOrderDaoImpl dao2=new BookOrderDaoImpl(DBConnect.getCon());
				 BookOrd ord=null;
				 Random random=new Random();
				 
				 ArrayList<BookOrd> Orderlist=new ArrayList<>();
				 for(cart c:blist) {
					 ord=new BookOrd();
					 ord.setOrderId("BOOK-ORD-00"+random.nextInt(1000));
					 ord.setUserName(name);
					 ord.setEmail(email);
					 ord.setFulladd(fullAddress);
					 ord.setPhno(Phno);
					 ord.setBook_name(c.getBook_Name());
					 ord.setAuthor(c.getCAuthor());
					 ord.setPrices(c.getPrice()+"");
					 ord.setPayment(PaymentType);
					 Orderlist.add(ord);
					
				 }
				 
				 if("NoSelect".equals(PaymentType)) {
					 session.setAttribute("FeildMsg", "Please select Your Payment Type");
					 response.sendRedirect("checkout.jsp");
				 }else {
					Boolean f= dao2.saveOrder(Orderlist);
					if(f) {
						response.sendRedirect("Order_success.jsp");
					}else {
						session.setAttribute("FeildMsg", "Something wrong on server");
						response.sendRedirect("checkout.jsp");
					}
					 
				 }
			}
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
	} 

}
