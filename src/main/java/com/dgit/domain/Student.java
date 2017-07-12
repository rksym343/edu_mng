package com.dgit.domain;

import java.util.Date;

public class Student {

	private String sId;
	private String sPassword;
	private String sName;
	private String sPhone;
	private int tmNo;
	private String sSchool;
	private int sGrade;
	private Date sEnrollemnt;
	private String sPicture;
	private String sMemo;
	private int spId;
	
	

	public int getTmNo() {
		return tmNo;
	}

	public int getSpId() {
		return spId;
	}

	public void setTmNo(int tmNo) {
		this.tmNo = tmNo;
	}

	public void setSpId(int spId) {
		this.spId = spId;
	}

	public String getsId() {
		return sId;
	}

	public String getsPassword() {
		return sPassword;
	}

	public String getsName() {
		return sName;
	}

	public String getsPhone() {
		return sPhone;
	}

	public String getsSchool() {
		return sSchool;
	}

	public int getsGrade() {
		return sGrade;
	}

	public Date getsEnrollemnt() {
		return sEnrollemnt;
	}

	public String getsPicture() {
		return sPicture;
	}

	public String getsMemo() {
		return sMemo;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public void setsPassword(String sPassword) {
		this.sPassword = sPassword;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public void setsSchool(String sSchool) {
		this.sSchool = sSchool;
	}

	public void setsGrade(int sGrade) {
		this.sGrade = sGrade;
	}

	public void setsEnrollemnt(Date sEnrollemnt) {
		this.sEnrollemnt = sEnrollemnt;
	}

	public void setsPicture(String sPicture) {
		this.sPicture = sPicture;
	}

	public void setsMemo(String sMemo) {
		this.sMemo = sMemo;
	}

}
