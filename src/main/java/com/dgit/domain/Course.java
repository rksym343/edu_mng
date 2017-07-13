package com.dgit.domain;

import java.util.Date;

public class Course {

	private int cNo;
	private String tId;
	private String cName;
	private Subject sbNo;
	private StudentGrade gbNo;
	private int tuituion;
	private int capacity;
	private Date cStartdate;
	private Date cEnddate;
	private String classroom;
	private String cContent;
	private String cPicture;
	private boolean isCanceled;
	
	

	
	public boolean isCanceled() {
		return isCanceled;
	}

	public void setCanceled(boolean isCanceled) {
		this.isCanceled = isCanceled;
	}

	public int getcNo() {
		return cNo;
	}

	public String gettId() {
		return tId;
	}

	public String getcName() {
		return cName;
	}

	public int getTuituion() {
		return tuituion;
	}

	public int getCapacity() {
		return capacity;
	}

	public Date getcStartdate() {
		return cStartdate;
	}

	public Date getcEnddate() {
		return cEnddate;
	}

	public String getClassroom() {
		return classroom;
	}

	public String getcContent() {
		return cContent;
	}

	public String getcPicture() {
		return cPicture;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public void settId(String tId) {
		this.tId = tId;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public void setTuituion(int tuituion) {
		this.tuituion = tuituion;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public void setcStartdate(Date cStartdate) {
		this.cStartdate = cStartdate;
	}

	public void setcEnddate(Date cEnddate) {
		this.cEnddate = cEnddate;
	}

	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public void setcPicture(String cPicture) {
		this.cPicture = cPicture;
	}

}
