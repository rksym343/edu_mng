package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.CartCourse;
import com.dgit.persistence.CartCourseDAO;

@Service
public class CartCourseServiceImpl implements CartCourseService {

	@Autowired
	private CartCourseDAO dao;

	@Override
	public int insertCartCourse(CartCourse cartCourse) throws Exception {
		int res = dao.insertCartCourse(cartCourse);
		System.out.println("=============dao result : " +res);
		return res;
	}
	
	@Override
	public boolean insertCartCourse(CartCourse[] cartCourses) throws Exception {
		for(CartCourse cc : cartCourses){
			int res = dao.insertCartCourse(cc);
			if( res != 1){
				return false;
			}
		}
		
		return true;
	}

	@Override
	public void deleteOneCartCourse(int ccNo) throws Exception {
		dao.deleteOneCartCourse(ccNo);
	}

	@Override
	public void deleteCartCoursesByDate() throws Exception {
		dao.deleteCartCoursesByDate();
	}

	@Override
	public List<CartCourse> selectAllCoursesBySId(String sId) throws Exception {
		return dao.selectAllCoursesBySId(sId);
	}

	

}
