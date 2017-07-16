package com.dgit.persistence;

import java.util.List;
import java.util.Map;

import com.dgit.domain.Attendance;

public interface AttendanceDAO {

	public void insertAttendanceToday(String sId) throws Exception;
	public void updateAttendance(Attendance attendance) throws Exception; 
	public void cancelAttendance(String sId) throws Exception;
	public List<Attendance> selectAttendanceByCri(Map<String, Object> param) throws Exception;
	public List<Attendance> selectAllAttendance() throws Exception;
}
