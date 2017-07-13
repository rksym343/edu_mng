package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.Timetable;

public interface TimetableDAO {

	public void insertTimetable(Timetable timetable) throws Exception;
	public void deleteTimetable(Timetable timetable) throws Exception;
	public List<Timetable> selectTimetableByCri(Timetable timetable) throws Exception;
	public List<Timetable> selectAllTimetable() throws Exception;
	
}
