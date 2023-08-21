package kr.or.ddit.rntCar.controller;

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

import kr.or.ddit.business.service.BsRmService;
import kr.or.ddit.rntCar.service.BsRntCarService;
import kr.or.ddit.util.PagingDTO;
import kr.or.ddit.vo.BsRmVO;
import kr.or.ddit.vo.BsRsvListVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CarVO;
import kr.or.ddit.vo.RsvRntCarVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/rntCar")
@Controller
public class BsRntCarContoller {
	
	@Autowired
	BsRntCarService bsRntCarService;
	
	
	// 차량 관리(리스트) 페이지
	@GetMapping("/abCar/carList")
	public String carList(
			Model model,
			BsRmVO bsRmVO, 
			HttpSession session, 
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, 
			@RequestParam(value = "size", required = false, defaultValue = "10") int size, 
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {
		log.info("차관리에 왔다.");
		BusiVO busiVO =  (BusiVO) session.getAttribute("vo");
		log.info("busiVO:" +busiVO);
		

		Map<String,String> map = new HashMap<String, String>();
		map.put("currentPage", Integer.toString(currentPage));
		map.put("size", String.valueOf(size));
		map.put("keyword", keyword);
		map.put("busiId", busiVO.getBusiId());
		
		log.info("data : {}", busiVO);
		log.info("map : {}", map);
		
		List<CarVO> carList = this.bsRntCarService.carList(map); 
		
		log.info("result count : {}", carList.size());
		log.info("result count : {}", carList);
		
		
		log.info("방 리스트" +carList);
		int total = this.bsRntCarService.getTotal(map);
		
		model.addAttribute("data", new PagingDTO<CarVO>(total, currentPage, size, carList));
		
		
		return "rntCar/abCar/carList";
	}
	
	// 차정보 변경
	@GetMapping("/abCar/detailCar")
	public String detailCar(@RequestParam("carNum") String carNum, Model model,HttpSession session){
		log.info("차변경 페이지 왓다. " );
		
		CarVO carVO = this.bsRntCarService.detailCar(carNum);
		log.info("carVO : " + carVO);
		model.addAttribute("data",carVO);
		
		session.setAttribute("carNum", carNum);
		
		
		
		return "rntCar/abCar/detailCar" ;
	}
	
	@PostMapping("/abCar/detailCarPost")
	@ResponseBody
	public int detailCarPost(@RequestBody CarVO carVO,HttpSession session){
		
		String carNum = (String) session.getAttribute("carNum");
		log.info("변경확인 페이지 왓다. +++++++--->>" );
		
		carVO.setCarNum(carNum);
		log.info("carVO:"+carVO);
		
		int cnt =this.bsRntCarService.updateCar(carVO);
		log.info("cnt:"+cnt);
		
		return cnt;
	}
	// 렌터카 등록 페이지
	@GetMapping("/abCar/addCar")
	public String addCar(@ModelAttribute("carVO")CarVO carVO ){
		log.info("렌터카등록 페이지 왓다. +++++++--->>" );
		log.info("carVO"+carVO );
		
		return "rntCar/abCar/addCar" ;
	}
	
	
	@PostMapping("/abCar/addCarPost")
	public String addCarPost(@ModelAttribute("carVO") CarVO carVO,  HttpSession session) {
		log.info("렌터카Post 페이지 왓다. +++++++--->>" );
		BusiVO busiVO =  (BusiVO) session.getAttribute("vo");
		
		log.info("busiVO:" +busiVO);
		
		carVO.setBusiId(busiVO.getBusiId());
		log.info("carVO:" +carVO);
		
		int result = this.bsRntCarService.addCar(carVO);
		log.info("result : " + result);
		
		
		return "redirect:/rntCar/abCar/addCar" ;
	}
	
	@GetMapping("/reserve/rsvCarList")
	public String rsvCar(Model model,HttpSession session, @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
			, @RequestParam(value = "size", required = false, defaultValue = "10") int size
			, @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
			, @RequestParam(value = "period", required = false, defaultValue = "") String period){
		log.info("렌터카 예약 페이지 왓다. +++++++--->>" );
		BusiVO busiVO =  (BusiVO) session.getAttribute("vo");
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("currentPage", Integer.toString(currentPage));
		map.put("size", String.valueOf(size));
		map.put("keyword", keyword);
		map.put("busiId", busiVO.getBusiId());
		
		// 날짜선택 잘못햇을시 
		if(!period.equals("")) {
			String[] dateTodate = new String[3];
			dateTodate = period.split("\\s");
			if(dateTodate.length < 3) {
				log.debug("Split Length : " + dateTodate.length);
				return "redirect:/rntCar/reserve/rsvCarList";
			}
			map.put("periodSt", dateTodate[0]);
			map.put("periodEd", dateTodate[2]);
		} 
		
		List<RsvRntCarVO> rsvCarVOList = this.bsRntCarService.rntRsvList(map);
		
		log.info("예약목록 :"+ rsvCarVOList) ;
		log.info("map : " + map);

		int total = this.bsRntCarService.carGetTotal(map);

		model.addAttribute("data", new PagingDTO<RsvRntCarVO>(total, currentPage, size, rsvCarVOList));
		model.addAttribute("vo", busiVO);
		
		
		return "rntCar/reserve/rsvCarList" ;
	}
	@PostMapping("/reserve/rsvCarListPost")
	@ResponseBody
	public RsvRntCarVO resListPost(@RequestParam("rsvId") String rsvId) {
		log.info(" ListPost로 왓따");
		
		RsvRntCarVO data = this.bsRntCarService.rsvIdDetail(rsvId);
		
		log.info("data :" + data);
		
		return data;
	}
	
	
	
}
