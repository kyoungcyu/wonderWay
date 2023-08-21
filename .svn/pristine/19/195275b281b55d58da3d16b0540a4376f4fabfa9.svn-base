package kr.or.ddit.util.websocket.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.util.websocket.mapper.WsMapper;
import kr.or.ddit.util.websocket.service.WsService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.ChatRmVO;
import kr.or.ddit.vo.ChatVO;
import lombok.extern.slf4j.Slf4j;

@Service
public class WsServiceImpl implements WsService {
	
	@Autowired
	WsMapper wsMapper;
	
	@Override
	public int insertChat(ChatVO chatVO) {
		System.out.println("WsServiceImpl : "+chatVO);
		return this.wsMapper.insertChat(chatVO);
	}
	
//	<insert id="insertAlarm" parameterType="java.kr.or.ddit.vo.AlarmVO">
	@Override
	public int insertAlarm(AlarmVO alarmVO) {
		System.out.println("WsServiceImpl : "+alarmVO);
		return this.wsMapper.insertAlarm(alarmVO);
	}
	
//	<select id="selectAllAlarms" parameterType="String" resultType="kr.or.ddit.vo.AlarmVO">
	@Override
	public List<AlarmVO> selectAllAlarms(String receiver) {
		System.out.println("WsServiceImpl : "+receiver);
		return this.wsMapper.selectAllAlarms(receiver);
	}
	
	@Override
	public int deleteAllAlarms(String receiver) {
		System.out.println("WsServiceImpl : "+receiver);
		return this.wsMapper.deleteAllAlarms(receiver);
	}
	
	//채팅방 중복 확인
	@Override
	public Long checkchatRm(ChatRmVO chatRmVO) {
		return this.wsMapper.checkchatRm(chatRmVO);
	};
	
	//채팅방 만들기
	@Override
	public int createChRmId(ChatRmVO chatRmVO) {
		return this.wsMapper.createChRmId(chatRmVO);
	};
	
	//관리자 -> 회원 채팅방 목록
	@Override
	public List<ChatRmVO> chatRmMemList(ChatRmVO chatRmVO){
		return this.wsMapper.chatRmMemList(chatRmVO);
	};
	
	//회원 -> 관리자 채팅방 목록
	@Override
	public List<ChatRmVO> chatRmMemAdList(ChatRmVO chatRmVO){
		return this.wsMapper.chatRmMemAdList(chatRmVO);
	};
	
	//대화 내역
	@Override
	public List<ChatVO> inMemTheChat(Long chatRmId){
		return this.wsMapper.inMemTheChat(chatRmId);
	};
	
	//권한 확인
	@Override
	public String checkAuth(String id) {
		return this.wsMapper.checkAuth(id);
	};
}
