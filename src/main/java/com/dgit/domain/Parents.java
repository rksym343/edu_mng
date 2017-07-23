package com.dgit.domain;

public class Parents {

	private String spId;
	private String spPassword;
	private String spName;
	private String spPhone;
	private TransferMethod transferMethod;
	private String spRelationship;
	private String sId;

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public TransferMethod getTransferMethod() {
		return transferMethod;
	}

	public void setTransferMethod(TransferMethod transferMethod) {
		this.transferMethod = transferMethod;
	}

	public String getSpId() {
		return spId;
	}

	public String getSpPassword() {
		return spPassword;
	}

	public String getSpName() {
		return spName;
	}

	public String getSpPhone() {
		return spPhone;
	}

	public String getSpRelationship() {
		return spRelationship;
	}


	public void setSpId(String spId) {
		this.spId = spId;
	}

	public void setSpPassword(String spPassword) {
		this.spPassword = spPassword;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}

	public void setSpPhone(String spPhone) {
		this.spPhone = spPhone;
	}

	public void setSpRelationship(String spRelationship) {
		this.spRelationship = spRelationship;
	}

	@Override
	public String toString() {
		return String.format(
				"Parents [spId=%s, spPassword=%s, spName=%s, spPhone=%s, transferMethod=%s, spRelationship=%s, sId=%s]",
				spId, spPassword, spName, spPhone, transferMethod, spRelationship, sId);
	}

	
}
