<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<title>WONDER WAY</title>

	<!-- Meta Tags -->
	<!-- Dark mode -->
	<script>
		const storedTheme = localStorage.getItem('theme')
 
		const getPreferredTheme = () => {
			if (storedTheme) {
				return storedTheme
			}
			return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
		}

		const setTheme = function (theme) {
			if (theme === 'auto' && window.matchMedia('(prefers-color-scheme: dark)').matches) {
				document.documentElement.setAttribute('data-bs-theme', 'dark')
			} else {
				document.documentElement.setAttribute('data-bs-theme', theme)
			}
		}

		setTheme(getPreferredTheme())

		window.addEventListener('DOMContentLoaded', () => {
		    var el = document.querySelector('.theme-icon-active');
			if(el != 'undefined' && el != null) {
				const showActiveTheme = theme => {
				const activeThemeIcon = document.querySelector('.theme-icon-active use')
				const btnToActive = document.querySelector(`[data-bs-theme-value="${theme}"]`)
				const svgOfActiveBtn = btnToActive.querySelector('.mode-switch use').getAttribute('href')

				document.querySelectorAll('[data-bs-theme-value]').forEach(element => {
					element.classList.remove('active')
				})

				btnToActive.classList.add('active')
				activeThemeIcon.setAttribute('href', svgOfActiveBtn)
			}

			window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
				if (storedTheme !== 'light' || storedTheme !== 'dark') {
					setTheme(getPreferredTheme())
				}
			})

			showActiveTheme(getPreferredTheme())

			document.querySelectorAll('[data-bs-theme-value]')
				.forEach(toggle => {
					toggle.addEventListener('click', () => {
						const theme = toggle.getAttribute('data-bs-theme-value')
						localStorage.setItem('theme', theme)
						setTheme(theme)
						showActiveTheme(theme)
					})
				})

			}
		})
		
	</script>

	<!-- Favicon -->
	<link rel="shortcut icon" href="/resources/booking/favicon.png">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/overlay-scrollbar/css/overlayscrollbars.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/apexcharts/css/apexcharts.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/css/style.css">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	

</head>

<body>

<!-- **************** MAIN CONTENT START **************** -->
<main>
	
	<!-- Sidebar START -->
	<tiles:insertAttribute name="sidebar"/>
	<!-- Sidebar END -->
	
	<!-- Page content START -->
	<div class="page-content">
	
		<!-- Top bar START -->
		<tiles:insertAttribute name="topbar"/>
		<!-- Top bar END -->
	
		<!-- Page main content START -->
		<tiles:insertAttribute name="body"/>
		<!-- Page main content END -->
	</div>
	<!-- Page content END -->
	
	</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- Bootstrap JS -->
<script src="/resources/booking/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendor -->
<script src="/resources/booking/assets/vendor/overlay-scrollbar/js/overlayscrollbars.min.js"></script>
<script src="/resources/booking/assets/vendor/apexcharts/js/apexcharts.min.js"></script>

<!-- ThemeFunctions -->
<script src="/resources/booking/assets/js/functions.js"></script>

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

</body>
</html>