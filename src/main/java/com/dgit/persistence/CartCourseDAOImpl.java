package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.CartCourse;

@Repository
public class CartCourseDAOImpl implements CartCourseDAO {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.dgit.mapper.CartCoursesMapper";

	@Override
	public int insertCartCourse(CartCourse cartCourse) throws Exception {
		return session.insert(namespace + ".insertCartCourse", cartCourse);
	}

	@Override
	public void deleteOneCartCourse(int ccNo) throws Exception {
		session.delete(namespace + ".deleteOneCartCourse", ccNo);
	}

	@Override
	public void deleteCartCoursesByDate() throws Exception {
		session.delete(namespace + ".deleteCartCoursesByDate");
	}

	@Override
	public List<CartCourse> selectAllCoursesBySId(String sId) throws Exception {
		List<CartCourse> list = session.selectList(namespace + ".selectAllCoursesBySId", sId);
		for(CartCourse item : list){
			System.out.println(item.toString());
		}
		return list;
	}

	@Override
	public void deleteOneCartCourseByCno(int cNo) throws Exception {
		session.delete(namespace + ".deleteOneCartCourseByCno", cNo);
		
	}

}
