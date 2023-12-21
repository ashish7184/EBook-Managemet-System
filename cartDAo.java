package com.dao;


import java.util.List;

import com.entites.cart;

public interface cartDAo {
	public boolean addCart(cart c);

	public List<cart> getBookbyUser(int uid);
	
	public boolean deleteBook(int bid,int uid,int cid);
}
