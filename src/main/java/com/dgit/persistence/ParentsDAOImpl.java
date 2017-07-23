package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Parents;

@Repository
public class ParentsDAOImpl implements ParentsDAO {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.dgit.mapper.ParentsMapper";

	@Override
	public void insertParents(Parents parents) throws Exception {
		session.insert(namespace + ".insertParents", parents);
	}

	@Override
	public void updateParents(Parents parents) throws Exception {
		session.update(namespace + ".updateParents", parents);
	}

	@Override
	public void deleteParents(String spId) throws Exception {
		session.delete(namespace + ".deleteParents", spId);
	}

	@Override
	public Parents selectOneParents(String spId) throws Exception {
		return session.selectOne(namespace + ".selectOneParent", spId);
	}

	
	@Override
	public List<Parents> selectAllParents() throws Exception {
		return session.selectList(namespace + ".selectAllParents");
	}

	@Override
	public List<Parents> selectParentsBysId(String sId) throws Exception {
		return session.selectList(namespace + ".selectParentsBysId", sId);
	}

	@Override
	public Parents login(String spId, String spPassword) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("spId", spId);
		map.put("spPassword", spPassword);
		return session.selectOne(namespace + ".login", map);
	}

}
