package com.dgit.domain;

public class CourseRegister {

	private int regNo;
	private int regMonth;
	private Student student;
	private Course course;
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

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public RegistrationStatus getRegistrationStatus() {
		return registrationStatus;
	}

	public void setRegistrationStatus(RegistrationStatus registrationStatus) {
		this.registrationStatus = registrationStatus;
	}

}
