package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.Teacher;
import com.dgit.persistence.TeacherDAO;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherDAO dao;

	@Override
	public void insertTeacher(Teacher teacher) throws Exception {
		dao.insertTeacher(teacher);
	}

	@Override
	public void updateTeacher(Teacher teacher) throws Exception {
		dao.updateTeacher(teacher);
	}

	@Override
	public void deleteTeacher(String tId) throws Exception {
		dao.deleteTeacher(tId);
	}

	@Override
	public Teacher selectOneTeacher(String tId) throws Exception {
		return dao.selectOneTeacher(tId);
	}

	@Override
	public Teacher login(String tId, String tPassword) throws Exception {
		return dao.login(tId, tPassword);
	}

	@Override
	public List<Teacher> selectAllTeacher() throws Exception {
		return dao.selectAllTeacher();
	}

}
