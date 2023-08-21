package kr.or.ddit.vo;

import lombok.Data;

@Data
public class AdStatsVO {
	// 매출 연-월
	public String payDtYM;
	
	// 총 매출
	public int payPrYM;
	
	// 예약 연-월
	public String rsvDtYM;
	
	// 총 예약 수
	public int rsvCntYM;

	// 가입일 연-월
	public String memJoinDtYM;
	
	// 총 가입자 수
	public int memCntYM;

	// 연령대
	public String memAge;
	
	// 회원 수
	public int memCnt;
}
