package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.ExamItem;

public interface ExamItemDAO {

	public List<ExamItem> selectAllExamItem() throws Exception;
	public ExamItem selectOneExamItem(int eiNo) throws Exception;
	
	
}
