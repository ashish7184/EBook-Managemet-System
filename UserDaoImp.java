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
import java.util.Calendar;

import com.entites.User;

public class UserDaoImp implements userDao {
	private Connection con;

	public UserDaoImp(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean userRegister(User us) {
		boolean f = false;
		try {
			String q = "insert into user(name,email,phno,password)values(?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, us.getName());
			pstmt.setString(2, us.getEmail());
			pstmt.setString(3, us.getPhone());
			pstmt.setString(4, us.getPassword());
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
	public User Login(String email, String password) {
		User us = null;
		try {
			String q = "select *from user where email=? and password=?";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				us = new User();
				us.setId(set.getInt(1));
				us.setName(set.getString(2));
				us.setEmail(set.getString(3));
				us.setPhone(set.getString(4));
				us.setPassword(set.getString(5));
				us.setAddress(set.getString(6));
				us.setLandmark(set.getString(7));
				us.setCity(set.getString(8));
				us.setState(set.getString(9));
				us.setPinCode(set.getString(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	@Override
	public boolean checkPassword(int id, String password) {
		boolean f = true;
		try {
			String q = "select *from user where id=? and password=?";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, id);
			pstmt.setString(2, password);

			ResultSet set = pstmt.executeQuery();

			while (set.next()) {
               f=false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean updateProfile(User u) {
		boolean f=false;
		try{
			String q="update user set Name=?,email=?,phno=? where id=?";
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPhone());
			pstmt.setInt(4, u.getId());
			
			int i=pstmt.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean checkUser(String em) {
		boolean f=true;
		try {
			String q="select *from user where email=?";
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setString(1, em);
			ResultSet set=pstmt.executeQuery();
			while(set.next()) {
				f=false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
