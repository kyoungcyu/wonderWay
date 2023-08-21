package kr.or.ddit.business.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.business.service.impl.BsEmailServiceImpl;
import kr.or.ddit.member.controller.emailController;
import kr.or.ddit.member.service.impl.MmEmailServiceImpl;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.MemVO;

@RequestMapping("/busi/email")
@Controller
public class BsEmailController {
	private static final Logger log =LoggerFactory.getLogger(emailController.class);

	@Autowired
	
	BsEmailServiceImpl bsEmailServiceImpl;
	
	//이메일인증시 인증코드
		@PostMapping("/mailCheck")
		@ResponseBody
		public String mailConfirm(@RequestParam("email") String email) throws Exception {
			   String code = bsEmailServiceImpl.sendSimpleMessage(email);
			   System.out.println("인증코드 : " + code);
			   return code;
			}

		//이메일로 아이디 확인
		@PostMapping("/findIdByEmail")
		@ResponseBody
		public String findIdByEmail(@RequestBody BusiVO busiVO){
			String lginId = bsEmailServiceImpl.findIdByEmail(busiVO);
			System.out.println("메일에 맞는 아이디"+lginId);
			return lginId;
		}
		
		//이메일로 비밀번호 재설정
		@PostMapping("/resetPwByEmail")
		@ResponseBody
		public int resetPwByEmail(@RequestBody BusiVO busiVO){
			int result = bsEmailServiceImpl.resetPwByEmail(busiVO);
			System.out.println(result);
			return result;
		}
		
		
	
}
