package com.dgit.domain;

import java.util.Date;
import java.util.List;

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
	private List<Timetable> timetables;
	private List<CourseRegister> courseRegisters;

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public StudentGrade getStudentGrade() {
		return studentGrade;
	}

	public void setStudentGrade(StudentGrade studentGrade) {
		this.studentGrade = studentGrade;
	}

	public int getTuition() {
		return tuition;
	}

	public void setTuition(int tuition) {
		this.tuition = tuition;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public Date getcStartdate() {
		return cStartdate;
	}

	public void setcStartdate(Date cStartdate) {
		this.cStartdate = cStartdate;
	}

	public Date getcEnddate() {
		return cEnddate;
	}

	public void setcEnddate(Date cEnddate) {
		this.cEnddate = cEnddate;
	}

	public String getClassroom() {
		return classroom;
	}

	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public String getcPicture() {
		return cPicture;
	}

	public void setcPicture(String cPicture) {
		this.cPicture = cPicture;
	}

	public boolean isCanceled() {
		return isCanceled;
	}

	public void setCanceled(boolean isCanceled) {
		this.isCanceled = isCanceled;
	}

	public List<Timetable> getTimetables() {
		return timetables;
	}

	public void setTimetables(List<Timetable> timetables) {
		this.timetables = timetables;
	}

	public List<CourseRegister> getCourseRegisters() {
		return courseRegisters;
	}

	public void setCourseRegisters(List<CourseRegister> courseRegisters) {
		this.courseRegisters = courseRegisters;
	}

	@Override
	public String toString() {
		return String.format(
				"Course [cNo=%s, teacher=%s, cName=%s, subject=%s, studentGrade=%s, tuition=%s, capacity=%s, cStartdate=%s, cEnddate=%s, classroom=%s, cContent=%s, cPicture=%s, isCanceled=%s, timetables=%s, courseRegisters=%s]",
				cNo, teacher, cName, subject, studentGrade, tuition, capacity, cStartdate, cEnddate, classroom,
				cContent, cPicture, isCanceled, timetables, courseRegisters);
	}

}
