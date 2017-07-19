package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Course;
import com.dgit.domain.Examination;
import com.dgit.domain.Timetable;
import com.dgit.persistence.CourseDAO;
import com.dgit.persistence.ExaminationDAO;
import com.dgit.persistence.TimetableDAO;

@Service
public class ExaminationServiceImpl implements ExaminationService {

	@Autowired
	private ExaminationDAO dao;

	@Override
	public void insertExamination(Examination examination) throws Exception {
		dao.insertExamination(examination);
	}

	@Override
	public void updateExamination(Examination examination) throws Exception {
		dao.updateExamination(examination);
	}

	@Override
	public void deleteExamination(int eNo) throws Exception {
		dao.deleteExamination(eNo);
	}

	@Override
	public Examination selectOneExamination(int eNo) throws Exception {
		return dao.selectOneExamination(eNo);
	}

	@Override
	public List<Examination> selectAllExamination() throws Exception {
		return dao.selectAllExamination();
	}

	@Override
	public List<Examination> selectExaminationByCri(Examination examination) throws Exception {
		return dao.selectExaminationByCri(examination);
	}

}
