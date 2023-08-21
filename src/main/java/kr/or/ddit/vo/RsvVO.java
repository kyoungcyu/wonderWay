package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class RsvVO {
	private String rsvId;		//예약아이디
	private String rsvCode;		//예약상태
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date rsvDt;			//예약일시
	private String rsvDtStr;	//예약일시 문자열로
	private String memId;		//회원아이디
	private String busiId;		//업체아이디
	private String cupnId;	
	private String gstEmail;
	
	private String rsvSt;		//입실일
}
