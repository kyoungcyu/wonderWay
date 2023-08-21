package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BsRmVO {
	
	private String busiId ; 	//업체아이디
	private String rmNm ; 		//객실명
	private String rmId ; 		//객실명
	private  int rmNum ;  		// 객실번호
	private String chckIn ; 	// 체크인
	private String chckOut ;	// 체크아웃
	private int rmPr  ; 		// 금액
	private String rmDc  ; 		// 방상세정보
	private int stdPp ;			// 기본인원
	private int maxPp ;			// 최대인원
	private int ppExFee ;		// 추가금액
	private int busiScr ;		// 별점
	private String busiLoc ;	// 숙소위치
	private String rmBed ;		// 침대갯수
	
//	private String rmDel ;		// 삭제여부
	
	private MultipartFile[] uploads;
	
	//  편의시설 리스트
	private List<CvfcVO> cvfcVOList;
	//  첨부파일 사진 리스트
	private List<AttachDeVO> attachDeVOList;

}
