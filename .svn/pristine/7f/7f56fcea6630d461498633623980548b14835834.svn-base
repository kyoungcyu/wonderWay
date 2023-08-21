<%@page import="java.security.Principal"%>
<%@page import="kr.or.ddit.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />
</sec:authorize>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
var socketAlm = null;

$(document).ready(function() {
	// 웹소켓 연결
	var sock = new SockJS("/echo");
	socketAlm = sock;

	socketAlm.onmessage = function(event) {
		console.log("EchoHandler에서 받은 메세지: " + event.data);
		var alarmVO = JSON.parse(event.data);
		
		// busiId 값을 확인하여 실행 여부 결정
		var adminId = "${user_id}";
	    if (alarmVO.receiver === adminId) {

			// alarmContainer 요소 가져오기
			var alarmContainer = document.getElementById("alarmContainer");

			// div 요소 생성
			var newDiv = document.createElement("div");
			newDiv.className = "alarmDiv";
			newDiv.textContent = alarmVO.almTt;

			// alarmContainer에 생성한 div 추가
			alarmContainer.appendChild(newDiv);

			// 3초 후에 div 요소 제거
			setTimeout(function() {
				newDiv.remove();
			}, 3000);
	    }
		
		$.ajax({
			url : "/alarm/insertAjax",
			type : "post",
			data : JSON.stringify(alarmVO), // alarmVO를 JSON으로 변환하여 전달
			dataType : "json",
			contentType : 'application/json; charset=utf-8',
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}")
			},
			success : function(result) {
				var cnt = result;
				console.log(result);

				if (cnt >= 1) {
					console.log("알림이 성공적으로 데이터베이스에 저장되었습니다.");
				}
			},
			error : function(xhr, status, error) {
				console.log("AJAX 요청 중 오류 발생:");
				console.log("상태 코드: " + xhr.status);
				console.log("오류 메시지: " + error);
			}
		});
	};
});

function executeAjax() {
	param = {"a":"A"};
	$.ajax({
		url : "/alarm/adminSelectAlarmAjax",
		type : "post",
		data: JSON.stringify(param),
		dataType: "json",
		contentType: 'application/json; charset=utf-8',
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
		},
		success: function(result) {
		    var listAlm = result;

		    // ul 요소를 선택합니다. 해당 ul 요소의 ID나 클래스에 맞게 변경해주세요.
		    var ulElement = document.getElementsByClassName("list-group list-group-flush list-unstyled p-2");

		    // ul 요소의 자식 요소를 모두 제거합니다.
		    while (ulElement[0].firstChild) {
		        ulElement[0].removeChild(ulElement[0].firstChild);
		    }

		    if (listAlm.length == 0) {
		        // 새로운 알림이 없는 경우 default li 요소를 생성하여 추가합니다.
		        var defaultLiElement = document.createElement("li");
		        defaultLiElement.id = "default";
		        defaultLiElement.textContent = "새로운 알림이 없습니다.";
		        ulElement[0].appendChild(defaultLiElement);
		        document.getElementById("alarmNumber").innerHTML = listAlm.length;
		        
		        //id=badgeBlink hidden 추가
		        document.getElementById("badgeBlink").setAttribute("hidden", "hidden");
		        
		    } else {
		        // listAlm 배열을 순회하며 li 요소를 생성합니다.
		        listAlm.forEach(function(data) {
		            // li 요소 생성
		            var liElement = document.createElement("li");

		            // a 요소 생성
		            var aElement = document.createElement("a");
		            aElement.href = data.almUrl;
		            aElement.className = "list-group-item list-group-item-action rounded notif-unread border-0 mb-1 p-3";

		            // h6 요소 생성
		            var h6Element = document.createElement("h6");
		            h6Element.className = "mb-2";
		            h6Element.textContent = data.almTt;

		            // p 요소 생성
		            var pElement = document.createElement("p");
		            pElement.className = "mb-0 small";
		            pElement.textContent = data.almCntn;

		            // span 요소 생성
		            var spanElement = document.createElement("span");
		            spanElement.textContent = data.almDt;
		            // 폰트 크기 조정
		            spanElement.style.fontSize = "0.8em";
		            // 투명도(Opacity) 추가
		            spanElement.style.opacity = "0.5";

		            // a 요소에 h6, p, span 요소를 자식으로 추가합니다.
		            aElement.appendChild(h6Element);
		            aElement.appendChild(pElement);
		            aElement.appendChild(spanElement);

		            // li 요소에 a 요소를 자식으로 추가합니다.
		            liElement.appendChild(aElement);

		            // ul 요소에 li 요소를 자식으로 추가합니다.
		            ulElement[0].appendChild(liElement);
			        document.getElementById("alarmNumber").innerHTML = listAlm.length;
			        
			        //id=badgeBlink에 hidden 제거
			        document.getElementById("badgeBlink").removeAttribute("hidden");
		        });
		        
		    }

		    var spanElement = document.createElement("span");
		    spanElement.className = "badge bg-danger bg-opacity-10 text-danger ms-2";
		    spanElement.innerHTML = listAlm.length;
		},
		error : function(xhr, status, error) {
			console.log("AJAX 요청 중 오류 발생:");
			console.log("상태 코드: " + xhr.status);
			console.log("오류 메시지: " + error);
			
		}
	});
}

//	executeAjax();
//setInterval(executeAjax, 2000); // 2초마다 executeAjax 함수 실행

function fn_deleteAll(){
	param = {"a":"A"};
	$.ajax({
		url : "/alarm/adminDeleteAlarmAjax",
		type : "post",
		data : JSON.stringify(param), // alarmVO를 JSON으로 변환하여 전달
		dataType : "json",
		contentType : 'application/json; charset=utf-8',
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
		},
		success : function(result) {
			var cnt = result;
			console.log(result);

			if (cnt >= 1) {
				console.log("알림이 성공적으로 데이터베이스레서 삭제되었습니다.");
				executeAjax();
			}
		},
		error : function(xhr, status, error) {
			console.log("AJAX 요청 중 오류 발생:");
			console.log("상태 코드: " + xhr.status);
			console.log("오류 메시지: " + error);
		}
	});
	
	
}
</script>