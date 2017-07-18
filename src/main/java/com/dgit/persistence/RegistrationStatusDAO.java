package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.RegistrationStatus;

public interface RegistrationStatusDAO {
	public RegistrationStatus selectOneRegistrationStatus(int rsNo) throws Exception;
	public List<RegistrationStatus> selectAllRegistrationStatus() throws Exception;
}
