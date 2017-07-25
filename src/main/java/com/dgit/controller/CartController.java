package com.dgit.controller;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.CartCourse;
import com.dgit.domain.CourseRegister;
import com.dgit.domain.RegistrationStatus;
import com.dgit.domain.Student;
import com.dgit.interceptor.LoginInterceptor;
import com.dgit.service.CartCourseService;
import com.dgit.service.CourseRegisterService;
import com.dgit.service.CourseService;
import com.dgit.service.ParentsService;
import com.dgit.service.StudentGradeService;
import com.dgit.service.SubjectService;
import com.dgit.service.TeacherService;
import com.dgit.service.TimetableService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private StudentGradeService studentGradeService;
	
	@Autowired
	private ParentsService parentsService;
	
	@Autowired
	private TimetableService timetableService;
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private CourseRegisterService courseRegisterService;
	
	@Autowired
	private CartCourseService cartCourseService;
	
	@Autowired
	private TeacherService teacherService;
	
	@Resource(name = "uploadPath") // bean의 id 이름
	String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	

	
	
	@RequestMapping(value="/insertCart/{memberType}/{memberId}/{cNo}", method=RequestMethod.PUT)
	public ResponseEntity<String> postRegisterCourses(
			@PathVariable("memberType") String memberType, @PathVariable("memberId") String memberId, @PathVariable("cNo") int cNo) throws Exception{
		 ResponseEntity<String> entity = null;
		logger.info("======================== /registerCourses/{memberType}/{memberId}/{cNo} ========================");
		// 장바구니에 담고
		logger.info("======================== 카트상품 ========================");
		try{
			CartCourse cart = new CartCourse();
			cart.setcNo(cNo);
			if(memberType.equals(LoginInterceptor.STUDENT)){
				cart.setsId(memberId);
			}else if(memberType.equals(LoginInterceptor.PARENTS)){
				String sId = parentsService.selectOneParents(memberId).getsId();
				cart.setsId(sId);
			}
			cartCourseService.insertCartCourse(cart);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	
	@RequestMapping(value="/cartCourses", method=RequestMethod.GET)
	public void getCartCourses(String memberType, String id, Model model) throws Exception{
		System.out.println("======================== cartCourses GET ========================");
		String sId = "";
		if(memberType.equals(LoginInterceptor.STUDENT)){
			sId=id;
		}else if(memberType.equals(LoginInterceptor.PARENTS)){
			sId = parentsService.selectOneParents(id).getsId();
		}
		List<CartCourse> list = cartCourseService.selectAllCoursesBySId(sId);
		for(CartCourse c : list){
			System.out.println(c);
		}
		model.addAttribute("list", list);		
	}
	
	@Transactional
	@RequestMapping(value="/cartCourses", method=RequestMethod.POST)
	public void postCartCourses(String memberType, String id, Integer[] cNo, Model model) throws Exception{
		System.out.println("======================== cartCourses POST ========================");
		// (#{regMonth}, #{student.sNo}, #{course.cNo}, #{registrationStatus.rsNo})
		RegistrationStatus rs = new RegistrationStatus();
		rs.setRsNo(1);
		Student student = new Student();
		String sId = "";
		if(memberType.equals(LoginInterceptor.STUDENT)){
			sId=id;
		}else if(memberType.equals(LoginInterceptor.PARENTS)){
			sId = parentsService.selectOneParents(id).getsId();
		}
		Calendar cal = Calendar.getInstance();
		String month = String.format("%04d%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1);
		int regMonth = Integer.parseInt(month);
		student.setsId(sId);
		for( int i = 0; i < cNo.length; i++){			
			CourseRegister courseRegister = new CourseRegister();
			courseRegister.setcNo(cNo[i]);
			courseRegister.setRegistrationStatus(rs);
			courseRegister.setStudent(student);
			courseRegister.setRegMonth(regMonth);
			courseRegisterService.insertCourseRegister(courseRegister);
		}
	}
	
	
	@RequestMapping(value="/cartCourses/{ccNo}", method=RequestMethod.DELETE)
	public ResponseEntity<String> postRegisterCourses(@PathVariable("ccNo") int ccNo) throws Exception{
		 ResponseEntity<String> entity = null;
		logger.info("======================== /cartCourses/{ccNo}/ ========================");
		try{
			cartCourseService.deleteOneCartCourse(ccNo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	
}