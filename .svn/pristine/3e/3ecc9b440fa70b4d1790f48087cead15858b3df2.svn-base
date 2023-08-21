package kr.or.ddit.util.websocket.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
import kr.or.ddit.business.service.BsCheckInService;
import kr.or.ddit.util.websocket.service.WsService;
import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CheckInVO;
import kr.or.ddit.vo.MemVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/alarm")
@Controller
public class AlarmController {
	
	@Autowired
	WsService wsService;
	
	// MEM, BUSI, ADMIN 공용
	@ResponseBody
	@PostMapping("/insertAjax")
	public ResponseEntity<Integer> insertAjax(@RequestBody AlarmVO alarmVO) {
		// 알람테이블에추가
		int cnt = wsService.insertAlarm(alarmVO);
		
		return ResponseEntity.ok(cnt);
	}
	//MEM
	@ResponseBody
	@PostMapping("/memSelectAlarmAjax")
	public ResponseEntity<List<AlarmVO>> memselectAlarmAjax(HttpSession session, Principal principal) {
		// mem_id가져오기
		String memId = "";
		if(principal!=null) {
			memId = principal.getName();
		}
		
		// 알림테이블 싹 가져오기
		List<AlarmVO> listAlm = wsService.selectAllAlarms(memId);
		log.info(listAlm.toString()+"여기야여기");
		return ResponseEntity.ok(listAlm);
	}
	//MEM
	@ResponseBody
	@PostMapping("/memDeleteAlarmAjax")
	public ResponseEntity<Integer> memDeleteAlarmAjax(HttpSession session, Principal principal) {
		// mem_id가져오기
		String memId = "test01";
		if(principal!=null) {
			memId = principal.getName();
		}
				
		// 알림테이블 지우기
		int cnt = wsService.deleteAllAlarms(memId);
		return ResponseEntity.ok(cnt);
	}
	//BUSI
	@ResponseBody
	@PostMapping("/busiSelectAlarmAjax")
	public ResponseEntity<List<AlarmVO>> busiSelectAlarmAjax(HttpSession session) {
		// busi_id가져오기(business만 사용가능)
		BusiVO busiVO = (BusiVO) session.getAttribute("vo");
		System.out.println("busiId:"+busiVO.getBusiId());
		String busiId = busiVO.getBusiId();
		// 알림테이블 싹 가져오기
		List<AlarmVO> listAlm = wsService.selectAllAlarms(busiId);
		
		return ResponseEntity.ok(listAlm);
	}
	//BUSI
	@ResponseBody
	@PostMapping("/busiDeleteAlarmAjax")
	public ResponseEntity<Integer> busiDeleteAlarmAjax(HttpSession session) {
		// busi_id가져오기(business만 사용가능)
		BusiVO busiVO = (BusiVO) session.getAttribute("vo");
		System.out.println("busiId:"+busiVO.getBusiId());
		String busiId = busiVO.getBusiId();
		// 알림테이블 지우기
		int cnt = wsService.deleteAllAlarms(busiId);
		return ResponseEntity.ok(cnt);
	}
	
	//ADMIN
	@ResponseBody
	@PostMapping("/adminSelectAlarmAjax")
	public ResponseEntity<List<AlarmVO>> adminSelectAlarmAjax(HttpSession session) {
		// busi_id가져오기(business만 사용가능)
		AdminVO adminVO = (AdminVO) session.getAttribute("vo");
		String adminId = adminVO.getAdminId();
		// 알림테이블 싹 가져오기
		List<AlarmVO> listAlm = wsService.selectAllAlarms(adminId);
		
		return ResponseEntity.ok(listAlm);
	}
	//ADMIN
	@ResponseBody
	@PostMapping("/adminDeleteAlarmAjax")
	public ResponseEntity<Integer> adminDeleteAlarmAjax(HttpSession session) {
		AdminVO adminVO = (AdminVO) session.getAttribute("vo");
		String adminId = adminVO.getAdminId();
		// 알림테이블 지우기
		int cnt = wsService.deleteAllAlarms(adminId);
		return ResponseEntity.ok(cnt);
	}
	
}
