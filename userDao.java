package com.dao;

import com.entites.User;

public interface userDao {
	public boolean userRegister(User us);

	public User Login(String email, String password);
	
	public boolean checkPassword(int id,String password);
	
	public boolean updateProfile(User u);
	
	public boolean checkUser(String em);
}
