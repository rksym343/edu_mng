package com.dgit.persistence;

import java.util.List;
import java.util.Map;

import com.dgit.domain.Examination;

public interface ExaminationDAO {
	
	
	public void insertExamination(Examination examination) throws Exception;
	public void updateExamination(Examination examination) throws Exception;
	public void deleteExamination(int eNo) throws Exception;
	public Examination selectOneExamination(int eNo) throws Exception;
	public List<Examination> selectAllExamination() throws Exception;
	public List<Examination> selectExaminationByCri(Examination examination) throws Exception;
	public List<Examination> selectExaminationByCriForTeacher(String sId, String regMonth, String eDate, int eiNo, int eNo, int cNo, int sbNo) throws Exception;
	

}
