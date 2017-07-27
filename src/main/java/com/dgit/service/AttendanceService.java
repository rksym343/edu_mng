package com.dgit.service;

import java.util.List;
import java.util.Map;

import com.dgit.domain.Attendance;
import com.dgit.domain.AttendanceSearchCriteria;

public interface AttendanceService {

	public void insertAttendance(Attendance attendance) throws Exception;
	public void insertAttendanceStudentIn(String sId) throws Exception;
	public void insertAttendanceStudentOut(String sId) throws Exception;
	public void insertAttendanceToday(String sId) throws Exception;
	public void updateAttendance(Attendance attendance) throws Exception; 
	public void updateAttendanceToday(Attendance attendance) throws Exception; 
	public void deleteAttendance(Attendance attendance) throws Exception;
	public int selectCntByAttendanceType(String sId, String searchType, String month) throws Exception;
	public List<Attendance> selectAttendanceByCri(AttendanceSearchCriteria cri) throws Exception;
	public List<Attendance> selectAttendanceBySIdAndMonth(String month, String sId) throws Exception;
	public List<Attendance> selectAllAttendance() throws Exception;
	
}
