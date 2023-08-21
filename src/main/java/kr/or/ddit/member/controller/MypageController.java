package kr.or.ddit.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.member.mapper.MypageMapper;
import kr.or.ddit.member.service.MmCartService;
import kr.or.ddit.member.service.MmMemService;
import kr.or.ddit.member.service.MmMsgService;
import kr.or.ddit.member.service.MypageService;
import kr.or.ddit.member.service.impl.MmEmailServiceImpl;
import kr.or.ddit.util.CommonFile;
import kr.or.ddit.util.ItemDTO;
import kr.or.ddit.util.PagingDTO;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CmtVO;
import kr.or.ddit.vo.CupnVO;
import kr.or.ddit.vo.GradVO;
import kr.or.ddit.vo.HCupnVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.MmMyProdList;
import kr.or.ddit.vo.MmRsvListVO;
import kr.or.ddit.vo.MmRsvRntcarListVO;
import kr.or.ddit.vo.MsgVO;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.RfdReqVO;
import kr.or.ddit.vo.RsvListVO;
import kr.or.ddit.vo.RsvVO;
import kr.or.ddit.vo.RvwVO;
import kr.or.ddit.vo.WishVO;


@RequestMapping("/member/mypage")
@Controller
public class MypageController {
	
	private final Logger log =  LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	MmMemService memService;
	
	@Autowired
	MmCartService mmCartService;
	
	
	@Autowired
	MmEmailServiceImpl mmEmailServiceImpl;
	
	@Autowired
	MmMsgService mmMsgService;
	
	
	//마이페이지- 내 정보 O :
	@GetMapping("/myInfo")
	public String myInfo(@ModelAttribute MemVO memVO, Principal principal, Model model) {
	    String memId = principal.getName();
	    log.info("memId: " + memId);

	    MemVO data = this.mypageService.detailMyInfo(memId);
	    log.info("data : "+data);
	    
	    String imgPath = this.mypageService.getImgPath(memId);
	    log.info("이미지 경로 :"+imgPath);
	    model.addAttribute("imgPath",imgPath);
	    
	    model.addAttribute("data", data);

	    return "member/mypage/myInfo";
	}

	
	//내 프로필 - 정보 수정하기  이미지
	@ResponseBody
	@PostMapping("/updateMyInfo")
	public int updateMyInfo(@RequestBody MemVO memVO, Principal principal) {
		    
		int result = this.mypageService.updateMyInfo(memVO);
		log.info("result : " + result);
		
		return result;
	}
	
	//이미지변경
	@PostMapping("/filePost")
	@ResponseBody
	public int  filePost(@RequestBody MemVO memVO) {
		log.info("filePost왓다:" );
		log.info("memVO:" +memVO);
		  
		File uploadPath = new File(CommonFile.uploadFolder+"\\profile", CommonFile.getFolder());
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		log.info("uploadFolder : " + CommonFile.uploadFolder);
		
		return 0;
	}	

	
	//이메일 변경
	@GetMapping("/emailModify")
	public String emailModify(@ModelAttribute MemVO memVO, Principal principal, Model model) {
		String memId = principal.getName();
		memVO.setMemId(memId);
		
		MemVO data = this.mypageService.detailMyInfo(memId);
		log.info("data : " + data);
		model.addAttribute("data",data);
		
		return "member/mypage/emailModify";
	}	
	//이메일 변경
	@ResponseBody
	@PostMapping("/emailPost")
	public String emailPost(@RequestBody MemVO memVO, Principal principal,Model model) {
		String memId = principal.getName();
		memVO.setMemId(memId);
		log.info("memId : " + memId);
		
		String memEmail = memVO.getMemEmail();
		log.info("memEmail : " + memEmail);
	
		
		int result = this.mypageService.updateMyEmail(memVO);
		log.info("result : " + result);
		
		
		
		if(result > 0) {
			return "success";
			
		} else {
			return "fail";
		}
				
	}
	
	//이메일 인증 시 인증코드 보내기
	@ResponseBody
	@PostMapping("/mailCheck")
	public String mailConfirm(@RequestParam String newEmail) {
	    try {
	        String code = mmEmailServiceImpl.sendSimpleMessage(newEmail);
	        log.info("인증코드: " + code);
	        return code;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "Error: Failed to send email confirmation";
	    }
	}

	//나의 비밀번호 변경
	@GetMapping("/passModify")
	public String passModify(MemVO memVO, Principal principal,Model model) {
		
		String memId = principal.getName();

		
		MemVO data = this.mypageService.detailMyInfo(memId);
		log.info("data : " + data);
		model.addAttribute("data",data);
	
		
		return "member/mypage/passModify";
	}
	

	//내 프로필 - 비밀번호 변경
	@ResponseBody
	@PostMapping("/passModifyPost")
	public int passModifyPost(@RequestBody MemVO memVO, Principal principal) {
		
		String memId = principal.getName();
		memVO.setMemId(memId);
		
		String memPw = memVO.getMemPw();
		log.info("memPw : " + memPw);
		
		int result = this.mypageService.updateMyPass(memVO);
		log.info("result : " + result);
		
		return result;
	}

	// 이미지 등록 
	@PostMapping("/updateImg")
	@ResponseBody
	public int updateImg( Model model ,MemVO memVO,Principal principal) {
		String memId =  principal.getName();
		memVO.setMemId(memId);
		model.addAttribute("memVO", memVO);
		
		memVO.setUploads(memVO.getUploads());
		
		log.info("memVO:" + memVO); 
		
		int result =this.mypageService.updateImg(memVO);
		
		return result;
	}
	
	
	//예약내역
	@GetMapping("/myBooking")
	public String myBooking(RsvVO rsvVO, MmRsvListVO mmRsvListVO,MmRsvRntcarListVO mmRsvRntcarListVO,RvwVO rvwVO, Principal principal,Model model) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		String memId = principal.getName();
		map.put("memId", memId);
		
		//결제취소
		mmRsvListVO.setMemId(memId);
		mmRsvListVO.setRsvCode("K01");
		//새로운 예약내역
		List<MmRsvListVO> bookingList = this.mypageService.bookingList(mmRsvListVO);
		model.addAttribute("bookingListBefPay",bookingList);
		log.info("bookingListBefPay : " + bookingList);
		
		//예약확정
		mmRsvListVO.setRsvCode("K02");
		//새로운 예약내역
		List<MmRsvListVO> bookingList2 = this.mypageService.bookingList(mmRsvListVO);
		model.addAttribute("bookingListBefOk",bookingList2);
		log.info("bookingListBefOk : " + bookingList2);
		
		//취소신청
		mmRsvListVO.setRsvCode("K03");
		
		List<MmRsvListVO> bookingList3 = this.mypageService.bookingList(mmRsvListVO);
		model.addAttribute("bookingListCancel",bookingList3);
		log.info("bookingListCancel : " + bookingList3);
		
		//취소확정
		mmRsvListVO.setRsvCode("K04");
		//새로운 예약내역
		List<MmRsvListVO> bookingList4 = this.mypageService.bookingList(mmRsvListVO);
		model.addAttribute("bookingListCancelOk",bookingList4);
		log.info("bookingListCancelOk : " + bookingList4);
		
		
		return "member/mypage/myBooking";
	}	
	
	/* 결제대기 취소 - 숙박 */
	@ResponseBody
	@PostMapping("/myBooking/cancelBefPayRsv")
	public int cancelBefPayRsv(@RequestBody String rsvId, Model model) {
		int result = this.mypageService.noPayRsvK01Sty(rsvId);
		model.addAttribute("result",result);
		log.info("result : " + result);
		return result;
	}
	
	/* 결제대기 취소 - 렌터카 */
	@ResponseBody
	@PostMapping("/myBooking/cancelBefPayRnt")
	public int cancelBefPayRnt(@RequestParam String rsvId, Model model) {
		int result = this.mypageService.noPayRsvK01Rnt(rsvId);
		model.addAttribute("result",result);
		log.info("result : " + result);
		return result;
	}
	
	/* 예약취소*/
	//수수료 0 일때
	@ResponseBody
	@PostMapping("/myBooking/cancelFee0")
	public int cancelFee0(@RequestBody RfdReqVO rfdReqVO, PayVO payVO) {
		log.info("rfdReqVO"+rfdReqVO);
		int result= this.mypageService.rfdOk(rfdReqVO);
		log.info("result : " + result);
		
		return result;
	}
	//수수료 있을 떄 
	@ResponseBody
	@PostMapping("/myBooking/cancelHasFee")
	public int cancelHasFee(@RequestBody RfdReqVO rfdReqVO, PayVO payVO) {
		
		int result = this.mypageService.rfdRequest(rfdReqVO);
		log.info("result 수수료 : " + result);
		return result;
	}	
	
	//예약내역조회
	//console.log("dt : " + JSON.stringify(dt))
	@ResponseBody
	@PostMapping("/myBooking/rsvDetail")
	public RsvVO rsvDetail(@RequestBody RsvVO rsvVO,Principal principal) {
		log.info("rsvVO : " + rsvVO);
		
		String memId = principal.getName();
		rsvVO.setMemId(memId);
		rsvVO = this.mypageService.rsvDetail(rsvVO);
		
		return rsvVO;
	}
	
	
	//리뷰작성
	@PostMapping("/myReivew")
	public String myReivew(RvwVO rvwVO, Principal principal) {
		String memId = principal.getName();
		rvwVO.setMemId(memId);
		int result = this.mypageService.myReivewWrite(rvwVO);
		return "redirect:/member/mypage/myBooking";
	}
	 
	
	
	// 관심내역
	// 찜목록
	@GetMapping("/myLike")
	public String myLike(HttpSession session, HttpServletRequest request, Principal principal, Model model, WishVO wishVO) throws UnsupportedEncodingException {
		String memId = principal.getName();
		// 찜상품
		wishVO.setMemId(memId);
		List<WishVO> myLikeList = this.mypageService.myLikeList(wishVO);
		model.addAttribute("myLikeList", myLikeList);
		log.info("myLikeList : " + myLikeList);

		// 최근 본 상품- 숙소
		Cookie[] cookies = request.getCookies();
		List<MmRsvListVO> resultList = new ArrayList<>();

		// HashSet을 사용하여 중복된 busiId를 제거합니다.
		Set<String> uniqueBusiIds = new HashSet<>();

		if (cookies != null) {
		    for (Cookie cookie : cookies) {
		        if (cookie.getName().equals(memId+"recentlyViewed")) {
		            String cookieValue = URLDecoder.decode(cookie.getValue(), "utf-8");
		            log.info("쿠키 출력할 때  cookieValue ==> " + cookieValue);
		            String[] items = cookieValue.split(",");
		            uniqueBusiIds.addAll(Arrays.asList(items));
		            break; // "recentlyViewed" 쿠키를 찾았으므로 반복문 종료
		        }
		    }
		}

		// 중복이 제거된 버전의 busiIds를 사용하여 결과를 조회
		for (String busiId : uniqueBusiIds) {
		    List<MmRsvListVO> result = this.mypageService.myRecentList(busiId);
		    resultList.addAll(result);
		}

		model.addAttribute("resultList", resultList);
		log.info("resultList : " + resultList);
		
		
		//최근 본 상품 - 렌트카
		Cookie[] cookiesCar = request.getCookies();
		List<MmRsvListVO> resultListCar = new ArrayList<>();

		// HashSet을 사용하여 중복된 busiId를 제거합니다.
		Set<String> uniqueCarNum = new HashSet<>();

		if (cookies != null) {
		    for (Cookie cookie : cookiesCar) {
		        if (cookie.getName().equals(memId+"recentlyViewedCar")) {
		            String cookieValueCar = URLDecoder.decode(cookie.getValue(), "utf-8");
		            log.info("쿠키 출력할 때  cookieValueCar ==> " + cookieValueCar);
		            String[] itemsCar = cookieValueCar.split(",");
		            uniqueCarNum.addAll(Arrays.asList(itemsCar));
		            break; // "recentlyViewed" 쿠키를 찾았으므로 반복문 종료
		        }
		    }
		}

		// 중복이 제거된 버전의 busiIds를 사용하여 결과를 조회
		for (String carNum : uniqueCarNum) {
		    List<MmRsvListVO> resultCar = this.mypageService.myRecentListCar(carNum);
		    resultListCar.addAll(resultCar);
		}

		model.addAttribute("resultListCar", resultListCar);
		log.info("resultListCar : " + resultListCar);

		

		return "member/mypage/myLike";
	}
	

	//쿠폰 및 마일리지
	@GetMapping("/myCoupon")
	public String myCoupon(MemVO memVO,CupnVO cupnVO, HCupnVO hCupnVO, Principal principal, Model model) {
		
		String memId = principal.getName();
		memVO.setMemId(memId);
		
		MemVO data = this.mypageService.detailMyInfo(memId);
		log.info("data : " + data);
		model.addAttribute("memVO",data);
		
		//등급조회
		GradVO gradVO = this.mypageService.myGrad(memId);
		model.addAttribute("gradVO",gradVO);
		log.info("gradVO : " + gradVO);
		

		//쿠폰함 조회
		List<CupnVO> myCoupon = this.mypageService.myCoupon(memId);
		model.addAttribute("myCoupon",myCoupon);
		log.info("myCoupon : " + myCoupon);
		
		//쿠폰존 조회 
		cupnVO.setMemId(memId);
		List<CupnVO> couponZone = this.mypageService.couponZone(cupnVO);
		model.addAttribute("couponZone",couponZone);
		
		return "member/mypage/myCoupon";
	}		
	//쿠폰 다운로드
	@ResponseBody
	@PostMapping("/myCouponPost")
	public int myCouponPost(@RequestBody HCupnVO hCupnVO, Principal principal) {
		log.info("hCupnVO : " + hCupnVO);
		
		String memId = principal.getName();
		log.info("memId : " + memId);
		
		//쿠폰 다운로드
		hCupnVO.setMemId(memId);
		
		int result = this.mypageService.downCoupon(hCupnVO);
		log.info("result : " + result);
		
		return result;
	}
	
	//나의 작성글
	@GetMapping("/myWrite")
	public String myWrite(Principal principal, RvwVO rvwVO, BrdVO brdVO, Model model,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "") String sort,
			@RequestParam(value = "currentTab", required = false, defaultValue = "tab-1") String currentTab,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "currentPage2", required = false, defaultValue = "1") int currentPage2,
			@RequestParam(value = "currentPage3", required = false, defaultValue = "1") int currentPage3,
			@RequestParam(value = "currentPage4", required = false, defaultValue = "1") int currentPage4) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("keyword", keyword);
		map.put("sort", sort);
		map.put("currentPage", Integer.toString(currentPage));
		
		// 한 페이지에 9개씩
		int size = 9;
		map.put("size", String.valueOf(size));
		log.info("map : " + map);
		
		String memId = principal.getName();
		log.info("memId : " + memId);
		
		//1. 여행후기
		
		map.put("frstWrtr", memId);
		
		List<BrdVO> myWriteList1 = this.mypageService.myWriteListD01(map);
		log.info("myWriteList1 : " + myWriteList1);
		model.addAttribute("myWriteList1",myWriteList1);
		
		
		int total = this.mypageService.myWriteListD01Count(map);
		log.info("total : " + total);
		
		PagingDTO<BrdVO> qnaPage = new PagingDTO<BrdVO>(total, currentPage, size, myWriteList1);
		log.info("qnaPage : " + qnaPage);
		model.addAttribute("qnaPage", qnaPage);
		
		///////////////////////////////////////////
		Map<String, String> map2 = new HashMap<String, String>();
		
		map2.put("keyword", keyword);
		map2.put("sort", sort);
		map2.put("currentPage2", Integer.toString(currentPage2));
		
		int size2 = 9;
		map2.put("size2", String.valueOf(size2));
		log.info("map2 : " + map2);
		
		//2. 질문답변
		map2.put("frstWrtr", memId);
		List<BrdVO> myWriteList2 = this.mypageService.myWriteListD02(map2);
		log.info("myWriteList2 : " + myWriteList2);
		model.addAttribute("myWriteList2",myWriteList2);			
		
		int total2 = this.mypageService.myWriteListD02Count(map2);
		log.info("total2 : " + total2);
		
		PagingDTO<BrdVO> qnaPage2 = new PagingDTO<BrdVO>(total2, currentPage2, size2, myWriteList2);
		log.info("qnaPage2 : " + qnaPage2);
		model.addAttribute("qnaPage2", qnaPage2);		
		
		//3. 리뷰 조회
		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("memId", memId);
		
		map3.put("keyword", keyword);
		map3.put("sort", sort);
		map3.put("currentPage3", Integer.toString(currentPage3));
		
		int size3 = 9;
		map3.put("size3", String.valueOf(size3));
		log.info("map3 : " + map3);
		
		
		List<RvwVO> myWriteListReview = this.mypageService.myWriteListReview(map3);
		log.info("myWriteListReview : " + myWriteListReview);
		model.addAttribute("myWriteListReview",myWriteListReview);	
		
		int total3 = this.mypageService.myWriteListRvwCnt(map3);
		log.info("total3 : " + total3);	
		
		PagingDTO<RvwVO> qnaPage3 = new PagingDTO<RvwVO>(total3, currentPage3, size3, myWriteListReview);
		log.info("qnaPage3 : " + qnaPage3);
		model.addAttribute("qnaPage3", qnaPage3);		
		
		
		
		//4. 댓글
		Map<String, String> map4 = new HashMap<String, String>();
		
		map4.put("keyword", keyword);
		map4.put("sort", sort);
		map4.put("currentPage4", Integer.toString(currentPage4));
		
		int size4 = 9;
		map4.put("size4", String.valueOf(size4));
		log.info("map4 : " + map4);
		
		map4.put("cmtWr", memId);
		
		List<CmtVO> myWriteListCmt = this.mypageService.myWriteListCmt(map4);
		log.info("myWriteListCmt : " + myWriteListCmt);
		model.addAttribute("myWriteListCmt",myWriteListCmt);	
		
		int total4 = this.mypageService.myWriteListCmtCount(map4);
		log.info("total4 : " + total4);
		
		PagingDTO<CmtVO> qnaPage4 = new PagingDTO<CmtVO>(total4, currentPage4, size4, myWriteListCmt);
		log.info("qnaPage4 : " + qnaPage4);
		model.addAttribute("qnaPage4", qnaPage4);	
		
		return "member/mypage/myWrite";
	}	
	//리뷰 삭제
	@ResponseBody
	@PostMapping("/myRvwDelete")
	public int myRvwDelete(@RequestBody String rsvId) {
		log.info("rsvId : " + rsvId);
		int result = this.mypageService.myRvwDelete(rsvId);
		log.info("result : "  + result);
		
		return result;
	}
	
	
	//업체문의
	@GetMapping("/myCs")
	public String myCs() {
		return "member/mypage/myCs";
	}
	
	//구매내역
	@GetMapping("/myCart")
	public String myCart(Principal principal, Model model) {
		
		String memId = principal.getName();
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		//구매내역 리스트
		List<MmMyProdList> myProdList = this.mypageService.myProdList(map);
		model.addAttribute("myProdList",myProdList);
		log.info("myProdList : " + myProdList);
		
		//취소내역 리스트
		List<MmMyProdList> myCancelProdList = this.mypageService.myCancelProdList(map);
		model.addAttribute("myCancelProdList",myCancelProdList);
		log.info("myCancelProdList : " + myCancelProdList);
		
		return "member/mypage/myCart";
	}	
	
	//구매내역 취소
	@ResponseBody
	@PostMapping("/myCart/myProdCancel")
	public int myProdCancel(Model model, @RequestBody RfdReqVO rfdReqVO) {
		int result = this.mypageService.rfdProdAdd(rfdReqVO);
		model.addAttribute("result", result);
		log.info("result1 : " + result);
		return result;
	}
	//구매내역 취소 상세보기
	@ResponseBody
	@PostMapping("/myCart/myProdCancelDetail")
	public RfdReqVO myProdCancelDetail(Model model, @RequestBody String payId) {
		RfdReqVO rfdDetail = this.mypageService.rfdDetail(payId);
		model.addAttribute("rfdDetail",rfdDetail);
		return rfdDetail;
	}
	
	//나의 카드
	@GetMapping("/myCard")
	public String myCard() {
		return "member/mypage/myCard";
	}
	
	
	//장바구니
	@GetMapping("/cartList")
	public String cartList(Model model, HttpSession session) {
		
		@SuppressWarnings("unchecked")
		ArrayList<ItemDTO> itemList=(ArrayList<ItemDTO>) session.getAttribute("itemList");
		if(itemList !=null) {
			for(ItemDTO dto : itemList) {
				String busiImg = this.mypageService.getBusiImg2(dto.getBusiId());
				dto.setBusiImg(busiImg);
			}
			
			log.info("itemList : "+itemList);
			model.addAttribute("itemList",itemList);
		}
		
		
		return "member/mypage/cartList";
	}
	
	//장바구니 삭제
	@PostMapping("/cartList/deleteItem")
	@ResponseBody
	public String deleteItemsFromCart(@RequestBody List<String> rmIds, HttpSession session) {
	    // 세션에서 상품들을 저장한 List를 가져옵니다.
		log.info("rmIds : "  + rmIds);
		ArrayList<ItemDTO> itemList = (ArrayList<ItemDTO>) session.getAttribute("itemList");
		log.info("itemList : "  + itemList);
		if(rmIds!=null) {
			for(String rmId : rmIds) {
				for(int i= itemList.size()-1; i>=0; i--) {
					if(rmId.equals(itemList.get(i).getRmId())) {
						log.info("itemlist 삭제 index : "  + i);
						itemList.remove(i);
					}
				}
		    }
		}
		session.setAttribute("itemList", itemList);

	    return "success";
	    
	}
	
	//회원탈퇴 페이지
	@GetMapping("/deleteMem")
	public String deleteMem(Principal principal, Model model) {
		String memId = principal.getName();
	    
	    MemVO data = this.mypageService.detailMyInfo(memId);
	    model.addAttribute("data",data);
		return "member/mypage/deleteMem";
	}	
	//회원탈퇴
	@ResponseBody
	@PostMapping("/deleteMemPost")
	public String deleteMemPost(@RequestBody MemVO memVO, Principal principal, Model model) {
		log.info("memVO : " + memVO);
	    int result = this.mypageService.deleteMem(memVO);
	    log.info("result : " + result);
	    
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//얼굴인식
	@ResponseBody
	@PostMapping("/faceRegPost")
	public MemVO faceReg(Principal principal) {
		String memId = principal.getName();
	    log.info("memId: " + memId);
	    
	    MemVO data = this.mypageService.detailMyInfo(memId);
	    log.info("MemVO: " + data);
	    
		return data;
	}
	

	


	
	
	
	
	
	
	//쪽지함
	@GetMapping("/msgbox")
	public String msgbox(Model model, HttpSession session, Principal principal
		   ,@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
			) {
		
		// 쪽지함과 페이징정보 같이 보내야해서 map 선언
		String memId = principal.getName();
		MemVO data = this.mypageService.detailMyInfo(memId);
		
		Map<String,Object> sendMap = new HashMap<String, Object>();
		Map<String,Object> recvMap = new HashMap<String, Object>();
		
		// 1-1. 쿼리에서 사용 할 map 채우기
		recvMap.put("memId", memId);
		recvMap.put("currentPage",currentPage);
		// 1-2. 받은쪽지함 불러오기 + model에 pagingDTO객체에 
		List<MsgVO> recvdata = this.mmMsgService.recvMsg(recvMap);
		int recvTotal = this.mmMsgService.recvTotal(memId);
		model.addAttribute("recvdata", new PagingDTO<MsgVO>(recvTotal, currentPage, 5, recvdata));
		
		// 2-1. 쿼리에서 사용 할 map 채우기
		sendMap.put("memId", memId);
		sendMap.put("currentPage",currentPage);
		// 2-2. 보낸쪽지 + total + model
		List<MsgVO> senddata = this.mmMsgService.sendMsg(sendMap);
		int sendTotal = this.mmMsgService.sendTotal(memId);
		model.addAttribute("senddata", new PagingDTO<MsgVO>(sendTotal, currentPage, 5, senddata));
		model.addAttribute("pageFix", 1);
		
		return "member/mypage/msgbox";
	}
	
	
	


	
	
	
	
}
