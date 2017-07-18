package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.TransferMethod;

@Repository
public class TransferMethodDAOImpl implements TransferMethodDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.dgit.mapper.TransferMethodMapper";

	@Override
	public void insertTransferMethod(TransferMethod transferMethod) throws Exception {
		session.insert(namespace+".insertTransferMethod", transferMethod);
	}

	@Override
	public void updateTransferMethod(TransferMethod transferMethod) throws Exception {
		session.update(namespace+".updateTransferMethod", transferMethod);
	}

	@Override
	public TransferMethod selectOneTransferMethod(int tmNo) throws Exception {
		return session.selectOne(namespace+".selectOneTransferMethod", tmNo);
	}

	@Override
	public List<TransferMethod> selectAllTransferMethod() throws Exception {
		return session.selectList(namespace+".selectAllTransferMethod");
	}

}
