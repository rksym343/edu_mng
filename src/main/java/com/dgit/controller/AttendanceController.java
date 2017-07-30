package com.dgit.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.Attendance;
import com.dgit.domain.AttendanceSearchCriteria;
import com.dgit.domain.AttendanceStatus;
import com.dgit.domain.Student;
import com.dgit.service.AttendanceService;
import com.dgit.service.AttendanceStatusService;

@Controller
@RequestMapping("/attend/*")
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private AttendanceStatusService attendanceStatusService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	
	
	
	@RequestMapping(value="/myCoursesWithStudentForAttendance", method=RequestMethod.GET)
	public String getMyAttendanceIn(Model model) throws Exception{
		return "/course/myCoursesWithStudentForAttendance";
	}
	

	@RequestMapping(value="/insertAttendanceInAndOut", method=RequestMethod.GET)
	public @ResponseBody String getMyAttendanceInString(String sId) throws Exception{
		String entity = "";
		try{
			entity = attendanceService.insertAttendanceStudentInAndOut(sId);
		}catch(Exception e){
		}		
		return entity;
	}
	
	@RequestMapping(value="/listAttendance", method=RequestMethod.GET)
	public void getListAttendance(Model model, AttendanceSearchCriteria cri) throws Exception{
		logger.info("==================listAttendance GET================");
		System.out.println("========== cri : "+cri);
		System.out.println("========== cri : "+cri.getSearchType());
		System.out.println("========== cri : "+cri.getKeyword());
		System.out.println("========== cri : "+cri.getStatus());
		List<Attendance> list = attendanceService.selectAttendanceByCri(cri);
		model.addAttribute("list",list);
		System.out.println("==========LIST  ====  ["+list.size()+"]");
		for(Attendance at : list){
			System.out.println(at);
		}
		System.out.println("==========LIST  ====  ["+list.size()+"]");
		model.addAttribute("statusList", attendanceStatusService.selectAllAttendanceStatus());
		model.addAttribute("cri", cri);
		
	}
	
	@RequestMapping(value="/myAttendance", method=RequestMethod.GET)
	public void getMyAttendance(Model model, HttpSession session) throws Exception{
		logger.info("==================listAttendance GET================");
		Calendar cal = Calendar.getInstance();
		String month = String.format("%d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1);
		model.addAttribute("statusList", attendanceStatusService.selectAllAttendanceStatus());
		model.addAttribute("curYear", cal.get(Calendar.YEAR));
		model.addAttribute("curMonth", cal.get(Calendar.MONTH)+1);
	}
	
	@RequestMapping(value="/myAttendanceRecord/json/{sId}/{year}/{month}", method=RequestMethod.GET)
	public @ResponseBody List<Attendance> getMyAttendanceRecordForJson(
			@PathVariable("sId") String sId, @PathVariable("year") int year, @PathVariable("month") int month) throws Exception{
		List<Attendance> list = null;
		String yearMonth = String.format("%04d-%02d", year, month);
		try{
			list = attendanceService.selectAttendanceBySIdAndMonth(yearMonth, sId);
		}catch(Exception e){
		}
		
		return list;
	}
	
	@RequestMapping(value="/myAttendanceRecordChart/json/{sId}/{year}/{month}", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> getMyAttendanceRecordCartForJson(
			@PathVariable("sId") String sId, @PathVariable("year") int year, @PathVariable("month") int month) throws Exception{
		Map<String, Object> map = new HashMap<>();
		List<Attendance> list = null;
		String yearMonth = String.format("%04d-%02d", year, month);
		try{
			list = attendanceService.selectAttendanceBySIdAndMonth(yearMonth, sId);
				map.put("ab", attendanceService.selectCntByAttendanceType(sId, "a", yearMonth));
				map.put("nm_in", attendanceService.selectCntByAttendanceType(sId, "n", yearMonth));
				map.put("ea", attendanceService.selectCntByAttendanceType(sId, "e", yearMonth));
				map.put("la", attendanceService.selectCntByAttendanceType(sId, "l", yearMonth));
				map.put("ea_la", attendanceService.selectCntByAttendanceType(sId, "el", yearMonth));
				map.put("list", list);
		}catch(Exception e){
		}
		
		return map;
	}
	
	@RequestMapping(value="/myAttendanceRecord/{sId}/{year}/{month}", method=RequestMethod.GET)
	public ResponseEntity<List<Attendance>> getMyAttendanceRecord(
			@PathVariable("sId") String sId, @PathVariable("year") int year, @PathVariable("month") int month) throws Exception{
		ResponseEntity<List<Attendance>> entity = null;
		String yearMonth = String.format("%04d-%02d", year, month);
		try{
			List<Attendance> list = attendanceService.selectAttendanceBySIdAndMonth(yearMonth, sId);
			entity = new ResponseEntity<List<Attendance>>(list, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<List<Attendance>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/studentAttendanceInfo/{cNo}/{ttDay}/{year}/{month}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getStudentAttendanceInfo(
			@PathVariable("cNo") int cNo, @PathVariable("ttDay") int ttDay, 
			@PathVariable("year") int year, @PathVariable("month") int month) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		int regMonth = Integer.parseInt(String.format("%04d%02d", year, month));
		Map<String, Object> map = new HashMap<>();
		try{
			List<Attendance> list = attendanceService.selectStudentByCnoWithAttendance(ttDay, cNo, regMonth);
			map.put("list", list);
			map.put("statusList", attendanceStatusService.selectAllAttendanceStatus());
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/updateAttendance/{sId}/{originAtNo}/{asNo}", method=RequestMethod.GET)
	public ResponseEntity<Attendance> updateAttendance(
			@PathVariable("sId") String sId, 
			@PathVariable("originAtNo") int originAtNo, @PathVariable("asNo") int asNo) throws Exception{
		logger.info("==========================updateAttendance=====================");
		ResponseEntity<Attendance> entity = null;
		int newAtNo = 0;
		try{
			Attendance attendance = new Attendance();
			Student student = new Student();
			student.setsId(sId);
			
			AttendanceStatus attendanceStatus = new AttendanceStatus();
			attendanceStatus.setAsNo(asNo);
			
			attendance.setStudent(student);
			attendance.setAttendanceStatus(attendanceStatus);
			logger.info("==========================updateAttendance========originAtNo: " + originAtNo);
			if(originAtNo == 0 ){
				newAtNo = attendanceService.insertAttendance(attendance);
			}else{
				
				attendance.setAtNo(originAtNo);
				newAtNo = originAtNo;

				logger.info("==========================updateAttendance========newAtNo: " + newAtNo);
				logger.info("==========================updateAttendance========attendance: " + attendance);
				attendanceService.updateAttendance(attendance);
			}
			Attendance att = attendanceService.selectOneAttendance(newAtNo);
			logger.info("==========================updateAttendance========after: " + att);
			entity = new ResponseEntity<>(att, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/viewAttendanceChart/{sId}/{year}/{month}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> viewAttendanceChartBySId(
			@PathVariable("sId") String sId, @PathVariable("year") int year, @PathVariable("month") int month) throws Exception{
		logger.info("==================viewStudentExam GET================");
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<>();
		String yearMonth = String.format("%04d-%02d", year, month);
		try{
			map.put("결석", attendanceService.selectCntByAttendanceType(sId, "a", yearMonth));
			map.put("등원", attendanceService.selectCntByAttendanceType(sId, "n", yearMonth));
			map.put("조퇴", attendanceService.selectCntByAttendanceType(sId, "e", yearMonth));
			map.put("지각", attendanceService.selectCntByAttendanceType(sId, "l", yearMonth));
			map.put("지각&조퇴", attendanceService.selectCntByAttendanceType(sId, "el", yearMonth));
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	@RequestMapping(value="/listAttendanceByCri", method=RequestMethod.GET)
	public String getListAttendanceByCri(Model model, AttendanceSearchCriteria cri) throws Exception{
		//ResponseEntity<Map<String, Object>> entity = null;
		logger.info("==================listAttendance GET================");
		System.out.println("========== cri : "+cri);
		System.out.println("========== cri : "+cri.getSearchType());
		System.out.println("========== cri : "+cri.getKeyword());
		System.out.println("========== cri : "+cri.getStatus());
		
		model.addAttribute("list", attendanceService.selectAttendanceByCri(cri));
		model.addAttribute("statusList", attendanceStatusService.selectAllAttendanceStatus());
		model.addAttribute("cri", cri);
		
		/*try{
			Map<String, Object> param = new HashMap<>();
			if(criValue.length > 1){
				param.put("startDate", criValue[0]);		
				param.put("endDate", criValue[1]);	
			}else{
				param.put(cri, criValue);		
			}
			List<Attendance> list = attendanceService.selectAttendanceByCri(cri);
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", "list");
			
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		*/
		return "/attend/listAttendance";
		/*1. > 오늘 < 출석기록
		2. 특정 학생 출석기록
		3. 특정 수업 출석기록*/
	}
	
	
	
}