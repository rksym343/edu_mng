package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Course;
import com.dgit.domain.CourseDetail;
import com.dgit.domain.CourseImage;
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
		course.setcNo(cNo);
		System.out.println("-------------------------insertCourse lastCourseId " + cNo);
		
		if(course.getPictures() != null){// 보호처리
			for(CourseImage img : course.getPictures()){
				img.setcNo(cNo);
				dao.insertCourseImage(img);
			}
		}
		if(course.getContent() != null){
			CourseDetail courseDetail = course.getContent();
			courseDetail.setcNo(cNo);
			dao.insertCourseDetail(courseDetail);
		}
		for(Timetable ttt : timetables){
			ttt.setCourse(course);
			System.out.println(ttt.getTtDay() +" : " + ttt.getTtStarttime() +" : "+ttt.getTtEndtime());
			timetableDao.insertTimetable(ttt);
		}		
	}

	@Override
	public void updateCourse(Course course) throws Exception {
		dao.updateCourse(course);
		if(course.getContent() != null){
			dao.updateCourseDetail(course.getContent());
		}
		if(course.getPictures().size() != 0){
			dao.deleteCourseImageByCno(course.getcNo());
			for(CourseImage img : course.getPictures()){
				dao.insertCourseImage(img);
			}
		}
	}

	@Override
	public void deleteCourse(int cNo) throws Exception {
		dao.deleteCourse(cNo);
		//dao.deleteCourseDetail(cNo);
		//dao.deleteCourseImageByCno(cNo);
	}

	@Override
	public Course selectOneCourse(int cNo) throws Exception {
		Course course = dao.selectOneCourse(cNo);
		course.setContent(dao.selectOneCourseDetial(cNo));
		return course;
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
