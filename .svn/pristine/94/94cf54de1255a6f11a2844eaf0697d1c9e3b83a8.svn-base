package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CmtVO;
import kr.or.ddit.vo.CupnVO;
import kr.or.ddit.vo.GradVO;
import kr.or.ddit.vo.HCupnVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.MmMyProdList;
import kr.or.ddit.vo.MmRsvListVO;
import kr.or.ddit.vo.MmRsvRntcarListVO;
import kr.or.ddit.vo.NonMemberVO;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.RfdReqVO;
import kr.or.ddit.vo.RsvVO;
import kr.or.ddit.vo.RvwVO;
import kr.or.ddit.vo.WishVO;

public interface MypageService {
	
	//내 프로필
	//마이페이지 - 내 프로필 - 내 정보(권한 미포함)
	public MemVO detailMyInfo(String memId);
	
	// 회원정보 변경
	// 마이페이지 - 내 프로필 - 정보 수정
	public int updateMyInfo(MemVO memVO);
	//마이페이지 - 내 프로필 - 이메일 변경
	public int updateMyEmail(MemVO memVO);
	// 마이페이지 - 내 프로필 - 비밀번호 변경
	public int updateMyPass(MemVO memVO);
	// 마이페이지 - 내프로필 - 이미지 변경
	public int updateImg(MemVO memVO);
	public String getImgPath(String memId);
	
	
	//예약내역
	//결제대기 취소
	public int noPayRsvK01(String rsvId);
	//1. 결제대기 취소 - 숙박
	public int noPayRsvK01Sty(String rsvId);	
	//2. 결제대기 취소 - 렌터카
	public int noPayRsvK01Rnt(String rsvId);	
	

	
	//예약완료 취소 시
	//1-1 환불 100%
	//1-1 환불요청 테이블 인서트
	public int rfdOk(RfdReqVO rfdReqVO);
	//2-1. 수수료 존재할 시 환불테이블 insert
	public int rfdRequest(RfdReqVO rfdReqVO);
	
	//예약내역
	public List<MmRsvListVO> bookingList(MmRsvListVO mmRsvListVO);	
	// 예약내역 상세 조회
	public RsvVO rsvDetail(RsvVO rsvVO);
	
	//이용 완료 시 리뷰작성
	public int myReivewWrite(RvwVO rvwVO);
	
	//리뷰 존재하는지 판단
	public RvwVO hasReview(RvwVO rvwVO);
	
	

	
	
	//쿠폰함
	//등급조회
	public GradVO myGrad(String memId);
	//쿠폰함 조회
	public List<CupnVO> myCoupon(String memId);
	//쿠폰존 조회
	public List<CupnVO> couponZone(CupnVO cupnVO);
	//쿠폰 다운로드
	public int downCoupon(HCupnVO hCupnVO);
	
	
	//나의 작성글 내역
	//1. 여행후기, 2. 질문답변
	public List<BrdVO> myWriteListD01(Map<String, String> map);
	public List<BrdVO> myWriteListD02(Map<String, String> map);
	
	
	//3. 리뷰 조회
	public List<RvwVO> myWriteListReview(Map<String, Object> map3);
	//3-1 리뷰 삭제
	public int myRvwDelete(String rsvId);
	//3-2 리부 수정
	public RvwVO myRvwUpdate(RvwVO rvwVO);
	
	
	//4.댓글
	public List<CmtVO> myWriteListCmt(Map<String, String> map);
	//5.게시글 count
	public int myWriteListD01Count(Map<String,String> map);
	public int myWriteListD02Count(Map<String,String> map);
	public int myWriteListCmtCount(Map<String,String> map);
	public int myWriteListRvwCnt(Map<String, Object> map3);
	
	
	//관심내역
	//1. 최근 본 상품
	public List<MmRsvListVO> myRecentList(String busiId);
	public List<MmRsvListVO> myRecentListCar(String carNum);
	//2.찜목록
	public List<WishVO> myLikeList(WishVO wishVO);
//	public List<WishVO> myLikeListD02(WishVO wishVO);
	
	
	//구매내역
	//1.구매내역
	public List<MmMyProdList> myProdList(Map<String, String> map);
	//2.취소내역조회
	public List<MmMyProdList> myCancelProdList(Map<String, String> map);
	//2.취소내역
	public int rfdProdAdd(RfdReqVO rfdReqVO);
	//3. 구매취소 상세보기
	public RfdReqVO rfdDetail(String payId);
	
	
	
	//회원탈퇴
	public int deleteMem(MemVO memVO);

	//비회원 예약조회
	public NonMemberVO nonMem(NonMemberVO nonMemberVO);


	//업체 이미지
	public int getBusiImg(String attachId);

	//찜하기(숙박업체)
	int insertWish(WishVO wishVO);
	//찜 안하기(숙박업체)
	int deleteWish(WishVO wishVO);
	//찜하기(차량)
	int insertWishCar(WishVO wishVO);
	//찜 안하기(차량)
	int deleteWishCar(WishVO wishVO);
	//rmId를 이용하여 업체이미지를 가져옴
	public String getBusiImg2(String rmId);

}
