package com.entites;

public class BookDtls {
	private int BookId;
	private String BookName;
	private String Authore;
	private String Price;
	private String BookCategory;
	private String Status;
	private String Photo;
	private String email;

	public BookDtls(String bookName, String authore, String price, String bookCategory, String status, String photo,
			String email) {
		super();
		BookName = bookName;
		Authore = authore;
		Price = price;
		BookCategory = bookCategory;
		Status = status;
		Photo = photo;
		this.email = email;
	}

	public int getBookId() {
		return BookId;
	}

	public void setBookId(int bookId) {
		BookId = bookId;
	}

	public String getBookName() {
		return BookName;
	}

	public void setBookName(String bookName) {
		BookName = bookName;
	}

	public String getAuthore() {
		return Authore;
	}

	public void setAuthore(String authore) {
		Authore = authore;
	}

	public String getPrice() {
		return Price;
	}

	public void setPrice(String price) {
		Price = price;
	}

	public String getBookCategory() {
		return BookCategory;
	}

	public void setBookCategory(String bookCategory) {
		BookCategory = bookCategory;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getPhoto() {
		return Photo;
	}

	public void setPhoto(String photo) {
		Photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public BookDtls() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "BookDtls [BookId=" + BookId + ", BookName=" + BookName + ", Authore=" + Authore + ", Price=" + Price
				+ ", BookCategory=" + BookCategory + ", Status=" + Status + ", Photo=" + Photo + ", email=" + email
				+ "]";
	}

	
}
