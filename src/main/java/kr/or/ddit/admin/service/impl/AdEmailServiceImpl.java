package kr.or.ddit.admin.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.mapper.AdBrdMapper;
import kr.or.ddit.admin.mapper.AdMemMapper;
import kr.or.ddit.admin.service.AdBrdService;
import kr.or.ddit.admin.service.AdEmailService;
import kr.or.ddit.admin.service.AdMemService;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.MemVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdEmailServiceImpl implements AdEmailService{
	@Autowired
	private JavaMailSender javaMailSender;
	
	
	@Override
	public String sendEmail(String to, String subject, String text) {
	    try {
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(to);
	        message.setSubject(subject);
	        message.setText(text);

	        javaMailSender.send(message);
	        return "success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "fail";
	    }
	}

}
