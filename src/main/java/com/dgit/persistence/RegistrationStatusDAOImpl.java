package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.RegistrationStatus;

@Repository
public class RegistrationStatusDAOImpl implements RegistrationStatusDAO {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.dgit.mapper.RegistrationStatusMapper";

	@Override
	public RegistrationStatus selectOneRegistrationStatus(int rsNo) throws Exception {
		return session.selectOne(namespace + ".selectOneRegistrationStatus", rsNo);
	}

	@Override
	public List<RegistrationStatus> selectAllRegistrationStatus() throws Exception {
		return session.selectList(namespace + ".selectAllRegistrationStatus");
	}

}
