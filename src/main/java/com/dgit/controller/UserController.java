package com.dgit.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.Parents;
import com.dgit.domain.Student;
import com.dgit.domain.StudentGrade;
import com.dgit.domain.Subject;
import com.dgit.domain.Teacher;
import com.dgit.domain.TransferMethod;
import com.dgit.interceptor.LoginInterceptor;
import com.dgit.service.ParentsService;
import com.dgit.service.StudentService;
import com.dgit.service.TeacherService;
import com.dgit.util.UploadFileUtils;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private StudentService studentService;
	
	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private ParentsService parentsService;	
	
	@Resource(name = "uploadPath") // bean의 id 이름
	String uploadPath;
	

	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="/readTeacherInfo", method=RequestMethod.GET)
	public void readTeacherInfo(Model model) throws Exception{
		String tId = "ttt01";
		model.addAttribute("teacher",teacherService.selectOneTeacher(tId));
	}
	
	@RequestMapping(value="/readParentsInfo", method=RequestMethod.GET)
	public void readParentsInfo(Model model) throws Exception{
		String spId = "mmm01";
		Parents parents = parentsService.selectOneParents(spId);
		model.addAttribute("parents", parents);
		model.addAttribute("student",studentService.selectOneStudent(parents.getsId()));
	}
	
	@RequestMapping(value="/readStudentInfo", method=RequestMethod.GET)
	public void readStudentInfo(Model model) throws Exception{
		String sId = "sss01";
		model.addAttribute("student",studentService.selectOneStudent(sId));
	}
	
	@RequestMapping(value="/registerMember", method=RequestMethod.GET)
	public void getRegisterMember(Model model) throws Exception{
		
	}
	
	@RequestMapping(value="/registerStudent", method=RequestMethod.POST)
	public void postRegisterMember(Student student, 
			TransferMethod transferMethod, StudentGrade studentGrade, MultipartFile picture) throws Exception{
		logger.info("=========================/registerStudent memberType : ");
		logger.info("=========================/registerMember picture: " + picture.getOriginalFilename());
		String thumb = UploadFileUtils.uplaodFile(uploadPath, picture.getOriginalFilename(), picture.getBytes());
			student.setsPicture(thumb);
			student.setTransferMethod(transferMethod);
			student.setsGrade(studentGrade);
			studentService.insertStudent(student);
	}
	
	@RequestMapping(value="/registerParents", method=RequestMethod.POST)
	public void postRegisterMember(Parents parents, TransferMethod transferMethod) throws Exception{
		logger.info("=========================/registerParents memberType : ");
		parents.setTransferMethod(transferMethod);
		parentsService.insertParents(parents);
	}
	
	
	@RequestMapping(value="/registerTeacher", method=RequestMethod.POST)
	public void postRegisterMember(Teacher teacher, Subject subject, MultipartFile picture) throws Exception{
		logger.info("=========================/registerTeacher  ");
		logger.info("=========================/registerMember picture: " + picture.getOriginalFilename());
		String thumb = UploadFileUtils.uplaodFile(uploadPath, picture.getOriginalFilename(), picture.getBytes());		
			teacher.settPicture(thumb);
			teacher.settSubject(subject);
			teacherService.insertTeacher(teacher);
	}
	
	
	@Transactional
	@RequestMapping(value="/checkId/{checkId}", method=RequestMethod.GET)
	public ResponseEntity<String> getCheckId(@PathVariable("checkId") String checkId) throws Exception{
		ResponseEntity<String> entity = null;
		logger.info("=========================/checkId/"+checkId);
		String result = "EXIST";
		try{
			if(studentService.selectOneStudent(checkId) != null){
				logger.info("=========================EXIST : 학생 아이디 검색");
			}else if(parentsService.selectOneParents(checkId) != null){
				logger.info("=========================EXIST : 부모 아이디 검색");
			}else if(teacherService.selectOneTeacher(checkId) != null){
				logger.info("=========================EXIST : 선생님 아이디 검색");
			}else{
				logger.info("=========================EXIST : 3 경우 모두 아님");
				result = "";	
			}
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
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
