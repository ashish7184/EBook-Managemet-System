package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
  private static Connection con;
  public static Connection getCon() {
	  try {
		 Class.forName("com.mysql.cj.jdbc.Driver");
		  con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ebook","root","System@#2003");
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return con;
  }
}
