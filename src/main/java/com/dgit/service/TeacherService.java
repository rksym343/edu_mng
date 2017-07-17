package com.dgit.service;

import java.util.List;

import com.dgit.domain.Teacher;

public interface TeacherService {
	public void insertTeacher(Teacher teacher) throws Exception;
	public void updateTeacher(Teacher teacher) throws Exception;
	public void deleteTeacher(String tId) throws Exception;
	public Teacher selectOneTeacher(String tId) throws Exception;
	public Teacher login(String tId, String tPassword) throws Exception;
	public List<Teacher> selectAllTeacher() throws Exception;
}
