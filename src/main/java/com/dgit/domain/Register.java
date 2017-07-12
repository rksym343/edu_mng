package com.dgit.domain;

public class Register {

	private int regNo;
	private int regMonth;
	private String regSId;
	private int regCNo;
	private boolean isRegistered;

	public int getRegNo() {
		return regNo;
	}

	public int getRegMonth() {
		return regMonth;
	}

	public String getRegSId() {
		return regSId;
	}

	public int getRegCNo() {
		return regCNo;
	}

	public boolean isRegistered() {
		return isRegistered;
	}

	public void setRegNo(int regNo) {
		this.regNo = regNo;
	}

	public void setRegMonth(int regMonth) {
		this.regMonth = regMonth;
	}

	public void setRegSId(String regSId) {
		this.regSId = regSId;
	}

	public void setRegCNo(int regCNo) {
		this.regCNo = regCNo;
	}

	public void setRegistered(boolean isRegistered) {
		this.isRegistered = isRegistered;
	}

}
