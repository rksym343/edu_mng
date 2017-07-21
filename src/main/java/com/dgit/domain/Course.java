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
	private Date cStartdate; //@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date cEnddate;
	private String classroom;
	private CourseDetail content;
	private List<CourseImage> pictures;
	private boolean isCanceled;
	private List<Timetable> timetables;
	private List<CourseRegister> courseRegisters;
	
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
	public CourseDetail getContent() {
		return content;
	}
	public List<CourseImage> getPictures() {
		return pictures;
	}
	public boolean isCanceled() {
		return isCanceled;
	}
	public List<Timetable> getTimetables() {
		return timetables;
	}
	public List<CourseRegister> getCourseRegisters() {
		return courseRegisters;
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
	public void setContent(CourseDetail content) {
		this.content = content;
	}
	public void setPictures(List<CourseImage> pictures) {
		this.pictures = pictures;
	}
	public void setCanceled(boolean isCanceled) {
		this.isCanceled = isCanceled;
	}
	public void setTimetables(List<Timetable> timetables) {
		this.timetables = timetables;
	}
	public void setCourseRegisters(List<CourseRegister> courseRegisters) {
		this.courseRegisters = courseRegisters;
	}
	@Override
	public String toString() {
		return String.format(
				"Course [cNo=%s, teacher=%s, cName=%s, subject=%s, studentGrade=%s, tuition=%s, capacity=%s, cStartdate=%s, cEnddate=%s, classroom=%s, content=%s, pictures=%s, isCanceled=%s, timetables=%s, courseRegisters=%s]",
				cNo, teacher, cName, subject, studentGrade, tuition, capacity, cStartdate, cEnddate, classroom, content,
				pictures, isCanceled, timetables, courseRegisters);
	}

	

}
