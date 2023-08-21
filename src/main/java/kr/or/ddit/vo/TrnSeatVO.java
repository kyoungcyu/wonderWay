package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class TrnSeatVO implements Serializable {
	private String trnNm;
	private String seatId;
	private String direction;
	private String rsvSt;
	private String seatType;
	
	
	
	/////////////////////////
	private String rmNum;
	private String seatStatus;
	
}
