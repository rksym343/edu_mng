package com.dgit.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Examination;

public interface ExaminationService {
	public void insertExamination(Examination examination) throws Exception;
	public void updateExamination(Examination examination) throws Exception;
	public void deleteExamination(int eNo) throws Exception;
	public Examination selectOneExamination(int eNo) throws Exception;
	public List<Examination> selectAllExamination() throws Exception;
	public List<Examination> selectExaminationByCri(Examination examination) throws Exception;
	
	

}
