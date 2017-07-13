package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Timetable;

@Repository
public class TimetableDAOImpl implements TimetableDAO{
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.dgit.mapper.TimetableMapper";

	@Override
	public void insertTimetable(Timetable timetable) throws Exception {
		session.insert(namespace+".insertTimetable", timetable);
	}

	@Override
	public void deleteTimetable(Timetable timetable) throws Exception {
		session.delete(namespace+".deleteTimetable", timetable);
	}

	@Override
	public List<Timetable> selectTimetableByCri(Timetable timetable) throws Exception {
		return session.selectList(namespace+".selectTimetableByCri", timetable);
	}

	@Override
	public List<Timetable> selectAllTimetable() throws Exception {
		return session.selectList(namespace+".selectAllTimetable");
	}

	
}
