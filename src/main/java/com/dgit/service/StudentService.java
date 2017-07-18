package com.dgit.service;

import java.util.List;

import com.dgit.domain.Student;

public interface StudentService {

	public void insertStudent(Student Student) throws Exception;
	public void updateStudent(Student Student) throws Exception;
	public void deleteStudent(String sId) throws Exception;
	public Student selectOneStudent(String sId) throws Exception;
	public Student login(String sId, String sPassword) throws Exception;
	public List<Student> selectAllStudent() throws Exception;
	public List<Student> selectStudentsByCri(Student student) throws Exception;
	
}
