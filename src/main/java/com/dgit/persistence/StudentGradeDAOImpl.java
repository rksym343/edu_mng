package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.StudentGrade;

@Repository
public class StudentGradeDAOImpl implements StudentGradeDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.dgit.mapper.StudentGradeMapper";

	@Override
	public void insertStudentGrade(StudentGrade studentGrade) throws Exception {
		session.insert(namespace+".insertStudentGrade", studentGrade);	
	}

	@Override
	public void updateStudentGrade(StudentGrade studentGrade) throws Exception {
		session.update(namespace+".updateStudentGrade", studentGrade);	
	}

	@Override
	public StudentGrade selectOneStudentGrade(int gdNo) throws Exception {
		return session.selectOne(namespace+".selectOneStudentGrade", gdNo);
	}

	@Override
	public List<StudentGrade> selectAllStudentGrade() throws Exception {
		return session.selectList(namespace+".selectAllStudentGrade");
	}

}
