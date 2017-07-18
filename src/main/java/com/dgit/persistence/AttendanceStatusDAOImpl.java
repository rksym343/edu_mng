package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.AttendanceStatus;

@Repository
public class AttendanceStatusDAOImpl implements AttendanceStatusDAO {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.dgit.mapper.AttendanceStatusMapper";

	@Override
	public void insertAttendanceStatus(AttendanceStatus attendanceStatus) throws Exception {
		session.insert(namespace + ".insertAttendanceStatus", attendanceStatus);
	}

	@Override
	public AttendanceStatus selectOneAttendanceStatus(int asNo) throws Exception {
		return session.selectOne(namespace + ".selectOneAttendanceStatus", asNo);
	}

	@Override
	public List<AttendanceStatus> selectAllAttendanceStatus() throws Exception {
		return session.selectList(namespace + ".selectAllAttendanceStatus");
	}

}
