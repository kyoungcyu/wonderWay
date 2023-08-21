package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ChatVO implements Serializable {
/**
 * 시퀀스 자동증가
 * 채팅내용
 * 채팅보낸 시각
 * (채팅방아이디)
 * 보낸사람아이디
 * 받는사람아이디
 * 
 * 현재 소켓 접속자 아이디
 * 
 */
	private int seq;     
	private String chatCntn;
	private String chatDt;  
	private Long chatRmId; //있어야 하나 의문..
	private String sender;
	private String receiver;
	
	
	// 업체채팅방에서 현재 소켓접속자 ID보기 위한 변수
	@JsonProperty("idSet")
	private Set<String> idSet;
	
	
	private String readChat;
	
	public String getReadChat() {
		return readChat;
	}
	public void setReadChat(String readChat) {
		this.readChat = readChat;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getChatCntn() {
		return chatCntn;
	}
	public void setChatCntn(String chatCntn) {
		this.chatCntn = chatCntn;
	}
	public String getChatDt() {
		return chatDt;
	}
	public void setChatDt(String curTime) {
		this.chatDt = curTime;
	}
	public Long getChatRmId() {
		return chatRmId;
	}
	public void setChatRmId(Long chatRmId) {
		this.chatRmId = chatRmId;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public Set<String> getIdSet() {
		return idSet;
	}
	public void setIdSet(Set<String> idSet) {
		this.idSet = idSet;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

}
