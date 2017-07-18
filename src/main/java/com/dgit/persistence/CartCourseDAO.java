package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.CartCourse;

public interface CartCourseDAO {
	
	public int insertCartCourse(CartCourse cartCourse) throws Exception;
	public void deleteOneCartCourse(CartCourse cartCourse) throws Exception;
	public void deleteCartCoursesByDate() throws Exception;
	public List<CartCourse> selectAllCoursesBySId(String sId) throws Exception;
}
