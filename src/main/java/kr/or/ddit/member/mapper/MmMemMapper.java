package kr.or.ddit.member.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemVO;

public interface MmMemMapper {
	//회원가입시 정보 입력
	//<insert id="registerMem" parameterType="memVO">
	public int registerMem(MemVO memVO);
	
	//아이디 중복 검사
	//<select id="checkMemId" parameterType="memVO" resultType="int">
	public int checkMemId(MemVO memVO);
	
	//이메일중복 검사
	//<select id="checkMemEmail" parameterType="memVO" resultType="int">
	public int checkMemEmail(MemVO memVO);
	
	//이메일로 아이디 찾기
	//<select id="checkIdByEmail" parameterType="memVO" resultType="String">
	public String findIdByEmail(MemVO memVO);
	
	//이메일로 비밀번호 재설정
	//<select id="resetPwByEmail" parameterType="memVO">
	public int resetPwByEmail(MemVO memVO);
	
	//로그인
	//<select id="signIn" parameterType="memVO" resultMap="memMap">
	//public MemVO signIn(MemVO memVO);
	
	//회원, 업체, 관리자 다 같이 쓰는 로그인
	//<select id="detailMem" parameterType="memVO" resultType="memVO">
	public MemVO detailMem(MemVO memVO);
	//회원정보 가져오기
	public MemVO userDetail(String memId);
	
	//예약시 로그인한 회원정보 가져오기
	//<select id="getMemInfo" parameterType="String" resultType="memVO">
	public MemVO getMemInfo(String memId);

}







