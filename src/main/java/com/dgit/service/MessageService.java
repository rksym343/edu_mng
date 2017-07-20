package com.dgit.service;

import java.util.List;

import com.dgit.domain.Message;

public interface MessageService {

	
	public void insertMessage(Message message) throws Exception;
	public void insertMessageToAllStudent(Message message) throws Exception;
	public void insertMessageToAllParents(Message message) throws Exception;
	public void insertMessageToAll(Message message) throws Exception;
	public void updateMessage(Message message) throws Exception;
	public void deleteMessage(int msgNo) throws Exception;
	public Message selectOneMessage(int msgNo) throws Exception;
	public List<Message> selectAllMessage() throws Exception;
	public List<Message> selectMessageByCri(String tId, int cNo, String memberType, String id, boolean isAll, boolean isChecked, int cnt) throws Exception;
}
