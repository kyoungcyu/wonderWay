package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

//자바빈 클래스
@Data
public class BrdVO {

	private int rnum; 			//글번호
	private String brdId; 		//번호
	private String brdKnd;	 	//종류
	@NotBlank(message="제목을 작성해주세요")
	private String brdTt; 		//제목
	@NotBlank(message="내용을 작성해주세요")
	private String brdCntn; 	//내용
	private String lastWrtr;	//최종 작성자
	private String attachId;	//첨부파일 아이디
	private String brdDel;		//삭제여부
	private String intr;		//차단여부
	private String intrResn;	//차단사유
	private int brdLike;		//좋아요
	private int reprt;			//신고수
	private String tourId;		//여행지아이디
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date lastDt;		//최종 수정일
	private String reprtCk;		//신고확인
	private String frstWrtr;	//작성자
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date frstDt;		//작성일
	private int inqCnt; 		//조회수
	
	private String isOk;		//답변여부
	
	//<input name="picture" type="file"
	private MultipartFile picture;	//파일객체
	
	//attach 테이블 
	private List<AttachVO> attachVOList;
	
	//cmt 테이블 - 댓글
	private List<CmtVO> cmtVOList;
	
	private String fileNm;			//저장 파일명
	private String savePath;		//저장경로
	
	private String memImg;
	
	
	
	
}






