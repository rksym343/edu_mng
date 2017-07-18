package com.dgit.domain;

public class AttendanceSearchCriteria {
	private String searchType;
	private String keyword;
	private int status;

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return String.format("AttendanceSearchCriteria [searchType=%s, keyword=%s, status=%s]", searchType, keyword,
				status);
	}

}
