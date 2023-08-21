package kr.or.ddit.business.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import kr.or.ddit.vo.BusiVO;

public interface BsEmailService {

	//인증 코드 생성
	public String createKey();

	//메일 내용 작성
	public MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException;

	//메일 발송
	public String sendSimpleMessage(String to) throws Exception;

	//이메일로 아이디 찾기
	public String findIdByEmail(BusiVO busiVO);
	
	//이메일로 비밀번호 재설정
	public int resetPwByEmail(BusiVO busiVO);



}