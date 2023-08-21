package kr.or.ddit.admin.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.RsvListVO;

public interface AdRsvMapper {
	// 예약 목록
	public List<RsvListVO> rsvList(Map<String,String> map);
	
	// 예약 상세 정보
	public RsvListVO rsvDetail(Map<String, String> map);
	
	// 예약 데이터 총 개수
	public int getTotal(Map<String, String> map);
	
	// 월 숙박 예약 수
	public int cntStyMonth();
	
	// 월 렌터카 예약 수
	public int cntRntMonth();
	
	// 월 전체 예약 금액
	public int sumRsvMonth();
}
