package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.MsgVO;

@Service
public interface MmMsgService {

	List<MsgVO> recvMsg(Map<String,Object> recvMap);

	List<MsgVO> sendMsg(Map<String,Object> sendMap);

	int recvTotal(String memId);

	int sendTotal(String memId);

}
