package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;


@Data
public class BsRfdListVO {
	
	
	private int no;   		// 순서
	private int rmNum;   	// 객실번호
	private String rmNm;   	// 객실명
	private String memNm; 	// 회원명
	private String memTel; 	// 회원번호
	private String memId; 	// 회원아이디
	private int payPr;    	// 결제금액
	private String rsvCode; // 예약상태
	private String rfdResn; // 환불사유
	private Date rfdDt; 	// 환불승인일자
	private Date rsvSt; 	// 환불승인일자
	private Date rsvEd; 	// 환불승인일자
	private String busiId ;
	private String rsvDtStr ;
}