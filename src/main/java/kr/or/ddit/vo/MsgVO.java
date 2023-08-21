package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MsgVO {
	private int rnum;
	private String msgId;
	private String sendId;
	private String recvId;
	private String sendNm;
	private String recvNm;
	private String cntn;
	private Date sendDt;
	
	
	
	// 사람이름이 겹쳐서 특정할때 필요
//	private String rsvId;
}
