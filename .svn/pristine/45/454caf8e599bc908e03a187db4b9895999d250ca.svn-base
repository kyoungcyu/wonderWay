package kr.or.ddit.business.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.business.mapper.BsRmMapper;
import kr.or.ddit.business.service.BsRmService;
import kr.or.ddit.util.CommonFile;
import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BsRmVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CvfcVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BsRmServiceImpl implements BsRmService{
	
	@Autowired
	BsRmMapper bsRmMapper;
	
	@Override
	public List<BsRmVO> bsRmList(Map<String, String> map){
		return this.bsRmMapper.bsRmList(map);
	}
	
	@Override
	public int getTotal(Map<String, String> map) {
		return this.bsRmMapper.getTotal(map);
	}
	
	@Override
	public int addRm(BsRmVO bsRmVO) {
		//1. RM 테이블에 insert
		int result = this.bsRmMapper.addRm(bsRmVO);
		log.info("bsRmVO :"+bsRmVO);
		
		//2. 첨부파일 처리
		AttachVO attachVO = new AttachVO();
		List<AttachDeVO> attachDeVOlist = new ArrayList<AttachDeVO>();
		log.info("attachDeVOlist :"+attachDeVOlist);
		
		//2.1. ATTACH테이블(ATTACH_ID, ATTACH_DEL)에 insert
		attachVO.setAttachId(bsRmVO.getRmId());
		attachVO.setAttachDel("N");
		log.info("attachVO :"+attachVO);
		this.bsRmMapper.attachInsert(attachVO);
		
		//2.2. ATTACH_DE테이블에 insert
		// <input name="picture" type="file"
		MultipartFile[] uploads = bsRmVO.getUploads();
		
		for(MultipartFile upload : uploads) {
			String orgNm = upload.getOriginalFilename();

			//UUID 처리 시작
			UUID uuid = UUID.randomUUID();
			String fileNm = uuid.toString() + "_" + orgNm;

			// 파일 업로드 시작 ===
			File uploadPath = new File(CommonFile.uploadFolder+"\\rm", CommonFile.getFolder());
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
		}//end for
		
		log.info("attachDeVOlist : " + attachDeVOlist);

		result += this.bsRmMapper.attachDeInsert(attachDeVOlist);

		return result;
	}
	@Override
	public BsRmVO rmIdList(String rmId) {
		return this.bsRmMapper.rmIdList(rmId);
	}
	
	@Override
	public int updateRm(BsRmVO bsRmVO) {
		int cnt1 = this.bsRmMapper.updateRm2(bsRmVO);
		int cnt2 = this.bsRmMapper.updateRm(bsRmVO);
		
		return cnt1+cnt2;
	}
	
	@Override
	public List<CvfcVO> cvfcSer() {
		return  this.bsRmMapper.cvfcSer();
	}
	@Override
	public List<CvfcVO> cvfcRm() {
		return  this.bsRmMapper.cvfcRm();
	}
	@Override
	public List<CvfcVO> cvfcIcon() {
		return  this.bsRmMapper.cvfcIcon();
	}
	@Override
	public List<CvfcVO> cvfcAcc() {
		return  this.bsRmMapper.cvfcAcc();
	}
	@Override
	public int insertCvfc(BusiVO busiVO){
		return  this.bsRmMapper.insertCvfc(busiVO);
	}
	@Override
	public List<CvfcVO> selectCvfc(BusiVO busiVO){
		return  this.bsRmMapper.selectCvfc(busiVO);
	}
	@Override
	public int deleteCvfc(BusiVO busiVO){
		return  this.bsRmMapper.deleteCvfc(busiVO);
	}

	
	


}
