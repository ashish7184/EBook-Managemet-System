package com.dao;

import java.io.InputStream;
import java.io.Reader;
import java.math.BigDecimal;
import java.net.URL;
import java.sql.Array;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.NClob;
import java.sql.ParameterMetaData;
import java.sql.PreparedStatement;
import java.sql.Ref;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.RowId;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.sql.SQLXML;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.entites.BookDtls;
import com.mysql.cj.xdevapi.Result;

public class BookDaoImpl implements BooksDao {
	private Connection con;

	public BookDaoImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean addBooks(BookDtls bd) {
		boolean f = false;
		try {
			String q = "insert into book_dtls(BookName,Author,Price,bookCategory,Status,photo,user_email)values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, bd.getBookName());
			pstmt.setString(2, bd.getAuthore());
			pstmt.setString(3, bd.getPrice());
			pstmt.setString(4, bd.getBookCategory());
			pstmt.setString(5, bd.getStatus());
			pstmt.setString(6, bd.getPhoto());
			pstmt.setString(7, bd.getEmail());
			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	@Override
	public List<BookDtls> getAllBook() {
		List<BookDtls> list = new ArrayList<>();
		BookDtls bd = null;
		try {
			String q = "select *from book_dtls";
			PreparedStatement pstmt = con.prepareStatement(q);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				bd = new BookDtls();
				bd.setBookId(set.getInt(1));
				bd.setBookName(set.getString(2));
				bd.setAuthore(set.getString(3));
				bd.setPrice(set.getString(4));
				bd.setBookCategory(set.getString(5));
				bd.setStatus(set.getString(6));
				bd.setPhoto(set.getString(7));
				bd.setEmail(set.getString(8));
				list.add(bd);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDtls getBookbyId(int id) {
		BookDtls bd = null;
		try {
			String q = "select *from book_dtls where bookId=?";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, id);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				bd = new BookDtls();
				bd.setBookId(set.getInt(1));
				bd.setBookName(set.getString(2));
				bd.setAuthore(set.getString(3));
				bd.setPrice(set.getString(4));
				bd.setBookCategory(set.getString(5));
				bd.setStatus(set.getString(6));
				bd.setPhoto(set.getString(7));
				bd.setEmail(set.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bd;
	}

	@Override
	public boolean upadateEditBooks(BookDtls b) {
		boolean f = false;
		try {
			String sql = "update book_dtls set BookName=?,Author=?,Price=?,Status=? where bookId=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b.getBookName());
			pstmt.setString(2, b.getAuthore());
			pstmt.setString(3, b.getPrice());
			pstmt.setString(4, b.getStatus());
			pstmt.setInt(5, b.getBookId());
			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			String qury = "delete from book_dtls where bookId=?";
			PreparedStatement pstmt = con.prepareStatement(qury);
			pstmt.setInt(1, id);
			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDtls> getNewBook() {
		List<BookDtls> list = new ArrayList<>();
		BookDtls bd = null;
		try {
			String query = "select *from book_dtls where bookCategory=? and Status=? order by bookId DESC";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, "New");
			pstmt.setString(2, "Active");

			ResultSet set = pstmt.executeQuery();
			int i = 1;
			while (set.next() && i <= 4) {
				bd = new BookDtls();
				bd.setBookId(set.getInt(1));
				bd.setBookName(set.getString(2));
				bd.setAuthore(set.getString(3));
				bd.setPrice(set.getString(4));
				bd.setBookCategory(set.getString(5));
				bd.setStatus(set.getString(6));
				bd.setPhoto(set.getString(7));
				bd.setEmail(set.getString(8));
				list.add(bd);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getRecentBook() {
		List<BookDtls> list = new ArrayList<>();
		BookDtls bd = null;
		try {
			String query = "select *from book_dtls where Status=? order by bookId DESC";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, "Active");

			ResultSet set = pstmt.executeQuery();
			int i = 1;
			while (set.next() && i <= 4) {
				bd = new BookDtls();
				bd.setBookId(set.getInt(1));
				bd.setBookName(set.getString(2));
				bd.setAuthore(set.getString(3));
				bd.setPrice(set.getString(4));
				bd.setBookCategory(set.getString(5));
				bd.setStatus(set.getString(6));
				bd.setPhoto(set.getString(7));
				bd.setEmail(set.getString(8));
				list.add(bd);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getOldBook() {
		List<BookDtls> list = new ArrayList<>();
		BookDtls bd = null;
		try {
			String query = "select *from book_dtls where bookCategory=? and Status=? order by bookId DESC";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, "Old");
			pstmt.setString(2, "Active");

			ResultSet set = pstmt.executeQuery();
			int i = 1;
			while (set.next() && i <= 4) {
				bd = new BookDtls();
				bd.setBookId(set.getInt(1));
				bd.setBookName(set.getString(2));
				bd.setAuthore(set.getString(3));
				bd.setPrice(set.getString(4));
				bd.setBookCategory(set.getString(5));
				bd.setStatus(set.getString(6));
				bd.setPhoto(set.getString(7));
				bd.setEmail(set.getString(8));
				list.add(bd);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllRecentBook() {
		List<BookDtls> list = new ArrayList<>();
		BookDtls bd = null;
		try {
			String query = "select *from book_dtls where Status=? order by bookId DESC";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, "Active");

			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				bd = new BookDtls();
				bd.setBookId(set.getInt(1));
				bd.setBookName(set.getString(2));
				bd.setAuthore(set.getString(3));
				bd.setPrice(set.getString(4));
				bd.setBookCategory(set.getString(5));
				bd.setStatus(set.getString(6));
				bd.setPhoto(set.getString(7));
				bd.setEmail(set.getString(8));
				list.add(bd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllNewBook() {
		List<BookDtls> list = new ArrayList<>();
		BookDtls bd = null;
		try {
			String query = "select *from book_dtls where bookCategory=? and Status=? order by bookId DESC";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, "New");
			pstmt.setString(2, "Active");

			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				bd = new BookDtls();
				bd.setBookId(set.getInt(1));
				bd.setBookName(set.getString(2));
				bd.setAuthore(set.getString(3));
				bd.setPrice(set.getString(4));
				bd.setBookCategory(set.getString(5));
				bd.setStatus(set.getString(6));
				bd.setPhoto(set.getString(7));
				bd.setEmail(set.getString(8));
				list.add(bd);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllOldBook() {
		List<BookDtls> list = new ArrayList<>();
		BookDtls bd = null;
		try {
			String query = "select *from book_dtls where bookCategory=? and Status=? order by bookId DESC";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, "Old");
			pstmt.setString(2, "Active");

			ResultSet set = pstmt.executeQuery();

			while (set.next()) {
				bd = new BookDtls();
				bd.setBookId(set.getInt(1));
				bd.setBookName(set.getString(2));
				bd.setAuthore(set.getString(3));
				bd.setPrice(set.getString(4));
				bd.setBookCategory(set.getString(5));
				bd.setStatus(set.getString(6));
				bd.setPhoto(set.getString(7));
				bd.setEmail(set.getString(8));
				list.add(bd);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getBookByOld(String emails, String cat) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String Sql = "select *from book_dtls where user_email=? and bookCategory=? ";
			PreparedStatement pstmt = con.prepareStatement(Sql);
			pstmt.setString(1, emails);
			pstmt.setString(2, cat);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				b = new BookDtls();
				b.setBookId(set.getInt(1));
				b.setBookName(set.getString(2));
				b.setAuthore(set.getString(3));
				b.setPrice(set.getString(4));
				b.setBookCategory(set.getString(5));
				b.setStatus(set.getString(6));
				b.setPhoto(set.getString(7));
				b.setEmail(set.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean OldBookDelete(String emails, String cat, int id) {
		boolean f = false;
		try {
			String q = "delete from book_dtls where user_email=? and bookCategory=? and bookId=?";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, emails);
			pstmt.setString(2, cat);
			pstmt.setInt(3, id);
			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDtls> getBookbySearch(String ch) {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String Sql = "select *from book_dtls where BookName like ? or Author like ? or bookCategory like ? and status=?";
			PreparedStatement pstmt = con.prepareStatement(Sql);
			pstmt.setString(1,"%"+ch+"%" );
			pstmt.setString(2,"%"+ch+"%");
			pstmt.setString(3,"%"+ch+"%");
			pstmt.setString(4,"Active");
			
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				b = new BookDtls();
				b.setBookId(set.getInt(1));
				b.setBookName(set.getString(2));
				b.setAuthore(set.getString(3));
				b.setPrice(set.getString(4));
				b.setBookCategory(set.getString(5));
				b.setStatus(set.getString(6));
				b.setPhoto(set.getString(7));
				b.setEmail(set.getString(8));
				list.add(b);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
