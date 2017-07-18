package com.dgit.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.interceptor.LoginInterceptor;
import com.dgit.service.ParentsService;
import com.dgit.service.StudentService;
import com.dgit.service.TeacherService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private StudentService studentService;
	
	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private ParentsService parentsService;	

	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void getLogin(Model model) throws Exception{
		
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void postLogin(Model model, String memberType, String id, String password) throws Exception{
		Object member = null;
		if(memberType.equalsIgnoreCase("student")){
			member = studentService.login(id, password);
		}else if(memberType.equalsIgnoreCase("parents")){
			member = parentsService.login(id, password);
		}else if(memberType.equalsIgnoreCase("teacher")){
			member = teacherService.login(id, password);
		}
		model.addAttribute("memberType", memberType);
		model.addAttribute("member", member);		
	}
	
	@RequestMapping(value="/loginSample", method=RequestMethod.GET)
	public void getLoginSample(Model model) throws Exception{
		
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public void getLogout(HttpSession session) throws Exception{
		session.removeAttribute(LoginInterceptor.MEMBER_ID);
		session.removeAttribute(LoginInterceptor.MEMBER_TYPE);
		session.invalidate();
	}
	
}
