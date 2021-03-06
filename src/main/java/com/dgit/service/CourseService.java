package com.dgit.service;

import java.util.List;

import com.dgit.domain.Course;
import com.dgit.domain.Timetable;

public interface CourseService {

	
	public void insertCourse(Course course, Timetable[] timetables) throws Exception;
	public void updateCourse(Course course) throws Exception;
	public void deleteCourse(int cNo) throws Exception;
	public Course selectOneCourse(int cNo) throws Exception;
	public List<Course> selectAllCourse() throws Exception;
}
