package kr.or.ddit.security;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.ddit.vo.BusiVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommonController {
	
	//요청 URI : /accessError
	//접근 거부 처리 메소드
	@GetMapping("/accessError")
	public String accessDenied(Authentication auth, Model model){
		log.info("access Denied : " + auth);
		
		model.addAttribute("msg", "Access Denied");
		
		//forwarding
		return "accessError";
	}
	
	
	//<security:form-login login-page="/login"/> //오류 메시지, 로그아웃 메시지를 파라미터로 준비
	@GetMapping("/login")
	public String login(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);
		System.out.println("로그아웃, 에러시");
		
		if(error != null) {
			model.addAttribute("error", "Login Error");
		}
		if(logout != null) {
			model.addAttribute("logout", "Logout");
		}
		
		//forwarding
		return "redirect:/member/sign/signIn";
	}
	
	
	//일반회원 로그인
	@GetMapping("/member/sign/signIn")
	public String singInMem(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);
		System.out.println("로그인시");
		
		if(error != null) {
			model.addAttribute("error", "Login Error");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout");
		}
		
		return "member/sign/signIn";
	}
	
	
	// 업체 로그인
	@GetMapping("/business/log/bsSignIn") 
	public String signIn(String error, String logout, Model model) {
		
		if(error != null) {
			model.addAttribute("error", "Login Error");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout");
		}
		log.info("여 지나갓나");
		
		return "/business/log/bsSignIn";
	}
	
}
