package com.dgit.persistence;

import java.util.List;
import java.util.Map;

import com.dgit.domain.Message;

public interface MessageDAO {

	
	public void insertMessage(Message message) throws Exception;
	public void insertNotCourseMessage(Message message) throws Exception;
	public void updateMessage(Message message) throws Exception;
	public void deleteMessage(int msgNo) throws Exception;
	public Message selectOneMessage(int msgNo) throws Exception;
	public List<Message> selectAllMessage() throws Exception;
	public List<Message> selectMessageByCri(Map<String, Object> map) throws Exception;
	public List<Message> selectMessageByCriForSender(Map<String, Object> map) throws Exception;
	
	
}
