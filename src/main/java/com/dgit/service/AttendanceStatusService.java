package com.dgit.service;

import java.util.List;

import com.dgit.domain.AttendanceStatus;

public interface AttendanceStatusService {

	public void insertAttendanceStatus(AttendanceStatus attendanceStatus) throws Exception;
	public AttendanceStatus selectOneAttendanceStatus(int asNo) throws Exception;
	public List<AttendanceStatus> selectAllAttendanceStatus() throws Exception;
}
