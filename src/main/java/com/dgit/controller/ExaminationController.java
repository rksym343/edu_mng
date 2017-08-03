package com.dgit.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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

import com.dgit.domain.Course;
import com.dgit.domain.ExamItem;
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
	
	
	@RequestMapping(value="/insertExamResult", method=RequestMethod.GET)
	public void insertExam(Model model) throws Exception{
		logger.info("==================viewStudentExam GET================");
		model.addAttribute("examList", examinationService.selectAllExamItem());
	}
	
	@RequestMapping(value="/insertExamResult", method=RequestMethod.POST)
	public void postInsertExam(Examination examination, int eiNo, int cNo, int sbNo, String date, String[] sIds, int[] eResults, String[] eMemos) throws Exception{
		// examination는 date만 받아옵니다.? cNo는 안된다.. sbNo도 안돼...
		logger.info("==================insertExam POST================");
		List<Examination> examinations = new ArrayList<>();
		try{
			for( int i = 0; i < sIds.length; i++){
				Examination exam = new Examination();
				
				Subject subject = new Subject();
				subject.setSbNo(sbNo);
				Course course = new Course();
				course.setcNo(cNo);
				ExamItem examItem = new ExamItem();
				examItem.setEiNo(eiNo);
				
				exam.setSubject(subject);
				exam.setCourse(course);
				exam.seteDate(examination.geteDate());
				exam.setExamItem(examItem);
			
				exam.setsId(sIds[i]);
				exam.seteResult(eResults[i]);
				exam.seteMemo(eMemos[i]);
				examinations.add(exam);
			}
			examinationService.insertExaminations(examinations);
		}catch(Exception e){
		
		}		
		//return "/exam/insertExamResult"; 
	}
	
	@RequestMapping(value="/viewExamResult/{sbNo}/{cNo}/{eiNo}/{date}", method=RequestMethod.GET)
	public ResponseEntity<List<Examination>> viewExamResultByCourseWithDate(
			@PathVariable("sbNo") int sbNo, @PathVariable("cNo") int cNo, 
			@PathVariable("eiNo") int eiNo, @PathVariable("date") String date) throws Exception{
		// examination는 date만 받아옵니다.? cNo는 안된다.. sbNo도 안돼...
		logger.info("==================viewExamResult POST================");
		logger.info("==================viewExamResult POST================cNo" + cNo);
		logger.info("==================viewExamResult POST================eiNo" + eiNo);
		logger.info("==================viewExamResult POST================date" + date);
		ResponseEntity<List<Examination>> entity = null;
		try{		
			logger.info("==================viewExamResult POST================1");
			logger.info("==================viewExamResult POST================2");
			
			if(date.equals("x")){
				date = "";
			}
			
			Calendar cal = Calendar.getInstance();
			String regMonth = String.format("%04d%02d", cal.get(Calendar.YEAR), (cal.get(Calendar.MONTH)+1));					
			
			logger.info("==================viewExamResult POST================4");
			List<Examination> list = examinationService.selectExaminationByCriForTeacher("", regMonth, date, eiNo, 0, cNo, sbNo);
			entity = new ResponseEntity<List<Examination>>(list, HttpStatus.OK);			
		}catch(Exception e){
			entity = new ResponseEntity<List<Examination>>(HttpStatus.BAD_REQUEST);
		}		
		return entity;
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