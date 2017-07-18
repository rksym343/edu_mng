package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.CourseRegister;
import com.dgit.persistence.CourseRegisterDAO;

@Service
public class CourseRegisterServiceImpl implements CourseRegisterService {

	@Autowired
	private CourseRegisterDAO dao;

	@Override
	public void insertCourseRegister(CourseRegister courseRegister) throws Exception {
		dao.insertCourseRegister(courseRegister);
	}

	@Override
	public void updateCourseRegister(CourseRegister courseRegister) throws Exception {
		dao.updateCourseRegister(courseRegister);
	}

	@Override
	public void cancelCourseRegister(String cancel, int regNo) throws Exception {
		dao.cancelCourseRegister(cancel, regNo);
	}

	@Override
	public List<CourseRegister> selectCourseRegisterByCri(CourseRegister courseRegister) throws Exception {
		return dao.selectCourseRegisterByCri(courseRegister);
	}

	@Override
	public List<CourseRegister> selectAllCourseRegister() throws Exception {
		return dao.selectAllCourseRegister();
	}

}
