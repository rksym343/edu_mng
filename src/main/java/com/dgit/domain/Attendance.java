package com.dgit.domain;

import java.util.Date;

public class Attendance {

	private int atNo;
	private Student student;
	private Date theTime;
	private AttendanceStatus attendanceStatus;

	public int getAtNo() {
		return atNo;
	}

	public void setAtNo(int atNo) {
		this.atNo = atNo;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Date getTheTime() {
		return theTime;
	}

	public void setTheTime(Date theTime) {
		this.theTime = theTime;
	}

	public AttendanceStatus getAttendanceStatus() {
		return attendanceStatus;
	}

	public void setAttendanceStatus(AttendanceStatus attendanceStatus) {
		this.attendanceStatus = attendanceStatus;
	}

	@Override
	public String toString() {
		return String.format("Attendance [atNo=%s, sId=%s, theTime=%s, attendanceStatus=%s]", atNo, student, theTime,
				attendanceStatus);
	}

}
