package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.Timetable;

public interface TimetableDAO {

	public void insertTimetable(Timetable timetable) throws Exception;
	public void deleteTimetable(Timetable timetable) throws Exception;
	public void deleteTimetableBbyCno(int cNo) throws Exception;
	
	public List<Timetable> selectTimetableByCri(Timetable timetable) throws Exception;
	public List<Timetable> selectAllTimetable() throws Exception;
	public List<Timetable> selectTimetableByCno(int cNo) throws Exception;
	
	
	public int checkttDay(int firstCNo, int lastCNo) throws Exception;
	public int checkttStartTimeEq(int firstCNo, int lastCNo, int ttDay) throws Exception;
	public int checkttStartTime(int firstCNo, int lastCNo, int ttDay) throws Exception;
	public int checkttEndTime(int firstCNo, int lastCNo, int ttDay) throws Exception;
	
	
	
	
}
