package com.dgit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Message;
import com.dgit.domain.Parents;
import com.dgit.domain.Student;
import com.dgit.persistence.MessageDAO;
import com.dgit.persistence.ParentsDAO;
import com.dgit.persistence.StudentDAO;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO dao;
	
	@Autowired
	private ParentsDAO parentsDAO;
	
	@Autowired
	private StudentDAO studentDAO;

	@Override
	public void insertMessage(Message message) throws Exception {
		if(message.getcNo() == 0){
			dao.insertNotCourseMessage(message);
		}else{
			dao.insertMessage(message);
		}
	}

	@Override
	public void updateMessage(Message message) throws Exception {
		dao.updateMessage(message);
	}

	@Override
	public void deleteMessage(int msgNo) throws Exception {
		dao.deleteMessage(msgNo);
	}

	@Override
	public Message selectOneMessage(int msgNo) throws Exception {
		return dao.selectOneMessage(msgNo);
	}

	@Override
	public List<Message> selectAllMessage() throws Exception {
		return dao.selectAllMessage();
	}

	@Override
	public List<Message> selectMessageByCri(
			String tId, int cNo, String memberType, String id, boolean isSender, boolean isAll, 
			boolean isChecked, boolean isDel, int cnt, boolean isSent) throws Exception {
		Map<String, Object> map = new HashMap<>();
		if(cNo != 0){
			map.put("cNo", cNo);
		}
		
		if(memberType.equalsIgnoreCase("student")){
			map.put("sId", id);
		}else if(memberType.equalsIgnoreCase("parents")){
			map.put("spId", id);
		}
		
		if(!isAll){
			if(isChecked){
				map.put("isChecked", "isChecked");
			}else{
				map.put("unchecked", "unchecked");
			}
			
		}
		

		if(!isSent){
			map.put("isSent", 0);
		}
		
		if(!isSender){
			if(isDel){
				map.put("isDel","isDel" );
			}else{
				map.put("isAlive", "isAlive");
			}
		}
		
		
		if(cnt != 0){
			map.put("cnt", cnt);
		}
		if(!tId.equals("")){
			map.put("tId", tId);	
			return dao.selectMessageByCriForSender(map);
		}
		return dao.selectMessageByCri(map);
	}
	

	@Override
	@Transactional
	public void insertMessageToAllStudent(Message message) throws Exception {
		List<Student> list = studentDAO.selectAllStudent();
		for(Student item : list){
			message.setsId(item.getsId());
			insertMessage(message);
		}
	}

	@Override
	@Transactional
	public void insertMessageToAllParents(Message message) throws Exception {
		List<Parents> list = parentsDAO.selectAllParents();
		for(Parents item : list){
			message.setSpId(item.getSpId());
			insertMessage(message);
		}
	}

	@Override
	@Transactional
	public void insertMessageToAll(Message message) throws Exception {
		insertMessageToAllStudent(message);
		message.setsId(null);
		insertMessageToAllParents(message);
	}

	@Override
	public int selectNewSendMessage(String memberType, String id, boolean isSent) throws Exception {
		System.out.println("MSG SERVICE selectNewSendMessage");
		System.out.println("selectNewSendMessage - memberType : " +memberType);
		System.out.println("selectNewSendMessage - id : " +id);
		System.out.println("selectNewSendMessage - id : " +id);
		
		return dao.selectNewSendMessage(memberType, id, isSent);
	}

	@Override
	public void updateSendMessage(String memberType, String id) throws Exception {
		dao.updateSendMessage(memberType, id);
	}

	

}
