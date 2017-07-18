package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Course;
import com.dgit.domain.StudentGrade;
import com.dgit.domain.Timetable;
import com.dgit.persistence.CourseDAO;
import com.dgit.persistence.StudentGradeDAO;
import com.dgit.persistence.TimetableDAO;

@Service
public class StudentGradeServiceImpl implements StudentGradeService{

	@Autowired
	private StudentGradeDAO dao;

	@Override
	public void insertStudentGrade(StudentGrade studentGrade) throws Exception {
		dao.insertStudentGrade(studentGrade);
	}

	@Override
	public void updateStudentGrade(StudentGrade studentGrade) throws Exception {
		dao.updateStudentGrade(studentGrade);
	}

	@Override
	public StudentGrade selectOneStudentGrade(int gdNo) throws Exception {
		return dao.selectOneStudentGrade(gdNo);
	}

	@Override
	public List<StudentGrade> selectAllStudentGrade() throws Exception {
		return dao.selectAllStudentGrade();
	}
	
	

}
