package com.dgit.domain;

import java.util.Date;
import java.util.List;

public class CartCourse {

	private String sId;
	private List<Course> courses;
	private Date cartDate;

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
		return String.format("CartCourse [sId=%s, course=%s, cartDate=%s]", sId, courses, cartDate);
	}

}
