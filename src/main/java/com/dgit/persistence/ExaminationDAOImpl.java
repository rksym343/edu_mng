package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Examination;

@Repository
public class ExaminationDAOImpl implements ExaminationDAO {
	
		@Autowired
		private SqlSession session;

		private static String namespace = "com.dgit.mapper.ExaminationMapper";

		@Override
		public void insertExamination(Examination examination) throws Exception {
			session.insert(namespace+".insertExamination", examination);
		}

		@Override
		public void updateExamination(Examination examination) throws Exception {
			session.update(namespace+".updateExamination", examination);
		}

		@Override
		public void deleteExamination(int eNo) throws Exception {
			session.delete(namespace+".deleteExamination", eNo);
		}

		@Override
		public Examination selectOneExamination(int eNo) throws Exception {
			return session.selectOne(namespace+".selectOneExamination", eNo);
		}

		@Override
		public List<Examination> selectAllExamination() throws Exception {
			return session.selectList(namespace+".selectAllExamination");
		}

		@Override
		public List<Examination> selectExaminationByCri(Examination examination) throws Exception {
			System.out.println("==================DAO==========================");
			System.out.println("=============== examination : "+examination);
			System.out.println("=============== examination.getCourse : "+examination.getCourse());
			System.out.println("==================DAO==========================");
			return session.selectList(namespace+".selectExaminationByCri", examination);
		}


	
}
