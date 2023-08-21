package kr.or.ddit.util;

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


@RequestMapping("/error")
@Controller
public class ErrorController {
	
	// 400 Error
	@GetMapping("/error400")
	public String Error400() {

	    return "error/400";
	}
	
	// 404 Error
	@GetMapping("/error404")
	public String Error404() {
		
		return "error/404";
	}

	// 500 Error
	@GetMapping("/error500")
	public String Error500() {
		
		return "error/500";
	}
}
