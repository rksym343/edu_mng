package com.dgit.persistence;

import java.util.List;
import java.util.Map;

import com.dgit.domain.Attendance;
import com.dgit.domain.AttendanceSearchCriteria;

public interface AttendanceDAO {
	
	public void insertAttendance(Attendance attendance) throws Exception;
	public void insertAttendanceToday(String sId) throws Exception;
	public void insertAttendanceInAndOut(String sId, String searchType) throws Exception;
	public void updateAttendance(Attendance attendance) throws Exception; 
	public void updateAttendanceToday(Attendance attendance) throws Exception; 
	public void deleteAttendance(Attendance attendance) throws Exception;
	public int selectCntByAttendanceType(Map<String, Object> map) throws Exception;
	public int selectAttendanceBySIdAndToday(String sId, String searchType) throws Exception;
	public int selectStudentRegisteredCourse(String sId, String month) throws Exception;
	public int selectAttendType(String sId, String searchType) throws Exception;
	
	public List<Attendance> selectAttendanceByCri(AttendanceSearchCriteria cri) throws Exception;
	public List<Attendance> selectAttendanceBySIdAndMonth(Map<String, Object> map) throws Exception;
	public List<Attendance> selectAllAttendance() throws Exception;
}
