package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.Attendance;
import com.dgit.domain.AttendanceSearchCriteria;
import com.dgit.persistence.AttendanceDAO;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private AttendanceDAO dao;


	@Override
	public void insertAttendanceToday(String sId) throws Exception {
		dao.insertAttendanceToday(sId);
	}

	@Override
	public void updateAttendance(Attendance attendance) throws Exception {
		dao.updateAttendance(attendance);
	}

	@Override
	public void deleteAttendance(Attendance attendance) throws Exception {
		dao.deleteAttendance(attendance);
	}

	@Override
	public List<Attendance> selectAttendanceByCri(AttendanceSearchCriteria cri) throws Exception {
		return dao.selectAttendanceByCri(cri);
	}

	@Override
	public List<Attendance> selectAllAttendance() throws Exception {
		return dao.selectAllAttendance();
	}

	@Override
	public void insertAttendance(Attendance attendance) throws Exception {
		dao.insertAttendance(attendance);
	}

	@Override
	public void updateAttendanceToday(Attendance attendance) throws Exception {
		dao.updateAttendanceToday(attendance);
	}

	@Override
	public List<Attendance> selectAttendanceBySIdAndMonth(String month, String sId) throws Exception {
		List<Attendance> list = dao.selectAttendanceBySIdAndMonth(month, sId);
		System.out.println("=======================at list===========");
		for (Attendance at : list){
			System.out.println(at.toString());
		}
		return list;
		
	}

}
