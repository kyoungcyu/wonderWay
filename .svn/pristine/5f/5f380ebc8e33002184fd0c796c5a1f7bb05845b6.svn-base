<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
<head>
<title>사장님과의 채팅</title>


<style type="text/css">
.basket {
	height: 500px;
	width: 50%;
	margin: 0 auto;
}
#txt{
	text-align: center;
}

.chat_wrap {
	height: 500px;
}

.chat_wrap .header {
	font-size: 14px;
	padding: 15px 0;
	background: #81DAF5;
	color: white;
	text-align: center;
}

.chat_wrap .chat {
	padding-bottom: 80px;
	width: auto;
	height: 330px;
	overflow: auto;
}

.chat_wrap .chat ul {
	width: 100%;
	list-style: none;
}

.chat_wrap .chat ul li {
	width: 100%;
}

.chat_wrap .chat ul li.left {
	text-align: left;
}

.chat_wrap .chat ul li.right {
	text-align: right;
}

.chat_wrap .chat ul li>div {
	font-size: 13px;
}

.chat_wrap .chat ul li>div.sender {
	margin: 10px 20px 0 20px;
	font-weight: bold;
}

.chat_wrap .chat ul li>div.message {
	display: inline-block;
	word-break: break-all;
	margin: 5px 20px;
	max-width: 75%;
	border: 1px solid #888;
	padding: 10px;
	border-radius: 5px;
	background-color: #FCFCFC;
	color: #555;
	text-align: left;
}

.chat_wrap .input-div {
	bottom: 0;
	width: 100%;
	background-color: #FFF;
	text-align: center;
	border-top: 1px solid #81DAF5;
}

.chat_wrap .input-div>textarea {
	width: 100%;
	height: 80px;
	border: none;
	padding: 10px;
	float: left;
	border-top: 1px solid #F18C7E;
}

.format {
	display: none;
}
</style>
</head>
<body>
	<!--  이쁘게 저장  -->
	<h1 id="txt" class="mb-2">
		<span class="position-relative z-index-9">Chatting <!-- SVG START -->
			<span
			class="position-absolute top-50 start-50 translate-middle z-index-n1 d-none d-sm-block">
				<svg width="203.94px" height="54.13px" viewBox="0 0 203.94 54.13">
							 <path class="fill-primary opacity-7"
						d="M126.49,49.51c19.28,0.32,33.97,0.06,48.55-2.07c5.25-0.77,10.43-2.14,15.54-3.6c2.26-0.64,4.43-1.95,6.35-3.36 c3.16-2.32,3.37-4.88,0.61-7.62c-1.84-1.82-3.96-3.42-6.16-4.8c-5.74-3.6-12.04-6.02-18.4-8.28c-15.69-5.58-31.86-9.17-48.29-11.7 c-18.65-2.87-37.4-4.07-56.26-3.51C54.54,5,40.71,6.16,26.99,8.39C19.25,9.65,11.5,10.9,3.76,12.15c-0.1,0.02-0.2,0.04-0.3,0.05 c-2.03,0.27-3.23-0.26-3.44-1.51c-0.2-1.22,0.72-2.05,2.84-2.45c13.24-2.51,26.48-5.11,39.9-6.43c14.43-1.42,28.9-2.13,43.42-1.67 c24.63,0.78,48.89,4.14,72.7,10.58c9.42,2.55,18.73,5.54,27.54,9.77c4.06,1.95,7.9,4.39,11.66,6.88c1.63,1.08,3.02,2.69,4.15,4.32 c2.53,3.63,2.27,7.63-0.89,10.71c-1.84,1.79-4.08,3.29-6.38,4.45c-5.44,2.75-11.4,3.91-17.38,4.77c-19.2,2.75-38.5,2.96-57.84,1.98 c-7.84-0.4-15.68-0.74-23.5-1.34c-10.13-0.77-20.26-1.58-30.36-2.72c-9.49-1.07-18.96-2.38-28.37-4.01 C32.2,44.6,26.97,43,21.81,41.34c-2.44-0.78-4.81-2.13-6.86-3.69c-4.56-3.49-4.8-8.3-0.9-12.54c2.3-2.5,5.23-4.07,8.3-5.36 c6.9-2.91,14.13-4.64,21.46-5.97c10.14-1.84,20.37-2.47,30.66-1.92c2.57,0.14,3.72,0.84,3.6,2.22c-0.11,1.26-1.19,1.84-3.6,1.92 c-6.13,0.21-12.28,0.2-18.4,0.67c-10.47,0.82-20.72,2.87-30.56,6.62c-2.23,0.85-4.45,1.95-6.4,3.31c-4.53,3.16-4.36,6.27,0.46,8.87 c2.28,1.23,4.75,2.19,7.24,2.97c7.8,2.44,15.84,3.88,23.93,4.79c15.4,1.73,30.8,3.38,46.24,4.67 C108.32,48.84,119.7,49.15,126.49,49.51z"></path>
							</svg>
		</span> <!-- SVG END -->
		</span>
		
		<a href="javascript:history.go(-1);" class="btn btn-primary-soft mb-0">이전으로 돌아가기</a>
	</h1>
	<div class="basket">
		<div class="chat_wrap">
			<div class="header">"${busiNm}"</div>
			<div class="chat">
				<ul>
					<!-- 동적 생성 -->
				</ul>
			</div>
			<div class="input-div">
				<textarea placeholder="Press Enter for send message."></textarea>
			</div>

			<!-- format -->

			<div class="chat format">
				<ul>
					<li>
						<div class="sender">
							<span></span>
						</div>
						<div class="message">
							<span></span>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//현재 시간 가져오기
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var dateString = year + '-' + month + '-' + day;

		var hours = ('0' + today.getHours()).slice(-2);
		var minutes = ('0' + today.getMinutes()).slice(-2);
		var seconds = ('0' + today.getSeconds()).slice(-2);
		var timeString = hours + ':' + minutes + ':' + seconds;

		var totalTime = dateString + timeString
		console.log(totalTime);
		var currChatRm = "${busiNm}";
		
		
		
		const Chat = (function() {
			const myName = "${memVO.memNm}";

			// 채팅용 웹소켓 열기
			var sockChat = new SockJS("/chat");
			socketChat = sockChat;

			socketChat.onopen = function() {
				loginMsg();
			};

			//**서버로부터 메세지를 받았을 때 **
			socketChat.onmessage = function(event) {
				console.log("chatHandler에서 받은 메세지이이  : " + event.data);
				var chatVO = JSON.parse(event.data);

				if (chatVO.idSet !== null) {
					var currIn = Array.from(chatVO.idSet);
				}

				console.log("chatVO.sender" + chatVO.sender);
				console.log("chatVO.receiver" + chatVO.receiver);
				console.log("chatVO.idSet: " + chatVO.idSet);
				console.log("chatVO.chatCntn" + chatVO.chatCntn);
				console.log("chatVO.chatDt" + chatVO.chatDt);

				//1. 채팅 화면에 보이기
				receiveChat(chatVO);
			}

			$("#goback").on("click", function() {
				let msg = {
					"sender" : "${memVO.memNm}",
					"receiver" : "OUT",
					"chatCntn" : "${memVO.memNm} 님이 퇴장하셨습니다.",
					"chatDt" : totalTime
				}
				socketChat.send(JSON.stringify(msg));
				// 채팅용 웹소켓 초기화
				socketChat.close();
				socketChat = null;

				//
				history.go(-1);
			});

			// init 함수
			function init() {
				// enter 키 이벤트
				$(document).on('keydown', 'div.input-div textarea',
						function(e) {
							if (e.keyCode == 13 && !e.shiftKey) {
								e.preventDefault();
								const message = $(this).val();

								// 메시지 전송
								sendMessage(message);
								// 입력창 clear
								clearTextarea();
							}
						});
			}

			// 메세지 태그 생성
			function createMessageTag(LR_className, senderName, message) {
				// 형식 가져오기
				let chatLi = $('div.chat.format ul li').clone();

				// 값 채우기
				chatLi.addClass(LR_className);
				chatLi.find('.sender span').text(senderName);
				chatLi.find('.message span').text(message);

				return chatLi;
			}

			// 메세지 태그 append
			function appendMessageTag(LR_className, senderName, message) {
				const chatLi = createMessageTag(LR_className, senderName,
						message);

				$('div.chat:not(.format) ul').append(chatLi);

				// 스크롤바 아래 고정
				$('div.chat').scrollTop($('div.chat').prop('scrollHeight'));
			}

			// 메세지 전송
			function sendMessage(message) {
				console.log("sendMessage receiver : '" + currChatRm + "'");
				// 서버에 전송하는 코드로 후에 대체
				const sendData = {
					"sender" : "${memVO.memNm}",
					"receiver" : currChatRm,
					"chatCntn" : message,
					"chatDt" : totalTime
				};
				socketChat.send(JSON.stringify(sendData));
				console.log("gg"+JSON.stringify(sendData));
			}

			// 메세지 입력박스 내용 지우기
			function clearTextarea() {
				$('div.input-div textarea').val('');
			}

			// 메세지 수신
			function receiveChat(chatVO) {
				console.log("chatVO.sender receiveChat()::" + chatVO.sender);
				console.log("currChatRm receiveChat()::" + currChatRm);
				const LR = (chatVO.sender == myName) ? "right"
						: (chatVO.receiver == myName && chatVO.sender === currChatRm) ? "left"
								: "";

				if (LR === "right") {
					appendMessageTag(LR, chatVO.sender, chatVO.chatCntn);
				} else if (LR === "left") {
					appendMessageTag(LR, chatVO.sender, chatVO.chatCntn);
				}
			}

			//로그인 메세지 발송
			function loginMsg() {

				let msg = {
					"sender" : "${memVO.memNm}",
					"receiver" : "IN",
					"chatCntn" : "${memVO.memNm}님이 입장하셨습니다.",
					"chatDt" : totalTime
				}
				socketChat.send(JSON.stringify(msg));
			}

			return {
				'init' : init
			};

		})();

		$(function() {
			Chat.init();

		});
	</script>


</body>
</html>
