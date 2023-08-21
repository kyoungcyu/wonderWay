package kr.or.ddit.business.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.business.mapper.BsMsgMapper;
import kr.or.ddit.business.service.BsMsgService;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.MsgVO;

@Service
public class BsMsgServiceImpl implements BsMsgService{
	
	@Autowired
	BsMsgMapper bsMsgMapper;
	

	@Override
	public List<MsgVO> recvMsg(Map<String,Object> recvMap) {
		return this.bsMsgMapper.recvMsg(recvMap);
	}
	@Override
	public List<MsgVO> sendMsg(Map<String,Object> sendMap) {
		return this.bsMsgMapper.sendMsg(sendMap);
	}
	@Override
	public int msgInsert(MsgVO msgVO) {
		return this.bsMsgMapper.msgInsert(msgVO);
	}
	@Override
	public int recvTotal(String busiId) {
		return this.bsMsgMapper.recvTotal(busiId);
	}
	@Override
	public int sendTotal(String busiId) {
		return this.bsMsgMapper.sendTotal(busiId);
	}
	@Override
	public String getRecvId(Map<String, String> msgMap) {
		return this.bsMsgMapper.getRecvId(msgMap);
	}
	@Override
	public List<String> rsvNmList(String busiId) {
		return this.bsMsgMapper.rsvNmList(busiId);
	}

}
