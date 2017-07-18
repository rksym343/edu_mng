package com.dgit.service;

import java.util.List;

import com.dgit.domain.CartCourse;

public interface CartCourseService {
	
	public int insertCartCourse(CartCourse cartCourse) throws Exception;
	public boolean insertCartCourse(CartCourse[] cartCourses) throws Exception;
	public void deleteOneCartCourse(CartCourse cartCourse) throws Exception;
	public void deleteCartCoursesByDate() throws Exception;
	public List<CartCourse> selectAllCoursesBySId(String sId) throws Exception;
}
