package com.dao;

import java.util.List;

import com.entites.BookOrd;

public interface BookOrderDAO {

	public boolean saveOrder(List<BookOrd> bO);
	
	public List<BookOrd> getBook(String Email);
	
	public List<BookOrd> getAllBook();
}
