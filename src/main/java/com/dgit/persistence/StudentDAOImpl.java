package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Student;

@Repository
public class StudentDAOImpl implements StudentDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.dgit.mapper.StudentMapper";

	@Override
	public void insertStudent(Student Student) throws Exception {
		session.insert(namespace+".insertStudent", Student);
	}

	@Override
	public void updateStudent(Student Student) throws Exception {
		session.update(namespace+".updateStudent", Student);
	}

	@Override
	public void deleteStudent(String sId) throws Exception {
		session.update(namespace+".updateStudent", sId);
	}

	@Override
	public Student selectOneStudent(String sId) throws Exception {
		return session.selectOne(namespace+".selectOneStudent", sId);
	}

	@Override
	public List<Student> selectAllStudent() throws Exception {
		return session.selectList(namespace+".selectAllStudent");
	}

	@Override
	public List<Student> selectStudentsByCri(Student student) throws Exception {
		return session.selectList(namespace+".selectStudentsByCri", student);
	}

	@Override
	public Student login(String sId, String sPassword) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("sId", sId);
		map.put("sPassword", sPassword);
		return session.selectOne(namespace+".login", map);
	}

}
