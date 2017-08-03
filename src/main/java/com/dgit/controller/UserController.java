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
import org.springframework.web.bind.annotation.ResponseBody;
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
	public void readTeacherInfo(String tId, Model model) throws Exception{
		model.addAttribute("teacher",teacherService.selectOneTeacher(tId));
	}
	
	@RequestMapping(value="/readParentsInfo", method=RequestMethod.GET)
	public void readParentsInfo(String spId, Model model) throws Exception{
		Parents parents = parentsService.selectOneParents(spId);
		model.addAttribute("parents", parents);
		model.addAttribute("student",studentService.selectOneStudent(parents.getsId()));
	}
	
	@RequestMapping(value="/readStudentInfo", method=RequestMethod.GET)
	public void readStudentInfo(String sId, Model model) throws Exception{
		model.addAttribute("student",studentService.selectOneStudent(sId));
	}
	
	@RequestMapping(value="/readStudentInfo/{sId}", method=RequestMethod.GET)
	public ResponseEntity<Student> readStudentInfo(@PathVariable("sId") String sId) throws Exception{
		ResponseEntity<Student> entity = null;	
		try{
			entity = new ResponseEntity<>(studentService.selectOneStudent(sId),  HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}		
		return entity;
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
		String member = "";
		if(memberType.equalsIgnoreCase(LoginInterceptor.STUDENT)){
			Student studnet =  studentService.login(id, password);
			if(studnet != null){
				member = studnet.getsId();
			}
		}else if(memberType.equalsIgnoreCase(LoginInterceptor.PARENTS)){
			Parents parents = parentsService.login(id, password);
			if(parents != null){
				member = parents.getSpId();
			}
		}else if(memberType.equalsIgnoreCase(LoginInterceptor.TEACHER)){
			Teacher teacher = teacherService.login(id, password);
			if(teacher != null){
				member = teacher.gettId();				
			}
		}
		System.out.println("==========member : " +member);
		if(member.equals("")){
			System.out.println("==========nonexistent======");
			model.addAttribute("nonexistent", "nonexistent");
		}
		model.addAttribute(LoginInterceptor.MEMBER_TYPE, memberType);
		model.addAttribute(LoginInterceptor.MEMBER_ID, member);		
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public @ResponseBody String postLoginForAndroid(String memberType, String id, String password) throws Exception{
		String memberName = "";
		logger.info("=============안드로이드 로그인");
		logger.info("=============안드로이드 로그인 memberType : " +memberType);
		logger.info("=============안드로이드 로그인 id : " +id);
		logger.info("=============안드로이드 로그인 password : " +password);
		 
		if(memberType.equalsIgnoreCase(LoginInterceptor.STUDENT)){
			Student studnet =  studentService.login(id, password);
			if(studnet != null){
				memberName = studnet.getsName();
			}
		}else if(memberType.equalsIgnoreCase(LoginInterceptor.PARENTS)){
			Parents parents = parentsService.login(id, password);
			if(parents != null){
				memberName = parents.getSpName();
			}
		}else if(memberType.equalsIgnoreCase(LoginInterceptor.TEACHER)){
			Teacher teacher = teacherService.login(id, password);
			if(teacher != null){
				memberName = teacher.gettName();			
			}
		}
		return memberName;
	}
	
	
	
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String getLogout(HttpSession session) throws Exception{
		session.removeAttribute(LoginInterceptor.MEMBER_ID);
		session.removeAttribute(LoginInterceptor.MEMBER_TYPE);
		session.invalidate();
		return "redirect:/";
	}
	
}
