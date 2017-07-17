package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Course;
import com.dgit.domain.Teacher;

@Repository
public class TeacherDAOImpl implements TeacherDAO {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.dgit.mapper.TeacherMapper";

	@Override
	public void insertTeacher(Teacher teacher) throws Exception {
		session.insert(namespace + ".insertTeacher", teacher);
	}

	@Override
	public void updateTeacher(Teacher teacher) throws Exception {
		session.update(namespace + ".updateTeacher", teacher);
	}

	@Override
	public void deleteTeacher(String tId) throws Exception {
		session.delete(namespace + ".deleteTeacher", tId);
	}

	@Override
	public Teacher selectOneTeacher(String tId) throws Exception {
		return session.selectOne(namespace + ".selectOneTeacher", tId);
	}

	@Override
	public List<Teacher> selectAllTeacher() throws Exception {
		return session.selectList(namespace + ".selectAllTeacher");
	}

	@Override
	public Teacher login(String tId, String tPassword) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("tId", tId);
		map.put("tPassword", tPassword);
		return session.selectOne(namespace + ".login", map);
	}

}
