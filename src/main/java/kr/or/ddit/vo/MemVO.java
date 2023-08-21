package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

//자바빈 클래스
@Data
public class MemVO implements Serializable{
	
	@NotBlank(message="아이디를 입력해주세요")
	private String memId;

	@NotBlank(message="비밀번호를 입력해주세요")
	private String memPw;
	
	@NotBlank(message="이름을 입력해주세요")
	private String memNm;
	
	@NotBlank(message="영문이름을 입력해주세요")
	private String memEnm;
	
	@NotBlank(message="영문성을 입력해주세요")
	private String memFmnm;
	
	@NotBlank(message="성별을 입력해주세요")
	private String memGen;
	
	@Past
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@NotNull(message="생년월일을 입력해주세요")
	private Date memBir;
	
	@NotBlank(message="전화번호를 입력해주세요")
	private String memTel;
	
	@NotBlank(message="이메일을 입력해주세요")
	private String memEmail;
	
	
	
	private String memAddr1;
	private String memAddr2;
	private String mailAgr;
	private int memMlg;
	private String wrnCnt;
	private String wrnSt;
	private String memMbti;
	private String gradId;
	private int enabled;
	private String memImg;
	private Date joinDt;
	private Date whdwlDt;
	private String gubun;
	
	//관리자
	private AdminVO adminVO;
	
	//업체
	private BusiVO busiVO;
	
//--------------------------------------------
	//1 : N
	private List<AuthVO> authVOList;

	//보유쿠폰 리스트 조회
	private List<CupnVO> cupnVOList;
	
//--------------------------------------------
	private MultipartFile[] uploads;
	
	private List<AttachVO> AttachVOList;
	
	
	
}