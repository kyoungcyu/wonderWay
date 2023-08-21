package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CupnVO implements Serializable{
	private String cupnId;
	private String cupnCl;
	private int cupnRt;
	private String cupnDc;
	private Date cupnExp;
	private String cupnExpStr;
	private String gradId;
	private String gradNm;
	private String remainExp;
	private String cupnEnable;
	// 쿠폰 조회
	private List<HCupnVO> hcupnVOList;
	
	private String memId;
	
}
