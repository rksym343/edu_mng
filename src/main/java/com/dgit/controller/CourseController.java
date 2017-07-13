package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.Course;

@Controller
@RequestMapping("/course/*")
public class CourseController {
	
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);

	@RequestMapping(value="/insertCourse", method=RequestMethod.GET)
	public void getInsertCourse(){
	}
	
	@RequestMapping(value="/insertCourse", method=RequestMethod.POST)
	public String postInsertCourse(Course course, Integer[] ttStarttime_hh, Integer[] ttEndtime_hh, 
			Integer[] ttStarttime_MM, Integer[] ttEndtime_MM ){
		
		return "course/readCourse";
	}
	
	
	@RequestMapping(value="/listCourses", method=RequestMethod.GET)
	public String getListCourses(Model model){
		logger.info("======================== listCourses ========================");
		model.addAttribute("listCourses", "list");
		return "course/listCourses";
	}
	
}
