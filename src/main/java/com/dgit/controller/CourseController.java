package com.dgit.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.dgit.domain.StudentGrade;
import com.dgit.domain.Subject;
import com.dgit.domain.Teacher;
import com.dgit.domain.Timetable;
import com.dgit.service.CartCourseService;
import com.dgit.service.CourseRegisterService;
import com.dgit.service.CourseService;
import com.dgit.service.StudentGradeService;
import com.dgit.service.SubjectService;
import com.dgit.service.TimetableService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

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
	
	@Autowired
	private CourseRegisterService courseRegisterService;
	
	@Autowired
	private CartCourseService cartCourseService;
	
	@Resource(name = "uploadPath") // bean의 id 이름
	String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);
	
	
	@ResponseBody
	@RequestMapping(value = "displayFile") // displayFile?filename={파일이름}
	public ResponseEntity<byte[]> displayFile(String filename) throws IOException {
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;

		logger.info("========================displayFile=============================");

		try {
			// IOUtils.toByteArray(in) : 해당데이터의 Byte를 꺼내주는 역할
			// 이미지 종류별로 형식이 다르다. byte 배열순이 다름...
			// BMP는 565... jpg는 다르게...
			// >>>>>>>>>> 이미지타입을 알려줘야 한다
			String formatName = filename.substring(filename.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders header = new HttpHeaders();
			header.setContentType(mType);
			in = new FileInputStream(uploadPath + "/" + filename);

			// [ header | body ] 전송되는 byte 모양...
			// header는 전송하고자 하는 정보... 어디로가니... 사이즈가 얼마다... 저장됨
			// body에는 전송할 data 원본 담겨서 감

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), header, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close(); // 닫지 않으면 메모리 누수 현상
		}

		return entity;
	}

	@RequestMapping(value="/insertCourse", method=RequestMethod.GET)
	public void getInsertCourse(Model model) throws Exception{
		model.addAttribute("studentGradeList", studentGradeService.selectAllStudentGrade()); // 전체학년
		model.addAttribute("subjectList", subjectService.selectAllSubject()); // 전체교과
	}
	
	@RequestMapping(value="/insertCourse", method=RequestMethod.POST)
	public String postInsertCourse(Course course, Teacher teacher, Subject subject, StudentGrade studentGrade, 
			CourseDetail courseDetail, List<MultipartFile> pics,
			Integer[] ttDay, Integer[] ttStarttime_hh, Integer[] ttEndtime_hh, 
			Integer[] ttStarttime_MM, Integer[] ttEndtime_MM, String cStart, String cEnd) throws Exception{
		logger.info("=======================insertCourse Post===============");
	
		course.setStudentGrade(studentGrade);
		course.setSubject(subject);
		course.setTeacher(teacher);
		course.setContent(courseDetail);
		List<CourseImage> list = new ArrayList<>();
		if (!pics.get(0).getOriginalFilename().equals("")) {
			// imgFiles.get(0).getSize() == 0 으로 쓰기도 함....
			for (MultipartFile file : pics) {
				logger.info("filename : " + file.getOriginalFilename());
				String thumb = UploadFileUtils.uplaodFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				CourseImage ci = new CourseImage();
				ci.setcPicture(thumb);
				list.add(ci);   
			} 
			course.setPictures(list);
		}
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		
		course.setcStartdate(sdf.parse(cStart));
		course.setcEnddate(sdf.parse(cEnd));
		
		
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
		//model.addAttribute("Courses", timetableService.selectAllTimetable());
		System.out.println("========================Courses size: "+timetableService.selectAllTimetable().size());
		return "course/listCourses";
	}
	
	@RequestMapping(value="/registerCourses", method=RequestMethod.GET)
	public void getRegisterCourses(Model model) throws Exception{
		logger.info("======================== registerCourses GET ========================");
		model.addAttribute("listCourses", courseService.selectAllCourse());
		model.addAttribute("Courses", timetableService.selectAllTimetable());
		System.out.println("========================Courses size: "+timetableService.selectAllTimetable().size());
	}
	
	@RequestMapping(value="/readCourse", method=RequestMethod.GET)
	public void getReadCourse(int cNo, Model model) throws Exception{
		logger.info("======================== readCourse GET ========================");
		Course course = courseService.selectOneCourse(cNo);
		logger.info(course.toString());
		logger.info("==========img List =========== : " + course.getPictures().size());
		// 생성되는데 이미지 null일 경우 어찌할 것인가
		model.addAttribute("course", course);
	}
	
	@RequestMapping(value="/registerCourses", method=RequestMethod.POST)
	public String postRegisterCourses(String sId, Integer[] cNos, Model model) throws Exception{
		logger.info("======================== registerCourses POST  ========================");
		logger.info("===============  sId : " + sId);
		// 장바구니에 담고
		logger.info("======================== 카트상품 ========================");
		/*CartCourse[] cartCourses = new CartCourse[cNos.length];
		for(int i = 0; i < cNos.length; i++){
			CartCourse cc = new CartCourse();
			Course course = new Course();
			course.setcNo(cNos[i]);
			cc.setsId(sId);			
			cc.setCourse(course);
			cartCourses[i] = cc;
			logger.info(cc.toString());
		}*/
		
		CartCourse[] cartCourses = new CartCourse[cNos.length];
		for(int i = 0; i < cNos.length; i++){
			CartCourse cc = new CartCourse();
			List<Course> courses = new ArrayList<>();
			Course course = new Course();
			course.setcNo(cNos[i]);
			courses.add(course);			
			cc.setsId(sId);			
			cc.setCourses(courses);
			cartCourses[i] = cc;
			logger.info(cc.toString());
		}
		boolean res = cartCourseService.insertCartCourse(cartCourses);
		if(res){
			
		}else{
			
		}
		// 장바구니 페이지로... 
		
		model.addAttribute("list", cartCourseService.selectAllCoursesBySId(sId));
		
		return "course/cartCourses";
	}
	
	@RequestMapping(value="/cartCourses", method=RequestMethod.GET)
	public void getCartCourses(String sId, Model model) throws Exception{
		System.out.println("======================== cartCourses GET ========================");
		sId = "sss01";
		System.out.println("=============== cart size   : " + cartCourseService.selectAllCoursesBySId(sId).size());
		model.addAttribute("list", cartCourseService.selectAllCoursesBySId(sId));
		
	}
	
	
	@RequestMapping(value="/myRegisteredCourses", method=RequestMethod.GET)
	public void getMyRegisteredCourses(String sId, Model model) throws Exception{
		System.out.println("======================== myRegisteredCourses GET ========================");
		sId = "sss01";
		
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
		sId = "sss01";
		
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
	
	
}