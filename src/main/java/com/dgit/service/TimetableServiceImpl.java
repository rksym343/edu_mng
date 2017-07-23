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

}
