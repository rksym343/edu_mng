package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.TransferMethod;

public interface TransferMethodDAO {

	public void insertTransferMethod(TransferMethod transferMethod) throws Exception;
	public void updateTransferMethod(TransferMethod transferMethod) throws Exception;
	public TransferMethod selectOneTransferMethod(int tmNo) throws Exception;
	public List<TransferMethod> selectAllTransferMethod() throws Exception;
	
}
