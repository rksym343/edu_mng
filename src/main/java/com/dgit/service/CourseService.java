package com.dgit.service;

import java.util.List;
import java.util.Map;

import com.dgit.domain.Course;
import com.dgit.domain.CourseDetail;
import com.dgit.domain.SearchCriteria;
import com.dgit.domain.Timetable;

public interface CourseService {

	
	public void insertCourse(Course course) throws Exception;
	public void updateCourse(Course course, String[] delPics) throws Exception;
	public void deleteCourse(int cNo) throws Exception;
	public Course selectOneCourse(int cNo) throws Exception;
	public int countCourses(SearchCriteria searchCriteria) throws Exception;
	public List<Course> selectAllCourse(SearchCriteria searchCriteria) throws Exception;
	public List<Course> selectCoursesByCri(String sId, String tId, int registrationStatus, int regMonth) throws Exception;
	
}
