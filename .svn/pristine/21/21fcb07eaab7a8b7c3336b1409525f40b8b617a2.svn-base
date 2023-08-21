package kr.or.ddit.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.vo.MemVO;

//사용자가 유저를 정의함
//MemberVO(사용자가 정의한 유저 및 권한) 정보를 User(스프링 시큐리티에서 정의된 유저) 객체 정보에 연계하여 넣어줌
public class CustomUser extends User{
	//jsp에서 principal.memVO
	private MemVO memVO;

	//User의 생성자를 처리해주는 생성자
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	//return memVO == null? null : new CustomUser(memVO);
	public CustomUser(MemVO memVO) {
		//사용자가 정의한(select한) MemVO 타입의 객체 memVO를
		//스프링 시큐리티에서 제공해주고 있는 User타입으로 변환
		//회원정보를 보내줄테니 이제부터 스프링이 관리해줘
		
		//Collection<? extends GrantedAuthority> authorities
		super(memVO.getMemId(), memVO.getMemPw(), memVO.getAuthVOList().stream()
			    .map(auth -> new SimpleGrantedAuthority(auth.getMemAuth()))
			    .collect(Collectors.toList()));
		
		//CustomUser 클래스의 memVO 멤버 변수에 select 한 회원/권한 정보(memVO 매개변수)가 setting됨
		//this.memVO는 jsp에서 principal로 사용될 것임
		this.memVO = memVO;
		
	}

	public MemVO getMemVO() {
		return memVO;
	}

	public void setMemVO(MemVO memVO) {
		this.memVO = memVO;
	}
}


