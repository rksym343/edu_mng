package com.dgit.controller;

import java.util.Calendar;
import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.Attendance;
import com.dgit.domain.AttendanceStatus;
import com.dgit.domain.Course;
import com.dgit.domain.CourseRegister;
import com.dgit.domain.RegistrationStatus;
import com.dgit.domain.Student;
import com.dgit.service.AttendanceService;
import com.dgit.service.AttendanceStatusService;
import com.dgit.service.CourseRegisterService;
import com.dgit.service.CourseService;

@FixMethodOrder
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class TimetableTest {

	@Autowired
	private CourseRegisterService service;
	
	@Autowired
	private CourseService courseService;
	
	/*@Test
	public void AtestSessionss() throws Exception {
		String sId = "sss01";
		CourseRegister courseRegister = new CourseRegister();
		Student student = new Student();
		student.setsId(sId);
		RegistrationStatus registrationStatus = new RegistrationStatus();
		registrationStatus.setRsNo(1); // 결제됨
		Calendar cal = Calendar.getInstance();
		int regMonth = Integer.parseInt(String.format("%04d%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1));
		
		courseRegister.setStudent(student);
		courseRegister.setRegistrationStatus(registrationStatus);
		courseRegister.setRegMonth(regMonth);
		List<CourseRegister> list = service.selectCourseRegisterByCri(courseRegister);
		System.out.println("=========================== CourseRegister List ======================== ["+list.size()+"]");
		for(CourseRegister cc : list){
			System.out.println(cc.toString());
		}
	}*/
	
	@Test
	public void AtestSessionss() throws Exception {
		String sId = "sss01";
		
		int registrationStatus = 1; // 결제됨
		Calendar cal = Calendar.getInstance();
		int regMonth = Integer.parseInt(String.format("%04d%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1));
		
		List<Course> list = courseService.selectMyRegistedCourses(sId, registrationStatus, regMonth);
		System.out.println("=========================== CourseRegister List ======================== ["+list.size()+"]");
		for(Course cc : list){
			System.out.println(cc.toString());
		}
	}
	
	
	
}
