package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class HInsrVO implements Serializable{
	private String hinsrId;
	private String hinsrDc;
	private String insrCom;
	private String busiId;
	private String insrNm;
	private int insrPr;

}
