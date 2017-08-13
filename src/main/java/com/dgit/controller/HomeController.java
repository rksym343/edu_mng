package com.dgit.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.Course;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.CourseService;


@Controller
public class HomeController {
	

	@Autowired
	private CourseService courseService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		
		
		List<Course> list = null;		
		try {
			SearchCriteria cri = new SearchCriteria();
			cri.setSearchType("");
			cri.setKeyword("");
			cri.setPage(1);
			cri.setPerPageNum(6);
			
			list = courseService.selectAllCourse(cri);
			model.addAttribute("listCourses", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "home";
	}
	
}
