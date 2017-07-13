package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Subject;

@Repository
public class SubjectDAOImpl implements SubjectDAO{

	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.dgit.mapper.SubjectMapper";

	
	@Override
	public void insertSubject(Subject subject) throws Exception {
		session.insert(namespace+".insertSubject", subject);	
	}

	@Override
	public void updateSubject(Subject subject) throws Exception {
		session.update(namespace+".updateSubject", subject);
	}

	@Override
	public void deleteSubject(int sbNo) throws Exception {
		session.update(namespace+".deleteSubject", sbNo);
	}

	@Override
	public Subject selectOneSubject(int sbNo) throws Exception {
		return session.selectOne(namespace+".selectOneSubject", sbNo);
	}

	@Override
	public List<Subject> selectAllSubject() throws Exception {
		return session.selectList(namespace+".selectAllSubject");
	}

}
