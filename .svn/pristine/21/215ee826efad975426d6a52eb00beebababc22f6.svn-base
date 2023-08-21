package kr.or.ddit.member.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.member.mapper.MmMsgMapper;
import kr.or.ddit.member.service.MmMsgService;
import kr.or.ddit.vo.MsgVO;

@Service
public class MmMsgServiceImpl implements MmMsgService{
	
	@Autowired
	MmMsgMapper mmMsgMapper;
	

	@Override
	public List<MsgVO> recvMsg(Map<String,Object> recvMap) {
		return this.mmMsgMapper.recvMsg(recvMap);
	}
	@Override
	public List<MsgVO> sendMsg(Map<String,Object> sendMap) {
		return this.mmMsgMapper.sendMsg(sendMap);
	}
	
	@Override
	public int recvTotal(String memId) {
		return this.mmMsgMapper.recvTotal(memId);
	}
	@Override
	public int sendTotal(String memId) {
		return this.mmMsgMapper.sendTotal(memId);
	}

}
