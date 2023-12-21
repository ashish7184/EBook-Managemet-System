package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entites.BookDtls;
import com.entites.cart;

public class cartDaoImpl implements cartDAo {

	private Connection con;

	public cartDaoImpl(Connection con) {
		this.con = con;
	}

	@Override
	public boolean addCart(cart c) {
		boolean f = false;
		try {

			String q = "insert into cart(bid,uid,book_name,Author,Price,totalPrice)values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, c.getBid());
			pstmt.setInt(2, c.getUid());
			pstmt.setString(3, c.getBook_Name());
			pstmt.setString(4, c.getCAuthor());
			pstmt.setDouble(5, c.getPrice());
			pstmt.setDouble(6, c.getTotalPrice());
			int i = pstmt.executeUpdate();
			if(i==1) {
				f=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<cart> getBookbyUser(int uid) {
		List<cart> list=new ArrayList<cart>();
		cart c=null;
		double totalprice=0;
		try {
			String sql="select *from cart where uid=?";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			ResultSet set=pstmt.executeQuery();
			while(set.next()) {
				c=new cart();
				c.setCid(set.getInt(1));
				c.setBid(set.getInt(2));
				c.setUid(set.getInt(3));
				c.setBook_Name(set.getString(4));
				c.setCAuthor(set.getString(5));
				c.setPrice(set.getDouble(6));
				totalprice+=set.getDouble(7);
				c.setTotalPrice(totalprice);
				list.add(c);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deleteBook(int bid,int uid,int cid) {
		boolean f=false;
		try {
			String q="delete from cart where cid=? and bid=? and uid=?";
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setInt(1, cid);
			pstmt.setInt(2, bid);
			pstmt.setInt(3, uid);
			int i=pstmt.executeUpdate();
			if(i==1) {			
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
