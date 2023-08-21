package kr.or.ddit.admin.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.RfdListVO;

public interface AdRfdMapper {
	// 환불 요청 목록
	public List<RfdListVO> rfdList(Map<String,String> map);
	
	// 환불 요청 상세
	public RfdListVO rfdDetail(String payId);
	
	// 환불 요청 승인
	public int rfdAccept(String payId);
	
	// 환불 요청 승인 일자 갱신
	public int rfdDtAccept(String payId);

	// 환불 요청 거절
	public int rfdDenied(String payId);
	
	// 결제 정보 환불 완료로 갱신
	public int rsvAccept(String payId);
	
	// 환불 요청 총 데이터 개수
	public int getTotal(Map<String,String> map);
	
	// 환불 정책 수수료 갱신
	public int rfdUpdateFee(Map<String, String> map);
	
	// 미처리 요청 수
	public int cntRfdAll();
	
	// 승인 요청 수
	public int cntRfdAcceptAll();

	// 월 전체 환불 금액
	public int sumRfdAll();
}
