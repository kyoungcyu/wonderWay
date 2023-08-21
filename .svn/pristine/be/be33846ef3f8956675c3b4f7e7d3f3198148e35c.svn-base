package kr.or.ddit.business.mapper;

import java.util.List;

import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CarCheckVO;
import kr.or.ddit.vo.MemVO;

public interface BsBusiMapper {
   //회원 목록
   public List<BusiVO> busiList();
   
   // 회원가입
   public int create(BusiVO busiVO);
   
   // ?
   public BusiVO busiOne(BusiVO busiVO);
   
   // 로그인한 회원정보 불러오기
   public BusiVO userDetail(String lginId);
   
   // 아이디 중복 검사
   public int checkBusiId(BusiVO busiVO);
 
   // 이메일중복 검사
   public int checkBsEmail(BusiVO busiVO);
   
   // 이메일 아이디 찾기
   public String findIdByEmail(BusiVO busiVO);
   
   //이메일인증으로 비밀번호 재설정
   public int resetPwByEmail(BusiVO busiVO);
   
   // 로그인시 권한부여
   public int insertAuth(BusiVO busiVO);
   
   // 마이페이지 비번수정
   public int resetPw(BusiVO busiVO);
   
   // 마이페이지 전화번호수정
   public int resetTel(BusiVO busiVO);
   
   // 마이페이지 계좌 등록
   public int updateBank(BusiVO busiVO);
   
   // 마이페이지 원더머니 차액계산
   public int withDraw(BusiVO busiVO);
   
   // 마이페이지 업체종류 selectBox
   
   public int updateGubun(BusiVO busiVO);
   
   // 마이페이지 채팅시간등록
   public int chatTime(BusiVO busiVO);

   public int updateImg(BusiVO busiVO);

   //공지사항 작성 - 첨부파일
 	public int attachInsert(AttachVO attachVO);
 	
 	//공지사항 작성 - 첨부파일_상세
 	public int attachDeInsert(List<AttachDeVO> attachDeVOlist);   

 	public String getImgPath(String busiId);

	public List<CarCheckVO> carNum(BusiVO busiVO);

	public List<CarCheckVO> memDetail(CarCheckVO carCheckVO);

	public int chckIn(BusiVO busiVO);




}

