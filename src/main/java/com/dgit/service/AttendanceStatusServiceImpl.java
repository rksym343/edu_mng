package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.AttendanceStatus;
import com.dgit.persistence.AttendanceStatusDAO;

@Service
public class AttendanceStatusServiceImpl implements AttendanceStatusService {

	@Autowired
	private AttendanceStatusDAO dao;

	@Override
	public void insertAttendanceStatus(AttendanceStatus attendanceStatus) throws Exception {
		dao.insertAttendanceStatus(attendanceStatus);
	}

	@Override
	public AttendanceStatus selectOneAttendanceStatus(int asNo) throws Exception {
		return dao.selectOneAttendanceStatus(asNo);
	}

	@Override
	public List<AttendanceStatus> selectAllAttendanceStatus() throws Exception {
		return dao.selectAllAttendanceStatus();
	}

}
