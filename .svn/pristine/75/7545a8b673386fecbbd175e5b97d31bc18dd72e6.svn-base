package kr.or.ddit.business.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.business.service.BsRcmService;
import kr.or.ddit.vo.CvfcRcmVO;
import kr.or.ddit.vo.CvfcVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/business")
@Controller
public class BsRcmController {

	@Autowired
	BsRcmService bsRcmService;
	
	@GetMapping("/rcm/cvfc")
	public String cvfcMain() {

		return "business/rcm/cvfc";
	}

	
	@ResponseBody
	@PostMapping("/rcm/cvfcAjax")
	public List<CvfcVO> cvfcAjax(@RequestBody HashMap<String,String> data) {

		CvfcRcmVO cvfcRcmVO =  bsRcmService.cvfcRcm(data);
		
		List<CvfcVO> cvfcVOList =new ArrayList<CvfcVO>();
		
		cvfcVOList.add(bsRcmService.getCvfcInfo(cvfcRcmVO.getCvfcId1()));
		cvfcVOList.add(bsRcmService.getCvfcInfo(cvfcRcmVO.getCvfcId2()));
		cvfcVOList.add(bsRcmService.getCvfcInfo(cvfcRcmVO.getCvfcId3()));
		cvfcVOList.add(bsRcmService.getCvfcInfo(cvfcRcmVO.getCvfcId4()));
		cvfcVOList.add(bsRcmService.getCvfcInfo(cvfcRcmVO.getCvfcId5()));
		cvfcVOList.add(bsRcmService.getCvfcInfo(cvfcRcmVO.getCvfcId6()));
		cvfcVOList.add(bsRcmService.getCvfcInfo(cvfcRcmVO.getCvfcId7()));
		cvfcVOList.add(bsRcmService.getCvfcInfo(cvfcRcmVO.getCvfcId8()));
		cvfcVOList.add(bsRcmService.getCvfcInfo(cvfcRcmVO.getCvfcId9()));
		cvfcVOList.add(bsRcmService.getCvfcInfo(cvfcRcmVO.getCvfcId10()));
		
		log.info("결과야 "+cvfcVOList);
		
		
		return cvfcVOList;
	}
	
	
}
