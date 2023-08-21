package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CmtVO {
	private String cmtId;		//댓글번호
	private String cmtWr;		//댓글작성자
	private String cmtCntn;		//댓글내용
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date cmtDt;			//댓글 작성일
	private String brdId;		//게시글번호
	private String repCmtId;	//원댓글번호
	private int repLevel; 		//댓글깊이
	private String ansId;		//답변아이디
	
	private String brdTt;		//게시물 제목
	private String brdKnd;		//게시물 종류
	
	private String savePath;
}
