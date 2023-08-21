package kr.or.ddit.business.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.MsgVO;


public interface BsMsgMapper {

	public List<MsgVO> recvMsg(Map<String,Object> recvMap);

	public List<MsgVO> sendMsg(Map<String,Object> sendMap);

	public int msgInsert(MsgVO msgVO);

	public int recvTotal(String busiId);

	public int sendTotal(String busiId);

	public String getRecvId(Map<String, String> msgMap);

	public List<String> rsvNmList(String busiId); 
	
}
