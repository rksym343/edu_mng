package com.dgit.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.CartCourse;
import com.dgit.domain.Timetable;
import com.dgit.service.CartCourseService;
import com.dgit.service.TimetableService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class CartTest {

	@Autowired
	private CartCourseService service;
	
	@Autowired
	private TimetableService tableService;
	
	@Test
	public void testSessionss() throws Exception {
		List<CartCourse> list = service.selectAllCoursesBySId("sss01");
		for(CartCourse cc : list){
			System.out.println(cc.toString());
		}
	}
	
	@Test
	public void testSdessionss() throws Exception {
		List<Timetable> list = tableService.selectAllTimetable();
		System.out.println("TimeTable==========================");
		for(Timetable cc : list){
			System.out.println(cc.toString());
		}
	}
}
