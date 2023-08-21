package kr.or.ddit.business.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import kr.or.ddit.business.service.BsStatisService;
import kr.or.ddit.vo.BusiVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/business/statis")
@Controller
public class BsStatisController {

	@Autowired
	BsStatisService bsStatisService;

	@GetMapping("/bsStatis") // 업체 통계 페이지
	public String bsStatis(Model model, HttpSession session,
			@RequestParam(value = "period", required = true, defaultValue = "") String period) {

		// 처음 파라미터는 최근30일
		if (period.equals("")) {
			LocalDate currentDate = LocalDate.now();
			LocalDate startDate = currentDate.minusDays(30);

			String dateRange = startDate + " to " + currentDate;
			period = dateRange;
		}
		// 파라미터로 보낼 map선언
		Map<String, String> statisMap = new HashMap<String, String>();

		// 1. busiId
		BusiVO busiVO = (BusiVO) session.getAttribute("vo");
		String busiId = busiVO.getBusiId();
		statisMap.put("busiId", busiId);

		// 2. period parameter
		if (!period.equals("")) {
			String[] dateTodate = new String[3];
			dateTodate = period.split("\\s");
			if (dateTodate.length < 3) {
				log.debug("Split Length : " + dateTodate.length);
				return "redirect:/business/statis/bsStatis";
			}
			statisMap.put("startDt", dateTodate[0]);
			statisMap.put("endDt", dateTodate[2]);
		}

		// 쿼리실행부분

		// 1. 방예약 선호도 (방, 예약건수)
		List<String> rmIdList1 = new ArrayList<>();
		List<String> rsvCountList1 = new ArrayList<>();
		List<Map<String, String>> rsvRm = bsStatisService.rsvRm(statisMap);
		for (Map<String, String> row : rsvRm) {
			rmIdList1.add((String) row.get("RM_ID"));
			rsvCountList1.add((String) row.get("RSV_COUNT"));
		}
		Gson gson = new Gson();
		String rmIdListStr1 = gson.toJson(rmIdList1);

		model.addAttribute("rmIdList1", rmIdListStr1);
		model.addAttribute("rsvCountList1", rsvCountList1);
		log.info("rmIdList1" + rmIdList1.toString());
		log.info("rsvCountList1" + rsvCountList1.toString());

		// 2. 날짜별 찜 수(날짜, 예약건수)
		List<String> wishList2 = new ArrayList<>();
		List<String> rsvCountList2 = new ArrayList<>();
		List<Map<String, String>> wishDate = bsStatisService.wishDate(statisMap);
		for (Map<String, String> row : wishDate) {
			wishList2.add((String) row.get("WISH_DT"));
			rsvCountList2.add((String) row.get("RSV_COUNT"));
		}
		String wishListStr2 = gson.toJson(wishList2);

		model.addAttribute("wishList2", wishListStr2);
		model.addAttribute("rsvCountList2", rsvCountList2);
		log.info("wishList2" + wishList2.toString());
		log.info("rsvCountList2" + rsvCountList2.toString());

		// 22. 날짜별 예약 추이(날짜, 예약건수)
//		List<String> rsvList22 = new ArrayList<>();
//		List<String> rsvCountList22 = new ArrayList<>();
//		List<Map<String, String>> rsvDate = bsStatisService.rsvDate(statisMap);
//		for (Map<String, String> row : rsvDate) {
//			rsvList22.add((String) row.get("RSV_DT"));
//			rsvCountList22.add((String) row.get("RSV_COUNT"));
//		}
//		String rsvListStr22 = gson.toJson(rsvList22);
//
//		model.addAttribute("rsvList22", rsvListStr22);
//		model.addAttribute("rsvCountList22", rsvCountList22);
//
//		log.info("rsvList22" + rsvList22.toString());
//		log.info("rsvCountList22" + rsvCountList22.toString());

		// 3-1. 여성의 연련대별 예약건수 (연령대+성별, 예약건수)
		List<String> femaleRsvCount3 = new ArrayList<>();
		List<Map<String, String>> rsvFemale = bsStatisService.rsvFemale(statisMap);
		for (Map<String, String> row : rsvFemale) {
			femaleRsvCount3.add((String) row.get("RSV_COUNT"));
		}
		model.addAttribute("mbtiList4", femaleRsvCount3);
		
		
		// 3-2. 님성의 연련대별 예약건수 (연령대+성별, 예약건수)
		List<String> maleRsvCount3 = new ArrayList<>();
		List<Map<String, String>> rsvMale = bsStatisService.rsvMale(statisMap);
		for (Map<String, String> row : rsvMale) {
			maleRsvCount3.add((String) row.get("RSV_COUNT"));
		}
		model.addAttribute("rsvCountList4", maleRsvCount3);

		// 4. 많이 예약한 MBTI (MBTI, 예약건수)
		List<String> mbtiList4 = new ArrayList<>();
		List<String> rsvCountList4 = new ArrayList<>();
		List<Map<String, String>> rsvMbti = bsStatisService.rsvMbti(statisMap);
		for (Map<String, String> row : rsvMbti) {
			mbtiList4.add(row.get("MEM_MBTI"));
			rsvCountList4.add((String) row.get("RSV_COUNT"));
		}

		String mbtiListStr4 = gson.toJson(mbtiList4);

		model.addAttribute("mbtiList4", mbtiListStr4);
		model.addAttribute("rsvCountList4", rsvCountList4);

		log.info("mbtiList4" + mbtiList4.toString());
		log.info("rsvCountList4" + rsvCountList4.toString());

		return "business/statis/bsStatis";
	}

	@GetMapping("/bsStatisTab") // 업체 통계 페이지
	public String bsStatisTab(Model model, HttpSession session,
			@RequestParam(value = "period", required = true, defaultValue = "") String period) {

		// 처음 파라미터는 최근30일
		if (period.equals("")) {
			LocalDate currentDate = LocalDate.now();
			LocalDate startDate = currentDate.minusDays(30);

			String dateRange = startDate + " to " + currentDate;
			period = dateRange;
		}
		// 파라미터로 보낼 map선언
		Map<String, String> statisMap = new HashMap<String, String>();

		// 1. busiId
		BusiVO busiVO = (BusiVO) session.getAttribute("vo");
		String busiId = busiVO.getBusiId();
		statisMap.put("busiId", busiId);

		// 2. period parameter
		if (!period.equals("")) {
			String[] dateTodate = new String[3];
			dateTodate = period.split("\\s");
			if (dateTodate.length < 3) {
				log.debug("Split Length : " + dateTodate.length);
				return "redirect:/business/statis/bsStatis";
			}
			statisMap.put("startDt", dateTodate[0]);
			statisMap.put("endDt", dateTodate[2]);
		}

		// 쿼리실행부분

		// 1. 방예약 선호도 (방, 예약건수)
		List<String> rmIdList1 = new ArrayList<>();
		List<String> rsvCountList1 = new ArrayList<>();
		List<Map<String, String>> rsvRm = bsStatisService.rsvRm(statisMap);
		for (Map<String, String> row : rsvRm) {
			rmIdList1.add((String) row.get("RM_ID"));
			rsvCountList1.add((String) row.get("RSV_COUNT"));
		}
		Gson gson = new Gson();
		String rmIdListStr1 = gson.toJson(rmIdList1);

		model.addAttribute("rmIdList1", rmIdListStr1);
		model.addAttribute("rsvCountList1", rsvCountList1);
		log.info("rmIdList1" + rmIdList1.toString());
		log.info("rsvCountList1" + rsvCountList1.toString());

		// 2. 날짜별 찜 수(날짜, 예약건수)
		List<String> wishList2 = new ArrayList<>();
		List<String> rsvCountList2 = new ArrayList<>();
		List<Map<String, String>> wishDate = bsStatisService.wishDate(statisMap);
		for (Map<String, String> row : wishDate) {
			wishList2.add((String) row.get("WISH_DT"));
			rsvCountList2.add((String) row.get("RSV_COUNT"));
		}
		String wishListStr2 = gson.toJson(wishList2);

		model.addAttribute("wishList2", wishListStr2);
		model.addAttribute("rsvCountList2", rsvCountList2);
		log.info("wishList2" + wishList2.toString());
		log.info("rsvCountList2" + rsvCountList2.toString());

		// 22. 날짜별 예약 추이(날짜, 예약건수)
		List<String> rsvList22 = new ArrayList<>();
		List<String> rsvCountList22 = new ArrayList<>();
		List<Map<String, String>> rsvDate = bsStatisService.rsvDate(statisMap);
		for (Map<String, String> row : rsvDate) {
			rsvList22.add((String) row.get("RSV_DT"));
			rsvCountList22.add((String) row.get("RSV_COUNT"));
		}
		String rsvListStr22 = gson.toJson(rsvList22);

		model.addAttribute("rsvList22", rsvListStr22);
		model.addAttribute("rsvCountList22", rsvCountList22);

		log.info("rsvList22" + rsvList22.toString());
		log.info("rsvCountList22" + rsvCountList22.toString());

		// 3. 고객층 연령대 (연령대+성별, 예약건수)
//	List<String> femaleAge3 = new ArrayList<>();
//	List<String> femaleRsvCountList3 = new ArrayList<>();
//	
//	List<String> maleAge3 = new ArrayList<>();
//	List<String> maleRsvCountList3 = new ArrayList<>();
//	List<Map<String, String>> rsvGener = bsStatisService.rsvGener(statisMap);
//	for (Map<String, String> row : rsvGener) {
//		String generation = (String) row.get("GENERATION");
//		if (generation.substring(2).equals("F")) {
//			String age = ((String) row.get("GENERATION")).substring(0, 2);
//			femaleAge3.add(age);
//			femaleRsvCountList3.add((String) row.get("RSV_COUNT"));
//			
//		} else {
//			String age = ((String) row.get("GENERATION")).substring(0, 2);
//			maleAge3.add(age);
//			maleRsvCountList3.add((String) row.get("RSV_COUNT"));
//			
//		}
//	}
//	model.addAttribute("femaleAge3",femaleAge3);
//	model.addAttribute("femaleRsvCountList3",femaleRsvCountList3);
//	
//	model.addAttribute("maleAge3",maleAge3);
//	model.addAttribute("maleRsvCountList3",maleRsvCountList3);

		// 4. 많이 예약한 MBTI (MBTI, 예약건수)
		List<String> mbtiList4 = new ArrayList<>();
		List<String> rsvCountList4 = new ArrayList<>();
		List<Map<String, String>> rsvMbti = bsStatisService.rsvMbti(statisMap);
		for (Map<String, String> row : rsvMbti) {
			mbtiList4.add(row.get("MEM_MBTI"));
			rsvCountList4.add((String) row.get("RSV_COUNT"));
		}

		String mbtiListStr4 = gson.toJson(mbtiList4);

		model.addAttribute("mbtiList4", mbtiListStr4);
		model.addAttribute("rsvCountList4", rsvCountList4);

		log.info("mbtiList4" + mbtiList4.toString());
		log.info("rsvCountList4" + rsvCountList4.toString());

		return "business/statis/bsStatisTab";
	}

}
