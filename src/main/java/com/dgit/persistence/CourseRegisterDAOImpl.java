package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.CourseRegister;

@Repository
public class CourseRegisterDAOImpl implements CourseRegisterDAO {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.dgit.mapper.CourseRegisterMapper";

	@Override
	public void insertCourseRegister(CourseRegister courseRegister) throws Exception {
		session.insert(namespace + ".insertCourseRegister", courseRegister);
	}

	@Override
	public void updateCourseRegister(CourseRegister courseRegister) throws Exception {
		session.update(namespace + ".updateCourseRegister", courseRegister);
	}

	@Override
	public void cancelCourseRegister(String cancel, int regNo) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("regNo", regNo);
		map.put("cancel", cancel);
		session.update(namespace + ".cancelCourseRegister", map);
	}

	@Override
	public List<CourseRegister> selectCourseRegisterByCri(CourseRegister courseRegister) throws Exception {  
		return session.selectList(namespace+".selectCourseRegisterByCri", courseRegister);
	}

	@Override
	public List<CourseRegister> selectAllCourseRegister() throws Exception {
		return session.selectList(namespace+".selectAllCourseRegister");
	}

	@Override
	public List<CourseRegister> selectRegisteredStudent(CourseRegister courseRegister) throws Exception {
		return session.selectList(namespace+".selectRegisteredStudent", courseRegister);
	}

}
