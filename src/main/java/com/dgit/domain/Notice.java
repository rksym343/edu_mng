package com.dgit.domain;

public class Notice {

	private int notiNo;
	private String tId;
	private String nTitle;
	private String nContent;

	public int getNotiNo() {
		return notiNo;
	}

	public String gettId() {
		return tId;
	}

	public String getnTitle() {
		return nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setNotiNo(int notiNo) {
		this.notiNo = notiNo;
	}

	public void settId(String tId) {
		this.tId = tId;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

}
