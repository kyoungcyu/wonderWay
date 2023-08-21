package kr.or.ddit.util.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.HandshakeInterceptor;

//WebSocketConfig.java 에서 EnabledWebSocket 어노테이션, setAloowedOrigins, withSockJS 옵션 확인

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer{
	@Autowired
	private EchoHandler echoHandler;
	@Autowired
	private ChatHandler chatHandler;
	@Autowired
	private AdminMemChatHandler adminMemChatHandler;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(echoHandler, "/echo").setAllowedOrigins("*").withSockJS();
		registry.addHandler(chatHandler, "/chat").setAllowedOrigins("*").withSockJS();
		registry.addHandler(adminMemChatHandler, "/adminMemChat").setAllowedOrigins("*").withSockJS();
	}
	
}