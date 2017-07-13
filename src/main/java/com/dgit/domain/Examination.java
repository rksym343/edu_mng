package com.dgit.domain;

public class Examination {

	private int eNo;
	private String sId;
	private int cNo;
	private int eiNo;
	private int eResult;
	private String eMemo;

	public int geteNo() {
		return eNo;
	}

	public String getsId() {
		return sId;
	}

	public int getcNo() {
		return cNo;
	}

	public int getEiNo() {
		return eiNo;
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

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public void setEiNo(int eiNo) {
		this.eiNo = eiNo;
	}

	public void seteResult(int eResult) {
		this.eResult = eResult;
	}

	public void seteMemo(String eMemo) {
		this.eMemo = eMemo;
	}

}
