package kr.or.ddit.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.member.mapper.MmMemMapper;
import kr.or.ddit.vo.MemVO;
import lombok.extern.slf4j.Slf4j;

//UserDetailsService : 스프링 시큐리티에서 제공해주는 사용자 상세 정보를 갖고 있는 인터페이스
@Slf4j
@Service
public class CustomUserDetailsService implements UserDetailsService{
	//DI(Dependency Injection) 의존성 주입
	@Autowired
	private MmMemMapper mmMemMapper;
	
	//username : 로그인페이지에서 로그인 시도 시 입력된 아이디
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//1) 사용자 정보를 검색해서
		//username : 로그인페이지에서 로그인 시도 시 입력된 아이디
		MemVO memVO = new MemVO();
		memVO.setMemId(username);
		memVO = mmMemMapper.detailMem(memVO); //업체, 회원, 관리자 모두 한번에 관리 가능한 쿼리.(vw_login_all 뷰 와 auth 조인테이블)
		log.info("memVO : " + memVO);
		
		//CustomUser : 사용자 정의 유저 정보, extends User를 상속받고 있음
		//2) 스프링 시큐리티의 User 객체의 정보를 넣어줌 => 스프링이 이제부터 해당 유저를 관리
		//User : 스프링 시큐리티에서 제공해주는 사용자 정보 클래스
		
		return memVO == null? null : new CustomUser(memVO);
	}
	

}
