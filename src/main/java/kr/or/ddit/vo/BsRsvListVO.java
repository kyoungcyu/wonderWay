package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BsRsvListVO {
	private String memId;		// 회원 아이디 1
	private Date rsvDt;			// 예약날짜  1
	private String rsvId;		// 예약 아이디 1
	private String memNm;		// 회원 명  1
	private String memTel;		// 회원 번호  1 
	private String memBir;		// 회원 번호  1 
	private String busiID;		// 업체 아이디 1
	private String rmNm;		// 객실 이름
	private int rmNum;          // 객실 번호 
	private Date rsvSt;			// 입실일
	private Date rsvEd;			// 퇴실일
	private String rsvCode;		// 예약상태	 1
	private String rprsvNm;
	private String rsvDtStr;	// 
	private String rsvPeriod;	// 
	private String gradId;		// 회원 등급 1
	private int rowNo;			// 넘버링 처리
	private String payMth;		// 결제방법 1
	private int rmPr;			// 방 금액(결제금액) 1
}
