package kr.or.ddit.business.service;

import java.util.List;

import kr.or.ddit.vo.ParkingVO;
import kr.or.ddit.vo.RvwVO;

public interface BsParkingService {

	List<ParkingVO> parkingList(String busiId);

}
