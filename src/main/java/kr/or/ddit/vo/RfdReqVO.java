package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class RfdReqVO {
	private String payId; //결제아이디
	private int rfdPr;		//환불금액
	private String rfdResn;	//환불이유
	private Date rfdDt;		//환불승인일자
	private Date rfdReqDt;	//환불요청일자
	private String rsvId;
	
	private String buyId;
	private String rfdDtStr;	//환불승인일 문자열로
	
}
