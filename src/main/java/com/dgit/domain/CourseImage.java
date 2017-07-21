package com.dgit.domain;

public class CourseImage {

	private int cNo;
	private String cPicture;

	public int getcNo() {
		return cNo;
	}

	public String getcPicture() {
		return cPicture;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public void setcPicture(String cPicture) {
		this.cPicture = cPicture;
	}

	@Override
	public String toString() {
		return String.format("CourseImage [cNo=%s, cPicture=%s]", cNo, cPicture);
	}

}
