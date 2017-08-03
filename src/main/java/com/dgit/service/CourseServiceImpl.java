package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Course;
import com.dgit.domain.CourseDetail;
import com.dgit.domain.CourseImage;
import com.dgit.domain.SearchCriteria;
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
	public void insertCourse(Course course) throws Exception {
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
		for(Timetable ttt : course.getTimetables()){
			ttt.setCourse(course);
			System.out.println(ttt.getTtDay() +" : " + ttt.getTtStarttime() +" : "+ttt.getTtEndtime());
			timetableDao.insertTimetable(ttt);
		}		
	}

	@Override
	@Transactional
	public void updateCourse(Course course, String[] delPics) throws Exception {
		int cNo = course.getcNo();
		dao.updateCourse(course);
		

		timetableDao.deleteTimetableBbyCno(course.getcNo());
		for(Timetable ttt : course.getTimetables()){
			ttt.setCourse(course);
			System.out.println(ttt.getTtDay() +" : " + ttt.getTtStarttime() +" : "+ttt.getTtEndtime());
			timetableDao.insertTimetable(ttt);
		}
		
		if(course.getContent() != null){
			dao.updateCourseDetail(course.getContent());
		}
		System.out.println("==========Course pictuers====="+ course.getPictures());
		if(course.getPictures() != null && course.getPictures().size() != 0){
			for(CourseImage img : course.getPictures()){
				img.setcNo(cNo);
				dao.insertCourseImage(img);
			}
		}
		
		System.out.println("==========delPics====="+ course.getPictures());
		if(delPics != null && delPics.length > 0){
			for(String imgAddr : delPics){
				if(!imgAddr.equals("")){
					dao.deleteCourseImage(imgAddr);
				}
			}
		}
	}

	@Override
	@Transactional
	public void deleteCourse(int cNo) throws Exception {
		dao.deleteCourse(cNo);
		dao.deleteCourseDetail(cNo);
		dao.deleteCourseImageByCno(cNo);
		timetableDao.deleteTimetableBbyCno(cNo);
	}

	@Override
	public Course selectOneCourse(int cNo) throws Exception {
		Course course = dao.selectOneCourse(cNo);
		course.setContent(dao.selectOneCourseDetial(cNo));
		return course;
	}

	@Override
	public List<Course> selectAllCourse(SearchCriteria searchCriteria) throws Exception {
		return dao.selectAllCourse(searchCriteria);
	}

	@Override
	public List<Course> selectCoursesByCri(String sId, String tId, int registrationStatus, int regMonth)
			throws Exception {
		List<Course> list = dao.selectCoursesByCri(sId, tId, registrationStatus, regMonth);
		return list;
	}
	
	@Override
	public List<Course> selectCoursesByCri(String sId, String tId, int registrationStatus, int regMonth, int ttDay)
			throws Exception {
		List<Course> list = dao.selectCoursesByCri(sId, tId, registrationStatus, regMonth, ttDay);
		return list;
	}
	
	

	@Override
	public int countCourses(SearchCriteria searchCriteria) throws Exception {
		return dao.countCourses(searchCriteria);
	}

}
