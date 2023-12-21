package com.entites;

public class BookOrd {
	private int id;
	private String OrderId;
	private String UserName;
	private String email;
	private String Phno;
	private String Book_name;
	private String Author;
	private String prices;
	private String fulladd;
	private String Payment;

	public BookOrd() {
		super();

	}
	

	public String getBook_name() {
		return Book_name;
	}


	public void setBook_name(String book_name) {
		Book_name = book_name;
	}


	public String getAuthor() {
		return Author;
	}


	public void setAuthor(String author) {
		Author = author;
	}


	public String getPrices() {
		return prices;
	}


	public void setPrices(String price) {
		this.prices = price;
	}


	public String getOrderId() {
		return OrderId;
	}


	public void setOrderId(String orderId) {
		OrderId = orderId;
	}


	public String getPhno() {
		return Phno;
	}

	public void setPhno(String phno) {
		Phno = phno;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFulladd() {
		return fulladd;
	}

	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}

	public String getPayment() {
		return Payment;
	}

	public void setPayment(String payment) {
		Payment = payment;
	}

	@Override
	public String toString() {
		return "BookOrd [id=" + id + ", UserName=" + UserName + ", email=" + email + ", fulladd=" + fulladd
				+ ", Payment=" + Payment + "]";
	}

}
