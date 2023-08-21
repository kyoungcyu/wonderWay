package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdReviewListVO {
	private int rNum;
	private String rsvId;
	private String rvwCntn;
	private int rvwStar;
	private String rvwCmt;
	private String rvwBlind;
	private Date rvwDt;
	private String busiId;
	private String busiCode;
	private String memId;
	private String busiNm;
	private String acmdCode;
	private String savePath;
}
