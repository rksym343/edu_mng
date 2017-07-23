package com.dgit.domain;

import java.util.Date;

public class Examination {

	private int eNo;
	private String sId;
	private Course course;
	private ExamItem examItem;
	private Subject subject;
	private int eResult;
	private String eMemo;
	private Date eDate;
	public int geteNo() {
		return eNo;
	}
	public void seteNo(int eNo) {
		this.eNo = eNo;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public ExamItem getExamItem() {
		return examItem;
	}
	public void setExamItem(ExamItem examItem) {
		this.examItem = examItem;
	}
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	public int geteResult() {
		return eResult;
	}
	public void seteResult(int eResult) {
		this.eResult = eResult;
	}
	public String geteMemo() {
		return eMemo;
	}
	public void seteMemo(String eMemo) {
		this.eMemo = eMemo;
	}
	public Date geteDate() {
		return eDate;
	}
	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}
	@Override
	public String toString() {
		return String.format(
				"Examination [eNo=%s, sId=%s, course=%s, examItem=%s, subject=%s, eResult=%s, eMemo=%s, eDate=%s]", eNo,
				sId, course, examItem, subject, eResult, eMemo, eDate);
	}
	
	
	
}
