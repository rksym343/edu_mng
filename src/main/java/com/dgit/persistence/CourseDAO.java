package com.dgit.persistence;

import java.util.List;
import java.util.Map;

import com.dgit.domain.Course;
import com.dgit.domain.CourseDetail;
import com.dgit.domain.CourseImage;
import com.dgit.domain.SearchCriteria;

public interface CourseDAO {

	public void insertCourse(Course course) throws Exception;
	public void updateCourse(Course course) throws Exception;
	public void deleteCourse(int cNo) throws Exception;
	public Course selectOneCourse(int cNo) throws Exception;
	public List<Course> selectAllCourse(SearchCriteria searchCriteria) throws Exception;
	public List<Course> selectCoursesByCri(String sId, String tId, int registrationStatus, int regMonth) throws Exception;
	public List<Course> selectCoursesByCri(String sId, String tId, int registrationStatus, int regMonth, int ttDay) throws Exception;
	public int lastCourseId() throws Exception;
	public int countCourses(SearchCriteria searchCriteria) throws Exception;
	
	
	public void insertCourseDetail(CourseDetail courseDetail) throws Exception;
	public void updateCourseDetail(CourseDetail courseDetail) throws Exception;
	public void deleteCourseDetail(int cNo) throws Exception;
	public CourseDetail selectOneCourseDetial(int cNo) throws Exception;
	
	
	public void insertCourseImage(CourseImage courseImage) throws Exception;
	public void deleteCourseImage(String cPicture) throws Exception;	
	public void deleteCourseImageByCno(int cNo) throws Exception;
	public CourseImage selectOneCourseImage(String cPicture) throws Exception;
	public List<CourseImage> selectListCourseImage(int cNo) throws Exception;
	
	
}
