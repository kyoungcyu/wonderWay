package kr.or.ddit.business.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.business.mapper.BsStatisMapper;
import kr.or.ddit.business.service.BsStatisService;
import kr.or.ddit.vo.CalculVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BsStatisServiceImpl implements BsStatisService{
   @Autowired
   BsStatisMapper bsStatisMapper;
   
   //1. 방예약 선호도 (방, 예약건수)
   @Override
	public List<Map<String, String>> rsvRm(Map<String, String> statisMap) {
		return this.bsStatisMapper.rsvRm(statisMap);
	}
   //2. 날짜별 찜 수(날짜, 예약건수)
   @Override
   public List<Map<String, String>> wishDate(Map<String, String> statisMap) {
	   return this.bsStatisMapper.wishDate(statisMap);
   }
   //2. 날짜별 예약 추이(날짜, 예약건수)
   @Override
   public List<Map<String, String>> rsvDate(Map<String, String> statisMap) {
	   return this.bsStatisMapper.rsvDate(statisMap);
   }
   //3-1. 여성의 연령대별 예약건수 (연령대+성별, 예약건수)
   @Override
   public List<Map<String, String>> rsvFemale(Map<String, String> statisMap) {
	   return this.bsStatisMapper.rsvFemale(statisMap);
   }
   //3-2. 남성의 연령대별 예약건수 (연령대+성별, 예약건수)
   @Override
   public List<Map<String, String>> rsvMale(Map<String, String> statisMap) {
	   return this.bsStatisMapper.rsvMale(statisMap);
   }
   //4. 많이 예약한 MBTI (MBTI, 예약건수)
   @Override
   public List<Map<String, String>> rsvMbti(Map<String, String> statisMap) {
	   return this.bsStatisMapper.rsvMbti(statisMap);
   }
   
   
}