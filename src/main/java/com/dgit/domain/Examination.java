package com.dgit.domain;

public class Examination {

	private int eNo;
	private String sId;
	private Course course;
	private ExamItem examItem;
	private int eResult;
	private String eMemo;

	public int geteNo() {
		return eNo;
	}

	public String getsId() {
		return sId;
	}

	public Course getCourse() {
		return course;
	}

	public ExamItem getExamItem() {
		return examItem;
	}

	public int geteResult() {
		return eResult;
	}

	public String geteMemo() {
		return eMemo;
	}

	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public void setExamItem(ExamItem examItem) {
		this.examItem = examItem;
	}

	public void seteResult(int eResult) {
		this.eResult = eResult;
	}

	public void seteMemo(String eMemo) {
		this.eMemo = eMemo;
	}

	@Override
	public String toString() {
		return String.format("Examination [eNo=%s, sId=%s, course=%s, examItem=%s, eResult=%s, eMemo=%s]", eNo, sId,
				course, examItem, eResult, eMemo);
	}

}
