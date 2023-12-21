package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entites.BookOrd;

public class BookOrderDaoImpl implements BookOrderDAO {
	private Connection con;

	public BookOrderDaoImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean saveOrder(List<BookOrd> blist) {
		boolean f = false;
		try {
			String q = "insert into book_order(Order_id,User_name,email,address,Phno,book_name,Author,Price,Payment)values(?,?,?,?,?,?,?,?,?)";
			con.setAutoCommit(false);
			PreparedStatement pstmt = con.prepareStatement(q);
			for (BookOrd b : blist) {
				pstmt.setString(1, b.getOrderId());
				pstmt.setString(2, b.getUserName());
				pstmt.setString(3, b.getEmail());
				pstmt.setString(4, b.getFulladd());
				pstmt.setString(5, b.getPhno());
				pstmt.setString(6, b.getBook_name());
				pstmt.setString(7, b.getAuthor());
				pstmt.setString(8, b.getPrices());
				pstmt.setString(9, b.getPayment());
				pstmt.addBatch();
			}
			int[] count = pstmt.executeBatch();
			con.commit();
			f = true;
			con.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookOrd> getBook(String email) {

		List<BookOrd> list = new ArrayList<BookOrd>();

		BookOrd od = null;

		try {
			String sql = "select *from book_order where email=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				od = new BookOrd();
				od.setId(set.getInt(1));
				od.setOrderId(set.getString(2));
				od.setUserName(set.getString(3));
				od.setEmail(set.getString(4));
				od.setFulladd(set.getString(5));
				od.setPhno(set.getString(6));
				od.setBook_name(set.getString(7));
				od.setAuthor(set.getString(8));
				od.setPrices(set.getString(9));
				od.setPayment(set.getString(10));
				list.add(od);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookOrd> getAllBook() {
		
		List<BookOrd> list = new ArrayList<BookOrd>();

		BookOrd od = null;

		try {
			String sql = "select *from book_order";
			PreparedStatement pstmt = con.prepareStatement(sql);
			

			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				od = new BookOrd();
				od.setId(set.getInt(1));
				od.setOrderId(set.getString(2));
				od.setUserName(set.getString(3));
				od.setEmail(set.getString(4));
				od.setFulladd(set.getString(5));
				od.setPhno(set.getString(6));
				od.setBook_name(set.getString(7));
				od.setAuthor(set.getString(8));
				od.setPrices(set.getString(9));
				od.setPayment(set.getString(10));
				list.add(od);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

}
