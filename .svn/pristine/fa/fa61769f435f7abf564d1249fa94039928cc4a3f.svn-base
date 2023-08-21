package kr.or.ddit.member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.MsgVO;


public interface MmMsgMapper {

	public List<MsgVO> recvMsg(Map<String,Object> recvMap);

	public List<MsgVO> sendMsg(Map<String,Object> sendMap);


	public int recvTotal(String memId);

	public int sendTotal(String memId);
	
}
