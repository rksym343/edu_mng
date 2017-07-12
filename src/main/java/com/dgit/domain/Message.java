package com.dgit.domain;

public class Message {

	private int msgNo;
	private String tId;
	private String sId;
	private String spId;
	private String msgContent;
	private boolean isChecked;

	public int getMsgNo() {
		return msgNo;
	}

	public String gettId() {
		return tId;
	}

	public String getsId() {
		return sId;
	}

	public String getSpId() {
		return spId;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public boolean isChecked() {
		return isChecked;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public void settId(String tId) {
		this.tId = tId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public void setSpId(String spId) {
		this.spId = spId;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public void setChecked(boolean isChecked) {
		this.isChecked = isChecked;
	}

}
