package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.Course;

public interface CourseDAO {

	public void insertCourse(Course course) throws Exception;
	public void updateCourse(Course course) throws Exception;
	public void deleteCourse(int cNo) throws Exception;
	public Course selectOneCourse(int cNo) throws Exception;
	public List<Course> selectAllCourse() throws Exception;

	public int lastCourseId() throws Exception;
	
}
