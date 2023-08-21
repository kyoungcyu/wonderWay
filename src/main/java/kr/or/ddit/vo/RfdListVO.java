package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class RfdListVO implements Serializable {
	private String payId;
	private String memNm;
	private String busiNm;
	private int rfdPr;
	private Date rfdReqDt;
	private String rfdResn;
	private String rfdCk;
}
