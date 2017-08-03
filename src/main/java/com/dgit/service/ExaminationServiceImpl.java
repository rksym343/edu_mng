package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Course;
import com.dgit.domain.ExamItem;
import com.dgit.domain.Examination;
import com.dgit.domain.Timetable;
import com.dgit.persistence.CourseDAO;
import com.dgit.persistence.ExamItemDAO;
import com.dgit.persistence.ExaminationDAO;
import com.dgit.persistence.TimetableDAO;

@Service
public class ExaminationServiceImpl implements ExaminationService {

	@Autowired
	private ExaminationDAO dao;
	
	@Autowired
	private ExamItemDAO examItemDAO;

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

	@Override
	public List<ExamItem> selectAllExamItem() throws Exception {
		return examItemDAO.selectAllExamItem();
	}

	@Override
	public ExamItem selectOneExamItem(int eiNo) throws Exception {
		return examItemDAO.selectOneExamItem(eiNo);
	}

	@Transactional
	@Override
	public void insertExaminations(List<Examination> examinations) throws Exception {
		for(Examination exam : examinations){
			dao.insertExamination(exam);
		}
	}

	@Override
	public List<Examination> selectExaminationByCriForTeacher(String sId, String regMonth, String eDate, int eiNo, int eNo, int cNo, int sbNo) throws Exception {
		return dao.selectExaminationByCriForTeacher(sId, regMonth, eDate, eiNo, eNo, cNo, sbNo);
	}

}
