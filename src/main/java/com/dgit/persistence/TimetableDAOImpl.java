package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Timetable;

@Repository
public class TimetableDAOImpl implements TimetableDAO {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.dgit.mapper.TimetableMapper";

	@Override
	public void insertTimetable(Timetable timetable) throws Exception {
		session.insert(namespace + ".insertTimetable", timetable);
	}

	@Override
	public void deleteTimetable(Timetable timetable) throws Exception {
		session.delete(namespace + ".deleteTimetable", timetable);
	}

	@Override
	public List<Timetable> selectTimetableByCri(Timetable timetable) throws Exception {
		return session.selectList(namespace + ".selectTimetableByCri", timetable);
	}

	@Override
	public List<Timetable> selectAllTimetable() throws Exception {
		return session.selectList(namespace + ".selectAllTimetable");
	}

	@Override
	public void deleteTimetableBbyCno(int cNo) throws Exception {
		session.delete(namespace + ".deleteTimetableBbyCno", cNo);
	}

	@Override
	public List<Timetable> selectTimetableByCno(int cNo) throws Exception {
		return session.selectList(namespace + ".selectTimetableByCno", cNo);
	}

	@Override
	public int checkttDay(int firstCNo, int lastCNo) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("firstCNo", firstCNo);
		map.put("lastCNo", lastCNo);
		return session.selectOne(namespace + ".checkttDay", map);
	}

	@Override
	public int checkttStartTimeEq(int firstCNo, int lastCNo, int ttDay) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("firstCNo", firstCNo);
		map.put("lastCNo", lastCNo);
		map.put("ttDay", ttDay);
		return session.selectOne(namespace + ".checkttStartTimeEq", map);
	}

	@Override
	public int checkttStartTime(int firstCNo, int lastCNo, int ttDay) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("firstCNo", firstCNo);
		map.put("lastCNo", lastCNo);
		map.put("ttDay", ttDay);
		return session.selectOne(namespace + ".checkttStartTime", map);
	}

	@Override
	public int checkttEndTime(int firstCNo, int lastCNo, int ttDay) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("firstCNo", firstCNo);
		map.put("lastCNo", lastCNo);
		map.put("ttDay", ttDay);
		return session.selectOne(namespace + ".checkttEndTime", map);
	}

}
