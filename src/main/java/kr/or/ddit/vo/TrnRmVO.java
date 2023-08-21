package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class TrnRmVO implements Serializable {
	private int rmNum;  	 //객실번호
	private String trnKnd;   //기차 종류 ex)ktx, 무궁화호
	private String seatType; //좌석 타입
	
}
