package com.dgit.domain;

import java.util.Date;

public class Qna {

	private int qnaNo;
	private String sId;
	private String spId;
	private String qnaWriter;
	private String qnaTitle;
	private String qnaPassword;
	private boolean qnaIsOpen;
	private Date qnaDate;
	private int qnaViewcnt;
	private int qnaLevel;
	private int qnaNo2;

	public int getQnaNo() {
		return qnaNo;
	}

	public String getsId() {
		return sId;
	}

	public String getSpId() {
		return spId;
	}

	public String getQnaWriter() {
		return qnaWriter;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public String getQnaPassword() {
		return qnaPassword;
	}

	public boolean isQnaIsOpen() {
		return qnaIsOpen;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public int getQnaViewcnt() {
		return qnaViewcnt;
	}

	public int getQnaLevel() {
		return qnaLevel;
	}

	public int getQnaNo2() {
		return qnaNo2;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public void setSpId(String spId) {
		this.spId = spId;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public void setQnaPassword(String qnaPassword) {
		this.qnaPassword = qnaPassword;
	}

	public void setQnaIsOpen(boolean qnaIsOpen) {
		this.qnaIsOpen = qnaIsOpen;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public void setQnaViewcnt(int qnaViewcnt) {
		this.qnaViewcnt = qnaViewcnt;
	}

	public void setQnaLevel(int qnaLevel) {
		this.qnaLevel = qnaLevel;
	}

	public void setQnaNo2(int qnaNo2) {
		this.qnaNo2 = qnaNo2;
	}

}
