package kr.or.ddit.member.controller;

import java.io.IOException;
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

import kr.or.ddit.member.service.MmKaKaoService;
import kr.or.ddit.member.service.MmMemService;
import kr.or.ddit.vo.MemVO;

@RequestMapping("/member/sign")
@Controller
public class SignController {
	private static final Logger log =LoggerFactory.getLogger(SignController.class);
	
	@Autowired
	MmMemService memService;
	
	//아이디 찾기
	@GetMapping("/forgotId")
	public String forgotId(@ModelAttribute("memVO") MemVO memVO) {
		
		return "member/sign/forgotId";
		
	}
	
	//비밀번호 재설정 
	@GetMapping("/forgotPw")
	public String forgotPw(@ModelAttribute("memVO") MemVO memVO) {
		
		return "member/sign/forgotPw";
		
	}
	
	//회원가입
	@GetMapping("/signUp")
	public String signUp(@ModelAttribute("memVO") MemVO memVO) {
		
		return "member/sign/signUp";
		
	}
	
	
	@PostMapping("/signUpPost")
	public String signUpPost(@Validated @ModelAttribute("memVO") MemVO memVO, BindingResult result ) {
		log.info("error : " + result.hasErrors());
		log.info("memVO : " + memVO);


		if(result.hasErrors()) {
			List<ObjectError> allErrors = result.getAllErrors();
			List<ObjectError> globalErrors = result.getGlobalErrors();
			List<FieldError> fieldErrors = result.getFieldErrors();
			
			for(ObjectError objectError: allErrors) {
				log.error("allError:"+objectError);
			}
			for(ObjectError objectError: globalErrors) {
				log.error("globalError:"+objectError);
			}
			for(FieldError fieldError: fieldErrors) {
				log.error("fieldError:"+fieldError.getDefaultMessage());
			}
			//forwarding(유효성 검사 결과 오류 발생 시) / redirect는 안됨(재요청)->오류정보가 사라짐
			return "member/sign/signUp";
		}
			
		int mResult=this.memService.registerMem(memVO);
		
		return "redirect:/member/main";
	}
	
	
	//아이디중복검사
	@ResponseBody
	@PostMapping("/checkMemId")
	public Map<String,String> checkMemId(@RequestBody MemVO memVO){
		log.info("memVO:"+memVO);
		
		int result=this.memService.checkMemId(memVO);
		log.info("result:"+result);
		
		Map<String,String> map=new HashMap<String,String>();
		map.put("result",result+"");
		
		return map;
		
	}
	
	//이메일중복검사
	@ResponseBody
	@PostMapping("/checkMemEmail")
	public Map<String,String> checkMemEmail(@RequestBody MemVO memVO){
		log.info("memVO:"+memVO);
		
		int result=this.memService.checkMemEmail(memVO);
		log.info("result:"+result);
		
		Map<String,String> map=new HashMap<String,String>();
		map.put("result",result+"");
		
		return map;
		
	}
	
	
	//카카오로그인
	@Autowired
    MmKaKaoService kakaoService;

    @GetMapping("/do")
    public String loginPage(){
        return "kakaoCI/login";
    }

    @GetMapping("/kakaoLogin")
    public String getCI(@RequestParam String code, Model model) throws IOException {
        System.out.println("code = " + code);
        String access_token = kakaoService.getToken(code); 
        Map<String, Object> userInfo = kakaoService.getUserInfo(access_token);
        model.addAttribute("code", code);
        model.addAttribute("access_token", access_token);
        model.addAttribute("userInfo", userInfo);

        //ci는 비즈니스 전환후 검수신청 -> 허락받아야 수집 가능
        return "member/main";
    }
	
}
