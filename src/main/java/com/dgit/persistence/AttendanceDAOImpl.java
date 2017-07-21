package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Attendance;
import com.dgit.domain.AttendanceSearchCriteria;

@Repository
public class AttendanceDAOImpl implements AttendanceDAO {
	
	@Autowired
	private SqlSession session;

	private static String namespace = "com.dgit.mapper.AttendanceMapper";

	@Override
	public void insertAttendanceToday(String sId) throws Exception {
		session.insert(namespace+".insertAttendanceToday", sId);
	}

	@Override
	public void updateAttendance(Attendance attendance) throws Exception {
		session.update(namespace+".updateAttendance", attendance);
	}

	@Override
	public void deleteAttendance(Attendance attendance) throws Exception {
		session.update(namespace+".deleteAttendance", attendance);
	}

	@Override
	public List<Attendance> selectAttendanceByCri(AttendanceSearchCriteria cri) throws Exception {
		
		return session.selectList(namespace+".selectAttendanceByCri", cri);
	}

	@Override
	public List<Attendance> selectAllAttendance() throws Exception {
		return session.selectList(namespace+".selectAllAttendance");
	}

	@Override
	public void insertAttendance(Attendance attendance) throws Exception {
		session.insert(namespace+".insertAttendance", attendance);
	}

	@Override
	public void updateAttendanceToday(Attendance attendance) throws Exception {
		session.update(namespace+".updateAttendanceToday", attendance);
	}

	@Override
	public List<Attendance> selectAttendanceBySIdAndMonth(Map<String, Object> map) throws Exception {
		return session.selectList(namespace+".selectAttendanceBySIdAndMonth", map);
	}

	@Override
	public int selectCntByAttendanceType(Map<String, Object> map) throws Exception {
		return session.selectOne(namespace+".selectCntByAttendanceType", map);
	}

}
