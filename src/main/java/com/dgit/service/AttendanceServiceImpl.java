package com.dgit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Attendance;
import com.dgit.domain.AttendanceSearchCriteria;
import com.dgit.domain.AttendanceStatus;
import com.dgit.domain.Student;
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
	public int selectCntByAttendanceType(String sId, String searchType, String month) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("sId", sId);
		if(!month.trim().equals("")){
			map.put("month", month);
		}
		return dao.selectCntByAttendanceType(map);
	}

	@Override
	@Transactional
	public String insertAttendanceStudentInAndOut(String sId) throws Exception {
		/*Calendar cal = Calendar.getInstance();
		String month = String.format("%04d%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1);
		int regRes = dao.selectStudentRegisteredCourse(sId, month);
		if(regRes == 0){
			// 이번달 등록되지 않은 학생
			dao.in
		}else{}*/
			// 이번달 등록학생
			int inRes = dao.selectAttendanceBySIdAndToday(sId, "in");
			int outRes = dao.selectAttendanceBySIdAndToday(sId, "out");
			System.out.println("=======inRes===== : " + inRes);
			if(inRes == 0){
				// 등원기록이 없음
				int asNoByIN = dao.selectAttendType(sId, "in");
				Attendance attendance = new Attendance();
				Student student = new Student();
				student.setsId(sId);
				attendance.setStudent(student);
				AttendanceStatus attendanceStatus = new AttendanceStatus();
				attendanceStatus.setAsNo(asNoByIN);
				attendance.setAttendanceStatus(attendanceStatus);
				dao.insertAttendance(attendance);
				if(asNoByIN == 2){
					return sId + ": IN";
				}else{
					return sId + ": IN / late";
				}
				
			}else if(inRes == 1 && outRes ==0) {
			
				// 등원기록이 있다 ==> 하원
				int asNoByOut = dao.selectAttendType(sId, "out");
				Attendance attendance = new Attendance();
				Student student = new Student();
				student.setsId(sId);
				attendance.setStudent(student);
				AttendanceStatus attendanceStatus = new AttendanceStatus();
				attendanceStatus.setAsNo(asNoByOut);
				attendance.setAttendanceStatus(attendanceStatus);
				dao.insertAttendance(attendance);
				if(asNoByOut == 5){
					return sId + ": OUT";
				}else{
					return sId + ": OUT / early";
				}
			}else{
				return sId + ": Duplicate records not allowed"; 
			}
		
	}

	

}
