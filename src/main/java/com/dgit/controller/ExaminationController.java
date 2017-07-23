package com.dgit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.Attendance;
import com.dgit.domain.Course;
import com.dgit.domain.Examination;
import com.dgit.domain.Subject;
import com.dgit.service.AttendanceService;
import com.dgit.service.ExaminationService;

@Controller
@RequestMapping("/exam/*")
public class ExaminationController {
	
	@Autowired
	private ExaminationService examinationService;
	
	@Autowired
	private AttendanceService attendanceService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(ExaminationController.class);

	
	
	@RequestMapping(value="/viewStudentExam", method=RequestMethod.GET)
	public void getViewStudentExam(Model model) throws Exception{
		logger.info("==================viewStudentExam GET================");
	}
	
	@RequestMapping(value="/viewChart", method=RequestMethod.GET)
	public void viewChart(Model model) throws Exception{
		logger.info("==================viewStudentExam GET================");
		
	}
	
	
	
	@RequestMapping(value="/viewStudentExam/{sId}/{cNo}", method=RequestMethod.GET)
	public ResponseEntity<List<Examination>> viewStudentExam(
			@PathVariable("sId") String sId, @PathVariable("cNo") int cNo) throws Exception{
		// 해당과목 학원시험
		ResponseEntity<List<Examination>> entity = null;
		logger.info("==================viewStudentExam /{sId}/{cNo}  GET================");
		logger.info("================== sId : " +sId);
		logger.info("================== cNo : " +cNo);
		try{
			Examination examination = new Examination();
			examination.setsId(sId);
			
			if(cNo != 0){
				Course course = new Course();
				course.setcNo(cNo);
				examination.setCourse(course);
			}
			
			logger.info("================== **** viewStudentExam /{sId}/{cNo}  GET================");
			logger.info("================== examination : " +examination);
			logger.info("================== examination.getCourse : " +examination.getCourse());
			logger.info("================== **** viewStudentExam /{sId}/{cNo}  GET================");
			List<Examination> list = examinationService.selectExaminationByCri(examination);	
			entity = new ResponseEntity<List<Examination>>(list, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<List<Examination>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/viewStudentExam/{sId}/{sbNo}", method=RequestMethod.PUT)
	public ResponseEntity<List<Examination>> putviewStudentExam(
			@PathVariable("sId") String sId, @PathVariable("sbNo") int sbNo) throws Exception{
		// 해당과목 학교시험
		ResponseEntity<List<Examination>> entity = null;
		logger.info("==================viewStudentExam /{sId}/{sbNov}  PUT================");
		logger.info("================== sId : " +sId);
		logger.info("================== sbNo : " +sbNo);
		try{
			Examination examination = new Examination();
			examination.setsId(sId);
			
			Subject subject = new Subject();
			subject.setSbNo(sbNo);
			examination.setSubject(subject);
			
			List<Examination> list = examinationService.selectExaminationByCri(examination);	
			entity = new ResponseEntity<List<Examination>>(list, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<List<Examination>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
}