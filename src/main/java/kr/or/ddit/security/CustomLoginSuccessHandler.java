package kr.or.ddit.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,	HttpServletResponse response, Authentication auth) 
			throws ServletException, IOException {
		log.warn("onAuthenticationSuccess");
		
		//auth.getPrincipal() : 사용자 정보를 가져옴
		//시큐리티에서 사용자 정보는 User 클래스의 객체로 저장됨(CustomUser.java를 참고)
		User customUser = (User)auth.getPrincipal();
		
		//사용자 아이디를 리턴
		log.info("customUser.getUsername() : " + customUser.getUsername());
		
		
		//로그인 성공시 나오는 페이지 url 설정-사용자,업체,멤버 다르게 
		List<String> roleNames = new ArrayList<String>();
		auth.getAuthorities().forEach(authority->{
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES : "+roleNames);
	
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/member/main");
			return;
		}
		
		if(roleNames.contains("ROLE_BUSI")) {
			response.sendRedirect("/business/main?currentPage1=1&currentPage2=1");
			return;
		}
		if(roleNames.contains("ROLE_RNTCAR")) {
			response.sendRedirect("/rntCar/main");
			return;
		}
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/admin/main");
			return;
		}
		
		
		//부모(super)에게 반납
		super.onAuthenticationSuccess(request, response, auth);
	}
	
}






