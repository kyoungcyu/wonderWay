package kr.or.ddit.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/member/airplane")
@Controller
public class AirplaneController {
	
	@GetMapping("/main")
	public String main() {
		return "member/airplane/main";
	}
}
