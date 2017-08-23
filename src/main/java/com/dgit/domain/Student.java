package com.dgit.domain;

import java.util.Date;
import java.util.List;

public class Student {

	private String sId;
	private String sPassword;
	private String sName;
	private String sPhone;
	private TransferMethod transferMethod;
	private String school;
	private StudentGrade sGrade;
	private Date joinDate;
	private String sPicture;
	private List<Parents> parents;

	

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



	public String getSchool() {
		return school;
	}



	public void setSchool(String school) {
		this.school = school;
	}



	public StudentGrade getsGrade() {
		return sGrade;
	}



	public void setsGrade(StudentGrade sGrade) {
		this.sGrade = sGrade;
	}



	public Date getJoinDate() {
		return joinDate;
	}



	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}



	public String getsPicture() {
		return sPicture;
	}



	public void setsPicture(String sPicture) {
		this.sPicture = sPicture;
	}



	public List<Parents> getParents() {
		return parents;
	}



	public void setParents(List<Parents> parents) {
		this.parents = parents;
	}



	@Override
	public String toString() {
		return String.format(
				"Student [sId=%s, sPassword=%s, sName=%s, sPhone=%s, transferMethod=%s, school=%s, sGrade=%s, joinDate=%s, sPicture=%s, parents=%s]",
				sId, sPassword, sName, sPhone, transferMethod, school, sGrade, joinDate, sPicture, parents);
	}

}
