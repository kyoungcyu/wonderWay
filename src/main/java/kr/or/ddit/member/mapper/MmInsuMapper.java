package kr.or.ddit.member.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CarVO;
import kr.or.ddit.vo.InsuDetailVO;
import kr.or.ddit.vo.InsuVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.RvwVO;

public interface MmInsuMapper {
	
	//<!-- 여행자보험 검색 -->
	//<select id="searchInsu" parameterType="hashMap" resultMap="insuVO">
	public List<InsuVO> searchInsu(HashMap<String, Object> map);
	
	
	//<!-- 보험 정보-->
	//<select id="getInsuVO" parameterType="String" resultType="insuVO">
	public InsuVO getInsuVO(String insuId);

	
	//<!-- 보험 상세 디테일 -->
	//<select id="detailInsu" parameterType="String" resultType="insuDetailVO">
	public List<InsuDetailVO> detailInsu(String insuId);


	//<!-- 보험 가입  -->
	//<select id="getInsuDetVO" parameterType="String" resultType="insuDetailVO">
	public InsuDetailVO getInsuDeVO(String prodId);
}







