package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.Attendance;
import com.dgit.domain.AttendanceSearchCriteria;
import com.dgit.domain.Parents;
import com.dgit.persistence.AttendanceDAO;
import com.dgit.persistence.ParentsDAO;

@Service
public class ParentsServiceImpl implements ParentsService {

	@Autowired
	private ParentsDAO dao;

	@Override
	public void insertParents(Parents parents) throws Exception {
		dao.insertParents(parents);
	}

	@Override
	public void updateParents(Parents parents) throws Exception {
		dao.updateParents(parents);
	}

	@Override
	public void deleteParents(String spId) throws Exception {
		dao.deleteParents(spId);
	}

	@Override
	public Parents selectOneParents(String spId) throws Exception {
		return dao.selectOneParents(spId);
	}

	@Override
	public Parents login(String spId, String spPassword) throws Exception {
		return dao.login(spId, spPassword);
	}

	@Override
	public List<Parents> selectAllParents() throws Exception {
		return dao.selectAllParents();
	}

	@Override
	public List<Parents> selectParentsBysId(String sId) throws Exception {
		return dao.selectParentsBysId(sId);
	}

}
