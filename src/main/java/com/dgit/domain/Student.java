package com.dgit.domain;

import java.util.Date;

public class Student {

	private String sId;
	private String sPassword;
	private String sName;
	private String sPhone;
	private TransferMethod transferMethod;
	private String sSchool;
	private StudentGrade sGrade;
	private Date sEnrollemnt;
	private String sPicture;
	private String sMemo;

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getsPassword() {
		return sPassword;
	}

	public void setsPassword(String sPassword) {
		this.sPassword = sPassword;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public TransferMethod getTransferMethod() {
		return transferMethod;
	}

	public void setTransferMethod(TransferMethod transferMethod) {
		this.transferMethod = transferMethod;
	}

	public String getsSchool() {
		return sSchool;
	}

	public void setsSchool(String sSchool) {
		this.sSchool = sSchool;
	}

	public StudentGrade getsGrade() {
		return sGrade;
	}

	public void setsGrade(StudentGrade sGrade) {
		this.sGrade = sGrade;
	}

	public Date getsEnrollemnt() {
		return sEnrollemnt;
	}

	public void setsEnrollemnt(Date sEnrollemnt) {
		this.sEnrollemnt = sEnrollemnt;
	}

	public String getsPicture() {
		return sPicture;
	}

	public void setsPicture(String sPicture) {
		this.sPicture = sPicture;
	}

	public String getsMemo() {
		return sMemo;
	}

	public void setsMemo(String sMemo) {
		this.sMemo = sMemo;
	}


}
