package kr.or.ddit.member.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import kr.or.ddit.util.ItemDTO;
import kr.or.ddit.util.PagingDTO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CvfcVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.MsgVO;
import kr.or.ddit.vo.RmDeVO;
import kr.or.ddit.vo.RmVO;
import kr.or.ddit.vo.RvwVO;

@RequestMapping("/member/cart")
@Controller
public class CartController{
	private static final Logger log = LoggerFactory.getLogger(CartController.class);
	


	
	@Autowired
	MmCartService mmCartService;

	

	@ResponseBody
	@PostMapping(value="/showCart")
	public ArrayList<ItemDTO> showCart(
			HttpSession session) {
		
		
		ArrayList<ItemDTO>  itemList = (ArrayList<ItemDTO>) session.getAttribute("itemList");

		log.info("리스트"+itemList);
		
		return itemList;
	}
	
	
	@ResponseBody
	@PostMapping(value="/clearCart", produces = "application/text; charset=utf8")//이걸해줘야 텍스트가 보낼때도 깨지지 않는다 
	public String clearCart(HttpSession session) {
		
		session.removeAttribute("itemList");

		return "삭제 완료";
	}
	
	
	
	
	@ResponseBody
	@PostMapping(value="/removeCartItem")
	public ArrayList<ItemDTO> removeCartItem(@RequestBody Map<String, String> map,
											HttpSession session) {
		
		ArrayList<ItemDTO>  itemList = (ArrayList<ItemDTO>) session.getAttribute("itemList");
		
		String rmId=map.get("rmId");
		int rmNum=Integer.parseInt(map.get("rmNum"));
		
		log.info("받아왓다"+rmId+rmNum);
		
		this.mmCartService.removeItem(rmId, rmNum, itemList);
		
		
		return itemList;
	}
	
	
	
	
	
	
	
	
	
	
}
