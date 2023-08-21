package kr.or.ddit.business.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.business.service.BsMsgService;
import kr.or.ddit.util.PagingDTO;
import kr.or.ddit.business.service.BsBusiService;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.MsgVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/business/inquiry")
@Controller
public class BsInquryController {

	@Autowired
	BsMsgService bsMsgService;
	@Autowired
	BsBusiService bsBusiService;

	@GetMapping("/msgbox")
	public String sendMsg(Model model, HttpSession session
		   ,@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
			) {
		log.info("왔다");
		// 쪽지함과 페이징정보 같이 보내야해서 map 선언
		BusiVO vo = (BusiVO) session.getAttribute("vo");
		String busiId = vo.getBusiId();
		Map<String,Object> sendMap = new HashMap<String, Object>();
		Map<String,Object> recvMap = new HashMap<String, Object>();
		
		// 1-1. 쿼리에서 사용 할 map 채우기
		recvMap.put("busiId", vo.getBusiId());
		recvMap.put("currentPage",currentPage);
		// 1-2. 받은쪽지함 불러오기 + model에 pagingDTO객체에 
		List<MsgVO> recvdata = this.bsMsgService.recvMsg(recvMap);
		int recvTotal = this.bsMsgService.recvTotal(vo.getBusiId());
		model.addAttribute("recvdata", new PagingDTO<MsgVO>(recvTotal, currentPage, 5, recvdata));
		
		// 2-1. 쿼리에서 사용 할 map 채우기
		sendMap.put("busiId", vo.getBusiId());
		sendMap.put("currentPage",currentPage);
		// 2-2. 보낸쪽지 + total + model
		List<MsgVO> senddata = this.bsMsgService.sendMsg(sendMap);
		int sendTotal = this.bsMsgService.sendTotal(vo.getBusiId());
		model.addAttribute("senddata", new PagingDTO<MsgVO>(sendTotal, currentPage, 5, senddata));
		model.addAttribute("pageFix", 1);
		
		// 3.1개월간 예약한 모든 회원이름 가져오기
		List<String> rsvNmList = this.bsMsgService.rsvNmList(busiId);
		model.addAttribute("rsvNmList",rsvNmList);
		
		
		return "business/inquiry/msgbox";
	}

	@ResponseBody
	@PostMapping("/msgInsert")
	public int msgInsert(@RequestBody MsgVO msgVO, HttpSession session) {
		log.info("sessionn:" + session.getAttribute("vo"));
		BusiVO busiVO = (BusiVO) session.getAttribute("vo");
		
		msgVO.setSendId(busiVO.getBusiId());
		msgVO.setSendNm(busiVO.getBusiNm());
		log.info("msgVO00:" + msgVO);
		
		
		//쪽지함 insert
		int cnt = this.bsMsgService.msgInsert(msgVO);
		return cnt;
	}

	@GetMapping("/chatting")
	public String chattings(Model model, HttpSession session) {
		log.info("chat");
		
		BusiVO busiVO = (BusiVO) session.getAttribute("vo");
		System.out.println("채팅페이지 가기전 busiVO확인"+busiVO);
		model.addAttribute("data", busiVO);
		
		return "business/inquiry/chatting";
	}
	
	
	@GetMapping("/adminChatting")
	public String adminChatting(Model model, HttpSession session) {
		log.info("adminChatting");
		return "business/inquiry/adminChatting";
	}
	
	

}
