
package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PayVO {
	private String payId;	//결제아이디
	private int payPr;		//결제금액
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date payDt;		//결제일시
	private String payMth;	//결제방법
	private String rsvId;	//예약아이디
	private String buyId;	//장바구니아이디
	private String trRsvId;	//교토예약아이디
	private String adReqId;	//광고요청아이디
	private String rfdCk;	//환불여부

}
