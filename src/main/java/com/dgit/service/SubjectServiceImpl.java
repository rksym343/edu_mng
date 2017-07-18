package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Course;
import com.dgit.domain.StudentGrade;
import com.dgit.domain.Subject;
import com.dgit.domain.Timetable;
import com.dgit.persistence.CourseDAO;
import com.dgit.persistence.StudentGradeDAO;
import com.dgit.persistence.SubjectDAO;
import com.dgit.persistence.TimetableDAO;

@Service
public class SubjectServiceImpl implements SubjectService{

	@Autowired
	private SubjectDAO dao;

	@Override
	public void insertSubject(Subject subject) throws Exception {
		dao.insertSubject(subject);
	}

	@Override
	public void updateSubject(Subject subject) throws Exception {
		dao.updateSubject(subject);
	}

	@Override
	public void deleteSubject(int sbNo) throws Exception {
		dao.deleteSubject(sbNo);
	}

	@Override
	public Subject selectOneSubject(int sbNo) throws Exception {
		return dao.selectOneSubject(sbNo);
	}

	@Override
	public List<Subject> selectAllSubject() throws Exception {
		return dao.selectAllSubject();
	}

	

}
