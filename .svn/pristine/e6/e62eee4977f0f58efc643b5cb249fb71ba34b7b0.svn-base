package kr.or.ddit.member.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.member.mapper.MypageMapper;
import kr.or.ddit.member.service.MypageService;
import kr.or.ddit.util.CommonFile;
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
import kr.or.ddit.vo.TourVO;
import kr.or.ddit.vo.WishVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MypageServiceImpl implements MypageService {
	@Inject
	MypageMapper mypageMapper;
	//마이페이지 - 내 프로필 
	@Override
	public MemVO detailMyInfo(String memId) {
		return this.mypageMapper.detailMyInfo(memId);
	}
	
	//마이페이지 - 내 프로필 - 내 정보 수정
	@Override
	public int updateMyInfo(MemVO memVO) {
		return this.mypageMapper.updateMyInfo(memVO);
	}
	//마이페이지 - 내 프로필 - 이메일 변경
	@Override
	public int updateMyEmail(MemVO memVO) {
		return this.mypageMapper.updateMyEmail(memVO);
	}
	//마이페이지 - 내 프로필 - 비밀번호 변경
	@Override
	public int updateMyPass(MemVO memVO) {
		return this.mypageMapper.updateMyPass(memVO);
	}
	// 마이페이지 - 내프로필 - 이미지 변경
	@Override
	public int updateImg(MemVO memVO) {
		//1. busi 테이블에 insert
//		int result = this.bsBusiMapper.updateImg(busiVO);
		log.info("memVO :"+memVO);
				
		//2. 첨부파일 처리
		AttachVO attachVO = new AttachVO();
		List<AttachDeVO> attachDeVOlist = new ArrayList<AttachDeVO>();
		log.info("attachDeVOlist :"+attachDeVOlist);
		
		//2.1. ATTACH테이블(ATTACH_ID, ATTACH_DEL)에 insert
		attachVO.setAttachId(memVO.getMemId());
		attachVO.setAttachDel("N");
		log.info("attachVO :"+attachVO);
		this.mypageMapper.attachInsert(attachVO);
		
		//2.2. ATTACH_DE테이블에 insert
		// <input name="picture" type="file"
		MultipartFile[] uploads = memVO.getUploads();
		
		for(MultipartFile upload : uploads) {
			String orgNm = upload.getOriginalFilename();

			//UUID 처리 시작
			UUID uuid = UUID.randomUUID();
			String fileNm = uuid.toString() + "_" + orgNm;

			// 파일 업로드 시작 ===
			File uploadPath = new File(CommonFile.uploadFolder+"\\mem", CommonFile.getFolder());
			if (uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}

			log.info("uploadPath => " + uploadPath.getAbsolutePath());
			// 설계
			File saveFile = new File(uploadPath, fileNm);
			try {
				upload.transferTo(saveFile);
	
				AttachDeVO attachDeVO = new AttachDeVO();
				attachDeVO.setAttachId(attachVO.getAttachId());
				attachDeVO.setSavePath("/" + CommonFile.getFolder().replace("\\", "/") + "/" + fileNm); // 파일 저장 경로
				attachDeVO.setOrgNm(orgNm);// 파일 원본 명
				attachDeVO.setFileNm(fileNm);// 파일 저장명
				attachDeVO.setFileSz(upload.getSize()); // 파일 사이즈
				attachDeVO.setFileTy(upload.getContentType()); // 파일 컨텐츠 타입
	
				log.info("insert할 attachDeVO : " + attachDeVO);
	
				attachDeVOlist.add(attachDeVO);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}//end for
		
		log.info("attachDeVOlist : " + attachDeVOlist);

		int result = this.mypageMapper.attachDeInsert(attachDeVOlist);
		String memImg = attachDeVOlist.get(0).getSavePath();
		memVO.setMemImg(memImg);
		result = this.mypageMapper.memImgUpdate(memVO);

		return result;
	}	
	//이미지 불러오기
	@Override
	public String getImgPath(String memId) {
		return this.mypageMapper.getImgPath(memId);
	}
	
	
	
	
	
	
	
	
	
	
	//예약내역
	//예약내역 조회
	@Override
	public RsvVO rsvDetail(RsvVO rsvVO) {
		return this.mypageMapper.rsvDetail(rsvVO);
	}
	//결제대기 취소
	@Override
	public int noPayRsvK01(String rsvId) {
		return this.mypageMapper.noPayRsvK01(rsvId);
	}
	//1. 결제대기 취소 - 숙박
	@Transactional
	@Override
	public int noPayRsvK01Sty(String rsvId) {
		int result = this.mypageMapper.noPayRsvK01Sty(rsvId);
		System.out.println("숙박취소 1 : " + result);
		result += this.mypageMapper.noPayRsvK01(rsvId);
		return result;
	}
	//2. 결제대기 취소 - 렌터카
	@Transactional
	@Override
	public int noPayRsvK01Rnt(String rsvId) {
		int result = this.mypageMapper.noPayRsvK01Rnt(rsvId);
		result +=this.mypageMapper.noPayRsvK01(rsvId);
		return result;
	}
	
	//예약완료 취소 시
	//1-1 환불 100% - PAY테이블 UPDATE rfdCk-> 'y'-> rfd_req테이블 insert
	@Transactional	
	@Override
	public int rfdOk(RfdReqVO rfdReqVO) {
		PayVO payVO = new PayVO();
		RsvVO rsvVO = new RsvVO();
		
		payVO.setRsvId(rfdReqVO.getRsvId());
		rsvVO.setRsvId(rfdReqVO.getRsvId());
		
		int result = this.mypageMapper.rfdOK(rfdReqVO);
		result += this.mypageMapper.rfdCk(payVO);
		result += this.mypageMapper.rfdCodeK04(rsvVO);
		return result;
	}
	//2-1. 수수료 존재하면 - 환불테이블 INSERT, 예약상태 : K03으로 변환
	@Transactional
	@Override
	public int rfdRequest(RfdReqVO rfdReqVO) {
		RsvVO rsvVO = new RsvVO();
		int result= this.mypageMapper.rfdRequest(rfdReqVO);
		rsvVO.setRsvId(rfdReqVO.getRsvId());
		result += this.mypageMapper.rsvCodeK03Change(rsvVO);
		return result;
	}
	
	//리뷰 존재하는지 판단
	public RvwVO hasReview(RvwVO rvwVO) {
		return this.mypageMapper.hasReview(rvwVO);
	}
	//이용 완료 시 리뷰작성
	@Transactional
	@Override
	public int myReivewWrite(RvwVO rvwVO) {
		AttachVO attachVO = new AttachVO();
		List<AttachDeVO> attachDeVOlist = new ArrayList<AttachDeVO>();

		int result = this.mypageMapper.myReivewWrite(rvwVO);
		System.out.println("result1 : " + result);
		result += this.mypageMapper.attachInsertRvw(attachVO);
		System.out.println("result2 : " + result);

		// <input name="picture" type="file"
		MultipartFile[] uploads = rvwVO.getUploads();
		System.out.println("uploads : " + uploads);
		
		for(MultipartFile upload : uploads) {
		String orgNm = upload.getOriginalFilename();

		// UUID 처리 시작
		UUID uuid = UUID.randomUUID();
		String fileNm = uuid.toString() + "_" + orgNm;

		// 파일 업로드 시작 ===
		File uploadPath = new File(CommonFile.uploadFolder+"\\rvw", CommonFile.getFolder());
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		// 설계
		File saveFile = new File(uploadPath, fileNm);
		try {
			upload.transferTo(saveFile);

			AttachDeVO attachDeVO = new AttachDeVO();
			attachDeVO.setAttachId(attachVO.getAttachId());
			attachDeVO.setSavePath("/" + CommonFile.getFolder().replace("\\", "/") + "/" + fileNm); // 파일 저장 경로
			attachDeVO.setOrgNm(orgNm);// 파일 원본 명
			attachDeVO.setFileNm(fileNm);// 파일 저장명
			attachDeVO.setFileSz(upload.getSize()); // 파일 사이즈
			attachDeVO.setFileTy(upload.getContentType()); // 파일 컨텐츠 타입

			log.info("insert할 attachDeVO : " + attachDeVO);

			attachDeVOlist.add(attachDeVO);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		}

		result += this.mypageMapper.attachDeInsertRvw(attachDeVOlist);
		System.out.println("result3 : " + result);

		rvwVO.setAttachId(attachVO.getAttachId());
		System.out.println("result3->brdVO : " + rvwVO);// attachId, brdId

		result += this.mypageMapper.attachIdUpdateRvw(rvwVO);
		System.out.println("result4 : " + result);
		
		
		return result;
	}

	
	//쿠폰함
	//등급조회
	@Override
	public GradVO myGrad(String memId) {
		return this.mypageMapper.myGrad(memId);
	}
	//쿠폰함 조회
	public List<CupnVO> myCoupon(String memId) {
		return this.mypageMapper.myCoupon(memId);
	}	
	//쿠폰존조회
	@Override
	public List<CupnVO> couponZone(CupnVO cupnVO) {
		return this.mypageMapper.couponZone(cupnVO);
	}	
	//쿠폰 다운로드
	@Override
	public int downCoupon(HCupnVO hCupnVO) {
		return this.mypageMapper.downCoupon(hCupnVO);
	}
	
	
	
	//나의 작성글 내역
	//1.여행후기/ 2. 질문답변
	@Override
	public List<BrdVO> myWriteListD01(Map<String, String> map) {
		return this.mypageMapper.myWriteListD01(map);
	}
	@Override
	public List<BrdVO> myWriteListD02(Map<String, String> map) {
		return this.mypageMapper.myWriteListD02(map);
	}
	//3. 리뷰 조회
	@Override
	public List<RvwVO> myWriteListReview(Map<String, Object> map) {
		return this.mypageMapper.myWriteListReview(map);
	}
	
	//3-1 리뷰 삭제
	@Override
	public int myRvwDelete(String rsvId) {
		
		int result = this.mypageMapper.myRvwDelete(rsvId);
		result += this.mypageMapper.rvwAttachDelete(rsvId);
		result = this.mypageMapper.rvwAttachDeDelete(rsvId);
		return result;
	}
	
	//3-1 리뷰 수정
	@Override
	public RvwVO myRvwUpdate(RvwVO rvwVO) {
		return this.mypageMapper.myRvwUpdate(rvwVO);
		
	}
	
	
	
	
	//4.댓글
	@Override
	public List<CmtVO> myWriteListCmt(Map<String, String> map) {
		return this.mypageMapper.myWriteListCmt(map);
	}	
	//5.게시글 count
	public int myWriteListD01Count(Map<String,String> map) {
		return this.mypageMapper.myWriteListD01Count(map);
	}	
	//페이지 게시글 총 수 
	public int myWriteListD02Count(Map<String,String> map) {
		return this.mypageMapper.myWriteListD02Count(map);
	}	
	//댓글 총 개수
	public int myWriteListCmtCount(Map<String,String> map) {
		return this.mypageMapper.myWriteListCmtCount(map);
	}	
	//리뷰 총 개수
	public int myWriteListRvwCnt(Map<String,Object> map) {
		return this.mypageMapper.myWriteListRvwCnt(map);
	}	

	
	
	
	//관심내역
	//1.최근본상품-숙소
	@Override
	public List<MmRsvListVO> myRecentList(String busiId) {
		return this.mypageMapper.myRecentList(busiId);
	}
	//최근 본 상품 - 차량
	@Override
	public List<MmRsvListVO> myRecentListCar(String carNum) {
		return this.mypageMapper.myRecentListCar(carNum);
	}
	//2. 찜목록
	@Override
	public List<WishVO> myLikeList(WishVO wishVO) {
		return this.mypageMapper.myLikeList(wishVO);
	}
	
	
	//구매내역
	//1.구매내역
	public List<MmMyProdList> myProdList(Map<String, String> map){
		return this.mypageMapper.myProdList(map);
	}
	//1.취소내역
	public List<MmMyProdList> myCancelProdList(Map<String, String> map){
		return this.mypageMapper.myCancelProdList(map);
	}
	//취소내역
	@Transactional
	@Override
	public int rfdProdAdd(RfdReqVO rfdReqVO) {
		int result = this.mypageMapper.rfdProdAdd(rfdReqVO);
		System.out.println("result 1 : " + result);
		 result += this.mypageMapper.myProdCancelOK(rfdReqVO.getBuyId());
		 System.out.println("result 2 : " + result);
		 result += this.mypageMapper.myProdCancel(rfdReqVO.getBuyId());
		 System.out.println("result 3 : " + result);
		
		return result;
	}
	//3. 구매취소 상세보기
	public RfdReqVO rfdDetail(String payId) {
		return this.mypageMapper.rfdDetail(payId);
	}


	
	
	//회원 탈퇴
	@Override
	public int deleteMem(MemVO memVO) {
		return this.mypageMapper.deleteMem(memVO);
	}
	
	
	
	//새로운 예약내역
	@Override
	public List<MmRsvListVO> bookingList(MmRsvListVO mmRsvListVO) {
		return this.mypageMapper.bookingList(mmRsvListVO);
	}

	//비회원 예약조회
	@Override
	public NonMemberVO nonMem(NonMemberVO nonMemberVO) {
		return this.mypageMapper.nonMem(nonMemberVO);
	}

	@Override
	public int getBusiImg(String attachId) {
		return this.mypageMapper.getBusiImg(attachId);
	};

	//rmId를 이용하여 업체이미지를 가져옴
	@Override
	public String getBusiImg2(String rmId) {
		return this.mypageMapper.getBusiImg2(rmId);
	};
	




	// insertWish
	@Override
	public int insertWish(WishVO wishVO) {
		return this.mypageMapper.insertWish(wishVO);
	};

	// deleteWish
	@Override
	public int deleteWish(WishVO wishVO) {
		return this.mypageMapper.deleteWish(wishVO);
	};
	
	// insertWishCar
	@Override
	public int insertWishCar(WishVO wishVO) {
		return this.mypageMapper.insertWishCar(wishVO);
	};
	
	// deleteWishCar
	@Override
	public int deleteWishCar(WishVO wishVO) {
		return this.mypageMapper.deleteWishCar(wishVO);
	};
	





















}
