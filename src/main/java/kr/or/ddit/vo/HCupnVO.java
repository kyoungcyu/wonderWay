package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class HCupnVO {
	private String usable;  //사용가능 여부 Y/N
	private Date useDt; 	//사용일자 
	private String memId;	//회원아이디
	private String cupnId;  //쿠폰아이디
	
	
	
}
