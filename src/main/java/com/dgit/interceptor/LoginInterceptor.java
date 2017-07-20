package com.dgit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dgit.domain.Parents;
import com.dgit.domain.Student;
import com.dgit.domain.Teacher;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	public static final String MEMBER_ID = "memberId";
	public static final String MEMBER_TYPE = "memberType";
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("==========================LoginInterceptor preHandle=============================");
		return true; // return true시 해당 컨트롤러로 이동해도 된다는 표시
	}


	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("==========================LoginInterceptor POST HANDLER=============================");
		String memberType = (String) modelAndView.getModel().get("memberType");
		Object member = modelAndView.getModel().get("model");
		
		if(member == null){
			response.sendRedirect("login"); // 원래 회원가입화면으로 유도해야 함..
			
		}else{
			// 로그인시 session영역에 login한 사람 정보를 넣음...
			
			HttpSession session = request.getSession();
			
			String id = "";
			if(memberType.equalsIgnoreCase("student")){
				Student student = (Student) member;
				id = student.getsId();
			}else if(memberType.equalsIgnoreCase("parents")){
				Parents parents = (Parents) member;
				id = parents.getSpId();
			}else if(memberType.equalsIgnoreCase("teacher")){
				Teacher teacher = (Teacher) member;
				id = teacher.gettId();
			}
			
			session.setAttribute(MEMBER_TYPE, memberType);
			session.setAttribute(MEMBER_ID, id);
			
			
			// 로그인 이전에 이동될 uri가 있다면 dest에 저장해둠
			// 저장된 dest의 값을 받아 그곳으로 이동되도록..
			String path = (String) session.getAttribute("dest");
			System.out.println("=======path : " + path);	
			if(path != null){
				response.sendRedirect(path);
			}
			
		}	
		
	}

	
	
	
}