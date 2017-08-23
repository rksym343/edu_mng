package com.dgit.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.Attendance;
import com.dgit.domain.AttendanceSearchCriteria;
import com.dgit.domain.AttendanceStatus;
import com.dgit.domain.Parents;
import com.dgit.domain.Student;
import com.dgit.interceptor.LoginInterceptor;
import com.dgit.service.AttendanceService;
import com.dgit.service.AttendanceStatusService;
import com.dgit.service.ParentsService;

@Controller
@RequestMapping("/attend/*")
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private AttendanceStatusService attendanceStatusService;
	
	@Autowired
	private ParentsService parentsService;
	
	
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
	public String getMyAttendance(Model model, HttpSession session) throws Exception{
		logger.info("==================listAttendance GET================");
		Calendar cal = Calendar.getInstance();
		String month = String.format("%d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1);
		model.addAttribute("statusList", attendanceStatusService.selectAllAttendanceStatus());
		model.addAttribute("curYear", cal.get(Calendar.YEAR));
		model.addAttribute("curMonth", cal.get(Calendar.MONTH)+1);
		return "/attend/myAttendance";
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
	
	/*-------------------------------------------For Android-------------------------------------------------*/
	
	
	@RequestMapping(value="/myAttendanceRecordByDate/{sId}/{year}/{month}", method=RequestMethod.GET)  
	public @ResponseBody Map<String, Object> getMyAttendanceRecordByDate(
			@PathVariable("sId") String sId, @PathVariable("year") int year, @PathVariable("month") int month) throws Exception{
		//ResponseEntity<Map<String, Object>> entity = null; 
		Map<String, Object> map = new HashMap<>();
		String yearMonth = String.format("%04d-%02d", year, month);
			List<Attendance> attList = attendanceService.selectAttendanceBySIdAndMonth(yearMonth, sId);
			
			for(Attendance att : attList){
				int date = att.getTheTime().getDate();
				if(map.get(date+"_IN_DATE") == null){
					map.put(date+"_IN_STATUS", att.getAttendanceStatus().getAsStatus());
					map.put(date+"_IN_DATE", att.getTheTime());	
				}else if(map.get(date+"_IN_DATE") != null){
					Date fDate =  (Date) map.get(date+"_IN_DATE");
					Date sDate = att.getTheTime();
					
					int compare = fDate.compareTo( sDate );
					if ( compare > 0 ){ 
						// fDate가 크다.
						map.put(date+"_OUT_STATUS", map.get(date+"_IN_STATUS"));
						map.put(date+"_OUT_DATE", map.get(date+"_IN_DATE"));
						map.put(date+"_IN_STATUS", att.getAttendanceStatus().getAsStatus());
						map.put(date+"_IN_DATE", att.getTheTime());
					} else if ( compare < 0) {
						//sDate가 크다.
						map.put(date+"_OUT_STATUS", att.getAttendanceStatus().getAsStatus());
						map.put(date+"_OUT_DATE", att.getTheTime());
					} 
				}
			}
			
		return map;
	}
	
	@ResponseBody 
	@RequestMapping(value="/myAttendanceRecord/json/{sId}/{year}/{month}", method=RequestMethod.GET)
	public List<Attendance> getMyAttendanceRecordForJson(
			@PathVariable("sId") String sId, @PathVariable("year") int year, @PathVariable("month") int month) throws Exception{
		List<Attendance> list = null;
		String yearMonth = String.format("%04d-%02d", year, month);
		try{
			list = attendanceService.selectAttendanceBySIdAndMonth(yearMonth, sId);
		}catch(Exception e){
		}
		
		return list;
	}
	
	@ResponseBody 
	@RequestMapping(value="/myAttendanceRecordChart/json/{sId}/{year}/{month}", method=RequestMethod.GET)
	public Map<String, Object> getMyAttendanceRecordCartForJson(
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
	
	@ResponseBody 
	@RequestMapping(value="/viewAttendRecordByDate/{sId}/{year}/{month}/{date}", method=RequestMethod.GET)
	public ResponseEntity<List<Attendance>> viewAttendRecordByDate(
			@PathVariable("sId") String sId, @PathVariable("year") int year,
			@PathVariable("month") int month, @PathVariable("date") int date) throws Exception{
		logger.info("==================viewStudentExam GET================");
		ResponseEntity<List<Attendance>> entity = null;
		String curDate = String.format("%04d-%02d-%02d", year, month, date);
		try{
			List<Attendance> list = attendanceService.selectAttenddanceByDate(curDate);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody 
	@Transactional
	@RequestMapping(value="/android/newAttendRecord/{memberType}/{id}/{latestTime}", method=RequestMethod.GET)
	public Attendance getNewAttendForAndroid(
			@PathVariable("memberType") String memberType, @PathVariable("id") String id, 
			@PathVariable("latestTime")  @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss") Date latestTime) throws Exception{
		Attendance result = null;
		logger.info("==================newAttendRecord/{memberType}/{id}/{latestTime}  GET================");
		logger.info("================== memberType : " +memberType);
		logger.info("================== id : " +id);
		logger.info("================== latestTime : " +latestTime.toString());
		try{
			//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			//Date theTime = sdf.parse(latestTime);
			
			Attendance attendance = new Attendance();
			attendance.setTheTime(latestTime);
			Student student = new Student();
			
			if(memberType.equals(LoginInterceptor.PARENTS)){
				Parents parents = parentsService.selectOneParents(id);
				student.setsId(parents.getsId());
			}else{
				student.setsId(id);
			}
			attendance.setStudent(student);
			
			result = attendanceService.selectOneAttendanceForNoti(attendance);
		}catch(Exception e){
		}		
		return result;
	}
	
	
	
}