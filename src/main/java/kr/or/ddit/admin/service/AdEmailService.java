package kr.or.ddit.admin.service;

public interface AdEmailService {

	//메일 발송
	public String sendEmail(String to, String subject, String text);

}
