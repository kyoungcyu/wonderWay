package kr.or.ddit.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.admin.service.AdAdvService;
import kr.or.ddit.admin.service.AdBrdService;
import kr.or.ddit.admin.service.AdBusiService;
import kr.or.ddit.admin.service.AdCupnService;
import kr.or.ddit.admin.service.AdEmailService;
import kr.or.ddit.admin.service.AdFaqService;
import kr.or.ddit.admin.service.AdGradManageService;
import kr.or.ddit.admin.service.AdMainService;
import kr.or.ddit.admin.service.AdMemService;
import kr.or.ddit.admin.service.AdRfdService;
import kr.or.ddit.admin.service.AdRsvService;
import kr.or.ddit.admin.service.AdRvwService;
import kr.or.ddit.admin.service.AdSalesService;
import kr.or.ddit.admin.service.AdTourService;
import kr.or.ddit.util.CommonFile;
import kr.or.ddit.util.PagingDTO;
import kr.or.ddit.util.websocket.service.WsService;
import kr.or.ddit.vo.AdBusiSalesVO;
import kr.or.ddit.vo.AdCheckDaysVO;
import kr.or.ddit.vo.AdCountCarsVO;
import kr.or.ddit.vo.AdCountRoomsVO;
import kr.or.ddit.vo.AdPopularRntVO;
import kr.or.ddit.vo.AdPopularStayVO;
import kr.or.ddit.vo.AdReviewListVO;
import kr.or.ddit.vo.AdadVO;
import kr.or.ddit.vo.AdRntDaysVO;
import kr.or.ddit.vo.AdSalesStatVO;
import kr.or.ddit.vo.AdSalesVO;
import kr.or.ddit.vo.AdStatsVO;
import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.AdvListVO;
import kr.or.ddit.vo.AdvReqListVO;
import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CarVO;
import kr.or.ddit.vo.ChatRmVO;
import kr.or.ddit.vo.ChatVO;
import kr.or.ddit.vo.CupnVO;
import kr.or.ddit.vo.FaqVO;
import kr.or.ddit.vo.GradVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.RcmLocVO;
import kr.or.ddit.vo.RfdListVO;
import kr.or.ddit.vo.RmVO;
import kr.or.ddit.vo.RsvListVO;
import kr.or.ddit.vo.TourVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	AdMemService memServiece;
	
	@Autowired
	AdBrdService adBrdService;
	
	@Autowired
	AdRsvService adRsvService;
	
	@Autowired
	AdRfdService adRfdService;
	
	@Autowired
	AdAdvService adAdvService;
	
	@Autowired
	AdEmailService adEmailService;
	
	@Autowired
	AdBusiService adBusiService;
	
	@Autowired
	AdRvwService adRvwService;
	
	@Autowired
	AdFaqService adFaqService;
	
	@Autowired
	AdMainService adMainService;
	
	@Autowired
	AdCupnService adCupnService;
	
	@Autowired
	AdGradManageService adGradManageService;
	
	@Autowired
	AdTourService adTourService;
	
	@Autowired
	AdSalesService adSalesService;
	
	@Autowired
	WsService wsService;
	
	/**
	 * 관리자 메인
	 * @param model
	 * @return
	 */
	@GetMapping("/main")
	public String main(Model model) {
		
		//숙박 업체 개수
		int styCount = this.adMainService.styCount();
		model.addAttribute("styCount",styCount);
		
		//렌터카 업체 개수
		int rntCount = this.adMainService.rntCount();
		model.addAttribute("rntCount",rntCount);
		
		//전체 회원수
		int memCount = this.adMainService.memCount();
		model.addAttribute("memCount",memCount);
		
		//최근 30일 사이트 매출
		int totalSales = this.adMainService.totalSales();
		model.addAttribute("totalSales",totalSales);
		
		//매출TOP4 숙박 업체
		List<AdPopularStayVO> popularStayList = this.adMainService.popularSty();
		model.addAttribute("popularStayList",popularStayList);
		
		//요일별 체크인.아웃 통계
		List<AdCheckDaysVO> checkDays = this.adMainService.checkDays();
		model.addAttribute("checkDays",checkDays);
		
		//객실 이용 여부 개수
		AdCountRoomsVO countRooms = this.adMainService.countRooms();
		model.addAttribute("countRooms",countRooms);
		
		//매출TOP4 렌터카 업체
		List<AdPopularRntVO> popularRntList = this.adMainService.popularRnt();
		model.addAttribute("popularRntList",popularRntList);
		
		//요일별 렌터 통계
		List<AdRntDaysVO> rntDays = this.adMainService.rntDays();
		model.addAttribute("rntDays",rntDays);
		
		//렌터카 이용 여부 개수
		AdCountCarsVO countCars = this.adMainService.countCars();
		model.addAttribute("countCars",countCars);
		
		return "admin/main";
	}
	
	/**
	 * 회원 목록
	 * @param model
	 * @param keyword
	 * @param sort
	 * @param currentPage
	 * @param map
	 * @return
	 */
	@GetMapping("/mem/list")
	public String memList(Model model, 
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "") String sort,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, Map<String, String> map) {
		
	    map.put("keyword", keyword); //검색어
	    map.put("sort", sort); //정렬
	    map.put("currentPage", Integer.toString(currentPage)); //현재 페이지
	    int size = 20; //한 페이지에 보여질 개수
	    map.put("size", String.valueOf(size));
	    
	    //전체 회원 목록
		List<MemVO> memList = this.memServiece.memList(map);

		//전체 회원 수
		int total = this.memServiece.memTotal(map);
		model.addAttribute("total",total);
		
		//활성 회원수
		int enableMem = this.memServiece.enableMem();
		model.addAttribute("enableMem",enableMem);
		//비활성 회원수
		int disableMem = this.memServiece.disableMem();
		model.addAttribute("disableMem",disableMem);
		
		//페이징 처리
		PagingDTO<MemVO> memPage = new PagingDTO<MemVO>(total, currentPage, size, memList);
		model.addAttribute("data", memPage);
		
		//등급별 회원수
		int bronze = this.memServiece.bronze();
		int silver = this.memServiece.silver();
		int gold = this.memServiece.gold();
		int dia = this.memServiece.dia();
		model.addAttribute("bronze", bronze);
		model.addAttribute("silver", silver);
		model.addAttribute("gold", gold);
		model.addAttribute("dia", dia);
		
		//이번달 가입자수
		int thisMthSignIn = this.adSalesService.thisMthSignIn();
		model.addAttribute("thisMthSignIn", thisMthSignIn);
		//지난달 가입자수
		int lastMthSignIn = this.adSalesService.lastMthSignIn();
		model.addAttribute("lastMthSignIn", lastMthSignIn);
		
		double increaseMthMem = (double)(thisMthSignIn - lastMthSignIn) / lastMthSignIn * 100;
		model.addAttribute("increaseMthMem", increaseMthMem);
		
		
		return "admin/mem/list";
	}
	
	/**
	 * 관리자 - 2차 인증
	 * @param map
	 * @param principal
	 * @param session
	 * @return
	 */
	@PostMapping("/mem/second")
	public ResponseEntity<String> second(@RequestBody Map<String, String> map, Principal principal, HttpSession session) {
		String id = principal.getName();
		map.put("id",id);
		
		int result = this.memServiece.second(map);
		if (result == 1) {//등록 성공 시
			session.setAttribute("secondAuth", "success");
			return ResponseEntity.ok("success");
		} else { //실패 시
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		}
	}
	
	/**
	 * 회원 제재
	 * @param model
	 * @param keyword
	 * @param sort
	 * @param currentPage
	 * @param map
	 * @return
	 */
	@GetMapping("/mem/restriction")
	public String memRestriction(Model model,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "") String sort,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, Map<String, String> map) {
		
	    map.put("keyword", keyword); //검색어
	    map.put("sort", sort); //정렬
	    map.put("currentPage", Integer.toString(currentPage)); //현재페이지
	    int size = 20; //한 페이지에 보여질 개수
	    map.put("size", String.valueOf(size));
	    
	    //전체 회원 목록
		List<MemVO> memList = this.memServiece.memList(map);
		
		//전체 회원수
		int total = this.memServiece.memTotal(map);
		
		//페이징 처리
		PagingDTO<MemVO> memPage = new PagingDTO<MemVO>(total, currentPage, size, memList);
		model.addAttribute("data", memPage);
		
		return "admin/mem/restriction";
	}
	
	/**
	 * 전체 회원 엑셀
	 * @param response
	 * @throws IOException
	 */
	@GetMapping("/mem/downloadExcel")
	public void memDownloadExcel(HttpServletResponse response) throws IOException {

		String[] headers = { "번호", "아이디", "이름", "성별", "전화번호", "이메일", "메일수신",
							 "생일", "기본주소", "상세주소", "마일리지", "MBTI", "등급", 
							 "가입일자", "탈퇴일자", "회원상태"  };
		List<MemVO> memList = this.memServiece.excelList();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		// 엑셀 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("전체 회원");

		// 헤더 생성
		Row headerRow = sheet.createRow(0);
		for(int i = 0; i < headers.length; i++) {
			headerRow.createCell(i).setCellValue(headers[i]);
		}

		// 데이터 저장
		int rowNum = 1;
		
		for (MemVO vo : memList) {
			Row row = sheet.createRow(rowNum);
			
			row.createCell(0).setCellValue(rowNum++); //번호
			row.createCell(1).setCellValue(vo.getMemId()); //아이디
			row.createCell(2).setCellValue(vo.getMemNm()); //이름
			row.createCell(3).setCellValue(vo.getMemGen()); //성별
			row.createCell(4).setCellValue(vo.getMemTel()); //전화번호
			row.createCell(5).setCellValue(vo.getMemEmail()); //이메일
			row.createCell(6).setCellValue(vo.getMailAgr()); //메일수신
			String memBir = vo.getMemBir() != null ? sdf.format(vo.getMemBir()) : ""; 
			row.createCell(7).setCellValue(memBir); //생일
			row.createCell(8).setCellValue(vo.getMemAddr1()); //기본주소
			row.createCell(9).setCellValue(vo.getMemAddr2()); //상세주소
			row.createCell(10).setCellValue(vo.getMemMlg()); //마일리지
			row.createCell(11).setCellValue(vo.getMemMbti()); //MBTI
			
			String grad = "";
			if (vo.getGradId() == null) {
			    grad = "";
			} else if (vo.getGradId().equals("G01")) {
			    grad = "BRONZE";
			} else if (vo.getGradId().equals("G02")) {
			    grad = "SILVER";
			} else if (vo.getGradId().equals("G03")) {
			    grad = "GOLD";
			} else if (vo.getGradId().equals("G04")) {
			    grad = "DIAMOND";
			}
			row.createCell(12).setCellValue(grad); // 등급

			String joinDt = vo.getJoinDt() != null ? sdf.format(vo.getJoinDt()) : ""; 
			row.createCell(13).setCellValue(joinDt); //가입일자
			String outDt = vo.getWhdwlDt() != null ? sdf.format(vo.getWhdwlDt()) : ""; 
			row.createCell(14).setCellValue(outDt); //탈퇴일자
			
			String abled = "";
			if(vo.getEnabled() == 1) {
				abled = "활성";
			} else {
				abled = "비활성";
			}
			row.createCell(15).setCellValue(abled); //회원상태
			
		}
		
		// 파일 다운로드를 위한 응답 헤더 설정
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment; filename='employeesVac.xlsx'");
		response.setHeader("Content-Transfer-Encoding", "binary");

		// response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
	}
	
	/**
	 * 회원 상세
	 * @param memId
	 * @param model
	 * @param map
	 * @param memVO
	 * @return
	 */
	@GetMapping("/mem/detail")
    public String memberDetail(@RequestParam("memId") String memId, Model model, Map<String, String> map, MemVO memVO) {
		
		//memVO에 param으로 받으 memId를 넣음
		memVO.setMemId(memId);
		
		//상세 회원 정보
		memVO = this.memServiece.memDetail(memVO);
		model.addAttribute("memVO", memVO);
		
		//회원 작성 게시글
		List<BrdVO> brdList = this.memServiece.memBrdList(memVO);
		model.addAttribute("brdList", brdList);
		
		//회원 예약 내역
		map.put("memId", memId);
		map.put("rsvCode", "K01"); //입금대기
		List<RsvListVO> rsvK01 = this.memServiece.rsvList(map);
		model.addAttribute("rsvK01",rsvK01);
		
		map.put("rsvCode", "K02"); //예약확정
		List<RsvListVO> rsvK02 = this.memServiece.rsvList(map);
		model.addAttribute("rsvK02",rsvK02);
		
		map.put("rsvCode", "K03"); //환불요청
		List<RsvListVO> rsvK03 = this.memServiece.rsvList(map);
		model.addAttribute("rsvK03",rsvK03);
		
		map.put("rsvCode", "K04"); //환불처리완료
		List<RsvListVO> rsvK04 = this.memServiece.rsvList(map);
		model.addAttribute("rsvK04",rsvK04);
		
		return "admin/mem/detail";
    }
	
	/**
	 * 회원 경고 상태 변경
	 * @param map
	 * @param memVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/mem/wrnStUpdate")
	public String wrnStUpdate(@RequestBody Map<String, String> map, MemVO memVO) {
		
		String memId = map.get("memId"); //회원ID
		String wrnSt = map.get("wrnSt"); //경고상태
		String intrResn = map.get("intrResn"); //경고 이유
        
        memVO.setMemId(memId);
        memVO.setWrnSt(wrnSt);
        
        //회원 경고 상태 변경
        this.memServiece.updateWarningStatus(memVO);
        
        //회원 상세 정보
        memVO = this.memServiece.memDetail(memVO);
        String memEmail = memVO.getMemEmail(); //회원 이메일
        String subject = ""; //보낼 이메일 제목
        
        if(wrnSt.equals("0")) { //일반
        	//차단 회원 테이블에서 삭제
        	this.memServiece.deleteIntrMem(map);
        }
        
        if (wrnSt.equals("1")) { //경고
        	//경고 개수 추가
        	this.memServiece.updateWarningCnt(memVO);
        	
        	//이메일 보내기
        	//제목
        	subject += "[wonderWay] 게시판 정책 위반으로 경고 조치합니다.";
        	this.adEmailService.sendEmail(memEmail, subject, intrResn); //받는 메일주소, 제목, 이유
        }
        
        if (wrnSt.equals("2")) { //차단
        	//차단 회원 테이블에 추가
        	this.memServiece.insertInrtMem(map);
        	
        	//이메일 보내기
        	//제목
        	subject += "[wonderWay] 게시판 정책 위반으로 1개월 정지합니다.";
        	this.adEmailService.sendEmail(memEmail, subject, intrResn); //받는 메일 주소, 제목, 이유
        }
        
		return memId;
	}
	
	/**
	 * 회원 상담/채팅
	 * @param model
	 * @param principal
	 * @return
	 */
	@GetMapping("/mem/counseling")
	public String memCounseling(Model model, Principal principal) {
		//로그인한 ID
		String id = principal.getName();
		model.addAttribute("id",id);
		
		//회원 리스트
		List<MemVO> memList = this.memServiece.chatMemList();
		model.addAttribute("memList",memList);
		
		return "admin/mem/counseling";
	}
	
	/**
	 * 숙박 업체 관리
	 * @param model
	 * @param keyword
	 * @param sort
	 * @param currentPage
	 * @param map
	 * @return
	 */
	@GetMapping("/busi/sty")
	public String busiSty(Model model, 
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "") String sort,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, Map<String, String> map) {
		
	    map.put("keyword", keyword); //검색어
	    map.put("sort", sort); ///정렬
	    map.put("currentPage", Integer.toString(currentPage)); //현재 페이지
	    int size = 20; //한 페이지에 보여질 개수
	    map.put("size", String.valueOf(size));

	    //숙박 업체 리스트
	    List<BusiVO> styList = this.adBusiService.styList(map);

	    //숙박 업체수
		int total = this.adBusiService.styTotal(map);
		model.addAttribute("total",total);

		//페이징 처리
		PagingDTO<BusiVO> styPage = new PagingDTO<BusiVO>(total, currentPage, size, styList);
		model.addAttribute("data", styPage);
		
		//활성 업체수
		int enable = this.adBusiService.enableSty();
		model.addAttribute("enable", enable);
		//비활성 업체수
		int disable = this.adBusiService.disableSty();
		model.addAttribute("disable", disable);
		
		//호텔 수
		int hotel = this.adBusiService.hotel();
		model.addAttribute("hotel", hotel);
		//모텔 수
		int motel = this.adBusiService.motel();
		model.addAttribute("motel", motel);
		//리조트 수
		int resort = this.adBusiService.resort();
		model.addAttribute("resort", resort);
		//게스트하우스 수
		int ghouse = this.adBusiService.ghouse();
		model.addAttribute("ghouse", ghouse);
		//펜션 수
		int pension = this.adBusiService.pension();
		model.addAttribute("pension", pension);
		
		//이번달 숙박업체 매출
		int thisMth = this.adBusiService.thisMthSty();
		model.addAttribute("thisMth", thisMth);
		//지난달 숙박업체 매출
		int lastMth = this.adBusiService.lastMthSty();
		model.addAttribute("lastMth", lastMth);
		
		double increaseMth= (double)(thisMth - lastMth) / lastMth * 100;
		model.addAttribute("increaseMth", increaseMth);
		
		return "admin/busi/sty";
	}
	
	/**
	 * 숙박 업체 엑셀
	 * @param response
	 * @throws IOException
	 */
	@GetMapping("/sty/downloadExcel")
	public void styDownloadExcel(HttpServletResponse response) throws IOException {

		String[] headers = { "번호", "업체ID", "업체코드", "로그인ID", "업체명", "주소",
							 "대표자명", "별점", "사업자번호", "이메일", "전화번호",
							 "원더머니", "계좌", "가입일자", "탈퇴일자", "회원상태"  };
		List<BusiVO> busiList = this.adBusiService.styExcelList();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		// 엑셀 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("업체 정보");

		// 헤더 생성
		Row headerRow = sheet.createRow(0);
		for(int i = 0; i < headers.length; i++) {
			headerRow.createCell(i).setCellValue(headers[i]);
		}

		// 데이터 저장
		int rowNum = 1;
		
		for (BusiVO vo : busiList) {
			Row row = sheet.createRow(rowNum);
			
			row.createCell(0).setCellValue(rowNum++); //번호
			row.createCell(1).setCellValue(vo.getBusiId()); //업체ID
			
			String busiCode = ""; //업체코드
			if(vo.getBusiCode() == null) {
				busiCode = "";
			} else if(vo.getBusiCode().equals("B01")) {
				String acmdCode = "";
				if(vo.getAcmdCode() == null) {
					acmdCode = "";
				} else if (vo.getAcmdCode().equals("A01")) {
					acmdCode = "호텔";
				} else if (vo.getAcmdCode().equals("A02")) {
					acmdCode = "모텔";
				} else if (vo.getAcmdCode().equals("A03")) {
					acmdCode = "리조트";
				} else if (vo.getAcmdCode().equals("A04")) {
					acmdCode = "게스트하우스";
				} else {
					acmdCode = "펜션";
				}
				row.createCell(2).setCellValue(acmdCode);
			} else {
				busiCode = "렌트카";
				row.createCell(2).setCellValue(busiCode);
			}
			
			row.createCell(3).setCellValue(vo.getLginId()); //로그인ID
			row.createCell(4).setCellValue(vo.getBusiNm()); //업체명
			row.createCell(5).setCellValue(vo.getBusiLoc()); //주소
			row.createCell(6).setCellValue(vo.getRprsvNm()); //대표자명
			row.createCell(7).setCellValue(vo.getBusiScr()); //별점
			row.createCell(8).setCellValue(vo.getBusiNo()); //사업자번호
			row.createCell(9).setCellValue(vo.getBusiEmail()); //이메일
			row.createCell(10).setCellValue(vo.getBusiTel()); //전화번호
			row.createCell(11).setCellValue(vo.getBusiMny()); //원더머니
			row.createCell(12).setCellValue(vo.getAccount()); //계좌
			String joinDt = vo.getRegDt() != null ? sdf.format(vo.getRegDt()) : ""; 
			row.createCell(13).setCellValue(joinDt); //가입일자
			String outDt = vo.getWhdwlDt() != null ? sdf.format(vo.getWhdwlDt()) : ""; 
			row.createCell(14).setCellValue(outDt); //탈퇴일자
			
			String abled = "";
			if(vo.getEnabled() == 1) {
				abled = "활성";
			} else {
				abled = "비활성";
			}
			row.createCell(15).setCellValue(abled); //회원상태
			
		}
		
		// 파일 다운로드를 위한 응답 헤더 설정
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment; filename='employeesVac.xlsx'");
		response.setHeader("Content-Transfer-Encoding", "binary");

		// response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
	}
	
	/**
	 * 숙박 업체 상세
	 * @param busiId
	 * @param busiVO
	 * @param model
	 * @return
	 */
	@GetMapping("/busi/styDetail")
	public String styDetail(@RequestParam("busiId") String busiId, BusiVO busiVO, Model model) {
		
		busiVO.setBusiId(busiId); //업체ID
		
		//숙박 업체 상세
		busiVO = this.adBusiService.styDetail(busiVO);
		model.addAttribute("busiVO",busiVO);
		
		//방의 개수
		int countRoom = this.adBusiService.countRoom(busiVO);
		model.addAttribute("countRoom", countRoom);
		
		//지난 30일 예약 건수
		int countRsv = this.adBusiService.countRsv(busiVO);
		model.addAttribute("countRsv", countRsv);
		
		//지난 30일 수익
		String totalPay = this.adBusiService.totalPay(busiVO);
		if (totalPay == null) {
		    totalPay = "0";
		}
		model.addAttribute("totalPay",totalPay);
		
		//방 목록
		List<RmVO> roomList = this.adBusiService.roomList(busiVO);
		model.addAttribute("roomList", roomList);
		
		return "admin/busi/styDetail";
	}
	
	/**
	 * 렌터카 업체 관리
	 * @param model
	 * @param keyword
	 * @param sort
	 * @param currentPage
	 * @param map
	 * @return
	 */
	@GetMapping("/busi/rnt")
	public String busiRnt(Model model, 
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "") String sort,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, Map<String, String> map) {
		
	    map.put("keyword", keyword); //검색어
	    map.put("sort", sort); //정렬
	    map.put("currentPage", Integer.toString(currentPage)); //현제 페이지
	    int size = 20; //한 페이지에 보여질 개수
	    map.put("size", String.valueOf(size));
	    
	    //랜터카 업체 목록
	    List<BusiVO> rntList = this.adBusiService.rntList(map);
		
	    //렌터카 업체 수
		int total = this.adBusiService.rntTotal(map);
		model.addAttribute("total",total);
		
		//페이징 처리
		PagingDTO<BusiVO> styPage = new PagingDTO<BusiVO>(total, currentPage, size, rntList);
		model.addAttribute("data", styPage);
		
		//활성 업체수
		int enable = this.adBusiService.enableRnt();
		model.addAttribute("enable", enable);
		//비활성 업체수
		int disable = this.adBusiService.disableRnt();
		model.addAttribute("disable", disable);
		
		//이번달 숙박업체 매출
		int thisMth = this.adBusiService.thisMthRnt();
		model.addAttribute("thisMth", thisMth);
		//지난달 숙박업체 매출
		int lastMth = this.adBusiService.lastMthRnt();
		model.addAttribute("lastMth", lastMth);
		
		double increaseMth= (double)(thisMth - lastMth) / lastMth * 100;
		model.addAttribute("increaseMth", increaseMth);
		
		return "admin/busi/rnt";
	}
	
	/**
	 * 렌터카 업체 엑셀
	 * @param response
	 * @throws IOException
	 */
	@GetMapping("/rnt/downloadExcel")
	public void rntDownloadExcel(HttpServletResponse response) throws IOException {

		String[] headers = { "번호", "업체ID", "업체코드", "로그인ID", "업체명", "주소",
							 "대표자명", "별점", "사업자번호", "이메일", "전화번호",
							 "원더머니", "계좌", "가입일자", "탈퇴일자", "회원상태"  };
		List<BusiVO> busiList = this.adBusiService.rntExcelList();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		// 엑셀 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("업체 정보");

		// 헤더 생성
		Row headerRow = sheet.createRow(0);
		for(int i = 0; i < headers.length; i++) {
			headerRow.createCell(i).setCellValue(headers[i]);
		}

		// 데이터 저장
		int rowNum = 1;
		
		for (BusiVO vo : busiList) {
			Row row = sheet.createRow(rowNum);
			
			row.createCell(0).setCellValue(rowNum++); //번호
			row.createCell(1).setCellValue(vo.getBusiId()); //업체ID
			
			String busiCode = ""; //업체코드
			if(vo.getBusiCode() == null) {
				busiCode = "";
			} else if(vo.getBusiCode().equals("B01")) {
				String acmdCode = "";
				if(vo.getAcmdCode() == null) {
					acmdCode = "";
				} else if (vo.getAcmdCode().equals("A01")) {
					acmdCode = "호텔";
				} else if (vo.getAcmdCode().equals("A02")) {
					acmdCode = "모텔";
				} else if (vo.getAcmdCode().equals("A03")) {
					acmdCode = "리조트";
				} else if (vo.getAcmdCode().equals("A04")) {
					acmdCode = "게스트하우스";
				} else {
					acmdCode = "펜션";
				}
				row.createCell(2).setCellValue(acmdCode);
			} else {
				busiCode = "렌트카";
				row.createCell(2).setCellValue(busiCode);
			}
			
			row.createCell(3).setCellValue(vo.getLginId()); //로그인ID
			row.createCell(4).setCellValue(vo.getBusiNm()); //업체명
			row.createCell(5).setCellValue(vo.getBusiLoc()); //주소
			row.createCell(6).setCellValue(vo.getRprsvNm()); //대표자명
			row.createCell(7).setCellValue(vo.getBusiScr()); //별점
			row.createCell(8).setCellValue(vo.getBusiNo()); //사업자번호
			row.createCell(9).setCellValue(vo.getBusiEmail()); //이메일
			row.createCell(10).setCellValue(vo.getBusiTel()); //전화번호
			row.createCell(11).setCellValue(vo.getBusiMny()); //원더머니
			row.createCell(12).setCellValue(vo.getAccount()); //계좌
			String joinDt = vo.getRegDt() != null ? sdf.format(vo.getRegDt()) : ""; 
			row.createCell(13).setCellValue(joinDt); //가입일자
			String outDt = vo.getWhdwlDt() != null ? sdf.format(vo.getWhdwlDt()) : ""; 
			row.createCell(14).setCellValue(outDt); //탈퇴일자
			
			String abled = "";
			if(vo.getEnabled() == 1) {
				abled = "활성";
			} else {
				abled = "비활성";
			}
			row.createCell(15).setCellValue(abled); //회원상태
			
		}
		
		// 파일 다운로드를 위한 응답 헤더 설정
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment; filename='employeesVac.xlsx'");
		response.setHeader("Content-Transfer-Encoding", "binary");

		// response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
	}
	
	/**
	 * 렌터카 업체 상세
	 * @param busiId
	 * @param busiVO
	 * @param model
	 * @return
	 */
	@GetMapping("/busi/rntDetail")
	public String rntDetail(@RequestParam("busiId") String busiId, BusiVO busiVO, Model model) {
		
		busiVO.setBusiId(busiId); //업체ID
		
		//렌터카 업체 상세
		busiVO = this.adBusiService.styDetail(busiVO);
		model.addAttribute("busiVO",busiVO);
		
		//렌터카 차량 개수
		int countCar = this.adBusiService.countCar(busiVO);
		model.addAttribute("countCar", countCar);
		
		//지난 30일 예약건수
		int countRsv = this.adBusiService.countRsv(busiVO);
		model.addAttribute("countRsv", countRsv);
		
		//지난 30일 수익
		String totalPay = this.adBusiService.totalPay(busiVO);
		if (totalPay == null) {
			totalPay = "0";
		}
		model.addAttribute("totalPay",totalPay);
		
		//차량 목록
		List<CarVO> carList = this.adBusiService.carList(busiVO);
		model.addAttribute("carList", carList);
		
		return "admin/busi/rntDetail";
	}
	
	/**
	 * 업체 메일 보내기
	 * @param map
	 * @return
	 */
	@PostMapping("/busi/sendMail")
	public ResponseEntity<String> sendMail(@RequestBody Map<String, String> map) {
		
		String busiEmail = map.get("busiEmail"); //업체 이메일
		String subject = map.get("subject"); //제목
		String text = map.get("text"); //내용
		
		String result = this.adEmailService.sendEmail(busiEmail, subject, text); //이메일 주소, 제목, 내용

		if (result == "success") { //이메일 보내기 성공 시
			return ResponseEntity.ok("success");
		} else { //실패 시
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		}
	}
	
	/**
	 * 업체 활성/비활성화
	 * @param map
	 * @param busiVO
	 * @return
	 */
	@PostMapping("/busi/abled")
	public ResponseEntity<String> updateAbled(@RequestBody Map<String, String> map, BusiVO busiVO) {
		
		String busiId = map.get("busiId"); //업체ID
		int enabled = Integer.parseInt(map.get("enabled")); //활성,비활성
		busiVO.setBusiId(busiId);
		busiVO.setEnabled(enabled);

		//업체 활성화 or 비활성화
		int update = this.adBusiService.updateAbled(busiVO);

		if (update == 1) { //성공 시
			return ResponseEntity.ok("success");
		} else { //실패 시
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		}
	}
	
	/**
	 * 업체 상담/채팅
	 * @param model
	 * @param principal
	 * @param busiVO
	 * @param chatRmVO
	 * @return
	 */
	@GetMapping("/busi/counseling")
	public String busiCounseling(Model model, Principal principal, ChatRmVO chatRmVO) {
		//채팅 아이디
		String id = principal.getName();
		model.addAttribute("id",id);
		
		//업체 리스트
		List<BusiVO> busiList = this.adBusiService.busiList();
		model.addAttribute("busiList",busiList);
		
		return "admin/busi/counseling";
	}
	
	/**
	 * 게시판 목록
	 * @param model
	 * @param keyword
	 * @param sort
	 * @param currentPage
	 * @param map
	 * @return
	 */
	@GetMapping("/brd/list")
	public String brdList(Model model,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "") String sort,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, Map<String, String> map) {
		
	    map.put("keyword", keyword); //검색어
	    map.put("sort", sort); //정렬
	    map.put("currentPage", Integer.toString(currentPage)); //현제 페이지
	    int size = 20; //한 페이지에 보여질 개수
	    map.put("size", String.valueOf(size));

	    //전체 게시글 목록
		List<BrdVO> brdList = this.adBrdService.brdList(map);
		
		//전체 게시글 개수
		int total = this.adBrdService.brdTotal(map);
		
		//페이징 처리
		PagingDTO<BrdVO> brdPage = new PagingDTO<BrdVO>(total, currentPage, size, brdList);
		model.addAttribute("data", brdPage);
		
		return "admin/brd/list";
	}
	
	/**
	 * 게시글 차단
	 * @param map
	 * @param brdVO
	 * @return
	 */
	@PostMapping("/brd/brdIntr")
	public ResponseEntity<String> brdIntr(@RequestBody Map<String, String> map, BrdVO brdVO) {
		
		//차단
		String intr = map.get("choice");
		
		//게시글ID
		String brdId = map.get("brdId");
		
		//차단 이유
		String intrResn = map.get("intrResn");
		
		int update = 0;
		brdVO.setBrdId(brdId);
		
		if(intr.equals("O")) { //신고 확인 처리
			update = this.adBrdService.reprtCk(brdVO);
		}
		if(!intr.equals("O")){ //0이 아닌 경우 = 차단 or 해제
			brdVO.setIntr(intr);
			brdVO.setIntrResn(intrResn);
			update = this.adBrdService.blindBrd(brdVO);
		}

		if (update == 1) { //신고 접수 게시물 상태 수정 성공 시
			return ResponseEntity.ok("success");
		} else { //실패 시
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		}
	}
	
	/**
	 * 공지사항
	 * @param model
	 * @param keyword
	 * @param sort
	 * @param currentPage
	 * @param map
	 * @return
	 */
	@GetMapping("/brd/notice")
	public String brdNotice(Model model,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "") String sort,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, Map<String, String> map) {
		
	    map.put("keyword", keyword); //검색어
	    map.put("sort", sort); //정렬
	    map.put("currentPage", Integer.toString(currentPage)); //현재 페이지
	    int size = 20; //한 페이지에 보여질 개수
	    map.put("size", String.valueOf(size));
	    
	    //공지사항 목록
		List<BrdVO> brdList = this.adBrdService.brdNotice(map);
		
		//공지사항 개수
		int total = this.adBrdService.noticeTotal(map);
		
		//페이징 처리
		PagingDTO<BrdVO> brdPage = new PagingDTO<BrdVO>(total, currentPage, size, brdList);
		model.addAttribute("data", brdPage);
		
		return "admin/brd/notice";
	}
	
	/**
	 * 공지사항 작성
	 * @return
	 */
	@GetMapping("/brd/noticeRegistration")
	public String noticeRegistration() {
		return "admin/brd/noticeRegistration";
	}
	
	/**
	 * 공지사항 등록
	 * @param brdVO
	 * @param attachDeVO
	 * @param bResult
	 * @return
	 */
	@PostMapping("/brd/noticeRegistrationPost")
	public String noticeRegistrationPost(@Validated @ModelAttribute("brdVO") BrdVO brdVO, AttachDeVO attachDeVO, BindingResult bResult) {
		
		// 유효성 검사 결과 체킹///
		if (bResult.hasErrors()) { // true :오류 있음
			List<ObjectError> allErrors = bResult.getAllErrors();
			for (ObjectError objectError : allErrors) {
				log.error("allError : " + objectError);
			}
			// 입력폼으로 다시 forwarding. 오류 정보도 함께 감.
			return "redirect:/admin/brd/noticeRegistration";
		}
		int result = this.adBrdService.noticeRegistration(brdVO);
		log.info("result : " + result);
		
		return "redirect:/admin/brd/notice";
	}
	
	/**
	 * 공지사항 상태 변경
	 * @param map
	 * @param brdVO
	 * @return
	 */
	@PostMapping("/brd/noticeIntr")
	public ResponseEntity<String> noticeIntr(@RequestBody Map<String, String> map, BrdVO brdVO) {
		
		//공지 여부
		String intr = map.get("choice");
		
		//게시글ID
		String brdId = map.get("brdId");

		brdVO.setIntr(intr);
		brdVO.setBrdId(brdId);

		//공지 여부 상태 변경
		int update = this.adBrdService.noticeIntr(brdVO);

		if (update == 1) { //상태 변경 성공 시
			return ResponseEntity.ok("success");
		} else { //실패 시
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		}
	}
	
	/**
	 * 공지사항 삭제
	 * @param map
	 * @param brdVO
	 * @return
	 */
	@PostMapping("/brd/noticeDelete")
	public ResponseEntity<String> noticeDelete(@RequestBody Map<String, String> map, BrdVO brdVO) {
		
		//게시글ID
		String brdId = map.get("brdId");
		brdVO.setBrdId(brdId);
		
		//공지사항 삭제
		int delete = this.adBrdService.noticeDelete(brdVO);
		
		if (delete == 1) { //공지사항 삭제 성공 시
			return ResponseEntity.ok("success");
		} else { //실패 시
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		}
	}
	
	/**
	 * 공지사항 수정
	 * @param brdId
	 * @param brdVO
	 * @param model
	 * @return
	 */
	@GetMapping("/brd/noticeModify")
	public String noticeModify(@RequestParam("brdId") String brdId, BrdVO brdVO, Model model) {
		brdVO.setBrdId(brdId);
		
		//수정할 공지사항 상세
		brdVO = this.adBrdService.brdSelect(brdVO);
		model.addAttribute("brdVO", brdVO);
		
		return "admin/brd/noticeModify";
	}
	
	/**
	 * 공지사항 수정 진행
	 * @param brdVO
	 * @return
	 */
	@PostMapping("/brd/noticeModifyPost")
	public String noticeModifyPost(@ModelAttribute("brdVO") BrdVO brdVO) {
		
		//게시글ID
		String brdId = brdVO.getBrdId();
		
		//공지사항 수정
		int update = this.adBrdService.noticeModifyPost(brdVO);
		
		if (update > 0) { //공지사항 수정 성공 시
			return "redirect:/member/csc/cscNoticeDetail?brdId=" + brdId;
		} else { //실패 시
			return "redirect:/admin/brd/noticeModify?brdId=" + brdId;
		}
	}

	/**
	 * 리뷰
	 * @param model
	 * @param keyword
	 * @param sort
	 * @param currentPage
	 * @param map
	 * @return
	 */
	@GetMapping("/brd/review")
	public String review(Model model, 
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "") String sort,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, Map<String, String> map) {
		
	    map.put("keyword", keyword); //검색어
	    map.put("sort", sort); //정렬
	    map.put("currentPage", Integer.toString(currentPage)); //현제 페이지
	    int size = 20; //한 페이지에 보여질 개수
	    map.put("size", String.valueOf(size));
	    
	    //리뷰 목록
		List<AdReviewListVO> rvwList = this.adRvwService.rvwList(map);
		
		//리뷰 개수
		int total = this.adRvwService.rvwTotal(map);
		
		//페이징 처리
		PagingDTO<AdReviewListVO> rvwPage = new PagingDTO<AdReviewListVO>(total, currentPage, size, rvwList);
		model.addAttribute("data", rvwPage);
		
		return "admin/brd/review";
	}
	
	/**
	 * 리뷰 차단
	 * @param map
	 * @param adReviewListVO
	 * @return
	 */
	@PostMapping("/brd/rvwBlind")
	public ResponseEntity<String> rvwBlind(@RequestBody Map<String, String> map, AdReviewListVO adReviewListVO) {
		
		//리뷰ID
		String rsvId = map.get("rsvId");
		adReviewListVO.setRsvId(rsvId);
		
		//리뷰차단 여부
		String rvwBlind = map.get("rvwBlind");
		adReviewListVO.setRvwBlind(rvwBlind);
		
		//리뷰 상태 수정
		int update = this.adRvwService.blindRvw(adReviewListVO);

		if (update == 1) { //리뷰 상채 수정 성공 시
			return ResponseEntity.ok("success");
		} else { //실패 시
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		}
	}
	
	/**
	 * 자주 묻는 질문
	 * @param model
	 * @param keyword
	 * @param sort
	 * @param currentPage
	 * @param map
	 * @return
	 */
	@GetMapping("/brd/faq")
	public String faq(Model model,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "") String sort,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, Map<String, String> map) {
		
	    map.put("keyword", keyword); //검색어
	    map.put("sort", sort); //정렬
	    map.put("currentPage", Integer.toString(currentPage)); //현재 페이지
	    int size = 20; //한 페이지에 보여질 개수
	    map.put("size", String.valueOf(size));

	    //자주 묻는 질문 목록
		List<FaqVO> faqList = this.adFaqService.faqList(map);
		
		//자주 묻는 질문 개수
		int total = this.adFaqService.faqTotal(map);
		
		//페이징 처리
		PagingDTO<FaqVO> faqPage = new PagingDTO<FaqVO>(total, currentPage, size, faqList);
		model.addAttribute("data", faqPage);
		
		return "admin/brd/faq";
	}
	
	/**
	 * FAQ 작성
	 * @return
	 */
	@GetMapping("/brd/faqRegistration")
	public String faqRegistration() {
		return "admin/brd/faqRegistration";
	}
	
	/**
	 * FAQ 등록
	 * @param map
	 * @param faqVO
	 * @return
	 */
	@PostMapping("/brd/faqRegistrationPost")
	public ResponseEntity<String> faqRegistrationPost(@RequestBody Map<String, String> map, FaqVO faqVO) {
		
		//제목
		String faqTt = map.get("faqTt"); 
		faqVO.setFaqTt(faqTt);
		
		//질문 코드 => F01	국내/해외숙소, F02	렌터카, F03	교통/항공, F04 쿠폰/포인트, F05	결제/영수증, F06 회원
		String faqCode = map.get("faqCode"); 
		faqVO.setFaqCode(faqCode);
		
		//답변
		String faqAns = map.get("faqAns"); 
		faqVO.setFaqAns(faqAns);
		
		//자주 묻는 질문 등록
		int regist = this.adFaqService.faqRegistration(faqVO);
		log.info("regist : " + regist);
		
		if (regist == 1) {//등록 성공 시
			return ResponseEntity.ok("success");
		} else { //실패 시
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		}
	}
	
	/**
	 * FAQ 수정
	 * @param faqId
	 * @param faqVO
	 * @param model
	 * @return
	 */
	@GetMapping("/brd/faqModify")
	public String faqModify(@RequestParam("faqId") String faqId, FaqVO faqVO, Model model) {
		
		//자주 묻는 질문 게시글ID
		faqVO.setFaqId(faqId);
		
		//수정할 자주 묻는 질문 상세
		faqVO = this.adFaqService.faqSelect(faqVO);
		model.addAttribute("faqVO", faqVO);
		
		return "admin/brd/faqModify";
	}
	
	/**
	 * FAQ 수정 등록
	 * @param map
	 * @param faqVO
	 * @return
	 */
	@PostMapping("/brd/faqModifyPost")
	public ResponseEntity<String> faqModifyPost(@RequestBody Map<String, String> map, FaqVO faqVO) {
		
		//자주 묻는 질문 게시글ID
		String faqId = map.get("faqId");
		faqVO.setFaqId(faqId);
		
		//자주 묻는 질문 제목
		String faqTt = map.get("faqTt");
		faqVO.setFaqTt(faqTt);
		
		//자주 묻는 질문 코드
		String faqCode = map.get("faqCode");
		faqVO.setFaqCode(faqCode);
		
		//자주 묻는 질문 답변
		String faqAns = map.get("faqAns");
		faqVO.setFaqAns(faqAns);
		
		//자주 묻는 질문 수정 등록
		int modify = this.adFaqService.faqModifyPost(faqVO);
		
		if (modify == 1) { //수정 등록 성공 시
			return ResponseEntity.ok("success");
		} else { //실패 시
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		}
	}
	
	/**
	 * 자주 묻는 질문 삭제
	 * @param map
	 * @param faqVO
	 * @return
	 */
	@PostMapping("/brd/faqDelete")
	public ResponseEntity<String> faqDelete(@RequestBody Map<String, String> map, FaqVO faqVO) {
		
		//자주 묻는 질문 게시글ID
		String faqId = map.get("faqId");
		faqVO.setFaqId(faqId);
		
		//자주 묻는 질문 삭제
		int delete = this.adFaqService.faqDelete(faqVO);
		
		if (delete == 1) { //삭제 성공 시
			return ResponseEntity.ok("success");
		} else { //삭제 실패 시
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		}
	}
	
	/**
	 * 고객 문의
	 * @param model
	 * @param keyword
	 * @param sort
	 * @param currentPage
	 * @param map
	 * @return
	 */
	@GetMapping("/brd/inquiry")
	public String inquiry(Model model, 
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "") String sort,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, Map<String, String> map) {
		
	    map.put("keyword", keyword); //검색어
	    map.put("sort", sort); //정렬
	    map.put("currentPage", Integer.toString(currentPage)); //현재 페이지
	    int size = 20; //한 페이지에 보여질 개수
	    map.put("size", String.valueOf(size));
	    
	    //고객 문의 목록
		List<BrdVO> inqList = this.adBrdService.inquiryList(map);

		//고객 문의 개수
		int total = this.adBrdService.inqTotal(map);

		//페이징 처리
		PagingDTO<BrdVO> inqPage = new PagingDTO<BrdVO>(total, currentPage, size, inqList);
		model.addAttribute("data", inqPage);
		
		return "admin/brd/inquiry";
	}
	
	/**
	 * 고객 문의 답변 등록
	 * @param map
	 * @return
	 */
	@PostMapping("/brd/inquiryAnswer")
	public ResponseEntity<String> inquiryAnswer(@RequestBody Map<String, String> map) {
		
		//고객 문의 게시글ID
		String brdId = map.get("brdId");
		
		//고객 문의 답변 등록
		int update = this.adBrdService.inquiryAnswer(brdId);

		if (update == 1) { //답변 등록 성공 시
			return ResponseEntity.ok("success");
		} else { //실패 시
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		}
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////김찬수 ////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/**
	 * 예약 목록 페이지
	 * 요청 URI : /admin/reserve/list
	 * @param model
	 * @param currentPage : 현재 페이지
	 * @param size : 보여질 목록 요소의 개수
	 * @param keyword : 검색 키워드
	 * @param sort : 정렬 키워드
	 * @param page : 숙박업체 / 렌터카업체
	 * @param period : 기간 검색 키워드
	 * @return /admin/reserve/list?currentPage=&size=&keyword=&sort=&page=&period=
	 */
	@GetMapping("/reserve/list")
	public String reserveListSty(Model model
							, @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
							, @RequestParam(value = "size", required = false, defaultValue = "10") int size
							, @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
							, @RequestParam(value = "sort", required = false, defaultValue = "") String sort
							, @RequestParam(value = "page", required = false, defaultValue = "숙박") String page
							, @RequestParam(value = "period", required = false, defaultValue = "") String period) {
		log.info("Called reserveList");
		log.info("keyword : " + keyword);	
		log.info("sort : " + sort);
		log.info("period : " + period);
		log.info("page : " + page);
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("currentPage", Integer.toString(currentPage));
		map.put("size", String.valueOf(size));
		map.put("keyword", keyword);
		map.put("sort", sort);
		map.put("page", page);
		
		if(!period.equals("")) {
			String[] dateTodate = new String[3];
			dateTodate = period.split("\\s");
			if(dateTodate.length < 3) {
				log.debug("Split Length : " + dateTodate.length);
				return "redirect:/admin/reserve/list";
			}
			map.put("periodSt", dateTodate[0]);
			map.put("periodEd", dateTodate[2]);
		}
		
		List<RsvListVO> rsvListVOList = this.adRsvService.rsvList(map);
	
		int total = this.adRsvService.getTotal(map);
		log.info("total : " + total);
		
		model.addAttribute("data", new PagingDTO<RsvListVO>(total, currentPage, size, rsvListVOList));
		model.addAttribute("page", page);
		
		int cntStyMonth = this.adRsvService.cntStyMonth();
		int cntRntMonth = this.adRsvService.cntRntMonth();
		int sumRsvMonth = this.adRsvService.sumRsvMonth();
		
		model.addAttribute("cntAllMonth", cntRntMonth + cntStyMonth);
		model.addAttribute("cntStyMonth", cntStyMonth);
		model.addAttribute("cntRntMonth", cntRntMonth);
		model.addAttribute("sumRsvMonth", sumRsvMonth);
		
		log.info("숙박 예약 목록 : " + rsvListVOList);
		
		return "admin/reserve/list";
	}
	
	/**
	 * 예약 목록 상세, 모달에 정보 표시
	 * 요청 URI : /admin/reserve/rsvDetailPost
	 * @param rsvId : 예약 ID
	 * @param pageId : 숙박업체 / 렌터카업체
	 * @return 예약 정보 VO
	 */
	@ResponseBody
	@PostMapping("/reserve/rsvDetailPost")
	public RsvListVO reserveDetail(@RequestParam("rsvId") String rsvId
								 , @RequestParam("pageId") String pageId) {
		log.info("rsvId : " + rsvId);
		log.info("pageId : " + pageId);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("rsvId", rsvId);
		map.put("page", pageId);
		
		RsvListVO data = this.adRsvService.rsvDetail(map);
		
		log.info("data : " + data);
		
		return data;
	}
	
	/**
	 * 
	 * 요청 URI : /admin/reserve/list?currentPage=??&keyword=??&sort=??&period=??
	 * @param model : Model
	 * @param currentPage : 현재 페이지 번째
	 * @param keyword : 검색어
	 * @param sort : 정렬 키워드
	 * @param period : 기간 검색
	 * @return
	 */
	@GetMapping("/reserve/refund")
	public String refundList(Model model
						   , @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
						   , @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
						   , @RequestParam(value = "sort", required = false, defaultValue = "") String sort
						   , @RequestParam(value = "period", required = false, defaultValue = "") String period) {
		log.info("currentPage : " + currentPage);
		
		
		Map<String,String> map = new HashMap<String, String>();
		int size = 10;
		
		map.put("currentPage", Integer.toString(currentPage));
		map.put("size", String.valueOf(size));
		map.put("keyword", keyword);
		map.put("sort", sort);

		if(!period.equals("")) {
			String[] dateTodate = new String[3];
			dateTodate = period.split("\\s");
			if(dateTodate.length < 3) {
				log.debug("Split Length : " + dateTodate.length);
				return "redirect:/admin/reserve/list";
			}
			map.put("periodSt", dateTodate[0]);
			map.put("periodEd", dateTodate[2]);
		}
		
		List<RfdListVO> rfdListVOList = this.adRfdService.rfdList(map);
		log.info("환불 목록 : " + rfdListVOList);
		
		int total = this.adRfdService.getTotal(map);
		log.info("total : " + total);
		
		PagingDTO<RfdListVO> data = new PagingDTO<RfdListVO>(total, currentPage, size, rfdListVOList); 
		
		model.addAttribute("data", data);
		
		int cntRfdAll = this.adRfdService.cntRfdAll();
		int cntRfdAcceptAll = this.adRfdService.cntRfdAcceptAll();
		int sumRfdAll = this.adRfdService.sumRfdAll();
		
		model.addAttribute("cntRfdAll", cntRfdAll);
		model.addAttribute("cntRfdAcceptAll", cntRfdAcceptAll);
		model.addAttribute("sumRfdAll", sumRfdAll);
		
		return "admin/reserve/refund";
	}
	
	/**
	 * 요청 파라미터 : {"payId" : ??}
	 * @param payId : 결제 ID
	 * @return 환불 요청 정보 VO
	 */
	@ResponseBody
	@PostMapping("/reserve/rfdDetailPost")
	public RfdListVO refundDetail(@RequestParam("payId") String payId) {
		log.info("payId : " + payId);
		
		RfdListVO data = this.adRfdService.rfdDetail(payId);
		
		log.info("RfdListVO : " + data);
		
		return data;
	}
	
	/**
	 * 환불 요청 승인
	 * 요청 파라미터 : {"payId" : ??}
	 * @param payId : 결제 ID
	 * @return 환불 상태 변경 성공 시 success
	 */
	@ResponseBody
	@PostMapping("/reserve/rfdAccept")
	public String refundAccept(@RequestParam("acceptId") String payId) {
		log.info("Called Accept Refund");
		
		int cnt = this.adRfdService.rfdAccept(payId);
		cnt += this.adRfdService.rfdDtAccept(payId);
		cnt += this.adRfdService.rsvAccept(payId);
		
		if(cnt > 2) {
			log.info("update success");
			return "success";
		} else {
			return "failed";
		}
	}

	/**
	 * 환불 요청 거절
	 * 요청 파라미터 : {"payId" : payId}
	 * @param payId : 결제 ID
	 * @return 환불 상태 변경 성공 시 success
	 */
	@ResponseBody
	@PostMapping("/reserve/rfdDenied")
	public String refundDenied(@RequestParam("deniedId") String payId) {
		int cnt = this.adRfdService.rfdDenied(payId);
		
		if(cnt > 0) {
			log.info("update success");
			return "success";
		} else {
			return "failed";
		}
	}
	
	/**
	 * 환불 정책 설정
	 * 요청 파라미터 : {"radioFee" : radioFee, "selectFee" : selectFee, "inputFee" : inputFee}
	 * @param radioFee : 숙박예약 정책 / 렌터카예약 정책
	 * @param selectFee : 수수료 기한 마지노선 선택값
	 * @param inputFee : 변경할 수수료 비율
	 * @return 수수료 비율 변경 성공 시 success
	 */
	@ResponseBody
	@PostMapping("/reserve/rfdFeePost")
	public String refundFee(@RequestParam("radioFee") String radioFee
						  , @RequestParam("selectFee") String selectFee
						  , @RequestParam("inputFee") String inputFee) {
		
		log.info("postValues : " + radioFee + ", "+ selectFee + ", "+ inputFee);
		String rfdFeeId = radioFee+selectFee;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("rfdFeeId", rfdFeeId);
		map.put("rfdFeePer", inputFee);
		
		int cnt = adRfdService.rfdUpdateFee(map);
		
		if(cnt > 0) {
			log.info("update success");
			return "success";
		} else {
			return "failed";
		}
	}
	
	/**
	 * 현재 진행 중 광고 목록
	 * 요청 URI : /admin/advertise/list
	 * @param model
	 * @param currentPage : 현재 페이지 번째
	 * @param keyword : 검색어
	 * @param sort : 정렬 키워드
	 * @param period : 기간 검색
	 * @return /admin/advertise/list?currentPage=&keyword=&sort=&period=
	 */
	@GetMapping("/advertise/list")
	public String advertiseList(Model model
 							  , @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
							  , @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
							  , @RequestParam(value = "sort", required = false, defaultValue = "") String sort
							  , @RequestParam(value = "period", required = false, defaultValue = "") String period) {
		log.info("currentPage : " + currentPage);
		log.info("keyword : " + keyword);
		log.info("sort : " + sort);
		log.info("period : " + period);
		
		Map<String,String> map = new HashMap<String, String>();
		int size = 10;
		
		map.put("currentPage", Integer.toString(currentPage));
		map.put("size", String.valueOf(size));
		map.put("keyword", keyword);
		map.put("sort", sort);

		if(!period.equals("")) {
			String[] dateTodate = new String[3];
			dateTodate = period.split("\\s");
			if(dateTodate.length < 3) {
				log.debug("Split Length : " + dateTodate.length);
				return "redirect:/admin/advertise/list";
			}
			map.put("periodSt", dateTodate[0]);
			map.put("periodEd", dateTodate[2]);
		}
		
		List<AdvListVO> advListVOList = this.adAdvService.advList(map);
		
		log.info("광고 목록 : " + advListVOList);
		
		int total = this.adAdvService.getTotalAdv(map);
		log.info("total : " + total);
		
		PagingDTO<AdvListVO> data = new PagingDTO<AdvListVO>(total, currentPage, size, advListVOList); 
		
		model.addAttribute("data", data);
		
		int cntAdvActive = this.adAdvService.cntAdvActive();
		int cntAdvExp = this.adAdvService.cntAdvExp();
		int sumAdvActive = this.adAdvService.sumAdvActive();
		
		model.addAttribute("cntAdvActive", cntAdvActive);
		model.addAttribute("cntAdvExp", cntAdvExp);
		model.addAttribute("sumAdvActive", sumAdvActive);
		
		return "admin/advertise/list";
	}
	
	/**
	 * 현재 진행 중 광고 정보 상세
	 * 요청 파라미터 : {"advId" : advId}
	 * @param advId : 현재 진행 중 광고 ID
	 * @return 광고 정보 VO
	 */
	@ResponseBody
	@PostMapping("/advertise/advDetailPost")
	public AdvListVO advDetail(@RequestParam("advId") String advId) {
		log.info("advId : " + advId);
		
		AdvListVO vo = this.adAdvService.advDetail(advId);
		
		log.info("AdvListVO : " + vo);
		
		return vo;
	}

	/**
	 * 요청받은 광고 목록
	 * 요청 URI : /admin/advertise/request
	 * @param model
	 * @param currentPage : 현재 페이지 번째
	 * @param keyword : 검색어
	 * @param sort : 정렬 키워드
	 * @param period : 기간 검색
	 * @return /admin/advertise/request?currentPage=&keyword=&sort=&period=
	 */
	@GetMapping("/advertise/request")
	public String advertiseRequest(Model model
							    , @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
							    , @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
							    , @RequestParam(value = "sort", required = false, defaultValue = "") String sort
							    , @RequestParam(value = "period", required = false, defaultValue = "") String period
								, @RequestParam(value = "adId", required = false, defaultValue = "") String adId) {
		
		log.info("currentPage : " + currentPage);
		log.info("keyword : " + keyword);
		log.info("sort : " + sort);
		log.info("period : " + period);
		log.info("adId : " + adId);
		
		Map<String,String> map = new HashMap<String, String>();
		int size = 10;
		
		map.put("currentPage", Integer.toString(currentPage));
		map.put("size", String.valueOf(size));
		map.put("keyword", keyword);
		map.put("sort", sort);
		map.put("adId", adId);

		if(!period.equals("")) {
			String[] dateTodate = new String[3];
			dateTodate = period.split("\\s");
			if(dateTodate.length < 3) {
				log.debug("Split Length : " + dateTodate.length);
				return "redirect:/admin/advertise/request";
			}
			map.put("periodSt", dateTodate[0]);
			map.put("periodEd", dateTodate[2]);
		}
		
		List<AdvReqListVO> advReqListVOList = this.adAdvService.advReqList(map);
		
		log.info("광고 요청 목록 : " + advReqListVOList);
		
		int total = this.adAdvService.getTotalAdvReq(map);
		log.info("total : " + total);
		
		PagingDTO<AdvReqListVO> data = new PagingDTO<AdvReqListVO>(total, currentPage, size, advReqListVOList); 
		
		model.addAttribute("data", data);
		
		int cntAdvReqAll = this.adAdvService.cntAdvReqAll();
		int cntAdvReqMain = this.adAdvService.cntAdvReqMain();
		int cntAdvReqUnder = this.adAdvService.cntAdvReqUnder();
		int cntAdvReqSearch = this.adAdvService.cntAdvReqSearch();
		
		model.addAttribute("cntAdvReqAll", cntAdvReqAll);
		model.addAttribute("cntAdvReqMain", cntAdvReqMain);
		model.addAttribute("cntAdvReqUnder", cntAdvReqUnder);
		model.addAttribute("cntAdvReqSearch", cntAdvReqSearch);
		
		return "admin/advertise/request";
	}
	
	/**
	 * 요청 광고 정보 상세
	 * 요청 파라미터 {"advReqId" : advReqId}
	 * @param advReqId
	 * @return 요청 광고 정보 VO
	 */
	@ResponseBody
	@PostMapping("/advertise/advReqDetailPost")
	public AdvReqListVO advReqDetail(@RequestParam("advReqId") String advReqId) {
		log.info("advId : " + advReqId);
		
		AdvReqListVO vo = this.adAdvService.advReqDetail(advReqId);
		
		log.info("AdvListVO : " + vo);
		
		return vo;
	}
	
	/**
	 * 광고 요청 승인/거절
	 * 요청 파라미터 {"advReqId" : advReqId, "btnName" : btnName}
	 * @param adReqId : 광고 요청 ID
	 * @param btnName : accpet(승인) / denied(거절)
	 * @return 요청 승인 상태 변경 시 success
	 */
	@ResponseBody
	@PostMapping("/advertise/processReqPost")
	public String refundFee(Principal principal
						  , @RequestParam("adReqId") String adReqId
						  , @RequestParam("btnName") String btnName) {
		log.info("AdminId : " + principal.getName());
		log.info("adReqId : " + adReqId);
		log.info("btnName : " + btnName);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("adReqId", adReqId);
		map.put("btnName", btnName);
		map.put("adminId", principal.getName());
		
		int cnt = this.adAdvService.processRequest(map);
		
		if(cnt > 0) {
			log.info("update success");
			return "success";
		} else {
			return "failed";
		}
	}

	/**
	 * 판매 중인 광고 상품 목록 및 설정
	 * 요청 URI : /admin/advertise/setting
	 * @param model
	 * @param currentPage : 현재 페이지 번호
	 * @return : /admin/advertise/setting?currentPage=
	 */
	@GetMapping("/advertise/setting")
	public String advertiseSetting(Model model
								 , @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		log.info("Called AdSetting");
		log.info("currentPage : " + currentPage);
		int size = 4;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("currentPage", Integer.toString(currentPage));
		map.put("size", String.valueOf(size));
		
		
		List<AdadVO> adVOList = this.adAdvService.selectAdList(map);
		log.info("adVOList : " + adVOList);
		
		int total = this.adAdvService.getTotalAdSet();
		
		PagingDTO<AdadVO> data = new PagingDTO<AdadVO>(total, currentPage, size, adVOList);
		
		model.addAttribute("data", data);
			
		return "admin/advertise/setting";
	}
	
	/**
	 * 광고 상품 정보 변경
	 * 요청 파라미터 {"adKind" : adKind, "period" : period, "pr" : pr}
	 * @param adKind : 광고 상품 ID
	 * @param period : 정보 변경할 상품의 광고 기간
	 * @param pr : 변경할 가격
	 * @return : 정보 변경 성공 시 success
	 */
	@ResponseBody
	@PostMapping("/advertise/advertiseSettingPost")
	public AdadVO advertiseSettingPost(@RequestParam("adKind") String adKind
			  						 , @RequestParam("period") String period
			  						 , @RequestParam("pr") String pr) {
		
		log.info("Hello Setting");
		log.info("adKind : " + adKind);
		log.info("period : " + period);
		log.info("pr : " + pr);
		
		String adId = adKind + period;
		log.info("adId : " + adId);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("adId", adId);
		map.put("pr", pr);
		map.put("pr", pr);
		
		
		int cnt = this.adAdvService.adSetting(map);
		
		AdadVO vo = this.adAdvService.selectAdDc(adId);
		
		log.info("vo : " + vo);
		
		if(cnt > 0) {
			return vo;
		} else {
			return null;
		}
		
	}
	
	/**
	 * 쿠폰 목록
	 * 요청 URI : /admin/cupn/list
	 * @param model
	 * @param currentPage : 현재 페이지 번호
	 * @param keyword : 검색 키워드
	 * @param sort : 정렬 키워드
	 * @return : /admin/cupn/list?currentPage=&keyword=&sort=
	 */
	@GetMapping("/cupn/list")
	public String cupnList(Model model
						 , @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
						 , @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
						 , @RequestParam(value = "sort", required = false, defaultValue = "") String sort) {
		log.info("currentPage : " + currentPage);
		log.info("keyword : " + keyword);
		log.info("sort : " + sort);
		
		Map<String,String> map = new HashMap<String, String>();
		int size = 5;
		
		map.put("currentPage", Integer.toString(currentPage));
		map.put("size", String.valueOf(size));
		map.put("keyword", keyword);
		map.put("sort", sort);

		List<CupnVO> cupnVOList = this.adCupnService.cupnList(map);
		log.info("cupnList 변경 전 : " + cupnVOList);
		
		for(CupnVO vo : cupnVOList) {
			if(vo.getCupnCl().equals("A001")) {
				vo.setCupnCl("등급 쿠폰");
			} else if(vo.getCupnCl().equals("B001")) {
				vo.setCupnCl("프로모션 쿠폰");
			}
			
			if(vo.getGradId() == null) {
				vo.setGradNm("전체");
			} else if(vo.getGradId().equals("G01")) {
				vo.setGradNm("브론즈");
			} else if(vo.getGradId().equals("G02")) {
				vo.setGradNm("실버");
			} else if(vo.getGradId().equals("G03")) {
				vo.setGradNm("골드");
			} else if(vo.getGradId().equals("G04")) {
				vo.setGradNm("다이아몬드");
			}
		}
		
		log.info("cupnList 변경 후 : " + cupnVOList);
		
		int total = this.adCupnService.getTotal(map);
		log.info("total : " + total);
		
		PagingDTO<CupnVO> data = new PagingDTO<CupnVO>(total, currentPage, size, cupnVOList); 
		
		model.addAttribute("data", data);
		
		return "admin/cupn/list";
	}
	
	/**
	 * 쿠폰 상세 정보
	 * 요청 파라미터 : {"cupnId" : cupnId}
	 * @param cupnId : 쿠폰 ID
	 * @return 쿠폰 상세 정보 VO
	 */
	@ResponseBody
	@PostMapping("/cupn/cupnDetailPost")
	public CupnVO cupnDetailPost(@RequestParam("cupnId") String cupnId) {
		log.info("cupnId : " + cupnId);
		
		CupnVO vo = this.adCupnService.cupnDetail(cupnId);
		
		if(vo.getCupnCl().equals("A001")) {
			vo.setCupnCl("등급 쿠폰");
		} else if(vo.getCupnCl().equals("B001")) {
			vo.setCupnCl("프로모션 쿠폰");
		}
		
		if(vo.getGradId() == null) {
			vo.setGradNm("전체");
		} else if(vo.getGradId().equals("G01")) {
			vo.setGradNm("브론즈");
		} else if(vo.getGradId().equals("G02")) {
			vo.setGradNm("실버");
		} else if(vo.getGradId().equals("G03")) {
			vo.setGradNm("골드");
		} else if(vo.getGradId().equals("G04")) {
			vo.setGradNm("다이아몬드");
		}
		
		log.info("CupnVO : " + vo);

		return vo;
	}
	
	/**
	 * 쿠폰 사용 비활성화
	 * 요청 파라미터 : {"cupnId" : cupnId}
	 * @param cupnId : 쿠폰 ID
	 * @return 쿠폰 비활성화 성공 시 success
	 */
	@ResponseBody
	@PostMapping("/cupn/cupnUnablePost")
	public CupnVO cupnUnablePost(@RequestParam("cupnId") String cupnId) {
		log.info("cupnId : " + cupnId);
		
		int cnt = this.adCupnService.cupnUnable(cupnId);
		
		if(cnt > 0) {
			CupnVO vo = this.adCupnService.cupnDetail(cupnId);
			
			return vo;
		} else {
			return null;
		}
	}

	/**
	 * 신규 쿠폰 등록
	 * 요청 파라미터 : {"cupnDc" : cupnDc, "grad" : grad, "rate" : rate, "period" : period}
	 * @param cupnDc : 신규 쿠폰 설명
	 * @param grad : 사용 가능한 등급
	 * @param rate : 할인율
	 * @param period : 사용 가능 기간
	 * @return 등록 성공 시 success
	 */
	@ResponseBody
	@PostMapping("/cupn/cupnRegistPost")
	public String cupnRegistPost(@RequestParam("cupnDc") String cupnDc
							   , @RequestParam("grad") String grad
							   , @RequestParam("rate") String rate
							   , @RequestParam("period") String period) {
		log.info("cupnDc : " + cupnDc);
		log.info("grad : " + grad);
		log.info("rate : " + rate);
		log.info("period : " + period);
		
		CupnVO cupnVO = new CupnVO();
		cupnVO.setCupnDc(cupnDc);
		cupnVO.setGradId(grad);
		cupnVO.setCupnRt(Integer.parseInt(rate));
		
		
		if(!period.equals("")) {
			String[] dateTodate = new String[3];
			dateTodate = period.split("\\s");
			if(dateTodate.length < 3) {
				log.debug("Split Length : " + dateTodate.length);
				return null;
			}
			cupnVO.setCupnExpStr(dateTodate[2]);
		}
		
		log.info("cupnVO : " + cupnVO);
		
		int cnt = this.adCupnService.cupnRegist(cupnVO);
		
		if(cnt > 0) {
			return "success";
		} else {
			return null;
		}
		
	}
	
	/**
	 * 회원 등급 정책 관리
	 * 요청 URI : /admin/grad/manage
	 * @param model
	 * @return /admin/grad/manage
	 */
	@GetMapping("/grad/manage")
	public String gradManage(Model model) {
		log.info("Called GradManage");
		
		List<GradVO> gradList = this.adGradManageService.gradList();
		log.info("gradList : " + gradList);
		
		for(GradVO vo : gradList) {
			String gradNm = vo.getGradNm();
			model.addAttribute(gradNm, vo);
		}
		
		return "admin/grad/manage";
	}
	
	/**
	 * 회원 등급 상세 정보
	 * 요청 파라미터 : {"gradId" : gradId}
	 * @param gradId : 등급 ID
	 * @return 회원 등급 상세 VO
	 */
	@ResponseBody
	@PostMapping("/grad/gradDetailPost")
	public GradVO gradDetailPost(@RequestParam("gradId") String gradId) {
		
		GradVO vo = this.adGradManageService.gradDetail(gradId);
		
		return vo;
	}

	/**
	 * 회원 등급 갱신 모달
	 * 요청 파라미터 : {"gradId" : gradId}
	 * @param gradId : 회원 등급 ID
	 * @return 회원 등급 상세 VO
	 */
	@ResponseBody
	@PostMapping("/grad/gradUpdateModal")
	public GradVO gradUpdateModal(@RequestParam("gradId") String gradId) {
		
		GradVO vo = this.adGradManageService.gradDetail(gradId);
		
		return vo;
	}

	/**
	 * 회원 등급 갱신
	 * 요청 파라미터 : {"gradId" : gradId, "mlgRt" : mlgRt, "accAmnt" : accAmnt}
	 * @param gradId : 등급 ID
	 * @param mlgRt : 결제마다 적립되는 마일리지 비율
	 * @param accAmnt : 등급 기준 하한선
	 * @return 정보 변경 성공 시 success
	 */
	@ResponseBody
	@PostMapping("/grad/gradUpdatePost")
	public String gradUpdatePost(@RequestParam("gradId") String gradId
							  ,  @RequestParam(value = "mlgRt", required = false, defaultValue = "") String mlgRt
							  ,  @RequestParam(value = "accAmnt", required = false, defaultValue = "") String accAmnt) {
		
		GradVO gradVO = this.adGradManageService.gradDetail(gradId);
		gradVO.setGradId(gradId);
		if(!mlgRt.equals("")) {
			gradVO.setMlgRt(Integer.parseInt(mlgRt));
		}
		if(!accAmnt.equals("")) {
			gradVO.setAccAmnt(Integer.parseInt(accAmnt));
		}
		
		int cnt = this.adGradManageService.gradUpdate(gradVO);
		log.info("cnt : " + cnt);
		
		if(cnt > 0) {
			return "success";
		} else {
			return null;
		}
	}
	
	/**
	 * 여행지 목록
	 * 요청 URI : /admin/tour/list
	 * @param model
	 * @param currentPage : 현재 페이지 번호
	 * @param keyword : 검색 키워드
	 * @param sort : 정렬 키워드
	 * @return /admin/tour/list?currentPage=&keyword=&sort=
	 */
	@GetMapping("/tour/list")
	public String tourList(Model model
						 , @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
						 , @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
						 , @RequestParam(value = "sort", required = false, defaultValue = "") String sort) {
		log.info("currentPage : " + currentPage);
		log.info("keyword : " + keyword);
		log.info("sort : " + sort);
		
		Map<String,String> map = new HashMap<String, String>();
		int size = 7;
		
		map.put("currentPage", Integer.toString(currentPage));
		map.put("size", String.valueOf(size));
		map.put("keyword", keyword);
		map.put("sort", sort);
		
		List<TourVO> tourVOList = this.adTourService.tourList(map);
		
		for(TourVO vo : tourVOList) {
			String imgPath = this.adTourService.getImgPath(vo.getTourId());
			vo.setImgPath(imgPath);
		}
		
		int total = this.adTourService.getTotal(map);
		
		log.info("total : " + total+ " " + "tourVOList : " + tourVOList);
		
		PagingDTO<TourVO> data = new PagingDTO<TourVO>(total, currentPage, size, tourVOList); 
		
		model.addAttribute("data", data);
		
		return "admin/tour/list";
	}
	
	/**
	 * 여행지 상세 정보
	 * 요청 파라미터 : {"tourId" : tourId}
	 * @param tourId : 여행지 ID
	 * @return 여행지 상세 VO
	 */
	@ResponseBody
	@PostMapping("/tour/tourDetailPost")
	public TourVO tourDetailPost(@RequestParam("tourId") String tourId) {
		log.info("tourId : " + tourId);
		
		TourVO vo = this.adTourService.tourDetail(tourId);
		log.info("TourVO : " + vo);
		
		String imgPath = this.adTourService.getImgPath(vo.getTourId());
		vo.setImgPath(imgPath);
		
		String description = vo.getTourDc();
		description = description.replace("<br />", "");
		description = description.replace("<br>", "");
		vo.setTourDc(description);
		
		
		return vo;
	}
	
	/**
	 * 여행지 신규 등록 페이지
	 * 요청 URI : /admin/tour/registerSingle
	 * @param tourVO : 여행지 정보 VO
	 * @return /admin/tour/registerSingle
	 */
	@GetMapping("/tour/registerSingle")
	public String tourRegisterSingle(@ModelAttribute TourVO tourVO) {
		
		return "admin/tour/registerSingle";
	}
	
	/**
	 * 여행지 신규 등록
	 * @param tourVO : 등록할 여행지 정보 VO
	 * @param bResult : 유효성 검사
	 * @return 등록 성공 시 redirect
	 */
	@PostMapping("/tour/registerPost")
	public String tourRegisterPost(@Validated @ModelAttribute("tourVO") TourVO tourVO, BindingResult bResult) {
		log.info("tourVO : " + tourVO);
		
		int result = this.adTourService.tourReg(tourVO);
		
		log.info("result : " + result);
		
		// 유효성 검사 결과 체킹///
		if (bResult.hasErrors()) { // true :오류 있음
			List<ObjectError> allErrors = bResult.getAllErrors();
			for (ObjectError objectError : allErrors) {
				log.error("allError : " + objectError);
			}
			return "admin/tour/register";
		}
		return "redirect:/admin/tour/register";
	}
	
	/**
	 * 여행지 신규 등록 페이지(Excel 파일)
	 * 요청 URI : /admin/tour/registerExcel
	 * @param tourVO : 여행지 정보 VO
	 * @return /admin/tour/registerExcel
	 */
	@GetMapping("/tour/registerExcel")
	public String tourRegister(@ModelAttribute TourVO tourVO) {
		
		return "admin/tour/registerExcel";
	}
	
	/**
	 * 등록할 Excel 파일 내부 정보 표시
	 * @param model
	 * @param file : 가져온 Excel 파일
	 * @param tourCode : 여행지 분류
	 * @return Excel 파일로 부터 읽어온 등록할 여행지 목록
	 */
	@ResponseBody
	@PostMapping("/tour/detailExcelPost")
	public List<TourVO> registerExcelPost(Model model
								  , @RequestParam("file") MultipartFile file
								  , @RequestParam("tourCode") String tourCode) {
		log.info("Called DetailExcelPost");
		log.info("tourCode :" + tourCode);
		List<TourVO> dataList = new ArrayList<>();
		
		try {
	        InputStream inputStream = file.getInputStream();
	        Workbook workbook = WorkbookFactory.create(inputStream);
	        
	        Sheet sheet = workbook.getSheetAt(0); // 첫 번째 시트 가져오기
	        
	        for(int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
	        	Row row = sheet.getRow(i);
	        	
	        	TourVO vo = new TourVO();
	        	vo.setTourNm(row.getCell(0).getStringCellValue());
	        	String cellDc = row.getCell(7).getStringCellValue();
	        	String[] cellDcSplit = cellDc.split("\\.");
	        	vo.setTourDc(cellDcSplit[0]);
	        	vo.setLati(row.getCell(5).getStringCellValue());
	        	vo.setLongi(row.getCell(6).getStringCellValue());
	        	vo.setTourCode(tourCode);
	        	String cellLoc = row.getCell(4).getStringCellValue();
	        	String[] cellLocSplit = cellLoc.split("\\s");
	        	vo.setTourLoc(cellLocSplit[0]);
	        	
	        	log.info("tourInfo : " + row.getCell(0).getStringCellValue() + ", " + cellDcSplit[0] + ", "
	        			+ row.getCell(0).getStringCellValue() + ", " + row.getCell(6).getStringCellValue() + ", "
	        			+ row.getCell(6).getStringCellValue() + ", "+ cellLocSplit[0]);
	        	log.info("tourVO : " + vo);
	        	
	        	dataList.add(vo);
	        }
	        
	        
	        
	        model.addAttribute("data", dataList);
	        
	        workbook.close();
	        inputStream.close();
	        
	        return dataList;
	    } catch (IOException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	/**
	 * 신규 여행지 Excel 파일 등록
	 * @param file : 등록할 여행지 Excel 파일
	 * @param tourCode : 여행지 분류
	 * @return 등록 페이지 되돌아가기
	 */
	@PostMapping("/tour/tourExcelRegister")
	public String tourExcelRegister(@RequestParam("file") MultipartFile file
								  , @RequestParam("tourCode") String tourCode) {
		log.info("Called TourExcelRegister");
		log.info("tourCode :" + tourCode);
		List<TourVO> dataList = new ArrayList<>();
		
		try {
	        InputStream inputStream = file.getInputStream();
	        Workbook workbook = WorkbookFactory.create(inputStream);
	        
	        Sheet sheet = workbook.getSheetAt(0); // 첫 번째 시트 가져오기
	        
	        for(int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
	        	Row row = sheet.getRow(i);
	        	
	        	TourVO vo = new TourVO();
	        	vo.setTourNm(row.getCell(0).getStringCellValue());
	        	String cellDc = row.getCell(7).getStringCellValue();
	        	String[] cellDcSplit = cellDc.split("\\.");
	        	vo.setTourDc(cellDcSplit[0]);
	        	vo.setLati(row.getCell(5).getStringCellValue());
	        	vo.setLongi(row.getCell(6).getStringCellValue());
	        	vo.setTourCode(tourCode);
	        	String cellLoc = row.getCell(4).getStringCellValue();
	        	String[] cellLocSplit = cellLoc.split("\\s");
	        	vo.setTourLoc(cellLocSplit[0]);
	        	
	        	log.info("tourInfo : " + row.getCell(0).getStringCellValue() + ", " + cellDcSplit[0] + ", "
	        			+ row.getCell(0).getStringCellValue() + ", " + row.getCell(6).getStringCellValue() + ", "
	        			+ row.getCell(6).getStringCellValue() + ", "+ cellLocSplit[0]);
	        	log.info("tourVO : " + vo);
	        	
	        	dataList.add(vo);
	        }
	        
	        int cnt = 0;
	        
	        for(TourVO vo : dataList) {
	        	cnt += this.adTourService.insertTourExcel(vo);
	        }
	        
	        log.info("Insert Result : " + cnt);
	        
	        workbook.close();
	        inputStream.close();
	        
	        return "admin/tour/registerExcel";
	    } catch (IOException e) {
	        e.printStackTrace();
	        return "redirect:/error";
	    }
	}
	
	/**
	 * 여행지 삭제
	 * 요청 파라미터 : {"brdId" : brdId}
	 * @param tourId : 여행지 ID
	 * @return : 삭제 성공 시 success
	 */
	@ResponseBody
	@PostMapping("/tour/tourDel")
	public String tourDel(@RequestParam("tourId") String tourId) {
		int cnt = this.adTourService.tourDel(tourId);
		
		if(cnt > 0) {
			return "success";
		} else {
			return null;
		}
	}
	
	/**
	 * 여행지 소개 매거진 작성 시 여행지 목록 출력
	 * 요청 URI : /admin/tour/magazineRegist
	 * @param model
	 * @return : /admin/tour/magazineRegist
	 */
	@GetMapping("/tour/magazineRegist")
	public String magazineRegist(Model model) {
		List<TourVO> tourVOList = this.adTourService.tourListMagazine();
		
		model.addAttribute("data", tourVOList);
		
		return "admin/tour/magazineRegist";
	}

	/**
	 * 여행지 소개 매거진 등록
	 * 요청 파라미터 : /admin/tour/magazineRegistPost?brdVO=
	 * @param brdVO : 작성된 여행지 소개 매거진
	 * @param bResult
	 * @return : /admin/tour/magazineList
	 */
	@PostMapping("/tour/magazineRegistPost")
	public String magazineRegistPost(@Validated @ModelAttribute BrdVO brdVO, BindingResult bResult, Principal principal) {
		log.info("BrdVO : " + brdVO);
		log.info("ID : " + principal.getName());
		brdVO.setFrstWrtr(principal.getName());
		brdVO.setLastWrtr(principal.getName());
		int result = this.adTourService.magazineRegister(brdVO);
		
		log.info("result : " + result);
		
		// 유효성 검사 결과 체킹///
		if (bResult.hasErrors()) { // true :오류 있음
			List<ObjectError> allErrors = bResult.getAllErrors();
			for (ObjectError objectError : allErrors) {
				log.error("allError : " + objectError);
			}
			return "redirect:/admin/tour/magazineRegist";
		}
		return "redirect:/admin/tour/magazineList";
	}
	
	/**
	 * 여행지 소개 매거진 목록
	 * 요청 URI : /admin/tour/magazineList
	 * @param model
	 * @param currentPage : 현재 페이지 번호
	 * @param keyword : 검색 키워드
	 * @param sort : 정렬 키워드
	 * @param period : 기간 검색 키워드
	 * @return : /admin/tour/magazineList?currentPage=&keyword=&sort=&period=
	 */
	@GetMapping("/tour/magazineList")
	public String magazineList(Model model
							 , @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
							 , @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
							 , @RequestParam(value = "sort", required = false, defaultValue = "") String sort
							 , @RequestParam(value = "period", required = false, defaultValue = "") String period) {
		log.info("currentPage : " + currentPage);
		log.info("keyword : " + keyword);
		log.info("sort : " + sort);
		
		Map<String,String> map = new HashMap<String, String>();
		int size = 10;
		
		map.put("currentPage", Integer.toString(currentPage));
		map.put("size", String.valueOf(size));
		map.put("keyword", keyword);
		map.put("sort", sort);
		
		if(!period.equals("")) {
			String[] dateTodate = new String[3];
			dateTodate = period.split("\\s");
			if(dateTodate.length < 3) {
				log.debug("Split Length : " + dateTodate.length);
				return "redirect:/admin/advertise/request";
			}
			map.put("periodSt", dateTodate[0]);
			map.put("periodEd", dateTodate[2]);
		}
		
		List<BrdVO> tourMagazineList = this.adTourService.tourMagazineList(map);
		log.info("magazineList : " + tourMagazineList);
		
		int total = this.adTourService.getTotalMagazine(map);
		
		PagingDTO<BrdVO> data = new PagingDTO<BrdVO>(total, currentPage, size, tourMagazineList);
		
		model.addAttribute("data", data);
		
		return "admin/tour/magazineList";
	}

	/**
	 * 여행지 소개 매거진 수정 페이지
	 * 요청 URI : /admin//tour/magazineUpdate?brdId=
	 * @param model
	 * @param brdId : 여행지 소개 매거진 ID
	 * @return : /admin//tour/magazineUpdate?brdId=
	 */
	@GetMapping("/tour/magazineUpdate")
	public String magazineUpdate(Model model
			   				   , @RequestParam("brdId") String brdId) {
		
		log.info("brdId : " + brdId);
		
		List<TourVO> tourVOList = this.adTourService.tourListMagazine();
		
		model.addAttribute("data", tourVOList);
		

		BrdVO vo = this.adTourService.tourMagazineDetail(brdId);
		log.info("BrdVO : " + vo);
		
		model.addAttribute("vo", vo);
		
		
		return "admin/tour/magazineUpdate";
	}
	
	/**
	 * 여행지 소개 매거진 수정
	 * 요청 파라미터 /admin//tour/magazineUpdatePost?brdId=
	 * @param brdVO : 여행지 소개 매거진 VO
	 * @param bResult
	 * @return : 수정 성공 시 목록 redirect
	 */
	@PostMapping("/tour/magazineUpdatePost")
	public String magazineUpdatePost(@Validated @ModelAttribute BrdVO brdVO, BindingResult bResult) {
		log.info("BrdVO : " + brdVO);
		int result = this.adTourService.magazineUpdate(brdVO);
		
		log.info("result : " + result);
		
//		// 유효성 검사 결과 체킹///
//		if (bResult.hasErrors()) { // true :오류 있음
//			List<ObjectError> allErrors = bResult.getAllErrors();
//			for (ObjectError objectError : allErrors) {
//				log.error("allError : " + objectError);
//			}
//			return "redirect:/admin/tour/magazineUpdate?brdId="+brdVO.getBrdId();
//		}
		return "redirect:/admin/tour/magazineList";
	}
	
	/**
	 * 여행지 소개 매거진 삭제
	 * 요청 URI /admin/tour/magazineDeletePost?brdId=
	 * @param brdId
	 * @return 삭제 성공 시 매거진 목록 redirect
	 */
	@GetMapping("/tour/magazineDeletePost")
	public String magazineDeletePost(@RequestParam("brdId") String brdId) {
		log.info("brdVO : " + brdId);
		
		int result = this.adTourService.magazineDelete(brdId);
		
		log.info("result : " + result);
		
		return "redirect:/admin/tour/magazineList";
	}
	
	/**
	 * 매출 내역 페이지
	 * 요청 URI : /admin/sales/salesList
	 * @param model
	 * @param currentPage : 현재 페이지 번호
	 * @param keyword : 검색 키워드
	 * @param sort : 정렬 키워드
	 * @param period : 기간 검색
	 * @return /admin/sales/salesList?currentPage=&keyword=&sort=&period=
	 */
	@GetMapping("/sales/salesList")
	public String salesList(Model model
					 	  , @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
					 	  , @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
						  , @RequestParam(value = "sort", required = false, defaultValue = "") String sort
						  , @RequestParam(value = "period", required = false, defaultValue = "") String period) {
		log.info("currentPage : " + currentPage);
		log.info("keyword : " + keyword);
		log.info("sort : " + sort);
		
		Map<String,String> map = new HashMap<String, String>();
		int size = 10;
		
		map.put("currentPage", Integer.toString(currentPage));
		map.put("size", String.valueOf(size));
		map.put("keyword", keyword);
		map.put("sort", sort);
		
		if(!period.equals("")) {
			String[] dateTodate = new String[3];
			dateTodate = period.split("\\s");
			if(dateTodate.length < 3) {
				log.debug("Split Length : " + dateTodate.length);
				return "redirect:/admin/advertise/request";
			}
			map.put("periodSt", dateTodate[0]);
			map.put("periodEd", dateTodate[2]);
		}
		
		
		List<AdSalesVO> adSalesVOList = this.adSalesService.salesList(map);
		
		for(AdSalesVO vo : adSalesVOList) {
			if(vo.getRsvId() != null && !vo.getRsvId().equals("")) {
				vo.setPayKnd("숙박/렌터카 예약");
			} else if(vo.getTrRsvId() != null && !vo.getTrRsvId().equals("")) {
				vo.setPayKnd("교통 예약");
			} else if(vo.getBuyId() != null && !vo.getBuyId().equals("")) {
				vo.setPayKnd("상품 판매");
			} else if(vo.getAdReqId() != null && !vo.getAdReqId().equals("")) {
				vo.setPayKnd("광고");
			}
			
			if(vo.getBuyNm() != null && !vo.getBuyNm().equals("")) {
				if(vo.getBuyNm().equals("INSU")) {
					vo.setBuyNm("여행자보험");
				} else if(vo.getBuyNm().equals("WIFI")) {
					vo.setBuyNm("와이파이");
				} else if(vo.getBuyNm().equals("ROAM")) {
					vo.setBuyNm("로밍");
				}
			}
			
		}
		
		log.info("adSalesVOList : " + adSalesVOList);

		int total = this.adSalesService.getTotal(map);
		
		PagingDTO<AdSalesVO> data = new PagingDTO<AdSalesVO>(total, currentPage, size, adSalesVOList);
		
		AdSalesStatVO statVO = this.adSalesService.popularBusi();
		
		int lastYearSales = this.adSalesService.lastYearSales();
		int thisYearSales = this.adSalesService.thisYearSales();
		int lastMthSales = this.adSalesService.lastMthSales();
		int thisMthSales = this.adSalesService.thisMthSales();
		
		int thisMthSignIn = this.adSalesService.thisMthSignIn();
		int lastMthSignIn = this.adSalesService.lastMthSignIn();
		
		int memCount = this.adMainService.memCount();

		double increaseYearSales = (double)(thisYearSales - lastYearSales) / lastYearSales * 100;
		double increaseMthSales = (double)(thisMthSales - lastMthSales) / lastMthSales * 100;
		double increaseMthMem = (double)(thisMthSignIn - lastMthSignIn) / lastMthSignIn * 100;
		log.info("thisYearSales : " + thisYearSales + " lastYearSales : " + lastYearSales);
		log.info("thisMthSales : " + thisMthSales + " lastMthSales : " + lastMthSales);
		log.info("thisMthSignIn : " + thisMthSignIn + " lastMthSignIn : " + lastMthSignIn);
		log.info("Increase : Year = " + ((thisYearSales - lastYearSales) / lastYearSales * 100)
				+ ", Month = " + ((thisMthSales - lastMthSales) / lastMthSales * 100) 
				+ ", Member = " + ((thisMthSignIn - lastMthSignIn) / lastMthSignIn * 100));
		log.info("Increase : Year = " + increaseYearSales + ", Month = " + increaseMthSales + ", Member = " + increaseMthMem);
		
		statVO.setLastYearSales(lastYearSales);
		statVO.setThisYearSales(thisYearSales);
		statVO.setLastMthSales(lastMthSales);
		statVO.setThisMthSales(thisMthSales);
		
		statVO.setThisMthSignIn(thisMthSignIn);
		statVO.setLastMthSignIn(lastMthSignIn);
		
		statVO.setIncreaseYearSales((int)increaseYearSales);
		statVO.setIncreaseMthSales((int)increaseMthSales);
		statVO.setIncreaseMthMem((int)increaseMthMem);
		
		statVO.setMemCount(memCount);
		
		log.info("AdSalesStatVO : " + statVO);
		
		int totalSales = this.adMainService.totalSales();
		model.addAttribute("totalSales",totalSales);
		
		model.addAttribute("data", data);
		model.addAttribute("vo", statVO);
		
		return "admin/sales/salesList";
	}
	
	/**
	 * 매출 내역 엑셀 다운로드
	 * 요청 URI : /admin/sales/downloadExcelPost?period=
	 * @param response
	 * @param period : 기간 검색 키워드
	 * @throws IOException
	 */
	@GetMapping("/sales/downloadExcelPost")
	public void downloadExcelPost(HttpServletResponse response,
									@RequestParam(value = "period", required = false, defaultValue = "") String period) throws IOException {
		log.info("period : " + period);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = new Date();

		String thisDate = sdf.format(dt);

		Map<String, String> map = new HashMap<String, String>();

		if (!period.equals("")) {
			String[] dateTodate = new String[3];
			dateTodate = period.split("\\s");
			if (dateTodate.length < 3) {
				log.debug("Split Length : " + dateTodate.length);
			} else {
				map.put("periodSt", dateTodate[0]);
				map.put("periodEd", dateTodate[2]);
			}
		}
		String[] headers = { "번호", "업체/상품명", "매출분류", "결제일시", "결제수단", "금액(원)" };
		List<AdSalesVO> adSalesVOList = this.adSalesService.salesListExcel(map);
		
		log.info("AdSalesVOList : " + adSalesVOList);

		// 엑셀 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("매출내역_" + thisDate);

		// 헤더 생성
		Row headerRow = sheet.createRow(0);
		for(int i = 0; i<headers.length; i++) {
			headerRow.createCell(i).setCellValue(headers[i]);
		}

		// 데이터 저장
		int rowNum = 1;
		
		for (AdSalesVO vo : adSalesVOList) {
			Row row = sheet.createRow(rowNum++);
			
			// int 타입일 경우의 처리
			Integer rNumObj = vo.getRowNum();
			int rNum = (rNumObj != null) ? rNumObj.intValue() : 0;
			row.createCell(0).setCellValue(rNum);
			
			//행의 n번째 열에 셀을 생성하고 헤더 번호에 맞게 값을 넣어준다, 삼항연산을 이용해서 null 값일 경우 처리를 해준다
			if(vo.getRsvId() != null && !vo.getRsvId().equals("")) {
				row.createCell(1).setCellValue(vo.getBusiNm());
				row.createCell(2).setCellValue("숙박/렌터카 예약");
			} else if(vo.getTrRsvId() != null && !vo.getTrRsvId().equals("")) {
				row.createCell(1).setCellValue(vo.getTrNm());
				row.createCell(2).setCellValue("교통 예약");
			} else if(vo.getBuyId() != null && !vo.getBuyId().equals("")) {
				row.createCell(1).setCellValue(vo.getBuyNm());
				row.createCell(2).setCellValue("상품 판매");
			} else if(vo.getAdReqId() != null && !vo.getAdReqId().equals("")) {
				row.createCell(1).setCellValue(vo.getAdDc());
				row.createCell(2).setCellValue("광고");
			}
			
			// date 타입일 경우의 처리
			String payDtStr = vo.getPayDt() != null ? sdf.format(vo.getPayDt()): "";
			row.createCell(3).setCellValue(payDtStr);
			row.createCell(4).setCellValue(vo.getPayMth() != null ? vo.getPayMth() : "");

			Integer payPrObj = vo.getPayPr();
			int payPr = (payPrObj != null) ? payPrObj.intValue() : 0;
			row.createCell(5).setCellValue(payPr);
		}
		log.info("Flag 1");
		
		// 파일 다운로드를 위한 응답 헤더 설정
		response.setContentType("ms-vnd/excel");
//		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml");
		response.setHeader("Content-Disposition", "attachment; filename='employeesVac.xlsx'");
		response.setHeader("Content-Transfer-Encoding", "binary");

		log.info("Flag 2");

		log.info("Flag 3, " + wb);
		
		// response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
		
	}
	
	/**
	 * 매출 통계 그래프 페이지
	 * 요청 URI : /admin/sales/salesStats
	 * @param model
	 * @param prYear : 매출 연도 검색 키워드
	 * @param rsvYear : 예약 수 연도 검색 키워드
	 * @param memYear : 회원 수 연도 검색 키워드
	 * @return /admin/sales/salesStats?prYear=&rsvYear=&memYear=
	 */
	@GetMapping("/sales/salesStats")
	public String salesStats(Model model
						   , @RequestParam(value = "prYear", defaultValue = "2023") String prYear
						   , @RequestParam(value = "rsvYear", defaultValue = "2023") String rsvYear
						   , @RequestParam(value = "memYear", defaultValue = "2023") String memYear) {
		log.info("prYear : " + prYear);
		log.info("rsvYear : " + rsvYear);
		log.info("memYear : " + memYear);
		
		Gson gson = new Gson();

		List<AdStatsVO> salesYMStatsList = this.adSalesService.salesYMStats(prYear);
		List<AdStatsVO> rsvYMStatsList = this.adSalesService.rsvYMStats(rsvYear);
		List<AdStatsVO> memYMStatsList = this.adSalesService.memYMStats(memYear);
		List<AdStatsVO> memAgeStatsList = this.adSalesService.memAgeStats();
		
		log.info("salesYMStatsList : " + salesYMStatsList);
		log.info("rsvYMStatsList : " + rsvYMStatsList);
		log.info("memYMStatsList : " + memYMStatsList);
		log.info("memAgeStatsList : " + memAgeStatsList);
		
		
		List<String> prLabels = new ArrayList<>();
		List<Integer> prDatas = new ArrayList<>();
		for (AdStatsVO vo : salesYMStatsList) {
			prLabels.add(vo.getPayDtYM());
			prDatas.add(vo.getPayPrYM());
		}
		String prLabelsStr = gson.toJson(prLabels);

		
		List<String> rsvLabels = new ArrayList<>();
		List<Integer> rsvDatas = new ArrayList<>();
		
		for (AdStatsVO vo : rsvYMStatsList) {
			rsvLabels.add(vo.getRsvDtYM());
			rsvDatas.add(vo.getRsvCntYM());
		}
		String rsvLabelsStr = gson.toJson(rsvLabels);

		
		List<String> memLabels = new ArrayList<>();
		List<Integer> memDatas = new ArrayList<>();
		for (AdStatsVO vo : memYMStatsList) {
			memLabels.add(vo.getMemJoinDtYM());
			memDatas.add(vo.getMemCntYM());
		}
		String memLabelsStr = gson.toJson(memLabels);

		
		List<String> memAgeLabels = new ArrayList<>();
		List<Integer> memAgeDatas = new ArrayList<>();
		for (AdStatsVO vo : memAgeStatsList) {
			memAgeLabels.add(vo.getMemAge());
			memAgeDatas.add(vo.getMemCnt());
		}
		String memAgeLabelsStr = gson.toJson(memAgeLabels);

		
		model.addAttribute("prLabels",prLabelsStr);
		model.addAttribute("prDatas",prDatas);
		
		model.addAttribute("rsvLabels",rsvLabelsStr);
		model.addAttribute("rsvDatas",rsvDatas);

		model.addAttribute("memLabels",memLabelsStr);
		model.addAttribute("memDatas",memDatas);

		model.addAttribute("memAgeLabels",memAgeLabelsStr);
		model.addAttribute("memAgeDatas",memAgeDatas);
		
		return "admin/sales/salesStats";
	}
	
	
	@GetMapping("/busi/busiSales")
	public String busiSales(Model model
					 	  , @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage
						  , @RequestParam(value = "sort", required = false, defaultValue = "1") int sort
						  , @RequestParam(value = "busiSearch", required = false, defaultValue = "") String busiSearch) {
		log.info("currentPage : " + currentPage);
		log.info("sort : " + sort);
		log.info("busiSearch : " + busiSearch);
		
		int size = 10;
		
		List<BusiVO> busiList = this.adBusiService.busiList();
		model.addAttribute("busiList", busiList);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("currentPage", Integer.toString(currentPage));
		map.put("size", String.valueOf(size));
		map.put("sort", Integer.toString(sort));
		map.put("busiSearch", busiSearch);
		
		List<AdBusiSalesVO> adBusiSalesList = this.adBusiService.busiSalesList(map);
		
		for(AdBusiSalesVO vo : adBusiSalesList) {
			log.info("adBusiSales : " + vo);
		}

		log.info("currentPage : " + currentPage);
		log.info("sort : " + sort);
		log.info("busiSearch : " + busiSearch);
		
		int total = this.adBusiService.getTotalSales(map);
		
		if(busiSearch != null && !busiSearch.equals("")) {
			int salesYear = this.adBusiService.salesYear(busiSearch);
			int salesMonth = this.adBusiService.salesMonth(busiSearch);
			
			model.addAttribute("year", salesYear);
			model.addAttribute("month", salesMonth);
		}
		
		PagingDTO<AdBusiSalesVO> data = new PagingDTO<AdBusiSalesVO>(total, currentPage, size, adBusiSalesList);
		model.addAttribute("data", data);
		
		return "admin/busi/busiSales";
	}
	
	/**
	 * 매출 내역 엑셀 다운로드
	 * 요청 URI : /admin/sales/downloadExcelPost?period=
	 * @param response
	 * @param period : 기간 검색 키워드
	 * @throws IOException
	 */
	@GetMapping("/busi/downloadExcelPost")
	public void busiDownloadExcelPost(HttpServletResponse response
									, @RequestParam(value = "sort", required = false, defaultValue = "1") int sort
									, @RequestParam(value = "busiSearch", required = false, defaultValue = "") String busiSearch) throws IOException {
		log.info("sort : " + sort);
		log.info("busiSearch : " + busiSearch);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = new Date();

		String thisDate = sdf.format(dt);

		Map<String, String> map = new HashMap<String, String>();

		String[] headers = { "번호", "날짜", "금액(원)"};
		List<AdBusiSalesVO> adBusiSalesVOList = this.adBusiService.downloadExcel(map);
		
		log.info("adBusiSalesVOList : " + adBusiSalesVOList);

		// 엑셀 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet(busiSearch + "_매출내역_" + thisDate);

		// 헤더 생성
		Row headerRow = sheet.createRow(0);
		for(int i = 0; i<headers.length; i++) {
			headerRow.createCell(i).setCellValue(headers[i]);
		}

		// 데이터 저장
		int rowNum = 1;
		
		for (AdBusiSalesVO vo : adBusiSalesVOList) {
			Row row = sheet.createRow(rowNum++);
			
			// int 타입일 경우의 처리
			Integer rNumObj = vo.getRowNum();
			int rNum = (rNumObj != null) ? rNumObj.intValue() : 0;
			row.createCell(0).setCellValue(rNum);

			Integer payPrObj = vo.getPayPr();
			int payPr = (payPrObj != null) ? payPrObj.intValue() : 0;
			row.createCell(1).setCellValue(payPr);
			
			
			// date 타입일 경우의 처리
			String rsvDtStr = vo.getRsvDt() != null ? sdf.format(vo.getRsvDt()): "";
			row.createCell(2).setCellValue(rsvDtStr);
		}
		log.info("Flag 1");
		
		// 파일 다운로드를 위한 응답 헤더 설정
		response.setContentType("ms-vnd/excel");
//		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml");
		response.setHeader("Content-Disposition", "attachment; filename='employeesVac.xlsx'");
		response.setHeader("Content-Transfer-Encoding", "binary");

		log.info("Flag 2");

		log.info("Flag 3, " + wb);
		
		// response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
		
	}
}






