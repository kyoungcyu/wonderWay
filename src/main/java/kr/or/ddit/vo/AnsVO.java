package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AnsVO {
	
	private String ansId;		//답변아이디
	private String ansTt;		//답변제목
	private String ansCntn;		//답변내용
	private String ansWr;		//답변작성자
	private Date ansDt; 		//답변작성일
	private String brdId;		//게시판아이디
	private String attachId; 	//첨부파일아이디
	private int ansLike;		//좋아요
	List<CmtVO> cmtList;		// 댓글리스트

}
