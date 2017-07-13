package com.dgit.domain;

public class StudentGrade {
	private int gdNo;
	private String gdName;

	public int getGdNo() {
		return gdNo;
	}

	public String getGdName() {
		return gdName;
	}

	public void setGdNo(int gdNo) {
		this.gdNo = gdNo;
	}

	public void setGdName(String gdName) {
		this.gdName = gdName;
	}

	@Override
	public String toString() {
		return String.format("StudentGrade [gdNo=%s, gdName=%s]", gdNo, gdName);
	}
	
	

}
