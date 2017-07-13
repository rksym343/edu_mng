package com.dgit.persistence;

import java.util.List;

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

}
