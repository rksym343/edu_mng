package com.dgit.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.CartCourse;
import com.dgit.domain.Course;
import com.dgit.domain.CourseDetail;
import com.dgit.domain.CourseImage;
import com.dgit.domain.CourseRegister;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.domain.StudentGrade;
import com.dgit.domain.Subject;
import com.dgit.domain.Teacher;
import com.dgit.domain.Timetable;
import com.dgit.interceptor.LoginInterceptor;
import com.dgit.service.CartCourseService;
import com.dgit.service.CourseRegisterService;
import com.dgit.service.CourseService;
import com.dgit.service.ExaminationService;
import com.dgit.service.ParentsService;
import com.dgit.service.StudentGradeService;
import com.dgit.service.SubjectService;
import com.dgit.service.TeacherService;
import com.dgit.service.TimetableService;
import com.dgit.util.UploadFileUtils;

@Controller
@RequestMapping("/course/*")
public class CourseController {
	
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
	
	@Autowired
	private ExaminationService examinationService;
	
	@Resource(name = "uploadPath") // bean의 id 이름
	String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);
	
	
	
	@RequestMapping(value="/insertCourse", method=RequestMethod.GET)
	public void getInsertCourse(Model model) throws Exception{
		model.addAttribute("studentGradeList", studentGradeService.selectAllStudentGrade()); // 전체학년
		model.addAttribute("subjectList", subjectService.selectAllSubject()); // 전체교과
		model.addAttribute("TeacherList", teacherService.selectAllTeacher()); // 선생님이름
	}
	
	@RequestMapping(value="/insertCourse", method=RequestMethod.POST)
	public String postInsertCourse(Course course, Teacher teacher, Subject subject, StudentGrade studentGrade, 
			CourseDetail courseDetail, List<MultipartFile> pics,
			Integer[] ttDay, Integer[] ttStarttime, Integer[] ttEndtime) throws Exception{
		logger.info("=======================insertCourse Post===============");
	
		course.setStudentGrade(studentGrade);
		course.setSubject(subject);
		course.setTeacher(teacher);
		course.setContent(courseDetail);
		List<CourseImage> list = new ArrayList<>();
		if (pics.get(0).getSize()!=0) {
			for (MultipartFile file : pics) {
				logger.info("filename : " + file.getOriginalFilename());
				String thumb = UploadFileUtils.uplaodFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				CourseImage ci = new CourseImage();
				ci.setcPicture(thumb);
				list.add(ci);   
			} 
			course.setPictures(list);
		}
		
		
		
		List<Timetable> timeTables = new ArrayList<>();
		for(int i = 0; i < ttDay.length; i++){
			Timetable tt = new Timetable();
			tt.setCourse(course);
			tt.setTtDay(ttDay[i]);
			tt.setTtStarttime(ttStarttime[i]);
			tt.setTtEndtime(ttEndtime[i]);
			timeTables.add(tt);
		}
		course.setTimetables(timeTables);
	
		
		courseService.insertCourse(course);
		
		
		return "redirect:listCourses";
	}
	

	@RequestMapping(value="/listCourses", method=RequestMethod.GET)
	public String getListCourses(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("======================== listCourses ========================");
		logger.info(cri.toString());
		model.addAttribute("listCourses", courseService.selectAllCourse(cri));
		//model.addAttribute("Courses", timetableService.selectAllTimetable());
	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(courseService.countCourses(cri));
		System.out.println("============pageMaker==============");
		System.out.println(pageMaker);
		System.out.println("============pageMaker==============");
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("studentGradeList", studentGradeService.selectAllStudentGrade()); // 전체학년
		model.addAttribute("subjectList", subjectService.selectAllSubject()); // 전체교과
		return "course/listCourses";
	}
	
	@RequestMapping(value="/registerCourses", method=RequestMethod.GET)
	public void getRegisterCourses(Model model) throws Exception{
		logger.info("======================== registerCourses GET ========================");
		model.addAttribute("listCourses", courseService.selectAllCourse(new SearchCriteria()));
		model.addAttribute("Courses", timetableService.selectAllTimetable());
	}
	
	@RequestMapping(value="/readCourse", method=RequestMethod.GET)
	public void getReadCourse(int cNo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("======================== readCourse GET ========================");
		Course course = courseService.selectOneCourse(cNo);
		logger.info(course.toString());
		logger.info("==========img List =========== : " + course.getPictures().size());
		// 생성되는데 이미지 null일 경우 어찌할 것인가
		model.addAttribute("course", course);
	}
	
	@RequestMapping(value="/updateCourse", method=RequestMethod.GET)
	public void getUpdateCourse(int cNo, Model model) throws Exception{
		logger.info("======================== updateCourse GET ========================");
		Course course = courseService.selectOneCourse(cNo);
		logger.info(course.toString());
		// 생성되는데 이미지 null일 경우 어찌할 것인가
		model.addAttribute("studentGradeList", studentGradeService.selectAllStudentGrade()); // 전체학년
		model.addAttribute("subjectList", subjectService.selectAllSubject()); // 전체교과
		model.addAttribute("TeacherList", teacherService.selectAllTeacher()); // 선생님이름
		model.addAttribute("course", course);
	}
	
	@RequestMapping(value="/deleteCourse", method=RequestMethod.POST)
	public String getDeleteCourse(int cNo) throws Exception{
		logger.info("======================== deleteCourse GET ========================");
		courseService.deleteCourse(cNo);
		return "redirect:listCourses";
	}
	
	
	@RequestMapping(value="/updateCourse", method=RequestMethod.POST)
	public String postUpdateCourse(Course course, Teacher teacher, Subject subject, StudentGrade studentGrade, 
			CourseDetail courseDetail, List<MultipartFile> pics, String[] delPics,
			Integer[] ttDay, Integer[] ttStarttime, Integer[] ttEndtime) throws Exception{
		logger.info("=======================updateCourse Post===============");
		for(MultipartFile file : pics){
			logger.info("=======================updateCourse Post===============pics name"+ file.getOriginalFilename());
			logger.info("=======================updateCourse Post===============pics size"+ file.getSize());
		}
		
		course.setStudentGrade(studentGrade);
		course.setSubject(subject);
		course.setTeacher(teacher);
		course.setContent(courseDetail);
		
		List<CourseImage> list = new ArrayList<>();
		if (pics.get(0).getSize() != 0 ) {
			for (MultipartFile file : pics) {
				logger.info("filename : " + file.getOriginalFilename());
				String thumb = UploadFileUtils.uplaodFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				CourseImage ci = new CourseImage();
				ci.setcPicture(thumb);
				list.add(ci);   
			} 
			course.setPictures(list);
		}
		
		List<Timetable> timeTables = new ArrayList<>();
		for(int i = 0; i < ttDay.length; i++){
			Timetable tt = new Timetable();
			tt.setCourse(course);
			tt.setTtDay(ttDay[i]);
			tt.setTtStarttime(ttStarttime[i]);
			tt.setTtEndtime(ttEndtime[i]);
			timeTables.add(tt);
		}
		logger.info("=======================updateCourse Post 3===============cNo "+ course.getcNo());
		course.setTimetables(timeTables);
		
		for(Timetable ttt : timeTables){
			System.out.println(ttt.getTtDay() +" : " + ttt.getTtStarttime() +" : "+ttt.getTtEndtime());
		}
		
		courseService.updateCourse(course, delPics);
		
		return "redirect:listCourses";
	}
	

	

	
	@RequestMapping(value="/myRegisteredCourses", method=RequestMethod.GET)
	public void getMyRegisteredCourses(String sId, Model model) throws Exception{
		System.out.println("======================== myRegisteredCourses GET ========================");
		int registrationStatus = 1; // 결제됨
		Calendar cal = Calendar.getInstance();
		int regMonth = Integer.parseInt(String.format("%04d%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1));
		
		List<Course> list = courseService.selectCoursesByCri(sId, "", registrationStatus, regMonth);
		System.out.println("=========================== CourseRegister List ======================== ["+list.size()+"]");
		
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/myRegisteredCoursesTable", method=RequestMethod.GET)
	public void getMyRegisteredCoursesTable(String sId, Model model) throws Exception{
		System.out.println("======================== myRegisteredCourses GET ========================");
		
		int registrationStatus = 1; // 결제됨
		Calendar cal = Calendar.getInstance();
		int regMonth = Integer.parseInt(String.format("%04d%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1));
		
		List<Course> list = courseService.selectCoursesByCri(sId, "", registrationStatus, regMonth);
		System.out.println("=========================== CourseRegister List ======================== ["+list.size()+"]");
		
		model.addAttribute("list", list);
	}
	
	
	
	
	@RequestMapping(value="/myRegisteredCourses/{sId}/{year}/{month}/{rsNo}", method=RequestMethod.GET)
	public ResponseEntity<List<Course>> getMyRegisteredCourses(
			@PathVariable("sId") String sId, @PathVariable("rsNo") int rsNo,
			@PathVariable("year") int year, @PathVariable("month") int month) throws Exception{
		ResponseEntity<List<Course>> entity = null;
		int regMonth = Integer.parseInt(String.format("%04d%02d", year, month));
		try{
			List<Course> list = courseService.selectCoursesByCri(sId, "", rsNo, regMonth);
			entity = new ResponseEntity<List<Course>>(list, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<List<Course>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/android/myRegisteredCourses/{sId}/{year}/{month}/{ttDay}", method=RequestMethod.GET)
	public @ResponseBody List<Course> getMyRegisteredCoursesForAndroid(
			@PathVariable("sId") String sId, @PathVariable("ttDay") int ttDay,
			@PathVariable("year") int year, @PathVariable("month") int month) throws Exception{
		List<Course> list = null;
		int regMonth = Integer.parseInt(String.format("%04d%02d", year, month));
		try{
			list = courseService.selectCoursesByCri(sId, "", 1, regMonth, ttDay);
		}catch(Exception e){
		}
		return list;
	}
	
	@RequestMapping(value="/myRegisteredStudents/{cNo}/{year}/{month}/{rsNo}", method=RequestMethod.GET)
	public ResponseEntity<List<CourseRegister>> getMyRegisteredStudents(
			@PathVariable("cNo") int cNo, @PathVariable("rsNo") int rsNo,
			@PathVariable("year") int year, @PathVariable("month") int month) throws Exception{
		ResponseEntity<List<CourseRegister>> entity = null;
		int regMonth = Integer.parseInt(String.format("%04d%02d", year, month));
		try{
			List<CourseRegister> list = courseRegisterService.selectRegisteredStudent(cNo, regMonth, rsNo);
			entity = new ResponseEntity<List<CourseRegister>>(list, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<List<CourseRegister>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value="/registerCourses/{memberType}/{memberId}/{cNo}", method=RequestMethod.PUT)
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
	
	@RequestMapping(value="/myCoursesTable", method=RequestMethod.GET)
	public void getMyCoursesTable() throws Exception{
		System.out.println("======================== myCoursesTable GET ========================");
	}
	
	@RequestMapping(value="/myCoursesWithStudent", method=RequestMethod.GET)
	public void getMyCoursesWithStudent(Model model) throws Exception{
		System.out.println("======================== myCoursesWithStudent GET ========================");
	}
	
	@RequestMapping(value="/myCoursesWithStudent/{cNo}/{year}/{month}", method=RequestMethod.GET)
	public ResponseEntity<List<CourseRegister>> getMyStudent(
			@PathVariable("cNo") int cNo,
			@PathVariable("year") int year, @PathVariable("month") int month) throws Exception{
		ResponseEntity<List<CourseRegister>> entity = null;
		System.out.println("======================== myCoursesWithStudent GET ========================");
		int regMonth = Integer.parseInt(String.format("%04d%02d", year, month));
		try{
			List<CourseRegister> list = courseRegisterService.selectRegisteredStudent(cNo, regMonth, 1);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/myCoursesTable/{tId}/{year}/{month}", method=RequestMethod.GET)
	public ResponseEntity<List<Course>> getMyCourses(
			@PathVariable("tId") String tId,
			@PathVariable("year") int year, @PathVariable("month") int month) throws Exception{
		ResponseEntity<List<Course>> entity = null;
		int regMonth = Integer.parseInt(String.format("%04d%02d", year, month));
		try{
			List<Course> list = courseService.selectCoursesByCri("", tId, 0, regMonth);
			entity = new ResponseEntity<List<Course>>(list, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<List<Course>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/timetable/{cNo1}/{cNo2}", method=RequestMethod.GET)
	public ResponseEntity<String> getMyCourses(@PathVariable("cNo1") int cNo1, @PathVariable("cNo2") int cNo2) throws Exception{
		System.out.println("======================== /timetable/{cNo1}/{cNo2} GET ========================");
		System.out.println("======================== /timetable/{cNo1}/{cNo2} GET ========================cNo1: "+ cNo1);
		System.out.println("======================== /timetable/{cNo1}/{cNo2} GET ========================cNo2: "+ cNo2);
		ResponseEntity<String> entity = null;
		try{
			
			int res = timetableService.checkEq(cNo1, cNo2);
			System.out.println("======================== /timetable/{cNo1}/{cNo2} ttDay : " + res);
			if(res == 99){
				// 수업이 안 겹친다
				entity = new ResponseEntity<>("NO", HttpStatus.OK);
			}else{
				// 수업이 겹친다
				entity = new ResponseEntity<>("OK", HttpStatus.OK);
			}
			
		}catch(Exception e){
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	

	
	
	
	
	
	
}