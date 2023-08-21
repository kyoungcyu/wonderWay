package kr.or.ddit.business.service;

import java.util.List;

import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CarCheckVO;

public interface BsBusiService {

   //회원 목록
	public List<BusiVO> busiList();

	public BusiVO busiOne(BusiVO busiVO);

	public BusiVO userDetail(String lginId);
    // 회원가입
    public int create(BusiVO busiVO);
    // 아이디 중복체크
    public int checkBusiId(BusiVO busiVO);
    // 이메일 중복체크
    public int checkBsEmail(BusiVO busiVO);
    // 비밀번호 수정
    public int resetPw(BusiVO busiVO);
    // 전화번호 수정
	public int resetTel(BusiVO busiVO);
	// 계좌번호 등록
	public int updateBank(BusiVO busiVO);
	// 원더머니 차액 계산
	public int withDraw(BusiVO busiVO);
	// 업체종류 selectBox 
	public int updateGubun(BusiVO busiVO);
	// 채팅시간 등록
	public int chatTime(BusiVO busiVO);
	// 이미지 등록
	public int updateImg(BusiVO busiVO);

	public String getImgPath(String busiId);
	// 차량번호조회
	public List<CarCheckVO> carNum(BusiVO busiVO);

	public List<CarCheckVO> memDetail(CarCheckVO carCheckVO);

	public int chckIn(BusiVO busiVO);

}