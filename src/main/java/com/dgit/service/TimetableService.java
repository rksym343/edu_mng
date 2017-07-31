package com.dgit.service;

import java.util.List;

import com.dgit.domain.Timetable;

public interface TimetableService {

	public void insertTimetable(Timetable timetable) throws Exception;
	public void deleteTimetable(Timetable timetable) throws Exception;
	public void deleteTimetableBbyCno(int cNo) throws Exception;
	public void updateTimetable(Timetable oldTimetable, Timetable newTimetable)  throws Exception;
	public List<Timetable> selectTimetableByCri(Timetable timetable) throws Exception;
	public List<Timetable> selectAllTimetable() throws Exception;
	public List<Timetable> selectTimetableByCno(int cNo) throws Exception;
	
	public int checkEq(int firstCNo, int lastCNo) throws Exception;
}
