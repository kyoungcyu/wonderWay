package kr.or.ddit.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.member.service.MmMemService;
import kr.or.ddit.member.service.impl.MmEmailServiceImpl;
import kr.or.ddit.vo.MemVO;

@RequestMapping("/member/email")
@Controller
public class emailController {
	private static final Logger log =LoggerFactory.getLogger(emailController.class);
	
	@Autowired
	MmEmailServiceImpl mmEmailServiceImpl;
	
	//이메일인증시 인증코드
	@PostMapping("/mailCheck")
	@ResponseBody
	public String mailConfirm(@RequestParam("email") String email) throws Exception {
		   String code = mmEmailServiceImpl.sendSimpleMessage(email);
		   System.out.println("인증코드 : " + code);
		   return code;
		}
	
	
	//이메일로 아이디 확인
	@PostMapping("/findIdByEmail")
	@ResponseBody
	public String findIdByEmail(@RequestBody MemVO memVO){
		String memId = mmEmailServiceImpl.findIdByEmail(memVO);
		System.out.println("메일에 맞는 아이디"+memId);
		return memId;
	}
	
	//이메일로 비밀번호 재설정
	@PostMapping("/resetPwByEmail")
	@ResponseBody
	public int resetPwByEmail(@RequestBody MemVO memVO){
		int result = mmEmailServiceImpl.resetPwByEmail(memVO);
		System.out.println(result);
		return result;
	}
	
	
	
}
