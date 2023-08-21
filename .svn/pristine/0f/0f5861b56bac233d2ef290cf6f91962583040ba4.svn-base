package kr.or.ddit.rntCar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.business.service.BsBusiService;
import kr.or.ddit.rntCar.service.BsRntCarService;
import kr.or.ddit.util.PagingDTO;
import kr.or.ddit.vo.BsRsvListVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CheckInVO;
import kr.or.ddit.vo.RsvRntCarVO;
import kr.or.ddit.vo.RsvVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/rntCar")
@Controller
public class BsRntCarMainController {
	
	@Autowired
	BsBusiService bsBusiService;	
	
	@Autowired
	BsRntCarService bsRntCarService;
	
	@GetMapping("/main") // home 페이지
	public String main(Model model, Authentication authentication, HttpSession session
				, @RequestParam(value = "currentPage1", required = false, defaultValue = "1")
				int currentPage1
				, @RequestParam(value = "currentPage2", required = false, defaultValue = "1")
				int currentPage2) {
		//--------시큐리티가 넣어놓은 session에서 username가져오고 Httpsession에 넣는다 -------------//
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();

	        log.info("session getUsername : " + userDetails.getUsername());
			
	        String lginId = userDetails.getUsername();
	        
	        //------------------ 메인 시작 --------------------//
	        //로그인한 회원 정보 가져옴
	        BusiVO busiVO = this.bsBusiService.userDetail(lginId);
	        log.info("busiVO:"+busiVO);
	        String imgPath = this.bsBusiService.getImgPath(busiVO.getBusiId());
	        busiVO.setBusiImg(imgPath);
			
			model.addAttribute("data", busiVO);
			session.setAttribute("vo", busiVO);//로그인한 회원의 로그인아이디 session에 저장
			//----------당일 출고 차량 , 페이징처리 
			String busiId = busiVO.getBusiId();
			
			Map<String,Object> checkInMap = new HashMap<String, Object>();
			checkInMap.put("busiId",busiId);
			checkInMap.put("currentPage",currentPage1);
			int totalIn = this.bsRntCarService.totalIn(busiId);
			
			log.info("checkInMap:"+checkInMap);
			log.info("totalIn:"+totalIn);
			// map으로 넣는걸로 변경해야함
			List<RsvRntCarVO> toDayCar = this.bsRntCarService.todayCar(checkInMap);
			log.info("toDayCar:"+toDayCar);
			
			model.addAttribute("tdCar",new PagingDTO<RsvRntCarVO>(totalIn, currentPage1, 5, toDayCar));
			//----------당일 반납 차량 , 페이징처리 
			Map<String,Object> checkOutMap = new HashMap<String, Object>();
			checkOutMap.put("busiId",busiId);
			checkOutMap.put("currentPage",currentPage2);
			
			List<RsvRntCarVO> toDayRf = this.bsRntCarService.todayRf(checkOutMap);
			
			int totalOut= bsRntCarService.totalOut(busiId);
			
			model.addAttribute("tdRf", new PagingDTO<RsvRntCarVO>(totalOut, currentPage2, 5, toDayRf));
			
			log.info("todayRf:"+toDayRf);
			
			
			return "rntCar/main";
	}
	
	@ResponseBody
	@PostMapping("/main/checkSt")
	public int checkSt(@RequestBody BsRsvListVO rsRsvListVO) {
		String rsvId =rsRsvListVO.getRsvId();
		log.info("아이디:" + rsvId);
		
		int result = this.bsRntCarService.checkSt(rsvId);
		log.info("result:" + result);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/main/checkEd")
	public int checkEd(@RequestBody BsRsvListVO rsRsvListVO) {
		String rsvId =rsRsvListVO.getRsvId();
		log.info("아이디:" + rsvId);
		int result = this.bsRntCarService.checkEd(rsvId);
		log.info("result:" + result);
		return result;
	}
	@ResponseBody
	@PostMapping("/main/plusFee")
	public String plusFee(@RequestParam("rsvId") String rsvId) {
		log.info("추가요금왔다:" );
		
		log.info("아이디:" + rsvId);
		RsvRntCarVO data = this.bsRntCarService.plusFee(rsvId);
		log.info("data:" + data.getCarFee());
		return Integer.toString(data.getCarFee());
	}
}
