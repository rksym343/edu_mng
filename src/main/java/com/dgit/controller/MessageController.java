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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.Attendance;
import com.dgit.domain.Course;
import com.dgit.domain.Message;
import com.dgit.service.AttendanceService;
import com.dgit.service.CourseService;
import com.dgit.service.MessageService;

@Controller
@RequestMapping("/message/*")
public class MessageController {

	@Autowired
	private MessageService messageService;

	@Autowired
	private CourseService courseService;

	@Autowired
	private AttendanceService attendanceService;

	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

	@RequestMapping(value = "/readMsg", method = RequestMethod.GET)
	public void getReadMsg(int msgNo, Model model) throws Exception {
		logger.info("==================getReadMsg ================");
		Message message = messageService.selectOneMessage(msgNo);
		model.addAttribute("message", message);
	}

	@RequestMapping(value = "/writeMsg", method = RequestMethod.GET)
	public void getWriteMsg(Model model) throws Exception {
		logger.info("==================getWriteMsg ================");
		String tId = "aaa01";
		List<Course> courseList = courseService.selectCoursesByCri("", tId, 0, 0);
		model.addAttribute("courseList", courseList);
	}

	@Transactional
	@RequestMapping(value = "/writeMsg", method = RequestMethod.POST)
	public String postWriteMsg(String[] sId, String[] pId, String cName, Message message, Model model)
			throws Exception {
		logger.info("==================postWriteAllMsg ================");
		logger.info("==================message : " + message);
		logger.info("==================cName : " + cName);
		String msg = "";
		if (!cName.equals("")) {
			msg = String.format("[ %s ] %s", cName, message.getMsgContent());
		} else {
			msg = message.getMsgContent();
		}
		message.setMsgContent(msg);
		if (sId != null) {

			for (String ss : sId) {
				logger.info("==================sId[] : " + ss);
				message.setsId(ss);
				messageService.insertMessage(message);
			}
		}

		if (pId != null) {

			for (String pp : pId) {
				logger.info("==================pId[] : " + pp);
				message.setsId(null);
				message.setSpId(pp);
				messageService.insertMessage(message);
			}
		}
		return "redirect:listMySendMsg";
	}

	@RequestMapping(value = "/writeAllMsg", method = RequestMethod.GET)
	public void getWriteAllMsg(Model model) throws Exception {
		logger.info("==================getWriteAllMsg ================");
	}

	@RequestMapping(value = "/writeAllMsg", method = RequestMethod.POST)
	public String postWriteAllMsg(String memberType, Message message, Model model) throws Exception {
		logger.info("==================postWriteAllMsg ================");
		logger.info("==================memberType : " + memberType);
		logger.info("==================message : " + message);
		if (memberType.equalsIgnoreCase("student")) {
			messageService.insertMessageToAllStudent(message);
		} else if (memberType.equalsIgnoreCase("parents")) {
			messageService.insertMessageToAllParents(message);
		} else {
			messageService.insertMessageToAll(message);
		}
		return "redirect:listMySendMsg";
	}

	@RequestMapping(value = "/listMsg", method = RequestMethod.GET)
	public void getListMsg(Model model) throws Exception {
		logger.info("==================getListMsg ================");
	}

	@RequestMapping(value = "/listMsg/{memberType}/{id}/{cnt}", method = RequestMethod.GET)
	public ResponseEntity<List<Message>> getListMsgById(@PathVariable("memberType") String memberType,
			@PathVariable("id") String id, @PathVariable("cnt") int cnt) throws Exception {
		ResponseEntity<List<Message>> entity = null;
		logger.info("==================viewStudentExam /{sId}/{cNo}  GET================");
		logger.info("================== id : " + id);
		try {
			List<Message> list = messageService.selectMessageByCri("", 0, memberType, id, false, true, false, false,
					cnt, true);
			entity = new ResponseEntity<List<Message>>(list, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<Message>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/listMsg/{memberType}/{id}/{cnt}/{cNo}", method = RequestMethod.GET)
	public ResponseEntity<List<Message>> getListMsgById(@PathVariable("memberType") String memberType,
			@PathVariable("id") String id, @PathVariable("cnt") int cnt, @PathVariable("cNo") int cNo)
			throws Exception {
		ResponseEntity<List<Message>> entity = null;
		logger.info("==================getListMsgById /{sId}/{cNo}  GET================");
		logger.info("================== id : " + id);
		try {
			List<Message> list = messageService.selectMessageByCri("", cNo, memberType, id, false, true, false, false,
					cnt, true);
			entity = new ResponseEntity<List<Message>>(list, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<Message>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/listMySendMsg", method = RequestMethod.GET)
	public void getListMySendMsg(Model model) throws Exception {
		logger.info("==================getListMySendMsg ================");
	}

	@RequestMapping(value = "/listMySendMsg/{id}", method = RequestMethod.GET)
	public ResponseEntity<List<Message>> getListMySendMsgById(@PathVariable("id") String id) throws Exception {
		ResponseEntity<List<Message>> entity = null;
		logger.info("==================getListMySendMsgById /{Id}/  GET================");
		logger.info("================== id : " + id);
		try {
			List<Message> list = messageService.selectMessageByCri(id, 0, "", "", true, true, false, false, 0, true);
			entity = new ResponseEntity<List<Message>>(list, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<Message>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@Transactional
	@RequestMapping(value = "/readMsg/{msgNo}", method = RequestMethod.GET)
	public ResponseEntity<Message> getMyMsgByNo(@PathVariable("msgNo") int msgNo) throws Exception {
		ResponseEntity<Message> entity = null;
		logger.info("==================getListMySendMsgById /{Id}/  GET================");
		logger.info("================== msgNo : " + msgNo);
		try {
			Message message = messageService.selectOneMessage(msgNo);
			Message newMsg = new Message();
			newMsg.setMsgNo(msgNo);
			newMsg.setChecked(true);
			messageService.updateMessage(newMsg);
			entity = new ResponseEntity<>(message, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@Transactional
	@RequestMapping(value = "android/readMsg/{msgNo}", method = RequestMethod.GET)
	public @ResponseBody Message getMyMsgByNoForAndroid(@PathVariable("msgNo") int msgNo) throws Exception {
		Message message = null;
		logger.info("==================getListMySendMsgById /{Id}/  GET================");
		logger.info("================== msgNo : " + msgNo);
		try {
			message = messageService.selectOneMessage(msgNo);
			Message newMsg = new Message();
			newMsg.setMsgNo(msgNo);
			newMsg.setChecked(true);
			messageService.updateMessage(newMsg);
		} catch (Exception e) {
		}

		return message;
	}

	@RequestMapping(value = "/deleteMsg/{msgNo}", method = RequestMethod.GET)
	public ResponseEntity<String> deleteMyMsgByNo(@PathVariable("msgNo") int msgNo) throws Exception {
		ResponseEntity<String> entity = null;
		logger.info("==================deleteMyMsgByNo /{msgNo}/  GET================");
		logger.info("================== msgNo : " + msgNo);
		try {
			messageService.deleteMessage(msgNo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	/*-------------------------------------------For Android-------------------------------------------------*/

	@ResponseBody
	@Transactional
	@RequestMapping(value = "android/newMsgs/{memberType}/{id}", method = RequestMethod.GET)
	public Map<String, Object> getListMsgByIdForAndroid(@PathVariable("memberType") String memberType,
			@PathVariable("id") String id) throws Exception {
		List<Message> list = null;
		Map<String, Object> map = new HashMap<>();
		Integer cnt = 0;
		logger.info("==================newMsgs/{memberType}/{id}/  GET================");
		logger.info("================== id : " + id);
		try {
			list = messageService.selectMessageByCri("", 0, memberType, id, false, false, false, false, 0, false);
			cnt = messageService.selectNewSendMessage(memberType, id, true);
			messageService.updateSendMessage(memberType, id);
			
			map.put("cnt", cnt);
			map.put("list", list);
		} catch (Exception e) {
		}
		return map;
	}

	@Transactional
	@RequestMapping(value = "/android/newMsgs/{memberType}/{id}/{curDate}", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getMainMsgNAttendForAndroid(@PathVariable("memberType") String memberType,
			@PathVariable("id") String id, @PathVariable("curDate") String curDate) throws Exception {
		Map<String, Object> map = new HashMap<>();
		// List<Message> msgList = null;
		List<Attendance> attendList = null;
		Integer msgCnt = 0;
		// Map<String, Object> map = null;
		Integer cnt = 0;
		logger.info("==================/android/newMsgs/{memberType}/{id}/{curDate}  GET================");
		logger.info("================== memberType : " + memberType);
		logger.info("================== id : " + id);
		logger.info("================== curDate : " + curDate);
		try {
			// msgList = messageService.selectMessageByCri("", 0, memberType,
			// id, false, false, false, false, 0, true);
			logger.info("msgCnt before : ", msgCnt);
			msgCnt = messageService.selectNewSendMessage(memberType, id, false);
			attendList = attendanceService.selectAttenddanceByDate(curDate);
			// messageService.updateSendMessage(memberType, id);
			// map.put("msgList", msgList);
			logger.info("msgCnt after : " + msgCnt);
			map.put("msgCnt", msgCnt);
			map.put("attendList", attendList);
			logger.info("msg ctr : msgCnt = " + msgCnt);
			logger.info("msg ctr : map = " + map.toString());
		} catch (Exception e) {
		}
		return map;
	}

}