package kr.or.ddit.business.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.ddit.business.service.BsAdService;
import kr.or.ddit.vo.AdadVO;
import kr.or.ddit.vo.AdvReqListVO;
import kr.or.ddit.vo.BusiVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/business/advertize")
@Controller
public class BsAdController {
	
	@Autowired
	BsAdService bsAdService;
	
	@GetMapping("/bsAd") // 업체 정산 내역 페이지
	public String bsAd(HttpSession session, Model model) {
		
		BusiVO vo = (BusiVO) session.getAttribute("vo");
		String busiId = vo.getBusiId();
		List<AdvReqListVO> AdvReqList = bsAdService.adInUse(busiId);
		
		List<String> codeList = new ArrayList<String>();
		for(AdvReqListVO adreqvo : AdvReqList) {
			codeList.add(adreqvo.getCmCode());
		}
		
		Gson gson = new Gson();
		String gsonCodeList = gson.toJson(codeList);
		model.addAttribute("advReqList", AdvReqList);
		model.addAttribute("codeList", gsonCodeList);
		
		return "business/advertize/bsAd";
	}
	
	@ResponseBody
	@PostMapping("/adajax") // 업체 정산 내역 페이지
	public int adajax(HttpSession session, 
			@RequestParam HashMap<String, Object> adadMap
			) {
		
		AdadVO adadVO = new AdadVO();
		BusiVO vo = (BusiVO) session.getAttribute("vo");
		String busiId = vo.getBusiId();
		adadVO.setBusiId(busiId);
		adadVO.setAdId(MapUtils.getString(adadMap, "adId"));
		adadVO.setStartDt(MapUtils.getString(adadMap, "startDt"));
		adadVO.setEndDt(MapUtils.getString(adadMap, "endDt"));
		adadVO.setAdPr(Integer.parseInt(MapUtils.getString(adadMap, "adPr")));
		
		int result = bsAdService.insertAdReq(adadVO);

		return result;
		
	}
	
	
	@ResponseBody
	@PostMapping("/adRfdAjax") // 업체 정산 내역 페이지
	public int adRfdAjax(HttpSession session, 
			@RequestParam("adReqId") String adReqId
			) {
		int result = bsAdService.adRfdReq(adReqId);
		
		return result;
		
	}
	
	
	
	

}
