package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class InsuVO {
	private String insuId;
	private String insuNm;
	private String insuTrTy;
	private String insuNat;
	private String insuPrcs;
	private String insuAge;
	private String insuType;
	private String deposit;
	private String company;
	private String insuImg;
	private String features1;
	private String features2;
	private String features3;
	private int withdrawal;
	
	
	
	//////////////////
	private List<InsuDetailVO> insuDetailVOList;
}
