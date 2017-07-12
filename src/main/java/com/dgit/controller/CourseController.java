package com.dgit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/course/*")
public class CourseController {

	@RequestMapping(value="/insertCourse", method=RequestMethod.GET)
	public void getInsertCourse(){
	}
	
	@RequestMapping(value="/insertCourse", method=RequestMethod.POST)
	public void postInsertCourse(){
	}
}
