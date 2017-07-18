package com.dgit.controller;

import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.Attendance;
import com.dgit.domain.AttendanceStatus;
import com.dgit.service.AttendanceService;
import com.dgit.service.AttendanceStatusService;

@FixMethodOrder
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class AttendanceStatusTest {

	@Autowired
	private AttendanceStatusService service;
	
	@Autowired
	private AttendanceService attendanceService;
	
	@Test
	public void AtestSessionss() throws Exception {
		List<AttendanceStatus> list = service.selectAllAttendanceStatus();
		System.out.println("=========================== AttendanceStatus List ========================");
		for(AttendanceStatus cc : list){
			System.out.println(cc.toString());
		}
	}
	
	@Test
	public void BtestSessionss() throws Exception {
		List<Attendance> list = attendanceService.selectAllAttendance();
		System.out.println("=========================== Attendance List ========================");
		for(Attendance cc : list){
			System.out.println(cc.toString());
		}
	}
	
	
}
