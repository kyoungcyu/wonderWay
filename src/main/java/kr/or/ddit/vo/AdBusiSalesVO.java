package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdBusiSalesVO {
	public int rowNum;
	public String payId;
	public String busiId;
	public String busiNm;
	public String rsvId;
	public int payPr;
	public Date rsvDt;
}
