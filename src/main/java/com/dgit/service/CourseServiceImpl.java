package com.dgit.service;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Course;
import com.dgit.domain.Timetable;
import com.dgit.persistence.CourseDAO;
import com.dgit.persistence.TimetableDAO;

@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	private CourseDAO dao;
	
	@Autowired
	private TimetableDAO timetableDao;
	
	@Override
	@Transactional
	public void insertCourse(Course course, Timetable[] timetables) throws Exception {
		dao.insertCourse(course);
		System.out.println("-------------------------insertCourse----------------------");
		int cNo = dao.lastCourseId();
		System.out.println("-------------------------insertCourse lastCourseId " + cNo);
		Course co = new Course();
		co.setcNo(cNo);
		for(Timetable ttt : timetables){
			ttt.setCourse(co);
			System.out.println(ttt.getTtDay() +" : " + ttt.getTtStarttime() +" : "+ttt.getTtEndtime());
			timetableDao.insertTimetable(ttt);
		}		
	}

	@Override
	public void updateCourse(Course course) throws Exception {
		dao.updateCourse(course);
	}

	@Override
	public void deleteCourse(int cNo) throws Exception {
		dao.deleteCourse(cNo);
	}

	@Override
	public Course selectOneCourse(int cNo) throws Exception {
		return dao.selectOneCourse(cNo);
	}

	@Override
	public List<Course> selectAllCourse() throws Exception {
		return dao.selectAllCourse();
	}

	@Override
	public List<Course> selectCoursesByCri(String sId, String tId, int registrationStatus, int regMonth)
			throws Exception {
		List<Course> list = dao.selectCoursesByCri(sId, tId, registrationStatus, regMonth);
		return list;
	}

}
