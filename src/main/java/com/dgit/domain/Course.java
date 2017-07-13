package com.dgit.domain;

import java.util.Date;

public class Course {

	private int cNo;
	private Teacher teacher;
	private String cName;
	private Subject subject;
	private StudentGrade studentGrade;
	private int tuition;
	private int capacity;
	private Date cStartdate;
	private Date cEnddate;
	private String classroom;
	private String cContent;
	private String cPicture;
	private boolean isCanceled;

	public int getcNo() {
		return cNo;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public String getcName() {
		return cName;
	}

	public Subject getSubject() {
		return subject;
	}

	public StudentGrade getStudentGrade() {
		return studentGrade;
	}

	public int getTuition() {
		return tuition;
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

	public boolean isCanceled() {
		return isCanceled;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public void setStudentGrade(StudentGrade studentGrade) {
		this.studentGrade = studentGrade;
	}

	public void setTuition(int tuition) {
		this.tuition = tuition;
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

	public void setCanceled(boolean isCanceled) {
		this.isCanceled = isCanceled;
	}

	@Override
	public String toString() {
		return String.format(
				"Course [cNo=%s, teacher=%s, cName=%s, subject=%s, studentGrade=%s, tuition=%s, capacity=%s, cStartdate=%s, cEnddate=%s, classroom=%s, cContent=%s, cPicture=%s, isCanceled=%s]",
				cNo, teacher, cName, subject, studentGrade, tuition, capacity, cStartdate, cEnddate, classroom,
				cContent, cPicture, isCanceled);
	}

}
