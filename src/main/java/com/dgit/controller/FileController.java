package com.dgit.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.CartCourse;
import com.dgit.domain.Course;
import com.dgit.domain.CourseDetail;
import com.dgit.domain.CourseImage;
import com.dgit.domain.CourseRegister;
import com.dgit.domain.StudentGrade;
import com.dgit.domain.Subject;
import com.dgit.domain.Teacher;
import com.dgit.domain.Timetable;
import com.dgit.service.CartCourseService;
import com.dgit.service.CourseRegisterService;
import com.dgit.service.CourseService;
import com.dgit.service.StudentGradeService;
import com.dgit.service.SubjectService;
import com.dgit.service.TeacherService;
import com.dgit.service.TimetableService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

@Controller
@RequestMapping("/file/*")
public class FileController {
	
	
	
	@Resource(name = "uploadPath") // bean의 id 이름
	String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	
	
	@ResponseBody
	@RequestMapping(value = "displayOriginFile") // displayFile?filename={파일이름}
	public ResponseEntity<byte[]> displayOriginFile(String filename) throws IOException {
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;

		logger.info("========================displayFile=============================");

		try {
			// IOUtils.toByteArray(in) : 해당데이터의 Byte를 꺼내주는 역할
			// 이미지 종류별로 형식이 다르다. byte 배열순이 다름...
			// BMP는 565... jpg는 다르게...
			// >>>>>>>>>> 이미지타입을 알려줘야 한다
			filename = filename.substring(0,filename.indexOf("s_"))+filename.substring(filename.indexOf("s_")+2);
			String formatName = filename.substring(filename.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders header = new HttpHeaders();
			header.setContentType(mType);
			in = new FileInputStream(uploadPath + "/" + filename);

			// [ header | body ] 전송되는 byte 모양...
			// header는 전송하고자 하는 정보... 어디로가니... 사이즈가 얼마다... 저장됨
			// body에는 전송할 data 원본 담겨서 감

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), header, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close(); // 닫지 않으면 메모리 누수 현상
		}

		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "displayFile") // displayFile?filename={파일이름}
	public ResponseEntity<byte[]> displayFile(String filename) throws IOException {
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;

		logger.info("========================displayFile=============================");

		try {
			// IOUtils.toByteArray(in) : 해당데이터의 Byte를 꺼내주는 역할
			// 이미지 종류별로 형식이 다르다. byte 배열순이 다름...
			// BMP는 565... jpg는 다르게...
			// >>>>>>>>>> 이미지타입을 알려줘야 한다
			//filename = filename.substring(0,filename.indexOf("s_"))+filename.substring(filename.indexOf("s_")+2);
			String formatName = filename.substring(filename.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders header = new HttpHeaders();
			header.setContentType(mType);
			in = new FileInputStream(uploadPath + "/" + filename);

			// [ header | body ] 전송되는 byte 모양...
			// header는 전송하고자 하는 정보... 어디로가니... 사이즈가 얼마다... 저장됨
			// body에는 전송할 data 원본 담겨서 감

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), header, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close(); // 닫지 않으면 메모리 누수 현상
		}

		return entity;
	}

	
	
}