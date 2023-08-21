package kr.or.ddit.business.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.business.mapper.BsRvwMapper;
import kr.or.ddit.business.service.BsRvwService;
import kr.or.ddit.vo.MsgVO;
import kr.or.ddit.vo.RvwVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BsRvwServiceImpl implements BsRvwService{
   @Autowired
   BsRvwMapper bsRvwMapper;
   
   @Override
	public List<RvwVO> selectRvw(Map<String, Object> reviewMap) {
		return this.bsRvwMapper.selectRvw(reviewMap);
	}

   @Override
   public List<RvwVO> selectBlind(Map<String, Object> reviewMap) {
	   return this.bsRvwMapper.selectBlind(reviewMap);
   }
   @Override
   public List<RvwVO> selectNoCmt(Map<String, Object> reviewMap) {
	   return this.bsRvwMapper.selectNoCmt(reviewMap);
   }
   
   
   
   
   
   
   @Override
   public String totalRvw(String busiId) {
	   return this.bsRvwMapper.totalRvw(busiId);
   }
   
   @Override
   public String totalCmt(String busiId) {
	   return this.bsRvwMapper.totalCmt(busiId);
   }
   
   @Override
   public String totalBlind(String busiId) {
	   return this.bsRvwMapper.totalBlind(busiId);
   }
   
   @Override
   public String averageStar(String busiId) {
	   return this.bsRvwMapper.averageStar(busiId);
   }
   
   @Override
   public int updateBlind(String rsvId) {
	   return this.bsRvwMapper.updateBlind(rsvId);
   }
   
   @Override
   public int deleteBlind(String rsvId) {
	   return this.bsRvwMapper.deleteBlind(rsvId);
   }
   
   @Override
   public int insertCmt(RvwVO rvwVO) {
	   return this.bsRvwMapper.insertCmt(rvwVO);
   }
   
   
   
   
}