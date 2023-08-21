package kr.or.ddit.util.websocket.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.ChatRmVO;
import kr.or.ddit.vo.ChatVO;

public interface WsMapper {

	public int insertChat(ChatVO chatVO);

	public int insertAlarm(AlarmVO alarmVO);

	public List<AlarmVO> selectAllAlarms(String receiver);

	public int deleteAllAlarms(String receiver);
	
	//채팅방 중복 확인
	public Long checkchatRm(ChatRmVO chatRmVO);
	
	//채팅방 만들기
	public int createChRmId(ChatRmVO chatRmVO);
	
	//관리자 -> 회원 채팅방 목록
	public List<ChatRmVO> chatRmMemList(ChatRmVO chatRmVO);
	
	//회원 -> 관리자 채팅방 목록
	public List<ChatRmVO> chatRmMemAdList(ChatRmVO chatRmVO);
	
	//대화 내역
	public List<ChatVO> inMemTheChat(Long chatRmId);
	
	//권한 확인
	public String checkAuth(String id);
}
