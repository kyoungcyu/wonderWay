package kr.or.ddit.member.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.ddit.member.mapper.MmMemMapper;
import kr.or.ddit.member.service.MmMemService;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.MemVO;
import lombok.extern.slf4j.Slf4j;

//골뱅이Service 애너테이션 : 스프링이 자바빈으로 등록하여 관리
@Slf4j
@Service
public class MmMemServiceImpl implements MmMemService {
	
	@Inject
	MmMemMapper mmMemMapper;
	
	
	//회원 가입
	@Transactional
	@Override
	public int registerMem(MemVO memVO) {
		//MEMBER테이블에 insert
		int result = this.mmMemMapper.registerMem(memVO);
		
		log.info("result : " + result);
		
		return result;
	}
	
	//아이디 중복 검사
	@Override
	public int checkMemId(MemVO memVO) {
		return this.mmMemMapper.checkMemId(memVO);
	}

	//이메일 중복 검사
	@Override
	public int checkMemEmail(MemVO memVO) {
		return this.mmMemMapper.checkMemEmail(memVO);
	}
	//회원정보
	@Override
	public MemVO userDetail(String memId) {
		return this.mmMemMapper.userDetail(memId);
	}
	
	
	
	
}










