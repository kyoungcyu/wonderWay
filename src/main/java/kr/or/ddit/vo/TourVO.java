package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TourVO {
	// 여행지 ID
	private String tourId;
	
	// 여행지명
	private String tourNm;
	
	// 여행지 설명
	private String tourDc;
	
	// 위도
	private String lati;
	
	// 경도
	private String longi;
	
	// 첨부 파일 ID
	private String attachId;
	
	// 분류
	private String tourCode;
	
	// 지역
	private String tourLoc;
	
	// 여행지 첨부 이미지 경로
	private String imgPath;
	
	// <input name="picture" type="file"
	private MultipartFile picture;	//파일객체
	
	// attach 테이블 
	private List<AttachVO> attachVOList;
}
