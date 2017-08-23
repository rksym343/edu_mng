package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.Student;
import com.dgit.persistence.StudentDAO;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDAO dao;

	@Override
	public void insertStudent(Student Student) throws Exception {
		dao.insertStudent(Student);
	}

	@Override
	public void updateStudent(Student Student) throws Exception {
		dao.updateStudent(Student);
	}

	@Override
	public void deleteStudent(String sId) throws Exception {
		dao.deleteStudent(sId);
	}

	@Override
	public Student selectOneStudent(String sId) throws Exception {
		Student student = dao.selectOneStudent(sId);
		if(student.getsPicture() == null){
			String sPic = "/basic/user.png";
			student.setsPicture(sPic);
		}
		return student;
	}

	@Override
	public Student login(String sId, String sPassword) throws Exception {
		return dao.login(sId, sPassword);
	}

	@Override
	public List<Student> selectAllStudent() throws Exception {
		return dao.selectAllStudent();
	}

	@Override
	public List<Student> selectStudentsByCri(Student student) throws Exception {
		return dao.selectStudentsByCri(student);
	}

	
}
