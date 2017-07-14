package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.Student;

public interface StudentDAO {

	public void insertStudent(Student Student) throws Exception;
	public void updateStudent(Student Student) throws Exception;
	public void deleteStudent(String sId) throws Exception;
	public Student selectOneStudent(String sId) throws Exception;
	public List<Student> selectAllStudent() throws Exception;
}
