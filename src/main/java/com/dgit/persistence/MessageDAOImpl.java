package com.dgit.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Examination;
import com.dgit.domain.Message;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
		@Autowired
		private SqlSession session;

		private static String namespace = "com.dgit.mapper.MessageMapper";

		@Override
		public void insertMessage(Message message) throws Exception {
			session.insert(namespace+".insertMessage", message);
		}
		

		@Override
		public void insertNotCourseMessage(Message message) throws Exception {
			session.insert(namespace+".insertNotCourseMessage", message);
		}

		@Override
		public void updateMessage(Message message) throws Exception {
			session.update(namespace+".updateMessage", message);
		}

		@Override
		public void deleteMessage(int msgNo) throws Exception {
			session.update(namespace+".deleteMessage", msgNo);
		}

		@Override
		public Message selectOneMessage(int msgNo) throws Exception {
			return session.selectOne(namespace+".selectOneMessage", msgNo);
		}

		@Override
		public List<Message> selectAllMessage() throws Exception {
			return session.selectList(namespace+".selectAllMessage");
		}

		@Override
		public List<Message> selectMessageByCri(Map<String, Object> map) throws Exception {
			return session.selectList(namespace+".selectMessageByCri", map);
		}



	
}
