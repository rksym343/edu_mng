package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Timetable;
import com.dgit.persistence.TimetableDAO;

@Service
public class TimetableServiceImpl implements TimetableService{
	
	@Autowired
	private TimetableDAO dao;
	
	

	@Override
	public void insertTimetable(Timetable timetable) throws Exception {
		dao.insertTimetable(timetable);
	}

	@Override
	public void deleteTimetable(Timetable timetable) throws Exception {
		dao.deleteTimetable(timetable);
	}
	
	
	@Override
	@Transactional
	public void updateTimetable(Timetable oldTimetable, Timetable newTimetable) throws Exception {
		dao.insertTimetable(newTimetable);
		dao.deleteTimetable(oldTimetable);
	}

	@Override
	public List<Timetable> selectTimetableByCri(Timetable timetable) throws Exception {
		return dao.selectTimetableByCri(timetable);
	}

	@Override
	public List<Timetable> selectAllTimetable() throws Exception {
		return dao.selectAllTimetable();
	}

	@Override
	public void deleteTimetableBbyCno(int cNo) throws Exception {
		dao.deleteTimetableBbyCno(cNo);
	}

	@Override
	public List<Timetable> selectTimetableByCno(int cNo) throws Exception {
		return dao.selectTimetableByCno(cNo);
	}

	@Override
	public int checkEq(int firstCNo, int lastCNo) throws Exception {
		int res = 99;
		
		int ttDay = dao.checkttDay(firstCNo, lastCNo);
		if(ttDay != 99 ){ // 일치하는 요일이 있다
			if(dao.checkttStartTimeEq(firstCNo, lastCNo, ttDay) != 99){ // 시작시간이 일치한다
				res = dao.checkttStartTimeEq(firstCNo, lastCNo, ttDay);
			}else if(dao.checkttStartTime(firstCNo, lastCNo, ttDay) != 99){ // 시작시간이  상대 수업시간 사이
				res = dao.checkttStartTime(firstCNo, lastCNo, ttDay);
			}else if(dao.checkttEndTime(firstCNo, lastCNo, ttDay) != 99){ // 끝 시간이 상대 수업시간 사이
				res = dao.checkttEndTime(firstCNo, lastCNo, ttDay);
			}			
				
		}
		
		return res;
	}

}
