package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RvwVO {
	//rvw table
	private String rsvId;	//예약아이디
	private String rvwCntn;	//리뷰 내용
	private double rvwStar;	//별점
	private String rvwCmt;  //댓글
	private String rvwBlind;
	private Date rvwDt;		//리뷰 작성일
	private String attachId;
	private String rvwDel;
	
	private String busiNm;
    
    
    //조인 위한 필드값
	//mem table 
    private String memImg;
    private String memId;
    private String memNm;
    
    //rsv table
	private Date rsvDt;
	
	//첨부파일 가져오기
	//attach table (1:1)
	public AttachVO attachVO; 
	
	private String savePath;
	
	private MultipartFile[] uploads;
	
	
}
	