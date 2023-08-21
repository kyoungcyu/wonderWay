package kr.or.ddit.business.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.business.service.BsCalculService;
import kr.or.ddit.business.service.BsParkingService;
import kr.or.ddit.util.PagingDTO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CalculVO;
import kr.or.ddit.vo.ParkingVO;
import kr.or.ddit.vo.RvwVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/business")
@Controller
public class BsParkingController {
	@Autowired
	BsParkingService bsParkingService;
	
	
	@GetMapping("/parking") // 주차장 현황 페이지
	public String parking(HttpSession session, Model model) {
		BusiVO busiVO = (BusiVO) session.getAttribute("vo");
		String busiId = busiVO.getBusiId();
		
		List<ParkingVO> parkingList = bsParkingService.parkingList(busiId);
		
		model.addAttribute("parkingList", parkingList);
		
		return "business/parking/parking";
	}
	
	@ResponseBody
	@PostMapping("/reparking")
	public ResponseEntity<List<ParkingVO>> parkingAjax(HttpSession session) {
	    BusiVO busiVO = (BusiVO) session.getAttribute("vo");
	    String busiId = busiVO.getBusiId();

	    List<ParkingVO> parkingList = bsParkingService.parkingList(busiId);
	    
	    log.info(parkingList.toString());

	    return ResponseEntity.ok(parkingList);
	}
	
	@GetMapping("/parking/testing01") // test01번 정지은
	public String testing01() {
		return "business/parking/parkingTesting01";
	}
	
	@GetMapping("/parking/testing02") // test02번 유대석
	public String testing02() {
		return "business/parking/parkingTesting02";
	}
	
	
	
	
	
}
