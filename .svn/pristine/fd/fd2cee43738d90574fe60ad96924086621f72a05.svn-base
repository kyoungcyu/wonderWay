package kr.or.ddit.admin.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.mapper.AdMemMapper;
import kr.or.ddit.admin.service.AdMemService;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.RsvListVO;
import kr.or.ddit.vo.RsvVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdMemServiceImpl implements AdMemService{
	@Autowired
	AdMemMapper memMapper;
	
	/**
	 * 전체 회원 목록
	 */
	@Override
	public List<MemVO> memList(Map<String,String> map){
		return this.memMapper.memList(map);
	}
	
	/**
	 * 회원 상세
	 */
	@Override
	public MemVO memDetail(MemVO memVO) {
		return this.memMapper.memDetail(memVO);
	}
	
	/**
	 * 회원 수
	 */
	@Override
	public int memTotal(Map<String,String> map) {
		return this.memMapper.memTotal(map);
	}
	
	/**
	 * 회원 작성 게시글
	 */
	@Override
	public List<BrdVO> memBrdList(MemVO memVO) {
		return this.memMapper.memBrdList(memVO);
	}
	
	/**
	 * 부적절 회원 관리
	 */
	@Override
	public List<BrdVO> brdReprtList(Map<String, String> map){
		return this.memMapper.brdReprtList(map);
	};
	
	/**
	 * 미처리 신고수
	 */
	@Override
	public int brdReptTotal(Map<String,String> map) {
		return this.memMapper.brdReptTotal(map);
	}
	
	/**
	 * 회원 경고 상태
	 */
	@Override
	public int updateWarningStatus(MemVO memVO) {
		return this.memMapper.updateWarningStatus(memVO);
	};
	
	/**
	 * 회원 경고 개수 증가
	 */
	@Override
	public int updateWarningCnt(MemVO memVO) {
		return this.memMapper.updateWarningCnt(memVO);
	};
	
	/**
	 * 차단 회원 등록
	 */
	@Override
	public int insertInrtMem(Map<String, String> map) {
		return this.memMapper.insertInrtMem(map);
	};
	
	/**
	 * 차단 회원 등록 삭제
	 */
	@Override
	public int deleteIntrMem(Map<String, String> map) {
		return this.memMapper.deleteIntrMem(map);
	};
	
	/**
	 * 예약 완료
	 */
	@Override
	public List<RsvListVO> rsvList(Map<String, String> map) {
		return this.memMapper.rsvList(map);
	};
	
	/**
	 * 채팅 회원 목록
	 */
	@Override
	public List<MemVO> chatMemList(){
		return this.memMapper.chatMemList();
	};
	
	/**
	 * 전체 회원 엑셀 다운로드
	 */
	@Override
	public List<MemVO> excelList(){
		return this.memMapper.excelList();
	};
	
	/**
	 * 활성 회원수
	 */
	@Override
	public int enableMem() {
		return this.memMapper.enableMem();
	};
	
	/**
	 * 비활성 회원수
	 */
	@Override
	public int disableMem() {
		return this.memMapper.disableMem();
	};
	
	/**
	 * 브론즈 회원수
	 * @return
	 */
	@Override
	public int bronze() {
		return this.memMapper.bronze();
	};
	
	/**
	 * 실버 회원수
	 * @return
	 */
	@Override
	public int silver() {
		return this.memMapper.silver();
	};
	
	
	/**
	 * 골드 회원수
	 * @return
	 */
	@Override
	public int gold() {
		return this.memMapper.gold();
	};
	
	/**
	 * 다이아 회원수
	 * @return
	 */
	@Override
	public int dia() {
		return this.memMapper.dia();
	};
	
	/**
	 * 2차인증
	 */
	@Override
	public int second(Map<String, String> map) {
		return this.memMapper.second(map);
	};
}
