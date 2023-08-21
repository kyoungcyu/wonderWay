package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MmStyCmpRsvListVO {
	public String rsvId; //예약아이디
	public String memId; //회원아이디
	public String rsvCode; //예약코드?
	public Date rsvSt; //입실일
	public Date rsvEd; //퇴실일
	public String busiId; //업체 아이디
	public String busiNm; //업체명
	public String rmId; //방아이디
	public String rmNm; //방이름

}
