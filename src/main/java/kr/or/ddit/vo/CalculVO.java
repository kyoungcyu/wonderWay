package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CalculVO {

	private String payPr;
	private String vat;         // 10%
	private String brokerFee;   // 3%
 	private String profit;
	private Date payDt; 		// (사용안함) payDt 때 관리자에게 돈이 들어가고
	private String payMth;
	private String rsvId;   	// 예약일이 지난 확정된 값만 보여집니다.
	private Date rsvDt;     	// rsvDt가 지난 후 업체에게 돈이 들어온다.
	private String memNm;
	
}
