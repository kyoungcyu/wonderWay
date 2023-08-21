package kr.or.ddit.member.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.AttachVO;
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

public interface MypageMapper {
	// 내 프로필
	// 마이페이지 - 내 프로필 - 내 정보
	public MemVO detailMyInfo(String memId);

	// 마이페이지 - 내 프로필 - 내 정보 수정
	public int updateMyInfo(MemVO memVO);

	// 마이페이지 - 내 프로필 - 이메일 변경
	public int updateMyEmail(MemVO memVO);

	// 마이페이지 - 내 프로필 - 비밀번호 변경
	public int updateMyPass(MemVO memVO);
	
	//마이페이지 - 내프로필-이미지 변경
	 public int updateImg(MemVO memVO);
	 public int attachInsert(AttachVO attachVO);
	 public int attachDeInsert(List<AttachDeVO> attachDeVOlist);   
	 public String getImgPath(String memId);
	 public int memImgUpdate(MemVO memVO);

	// 예약내역  사용 안 함-> 새로운 예약내역으로 사용
	// 예약완료 조회
	public RsvVO rsvDetail(RsvVO rsvVO);
	// 마이페이지 - 예약내역 - 예약 리스트 - 숙박
	public List<MmRsvListVO> allBooking(Map<String, String> map);
	// 마이페이지 - 예약내역 - 렌트카 조회
	public List<MmRsvRntcarListVO> rntBooking(Map<String, String> map);
	
	//결제대기 취소
	public int noPayRsvK01(String rsvId);
	//1. 결제대기 - 숙박
	public int noPayRsvK01Sty(String rsvId);	
	//2. 결제대기 - 렌터카
	public int noPayRsvK01Rnt(String rsvId);	
	//예약완료 취소 시
	//1-1 환불요청 테이블 인서트
	public int rfdOK(RfdReqVO rfdReqVO);
	//1-2 결제 환불여부 업데이트 ->y
	public int rfdCk(PayVO payVO);
	//1-3 RSV 테이블 RSV_CODE='K04'
	public int rfdCodeK04(RsvVO rsvVO);

	//2-1. 수수료 존재할 시 환불테이블 insert
	public int rfdRequest(RfdReqVO rfdReqVO);
	//2-2. 예약상태 k03으로 변경
	public int rsvCodeK03Change(RsvVO rsvVO);
	
	//결제완료 (1.RSV_ST < today : 결제확인 2.RSV_ST > today : 리뷰작성)
	//1.리뷰작성
	public List<MmRsvListVO> completePay(Map<String, String> map);
	//2. 결제확인
	public List<MmRsvListVO> completePayBefUse(Map<String, String> map);
	
	//취소확정 -> K04
	public List<MmRsvListVO> rsvCancelK04(Map<String, String> map);
	
	//이용 완료 시 리뷰작성 -> 오타..고쳐라
	public int myReivewWrite(RvwVO rvwVO);
	public int attachInsertRvw(AttachVO attachVO);
	public int attachDeInsertRvw(List<AttachDeVO> attachDeVOlist);
	public int attachIdUpdateRvw(RvwVO rvwVO);
	
	
	
	//리뷰 존재하는지 판단
	public RvwVO hasReview(RvwVO rvwVO);
	
	
	//새로운예약내역
	public List<MmRsvListVO> bookingList(MmRsvListVO mmRsvListVO);
	
	
	//쿠폰함
	//등급조회
	public GradVO myGrad(String memId);
//	//보유쿠폰 조회
//	public  List<CupnVO> hasCoupon(String memId);
	//쿠폰함 조회 
	public List<CupnVO> myCoupon(String memId);
	//쿠폰존 조회
	public List<CupnVO> couponZone(CupnVO cupnVO);
	//쿠폰 다운로드
	public int downCoupon(HCupnVO hCupnVO);
	
	
	//나의 작성글 내역
	//1. 여행후기, 2. 질문답변  BRD_KND만 다르게
	public List<BrdVO> myWriteListD01(Map<String, String> map);
	public List<BrdVO> myWriteListD02(Map<String, String> map);
	
	
	//3. 리뷰 조회
	public List<RvwVO> myWriteListReview(Map<String, Object> map);
	//3-1 리뷰 삭제
	public int myRvwDelete(String rsvId);
	public int rvwAttachDelete(String rsvId);
	public int rvwAttachDeDelete(String rsvId);
	
	//3-2 리부 수정
	public RvwVO myRvwUpdate(RvwVO rvwVO);
	
	
	//4. 댓글 조회
	public List<CmtVO> myWriteListCmt(Map<String, String> map);
	
	//5.게시글 count
	public int myWriteListD01Count(Map<String,String> map);
	public int myWriteListD02Count(Map<String,String> map);
	public int myWriteListCmtCount(Map<String,String> map);
	public int myWriteListRvwCnt(Map<String, Object> map);
	
		

	
	
	//관심내역
	//1.최근 본 상품
	public List<MmRsvListVO> myRecentList(String busiId);
	public List<MmRsvListVO> myRecentListCar(String carNum);
	//2.찜목록
	public List<WishVO> myLikeList(WishVO wishVO);
	
	
	
	//구매내역
	//1.구매내역 조회
	public List<MmMyProdList> myProdList(Map<String, String> map);
	//2.취소내역조회
	public List<MmMyProdList> myCancelProdList(Map<String, String> map);
	//2.구매취소 시
	public int myProdCancel(String buyId);
	public int rfdProdAdd(RfdReqVO rfdReqVO);
	public int myProdCancelOK(String buyId);
	//3. 구매취소 상세보기
	public RfdReqVO rfdDetail(String payId);
	
	
	// 회원탈퇴
	public int deleteMem(MemVO memVO);
	
	//비회원 예약조회
	public NonMemberVO nonMem(NonMemberVO nonMemberVO);
	
	//업체 이미지
	public int getBusiImg(String attachId);
	
	//rmId를 이용하여 업체이미지를 가져옴
	public String getBusiImg2(String rmId);

	
	
	

	//찜하기(숙박업체)
	public int insertWish(WishVO wishVO);
	//찜 안하기(숙박업체)
	public int deleteWish(WishVO wishVO);
	//찜하기(차량)
	public int insertWishCar(WishVO wishVO);
	//찜 안하기(차량)
	public int deleteWishCar(WishVO wishVO);

}
