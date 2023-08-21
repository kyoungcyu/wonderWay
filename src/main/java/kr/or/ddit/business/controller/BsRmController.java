package kr.or.ddit.business.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.business.service.BsRmService;
import kr.or.ddit.util.PagingDTO;
import kr.or.ddit.vo.BsRmVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CvfcVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/business/room")
@Controller
public class BsRmController {
	
	@Autowired
	BsRmService bsRmService;
	
	@GetMapping("/addRm")
	public String addRm(@ModelAttribute("bsRmVO")BsRmVO bsRmVO ){
		log.info("방등록 페이지 왓다. +++++++--->>" );
		log.info("bsRmVO"+bsRmVO );
		
		return "business/room/addRm" ;
	}
	
	@PostMapping("/addRmPost")
	public String addRmPost(@ModelAttribute("bsRmVO") BsRmVO bsRmVO,  HttpSession session){
		log.info("Post 페이지 왓다.bsRmVO : " + bsRmVO);
		
		BusiVO busiVO =  (BusiVO) session.getAttribute("vo");
		
		log.info("busiVO:" +busiVO);
		
		bsRmVO.setBusiId(busiVO.getBusiId());
		log.info("bsRmVO:" +bsRmVO);
		
		int result = this.bsRmService.addRm(bsRmVO);
		log.info("result : " + result);
		
		return "redirect:/business/room/addRm" ;
	}
//	/business/room/rmDel
	
	@GetMapping("/rmDel")
	public String rmDel(@RequestParam("rmId") String rmId, Model model,HttpSession session) {
		log.info("삭제 왔다 .");
		log.info("rmId:"+rmId);
//		BsRmVO bsRmVO = this.bsRmService.delRm(rmId);
//		log.info("bsRmVO:"+bsRmVO);
		
		
		return "redirect:/business/room/rmList";
		
		
	}
	
	
	@GetMapping("/detailRm")
	public String detailRm(@RequestParam("rmId") String rmId, Model model,HttpSession session){
		log.info("방변경 페이지 왓다. " );
		
		BsRmVO bsRmVO =this.bsRmService.rmIdList(rmId);
		
		log.info("bsRmVO : " + bsRmVO);
		model.addAttribute("data",bsRmVO);
		
		session.setAttribute("rmId", rmId);
		
		
		
		return "business/room/detailRm" ;
	}
	/**
	 * 
	 * @param bsRmVO
	 * @param session
	 * @return
	 */
	@PostMapping("/detailRmPost")
	@ResponseBody
	public int detailRmPost(@RequestBody BsRmVO bsRmVO,HttpSession session){
		
		String rmId = (String) session.getAttribute("rmId");
		log.info("변경확인 페이지 왓다. +++++++--->>" );
		
		bsRmVO.setRmId(rmId);
		log.info("bsRmVO:"+bsRmVO);
		
		int cnt =this.bsRmService.updateRm(bsRmVO);
		log.info("cnt:"+cnt);
		
		return cnt;
	}
	
	/**
	 * @param model
	 * @param bsRmVO
	 * @param session
	 * @param currentPage
	 * @param size
	 * @param keyword
	 * @return
	 */
	@GetMapping("/rmList")
	public String rmList(
			Model model,
			BsRmVO bsRmVO, 
			HttpSession session, 
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, 
			@RequestParam(value = "size", required = false, defaultValue = "10") int size, 
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {
		log.info("방 관리 페이지 왓다.");

		BusiVO busiVO =  (BusiVO) session.getAttribute("vo");
		log.info("busiVO:" +busiVO);
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("currentPage", Integer.toString(currentPage));
		map.put("size", String.valueOf(size));
		map.put("keyword", keyword);
		map.put("busiId", busiVO.getBusiId());
		
		log.info("data : {}", busiVO);
		log.info("map : {}", map);
		
		List<BsRmVO> rmList = this.bsRmService.bsRmList(map); 
		
		log.info("result count : {}", rmList.size());
		log.info("result count : {}", rmList);
		
		
		log.info("방 리스트" +rmList);
		int total = this.bsRmService.getTotal(map);
		
		model.addAttribute("data", new PagingDTO<BsRmVO>(total, currentPage, size, rmList));
		
		
		
		
		return "business/room/rmList" ;
	}

	
	@GetMapping("/mngRm")
	public String mngRm(Model model,HttpSession session) {
		log.info("편의시설 정보에 왔다.");
		BusiVO busiVO =  (BusiVO) session.getAttribute("vo");
		
		List<CvfcVO> cvfcAccList = this.bsRmService.cvfcAcc();
		List<CvfcVO> cvfcRmList =this.bsRmService.cvfcRm();
		List<CvfcVO> cvfcIconList =this.bsRmService.cvfcIcon();
		List<CvfcVO> cvfcSerList =this.bsRmService.cvfcSer();
		model.addAttribute("cvfcAccList" ,cvfcAccList);
		model.addAttribute("cvfcRmList" ,cvfcRmList);
		model.addAttribute("cvfcIconList" ,cvfcIconList);
		model.addAttribute("cvfcSerList" ,cvfcSerList);
		model.addAttribute("busiVO" ,busiVO);
		List<CvfcVO> selectCvfc =this.bsRmService.selectCvfc(busiVO);
		model.addAttribute("selectCvfc" ,selectCvfc);
		log.info("selectCvfc:"+selectCvfc);
		
		
		
		return "business/room/mngRm";
		
	}
	@ResponseBody
	@PostMapping("/insertCvfc")
	public int insertCvfc(@RequestBody CvfcVO cvfcVO,HttpSession session) {
		BusiVO busiVO =  (BusiVO) session.getAttribute("vo");
		log.info("insert왔따");
		log.info("busiVO:"+busiVO);
		log.info("cvfcVO:"+cvfcVO);
		busiVO.setCvfcId(cvfcVO.getCvfcId());
		
		int result = this.bsRmService.insertCvfc(busiVO);
		log.info("result:"+result);
		
		return result;
	}
	@ResponseBody
	@PostMapping("/deleteCvfc")
	public int deleteCvfc(@RequestBody CvfcVO cvfcVO,HttpSession session) {
		BusiVO busiVO =  (BusiVO) session.getAttribute("vo");
		log.info("delete왔따");
		log.info("cvfcVO:"+cvfcVO);
		busiVO.setCvfcId(cvfcVO.getCvfcId());
		log.info("busiVO:"+busiVO);
		
		int result = this.bsRmService.deleteCvfc(busiVO);
		
		return result;
	}

	
	
}
