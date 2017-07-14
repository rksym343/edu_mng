package com.dgit.controller;

import java.text.SimpleDateFormat;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.Course;
import com.dgit.domain.StudentGrade;
import com.dgit.domain.Subject;
import com.dgit.domain.Teacher;
import com.dgit.domain.Timetable;
import com.dgit.service.CourseService;
import com.dgit.service.StudentGradeService;
import com.dgit.service.SubjectService;
import com.dgit.service.TimetableService;

@Controller
@RequestMapping("/course/*")
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private StudentGradeService studentGradeService;
	
	@Autowired
	private TimetableService timetableService;
	
	@Autowired
	private SubjectService subjectService;
	
	@Resource(name = "uploadPath") // bean의 id 이름
	String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);

	@RequestMapping(value="/insertCourse", method=RequestMethod.GET)
	public void getInsertCourse(Model model) throws Exception{
		model.addAttribute("studentGradeList", studentGradeService.selectAllStudentGrade()); // 전체학년
		model.addAttribute("subjectList", subjectService.selectAllSubject()); // 전체교과
	}
	
	@RequestMapping(value="/insertCourse", method=RequestMethod.POST)
	public String postInsertCourse(Course course, Teacher teacher, Subject subject, StudentGrade studentGrade, Integer[] ttDay, Integer[] ttStarttime_hh, Integer[] ttEndtime_hh, 
			Integer[] ttStarttime_MM, Integer[] ttEndtime_MM, String cStart, String cEnd, MultipartFile picture ) throws Exception{
		System.out.println("=======================insertCourse Post===============");
	
		course.setStudentGrade(studentGrade);
		course.setSubject(subject);
		course.setTeacher(teacher);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		
		course.setcStartdate(sdf.parse(cStart));
		course.setcEnddate(sdf.parse(cEnd));
		course.setcPicture(picture.getOriginalFilename());
		
		Timetable[] timeTables = new Timetable[ttDay.length];
		for(int i = 0; i < timeTables.length; i++){
			Timetable tt = new Timetable();
			tt.setCourse(course);
			tt.setTtDay(ttDay[i]);
			tt.setTtStarttime(Integer.parseInt(String.format("%02d%02d", ttStarttime_hh[i], ttStarttime_MM[i])));
			tt.setTtEndtime(Integer.parseInt(String.format("%02d%02d", ttEndtime_hh[i], ttEndtime_MM[i])));
			timeTables[i] = tt;
		}
		
		System.out.println("Controller에서 넘기기 전~~~~");
		for(Timetable ttt : timeTables){
			System.out.println(ttt.getTtDay() +" : " + ttt.getTtStarttime() +" : "+ttt.getTtEndtime());
		}
		System.out.println("Controller에서 넘기기 전~~~~");
		
		courseService.insertCourse(course, timeTables);
		
		
		return "redirect:listCourses";
	}
	
	
	@RequestMapping(value="/listCourses", method=RequestMethod.GET)
	public String getListCourses(Model model) throws Exception{
		logger.info("======================== listCourses ========================");
		model.addAttribute("listCourses", courseService.selectAllCourse());
		model.addAttribute("Courses", timetableService.selectAllTimetable());
		System.out.println("========================Courses size: "+timetableService.selectAllTimetable().size());
		return "course/listCourses";
	}
	
}
