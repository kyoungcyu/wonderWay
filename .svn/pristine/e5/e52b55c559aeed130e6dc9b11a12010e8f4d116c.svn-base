package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MmMyProdList {
	private String memId;		//회원아이디
	
	//PROD
	private String cmCode;		//상품코드
	private String prodId;		//상뭄아이디
	
	//BUY
	private String buyId;		//구매아이디
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date prodStrt;		//사용시일
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date prodEnd;		//끝나는 시일
	private String buyRtrcn;	//취소여부
	
	//PAY
	private String payId;
	private int payPr;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date payDt;
	private String payMth;
	private String rfdCk;
	
	//WIFI
	private String wifiNm;			//상품명
	private String wifiNat;			//지원국가
	private int wifiData;			//데이터제공량
	private int wifiSpd;			//속도
	private String wifiCom;			//서비스제공업체
	private String wifiLoc;			//기기위치
	private int wifiFee;			//요금
	private String wifiMaker;		//장치제조사
	private String wifiLend;		//대여가능여부
	
	//ROAM
	private String roamNm;			//상품명
	private String roamNat;			//지원국가
	private int roamDays;			//사용가능일수
	private int roamQtt;			//데이터제공량
	private int roamSpd;			//속도도
	private String roamCom;			//서비스제공업체
	private String roamOpt;			//로밍옵션
	private int roamFee;			//요금
	
	//INSU
	private String insuNm;			//보험이름
	private String insuTrTy;		//여행유형
	private String insuNat;			//국가
	private String insuPrcs;		//보험금청구절차
	private String insuAge;			//보험나이
	private String company;			//보험회사
	private int withdrawal;			//WITHDRAWAL
	private String insuType;		//보험타입
	private int deposit;			//보증금
	
	//INSU_DETAIL
	private String insuKnd;			//보험종류
	private String insuId;			//보험아이디
	private int insuFee;			//보험요금
	
	//환불
	private Date rfdDt;
	private Date rfdReqDt;
	
	
	
	

}
