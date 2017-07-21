package com.dgit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		Map<String, Object> map = new HashMap<>();
		map.put("month", month);
		map.put("sId", sId);
		List<Attendance> list = dao.selectAttendanceBySIdAndMonth(map);
		System.out.println("=======================at list===========");
		for (Attendance at : list){
			System.out.println(at.toString());
		}
		return list;
		
	}

	@Override
	public int selectCntByAttendanceType(String sId, String searchType) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("sId", sId);
		return dao.selectCntByAttendanceType(map);
	}

}
