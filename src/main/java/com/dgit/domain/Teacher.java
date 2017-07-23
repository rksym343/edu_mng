package com.dgit.domain;

public class Teacher {

	private String tId;
	private String tPassword;
	private String tName;
	private String tPhone;
	private Subject tSubject;
	private String tPicture;

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

	public Subject gettSubject() {
		return tSubject;
	}

	public String gettPicture() {
		return tPicture;
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

	public void settSubject(Subject tSubject) {
		this.tSubject = tSubject;
	}

	public void settPicture(String tPicture) {
		this.tPicture = tPicture;
	}

	@Override
	public String toString() {
		return String.format("Teacher [tId=%s, tPassword=%s, tName=%s, tPhone=%s, tSubject=%s, tPicture=%s]",
				tId, tPassword, tName, tPhone, tSubject, tPicture);
	}
	
	

}
