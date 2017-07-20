package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.CourseRegister;
import com.dgit.domain.RegistrationStatus;
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

	@Override
	public List<CourseRegister> selectRegisteredStudent(int cNo, int regMonth, int rsNo) throws Exception {
		CourseRegister courseRegister = new CourseRegister();
		if(cNo != 0){
			courseRegister.setcNo(cNo);
		}
		if(regMonth != 0){
			courseRegister.setRegMonth(regMonth);
		}
		if(rsNo != 0){
			RegistrationStatus registrationStatus = new RegistrationStatus();
			registrationStatus.setRsNo(rsNo);
			courseRegister.setRegistrationStatus(registrationStatus);
		}
		
		return dao.selectRegisteredStudent(courseRegister);
	}

}
