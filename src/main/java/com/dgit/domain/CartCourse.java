package com.dgit.domain;

import java.util.Date;
import java.util.List;

public class CartCourse {

	private int ccNo;
	private String sId;
	private List<Course> courses;
	private Date cartDate;

	public int getCcNo() {
		return ccNo;
	}

	public void setCcNo(int ccNo) {
		this.ccNo = ccNo;
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public Date getCartDate() {
		return cartDate;
	}

	public void setCartDate(Date cartDate) {
		this.cartDate = cartDate;
	}

	@Override
	public String toString() {
		return String.format("CartCourse [ccNo=%s, sId=%s, courses=%s, cartDate=%s]", ccNo, sId, courses, cartDate);
	}

}