package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.Parents;

public interface ParentsDAO {

	public void insertParents(Parents parents) throws Exception;
	public void updateParents(Parents parents) throws Exception;
	public void deleteParents(String spId) throws Exception;
	public Parents selectOneParents(String spId) throws Exception;
	public Parents login(String spId, String spPassword) throws Exception;
	public List<Parents> selectAllParents() throws Exception;
	public List<Parents> selectParentsBysId(String sId) throws Exception;
}
