package com.dgit.domain;

public class CourseDetail {

	private int cNo;
	private String cContent;

	public int getcNo() {
		return cNo;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	@Override
	public String toString() {
		return String.format("CourseDetail [cNo=%s, cContent=%s]", cNo, cContent);
	}

}
