package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.StudentGrade;

public interface StudentGradeDAO {
	
	public void insertStudentGrade(StudentGrade studentGrade) throws Exception;
	public void updateStudentGrade(StudentGrade studentGrade) throws Exception;
	public StudentGrade selectOneStudentGrade(int gdNo) throws Exception;
	public List<StudentGrade> selectAllStudentGrade() throws Exception;
}
