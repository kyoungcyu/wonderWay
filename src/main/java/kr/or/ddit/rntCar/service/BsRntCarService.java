package kr.or.ddit.rntCar.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BsRsvListVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CarVO;
import kr.or.ddit.vo.RsvRntCarVO;

public interface BsRntCarService {

	public List<CarVO> carList(Map<String, String> map);

	public int getTotal(Map<String, String> map);

	public CarVO detailCar(String carNum);

	public int updateCar(CarVO carVO);

	public int addCar(CarVO carVO);

	public String getImgPath(String carNum);

	public int getImg(CarVO carVO);

	public List<RsvRntCarVO> rntRsvList(Map<String, String> map);

	public int carGetTotal(Map<String, String> map);

	public RsvRntCarVO rsvIdDetail(String rsvId);


	public List<RsvRntCarVO> todayRf(Map<String, Object> checkOutMap);

	public List<RsvRntCarVO> todayCar(Map<String, Object> checkInMap);

	public int totalIn(String busiId);

	public int totalOut(String busiId);

	public int checkSt(String rsvId);

	public int checkEd(String rsvId);

	public RsvRntCarVO plusFee(String rsvId);

}
