package com.dgit.domain;

import java.util.Date;

public class Attendance {

	private int atNo;
	private String sId;
	private Date inTime;
	private Date outTime;
	private AttendanceStatus attendanceStatus;

	public int getAtNo() {
		return atNo;
	}

	public void setAtNo(int atNo) {
		this.atNo = atNo;
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public Date getInTime() {
		return inTime;
	}

	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}

	public Date getOutTime() {
		return outTime;
	}

	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}

	public AttendanceStatus getAttendanceStatus() {
		return attendanceStatus;
	}

	public void setAttendanceStatus(AttendanceStatus attendanceStatus) {
		this.attendanceStatus = attendanceStatus;
	}

	@Override
	public String toString() {
		return String.format("Attendance [atNo=%s, sId=%s, inTime=%s, outTime=%s, attendanceStatus=%s]", atNo, sId,
				inTime, outTime, attendanceStatus);
	}
	
	

}
