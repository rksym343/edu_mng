package com.dgit.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.dgit.domain.AttendanceSearchCriteria;
import com.dgit.domain.Course;
import com.dgit.domain.Examination;
import com.dgit.service.AttendanceService;
import com.dgit.service.AttendanceStatusService;
import com.dgit.service.ExaminationService;

@Controller
@RequestMapping("/exam/*")
public class ExaminationController {
	
	@Autowired
	private ExaminationService examinationService;
	
	private static final Logger logger = LoggerFactory.getLogger(ExaminationController.class);

	
	
	@RequestMapping(value="/viewStudentExam", method=RequestMethod.GET)
	public void getListAttendance(Model model) throws Exception{
		logger.info("==================viewStudentExam GET================");
		String sId = "sss01";
		Examination examination = new Examination();
		examination.setsId(sId);
		List<Examination> list = examinationService.selectExaminationByCri(examination);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/viewStudentExam/{sId}/{cNo}", method=RequestMethod.GET)
	public ResponseEntity<List<Examination>> getMyAttendanceRecord(
			@PathVariable("sId") String sId, @PathVariable("cNo") int cNo) throws Exception{
		ResponseEntity<List<Examination>> entity = null;
		try{
			Examination examination = new Examination();
			examination.setsId(sId);
			if(cNo != 0){
				Course course = new Course();
				course.setcNo(cNo);
				examination.setCourse(course);
			}
			List<Examination> list = examinationService.selectExaminationByCri(examination);	
			entity = new ResponseEntity<List<Examination>>(list, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<List<Examination>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	
	
}