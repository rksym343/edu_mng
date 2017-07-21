package com.dgit.controller;

import java.util.List;

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

import com.dgit.domain.Course;
import com.dgit.domain.Message;
import com.dgit.service.CourseRegisterService;
import com.dgit.service.CourseService;
import com.dgit.service.MessageService;

@Controller
@RequestMapping("/message/*")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private CourseService courseService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	
	@RequestMapping(value="/writeMsg", method=RequestMethod.GET)
	public void getWriteMsg(Model model) throws Exception{
		logger.info("==================getWriteMsg ================");
		String tId="aaa01";
		List<Course> courseList = courseService.selectCoursesByCri("", tId, 0, 0);
		model.addAttribute("courseList", courseList);
	}

	@Transactional
	@RequestMapping(value="/writeMsg", method=RequestMethod.POST)
	public String postWriteMsg(String[] sId, String[] pId, String cName, Message message, Model model) throws Exception{
		logger.info("==================postWriteAllMsg ================");
		logger.info("==================message : " + message);
		logger.info("==================cName : " + cName);
		String msg = "";
		if(!cName.equals("")){
			msg = String.format("[ %s ] %s", cName, message.getMsgContent());
		}else{
			 msg = message.getMsgContent();
		}
		message.setMsgContent(msg);
		for(String ss : sId){
			logger.info("==================sId[] : " + ss);
			message.setsId(ss);
			messageService.insertMessage(message);
		}
		for(String pp : pId){
			logger.info("==================pId[] : " + pp);
			message.setsId(null);
			message.setSpId(pp);
			messageService.insertMessage(message);
		}
		return "redirect:listMySendMsg";
	}
	
	
	@RequestMapping(value="/writeAllMsg", method=RequestMethod.GET)
	public void getWriteAllMsg(Model model) throws Exception{
		logger.info("==================getWriteAllMsg ================");
	}
	@RequestMapping(value="/writeAllMsg", method=RequestMethod.POST)
	public String postWriteAllMsg(String memberType, Message message, Model model) throws Exception{
		logger.info("==================postWriteAllMsg ================");
		logger.info("==================memberType : " + memberType);
		logger.info("==================message : " + message);
		if(memberType.equalsIgnoreCase("student")){
			messageService.insertMessageToAllStudent(message);
		}else if(memberType.equalsIgnoreCase("parents")){
			messageService.insertMessageToAllParents(message);
		}else{
			messageService.insertMessageToAll(message);
		}
		return "redirect:listMySendMsg";
	}
	
	@RequestMapping(value="/listMsg", method=RequestMethod.GET)
	public void getListMsg(Model model) throws Exception{
		logger.info("==================getListMsg ================");
	}
	
	@RequestMapping(value="/listMsg/{memberType}/{id}/{cnt}", method=RequestMethod.GET)
	public ResponseEntity<List<Message>> getListMsgById(
			@PathVariable("memberType") String memberType, @PathVariable("id") String id, @PathVariable("cnt") int cnt) throws Exception{
		ResponseEntity<List<Message>> entity = null;
		logger.info("==================viewStudentExam /{sId}/{cNo}  GET================");
		logger.info("================== id : " +id);
		try{
			List<Message> list = messageService.selectMessageByCri("", 0, memberType, id, true, false, cnt);
			entity = new ResponseEntity<List<Message>>(list, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<List<Message>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value="/listMySendMsg", method=RequestMethod.GET)
	public void getListMySendMsg(Model model) throws Exception{
		logger.info("==================getListMySendMsg ================");
	}
	
	@RequestMapping(value="/listMySendMsg/{id}", method=RequestMethod.GET)
	public ResponseEntity<List<Message>> getListMySendMsgById(@PathVariable("id") String id) throws Exception{
		ResponseEntity<List<Message>> entity = null;
		logger.info("==================getListMySendMsgById /{Id}/  GET================");
		logger.info("================== id : " +id);
		try{
			List<Message> list = messageService.selectMessageByCri(id, 0, "", "", true, false, 0);
			entity = new ResponseEntity<List<Message>>(list, HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<List<Message>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	
	
}