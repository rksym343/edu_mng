package com.dgit.domain;

public class Subject {
	private int sbNo;
	private String sbName;
	private boolean sbIsDel;

	public boolean isSbIsDel() {
		return sbIsDel;
	}

	public void setSbIsDel(boolean sbIsDel) {
		this.sbIsDel = sbIsDel;
	}

	public int getSbNo() {
		return sbNo;
	}

	public String getSbName() {
		return sbName;
	}

	public void setSbNo(int sbNo) {
		this.sbNo = sbNo;
	}

	public void setSbName(String sbName) {
		this.sbName = sbName;
	}

}
