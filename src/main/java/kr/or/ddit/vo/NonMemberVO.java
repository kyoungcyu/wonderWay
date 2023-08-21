package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NonMemberVO {
    
    private String gstEmail;
	private String gstTel;
	private String gstSeq;
	private String rsvId;
	private String rsvCode;
	private Date rsvDt;
	private String payId;
	private String payPr;
	private Date payDt;
	private String payMth;
	private String rStyPp;
	private Date rsvSt;
	private Date rsvEd;
	private String checkIn;
	private String rmNum;
	private String rmId;
	private String rmDc;
	private String busiId;
	private String carNum;
	private String carCode;
	private String carKnd;
	private String carYr;
	private String fuelTyrs;
	private String busiCode;
	private String busiNm;
	private Date carSt;
	private Date carEd;
}
