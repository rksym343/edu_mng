package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.ExamItem;

@Repository
public class ExamItemDAOImpl implements ExamItemDAO {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.dgit.mapper.ExamItemMapper";

	@Override
	public List<ExamItem> selectAllExamItem() throws Exception {
		return session.selectList(namespace + ".selectAllExamItem");
	}

	@Override
	public ExamItem selectOneExamItem(int eiNo) throws Exception {
		return session.selectOne(namespace + ".selectOneExamItem", eiNo);
	}

}
