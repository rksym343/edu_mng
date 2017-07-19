package com.dgit.domain;

public class CourseRegister {

	private int regNo;
	private int regMonth;
	private int cNo;
	private Student student;
	private RegistrationStatus registrationStatus;

	public int getRegNo() {
		return regNo;
	}

	public void setRegNo(int regNo) {
		this.regNo = regNo;
	}

	public int getRegMonth() {
		return regMonth;
	}

	public void setRegMonth(int regMonth) {
		this.regMonth = regMonth;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	
	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public RegistrationStatus getRegistrationStatus() {
		return registrationStatus;
	}

	public void setRegistrationStatus(RegistrationStatus registrationStatus) {
		this.registrationStatus = registrationStatus;
	}

	@Override
	public String toString() {
		return String.format(
				"CourseRegister [regNo=%s, regMonth=%s, student=%s, course=%s, registrationStatus=%s]",
				regNo, regMonth, student, cNo, registrationStatus);
	}

}
