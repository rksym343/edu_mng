package com.dgit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.Course;

@Controller
@RequestMapping("/course/*")
public class CourseController {

	@RequestMapping(value="/insertCourse", method=RequestMethod.GET)
	public void getInsertCourse(){
	}
	
	@RequestMapping(value="/insertCourse", method=RequestMethod.POST)
	public void postInsertCourse(Course course, Integer[] ttStarttime_hh, Integer[] ttEndtime_hh, 
			Integer[] ttStarttime_MM, Integer[] ttEndtime_MM ){
	}
}
