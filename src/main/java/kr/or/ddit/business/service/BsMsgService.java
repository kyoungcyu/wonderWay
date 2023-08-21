package kr.or.ddit.business.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.MsgVO;

@Service
public interface BsMsgService {

	List<MsgVO> recvMsg(Map<String,Object> recvMap);

	List<MsgVO> sendMsg(Map<String,Object> sendMap);

	int msgInsert(MsgVO msgVO);

	int recvTotal(String busiId);

	int sendTotal(String busiId);

	String getRecvId(Map<String, String> msgMap);

	List<String> rsvNmList(String busiId);


}
