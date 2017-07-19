package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Course;

@Repository
public class CourseDAOImpl implements CourseDAO {

	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.dgit.mapper.CourseMapper";

	@Override
	public void insertCourse(Course course) throws Exception {
		session.insert(namespace+".insertCourse", course);
	}

	@Override
	public void updateCourse(Course course) throws Exception {
		session.update(namespace+".updateCourse", course);
	}

	@Override
	public void deleteCourse(int cNo) throws Exception {
		session.update(namespace+".deleteCourse", cNo);
	}

	@Override
	public Course selectOneCourse(int cNo) throws Exception {
		return session.selectOne(namespace+".selectOneCourse", cNo);
	}

	@Override
	public List<Course> selectAllCourse() throws Exception {
		return session.selectList(namespace+".selectAllCourse");
	}

	@Override
	public int lastCourseId() throws Exception {
		return session.selectOne(namespace+".lastCourseId");
	}

	@Override
	public List<Course> selectMyRegistedCourses(String sId, int registrationStatus, int regMonth)
			throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("sId", sId);
		map.put("registrationStatus", registrationStatus);
		map.put("regMonth", regMonth);
		return session.selectList(namespace+".selectMyRegistedCourses", map);
	}


}
