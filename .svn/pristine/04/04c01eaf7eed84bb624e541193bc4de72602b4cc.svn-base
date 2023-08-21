package kr.or.ddit.member.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.member.service.MmAcmService;
import kr.or.ddit.member.service.MmCartService;
import kr.or.ddit.member.service.MmInsuService;
import kr.or.ddit.member.service.MmMemService;
import kr.or.ddit.util.ItemDTO;
import kr.or.ddit.util.PagingDTO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CvfcVO;
import kr.or.ddit.vo.InsuDetailVO;
import kr.or.ddit.vo.InsuVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.RmDeVO;
import kr.or.ddit.vo.RmVO;
import kr.or.ddit.vo.RvwVO;

@RequestMapping("/member/insurance")
@Controller
public class InsuController{
	private static final Logger log = LoggerFactory.getLogger(InsuController.class);
	


	@Autowired
	MmInsuService mmInsuService;
	
	@Autowired
	MmCartService mmCartService;
	
	@Autowired
	MmAcmService mmAcmService;
	
	@Autowired
	MmMemService mmMemService;

	/** 숙소 검색 메인페이지로
	 * @param model
	 * @return
	 */
	@GetMapping("/main")
	public String acmMain(Model model,
						Principal principal) {

		String memId = principal.getName();
		MemVO memVO = mmMemService.userDetail(memId);
		
		model.addAttribute("memVO",memVO);
	
		return "member/insurance/insuMain";
	}
	

	
	/**검색 조건 처리-세션에 담아줌
	 * @param model
	 * @param busiLoc
	 * @param guestRoomNum
	 * @param checkInOut
	 * @param session
	 * @return
	 */
	@PostMapping("/search")
	public String searchAcm(Model model,
			@RequestParam(value="nation",required=false) String nation,
		    @RequestParam(value="period",required=false) String period,
			@RequestParam(value="sex",required=false) String sex,
			@RequestParam(value="birth",required=false) String birth,
			@RequestParam(value="tripType",required=false) String tripType,
		    HttpSession session){
		
		

		String tripStStr=period.split("to")[0].trim();
		String tripEdStr=period.split("to")[1].trim();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		LocalDate tripSt = LocalDate.parse(tripStStr, formatter);
		LocalDate tripEd = LocalDate.parse(tripEdStr, formatter);
		
		int daysDiffer = (int)tripEd.minusDays(tripSt.toEpochDay()).toEpochDay();
		
		
		session.setAttribute("nation",nation);
		session.setAttribute("period",period);
		session.setAttribute("sex",sex);
		session.setAttribute("birth",birth);
		session.setAttribute("tripType",tripType);
		session.setAttribute("daysDiffer", daysDiffer);
		
		
		return "redirect:/member/insurance/search/result";
	}
	
	
	@GetMapping("/search/result")
	public String searchResultAcm(Model model, HttpSession session){
		
		//세션에서 값 가져온다 
		String nation= (String) session.getAttribute("nation");
		String period= (String) session.getAttribute("period");
		String sex= (String) session.getAttribute("sex");
		String birth= (String) session.getAttribute("birth");
		String tripType= (String) session.getAttribute("tripType");
		
		int birthYear=Integer.parseInt(birth.split("/")[0]);
		int birthMonth=Integer.parseInt(birth.split("/")[1]);
		int birthDay=Integer.parseInt(birth.split("/")[2]);
		
		int age=getAge(birthYear,birthMonth,birthDay);
		
		

		
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		

		map.put("nation",nation);
		map.put("age",age);
		map.put("tripType",tripType);
		
		log.info("맵이야"+map);
		
		
		List<InsuVO> insuVOList=this.mmInsuService.searchInsu(map);
		
		model.addAttribute("insuVOList",insuVOList);
		
		log.info("리스트야"+insuVOList);
		
		
		return "member/insurance/insuList";
		
	}
	
	
	
	/** 보험상세보기 클릭시 
	 * @param busiId
	 * @param busiVO
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/detail/{insuId}")
	public String acmDetail(@PathVariable(value="insuId",required=true) String insuId,
			Model model,
			HttpSession session) {
		
		int daysDiffer =(int) session.getAttribute("daysDiffer");
		
		//보험 정보 가져오기 
		InsuVO insuVO = this.mmInsuService.getInsuVO(insuId);
		
		//보홈정류 
		List <InsuDetailVO> insuDeVOList = this.mmInsuService.detailInsu(insuId);
		
		//model에 값 넣기
		model.addAttribute("insuDeVOList",insuDeVOList);
		model.addAttribute("insuVO",insuVO);
		model.addAttribute("daysDiffer",daysDiffer);

		return "member/insurance/insuDetail";
	}

		
	@PostMapping("/reserveInsu")
	public String reserveRm(Model model,
			@RequestParam("prodId") String prodId,
			HttpSession session,
			Principal principal
			) {
		
		//로그인 했을시 회원정보 넘겨주기 
		if(principal!=null) {
			String memId = principal.getName();
			MemVO memVO = mmAcmService.getMemInfo(memId);
			model.addAttribute("memVO",memVO);
			
		}
		int daysDiffer =(int) session.getAttribute("daysDiffer");
		InsuDetailVO insuDeVO =this.mmInsuService.getInsuDeVO(prodId);
		
		//체크인아웃날짜 가져오기
		String nation= (String) session.getAttribute("nation");
		String period= (String) session.getAttribute("period");
		String sex= (String) session.getAttribute("sex");
		String birth= (String) session.getAttribute("birth");
		String tripType= (String) session.getAttribute("tripType");
		
		
		
		model.addAttribute("insuDeVO",insuDeVO);
		model.addAttribute("nation",nation);
		model.addAttribute("period",period);
		model.addAttribute("sex",sex);
		model.addAttribute("birth",birth);
		model.addAttribute("tripType",tripType);
		model.addAttribute("daysDiffer",daysDiffer);
		
		
		return "member/insurance/insuRsv";
	}
	
		
	//생년월일로 만나이 구하는 함수
    public int getAge(int birthYear, int birthMonth, int birthDay) {
        Calendar current = Calendar.getInstance();
        int currentYear  = current.get(Calendar.YEAR);
        int currentMonth = current.get(Calendar.MONTH) + 1;
        int currentDay   = current.get(Calendar.DAY_OF_MONTH);
       
        int age = currentYear - birthYear;
        // 생일 안 지난 경우 -1
        if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay)  
            age--;
       
        return age;
    }
}

	
	