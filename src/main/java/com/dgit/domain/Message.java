package com.dgit.domain;

import java.util.Date;

public class Message {

	private int msgNo;
	private String tId;
	private int cNo;
	private String sId;
	private String spId;
	private String msgContent;
	private boolean isChecked;
	private Date regDate;
	private Teacher teacher;
	private Student student;
	private Parents parents;
	private boolean isSent;
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public String gettId() {
		return tId;
	}
	public void settId(String tId) {
		this.tId = tId;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getSpId() {
		return spId;
	}
	public void setSpId(String spId) {
		this.spId = spId;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public boolean isChecked() {
		return isChecked;
	}
	public void setChecked(boolean isChecked) {
		this.isChecked = isChecked;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Parents getParents() {
		return parents;
	}
	public void setParents(Parents parents) {
		this.parents = parents;
	}
	public boolean isSent() {
		return isSent;
	}
	public void setSent(boolean isSent) {
		this.isSent = isSent;
	}
	@Override
	public String toString() {
		return String.format(
				"Message [msgNo=%s, tId=%s, cNo=%s, sId=%s, spId=%s, msgContent=%s, isChecked=%s, regDate=%s, teacher=%s, student=%s, parents=%s, isSent=%s]",
				msgNo, tId, cNo, sId, spId, msgContent, isChecked, regDate, teacher, student, parents, isSent);
	}

	

}
