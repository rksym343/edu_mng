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

import com.dgit.domain.Attendance;
import com.dgit.domain.AttendanceSearchCriteria;
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
		/*String sId = (String) session.getAttribute(LoginInterceptor.MEMBER_ID);*/
		String sId = "sss01";
		List<Attendance> list = attendanceService.selectAttendanceBySIdAndMonth(month, sId);
		
		System.out.println("==========LIST  ====  ["+list.size()+"]");
		for(Attendance at : list){
			System.out.println(at);
		}
		System.out.println("==========LIST  ====  ["+list.size()+"]");
		
		model.addAttribute("list", list);
		model.addAttribute("statusList", attendanceStatusService.selectAllAttendanceStatus());
		model.addAttribute("curYear", cal.get(Calendar.YEAR));
		model.addAttribute("curMonth", cal.get(Calendar.MONTH)+1);
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
			map.put("지각", attendanceService.selectCntByAttendanceType(sId, "e", yearMonth));
			map.put("조퇴", attendanceService.selectCntByAttendanceType(sId, "l", yearMonth));
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