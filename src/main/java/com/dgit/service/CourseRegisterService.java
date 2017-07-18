package com.dgit.service;

import java.util.List;

import com.dgit.domain.CourseRegister;

public interface CourseRegisterService {
	
	public void insertCourseRegister(CourseRegister courseRegister) throws Exception;
	public void updateCourseRegister(CourseRegister courseRegister) throws Exception;
	public void cancelCourseRegister(String cancel, int regNo) throws Exception;
	public List<CourseRegister> selectCourseRegisterByCri(CourseRegister courseRegister) throws Exception;
	public List<CourseRegister> selectAllCourseRegister() throws Exception;
	
}
