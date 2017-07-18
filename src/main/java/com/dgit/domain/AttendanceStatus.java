package com.dgit.domain;

public class AttendanceStatus {
	private int asNo;
	private String asStatus;

	public int getAsNo() {
		return asNo;
	}

	public void setAsNo(int asNo) {
		this.asNo = asNo;
	}

	public String getAsStatus() {
		return asStatus;
	}

	public void setAsStatus(String asStatus) {
		this.asStatus = asStatus;
	}

	@Override
	public String toString() {
		return String.format("AttendanceStatus [asNo=%s, asStatus=%s]", asNo, asStatus);
	}

}
