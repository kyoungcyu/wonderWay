package kr.or.ddit.util.websocket;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.ChatVO;

@Component
public class EchoHandler extends TextWebSocketHandler {
	public static final Logger log = LoggerFactory.getLogger(EchoHandler.class);
	//전체로그인한 회원
	List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	//업체채팅 회원
	List<WebSocketSession> busiChatList = new ArrayList<WebSocketSession>();

	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();

	// afterConnectionEstablished : 웹소켓이 연결되면 호출되는 함수
	// 웹소켓이 연결 되는 것 = 프론트에서 웹소켓이 정확한 경로를 잡아 생성 되는 것
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("EchoHandler 소켓연결 : " + session.toString());
		sessionList.add(session);
		log.info("{}연결됨", session.getId());

	}

	/** EchoHandler for alarm
	 * 
	 * alarmVO
	 *	private String almId;
	 *	private String receiver;
	 *	private String almCntn;
	 *	private String almDt;
	 *	private String sender;
	 *	private String almTt;
     *	private String almUrl;
	 *
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.printf("EchoHandler 소켓메세지 받은. %s로부터 [%s] 받음\n", session.getId(), message.getPayload());
		String recvMsg =  message.getPayload();
		// string으로 받은 메세지 alarmVO로 객체로 변환시키기
		AlarmVO alarmVo = new ObjectMapper().readValue(recvMsg, AlarmVO.class);
		
		// 알람 시간 담기 
		String curTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date());
		alarmVo.setAlmDt(curTime);
		
		// chat을 다시 String으로 바꾸기
		String jsonString = new ObjectMapper().writeValueAsString(alarmVo);
		
		for (WebSocketSession alarmSess : sessionList) {
			alarmSess.sendMessage(new TextMessage(jsonString));
		}
	
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("EchoHandler 소켓닫힘. afterConnectionClosed");
		System.out.printf("EchoHandler %s 연결 끊김\n", session.getId());
		sessionList.remove(session);
	}
}
