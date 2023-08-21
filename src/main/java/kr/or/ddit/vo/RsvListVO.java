package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class RsvListVO implements Serializable {
	// 예약자 ID
	private String memId;
	
	// 예약 ID
	private String rsvId;
	
	// 예약자명
	private String memNm;
	
	// 예약자 회원 등급
	private String gradId;
	
	// 예약 업체 숙박/렌터카
	private String busiCode;
	
	// 예약 업체명
	private String busiNm;
	
	// 결제 수단
	private String payMth;
	
	// 예약 일자
	private Date rsvDt;
	
	// 예약 일자(문자열형)
	private String rsvDtStr;
	
	// 예약 기간
	private String rsvPeriod;
	private int payPr;
	private String rsvCode;
	private int remainDate;
}
