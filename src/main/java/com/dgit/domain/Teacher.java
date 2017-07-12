package com.dgit.domain;

public class Teacher {

	private String tId;
	private String tPassword;
	private String tName;
	private String tPhone;
	private String tSubject;
	private String tPicture;
	private String tMemo;

	public String gettId() {
		return tId;
	}

	public String gettPassword() {
		return tPassword;
	}

	public String gettName() {
		return tName;
	}

	public String gettPhone() {
		return tPhone;
	}

	public String gettSubject() {
		return tSubject;
	}

	public String gettPicture() {
		return tPicture;
	}

	public String gettMemo() {
		return tMemo;
	}

	public void settId(String tId) {
		this.tId = tId;
	}

	public void settPassword(String tPassword) {
		this.tPassword = tPassword;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public void settPhone(String tPhone) {
		this.tPhone = tPhone;
	}

	public void settSubject(String tSubject) {
		this.tSubject = tSubject;
	}

	public void settPicture(String tPicture) {
		this.tPicture = tPicture;
	}

	public void settMemo(String tMemo) {
		this.tMemo = tMemo;
	}

}
