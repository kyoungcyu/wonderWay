package kr.or.ddit.business.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.business.mapper.BsParkingMapper;
import kr.or.ddit.business.mapper.BsRvwMapper;
import kr.or.ddit.business.service.BsParkingService;
import kr.or.ddit.business.service.BsRvwService;
import kr.or.ddit.vo.MsgVO;
import kr.or.ddit.vo.ParkingVO;
import kr.or.ddit.vo.RvwVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BsParkingServiceImpl implements BsParkingService{
   @Autowired
   BsParkingMapper bsParkingMapper;
   
   @Override
	public List<ParkingVO> parkingList(String busiId) {
		return this.bsParkingMapper.parkingList(busiId);
	}
  
}