package com.dgit.service;

import java.util.List;

import com.dgit.domain.Subject;

public interface SubjectService {
	
	public void insertSubject(Subject subject) throws Exception;
	public void updateSubject(Subject subject) throws Exception;
	public void deleteSubject(int sbNo) throws Exception;
	public Subject selectOneSubject(int sbNo) throws Exception;
	public List<Subject> selectAllSubject() throws Exception;
}

