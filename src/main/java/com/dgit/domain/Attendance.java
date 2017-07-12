package com.dgit.domain;

import java.util.Date;

public class Attendance {

	private int atNo;
	private int sNo;
	private Date inTime;
	private Date outTime;
	private boolean isDelay;
	
	

	public boolean isDelay() {
		return isDelay;
	}

	public void setDelay(boolean isDelay) {
		this.isDelay = isDelay;
	}

	public int getAtNo() {
		return atNo;
	}

	public int getsNo() {
		return sNo;
	}

	public Date getInTime() {
		return inTime;
	}

	public Date getOutTime() {
		return outTime;
	}

	public void setAtNo(int atNo) {
		this.atNo = atNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}

	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}

}
