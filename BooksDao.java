package com.dao;

import java.util.List;

import com.entites.BookDtls;

public interface BooksDao {
	public boolean addBooks(BookDtls bd);

	public List<BookDtls> getAllBook();

	public BookDtls getBookbyId(int id);

	public boolean upadateEditBooks(BookDtls b);

	public boolean deleteBooks(int id);

	public List<BookDtls> getNewBook();

	public List<BookDtls> getRecentBook();

	public List<BookDtls> getOldBook();

	public List<BookDtls> getAllRecentBook();

	public List<BookDtls> getAllNewBook();

	public List<BookDtls> getAllOldBook();

	public List<BookDtls> getBookByOld(String emails, String cat);
	
	public boolean OldBookDelete(String emails, String cat,int id);
	
	public List<BookDtls> getBookbySearch(String ch);
}
