<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
<head>
	<title>Wonderway-숙소</title>
	
	
<script type="text/javascript">
$(function() {
		flatpickr(".flatpickr", {
			minDate: "today",
			local: "ko"
		})
	
////////////////////////음성 인식 시작////////////////////////////////////
	const searchConsole = document.getElementById("search_console");
	
	window.addEventListener("load", availabilityFunc);
	availabilityFunc() 



	
});


function availabilityFunc() {
	const searchConsole = document.getElementById("search_console");

	 //현재 SpeechRecognition을 지원하는 크롬 버전과 webkit 형태로 제공되는 버전이 있으므로 둘 중 해당하는 생성자를 호출한다.
	  recognition = new webkitSpeechRecognition() || new SpeechRecognition();
	  recognition.lang = "ko"; // 음성인식에 사용되고 반환될 언어를 설정한다.
	  recognition.maxAlternatives = 5; //음성 인식결과를 5개 까지 보여준다.
	
	  if (!recognition) {
	    alert("현재 브라우저는 사용이 불가능합니다.");
	  }
	}

	// --- 음성녹음을 실행하는 함수
	function startRecord() {
		const searchConsole = document.getElementById("search_console");

	  console.log("시작");
	
	  // ⏺️클릭 시 음성인식을 시작한다.
	  recognition.addEventListener("speechstart", () => {
	    console.log("인식");
	  });
	
	  //음성인식이 끝까지 이루어지면 중단된다.
	  recognition.addEventListener("speechend", () => {
	    console.log("인식2");
	  });
	
	  //음성인식 결과를 반환
	  // SpeechRecognitionResult 에 담겨서 반환된다.
	  recognition.addEventListener("result", (e) => {
	    searchConsole.value = e.results[0][0].transcript;
	  });
	
	  recognition.start();
	}
	//  🛑 클릭 시 종료(안 눌러도 음성인식은 알아서 종료됨)
	function endRecord() {
	  console.log("종료");
	  recognition.stop(); // 음성인식을 중단하고 중단까지의 결과를 반환
	}

</script>
</head>
<body>
<main>	

<!-- =======================
Main Banner START -->
<section class="pt-0 pt-lg-2">
	<div class="container">
			<!-- Content and Image START -->
			<div class="row g-4 g-lg-5">
				<!-- Content -->
				<div class="col-lg-6 position-relative mb-4 mb-md-0">
					<!-- Title -->
					<h3 class="mb-4 mt-md-5 display-6">숙소 검색
						<span class="position-relative z-index-9">
							<!-- SVG START -->
							<span class="position-absolute top-50 start-50 translate-middle z-index-n1 d-none d-md-block mt-4">
								<svg width="390.5px" height="21.5px" viewBox="0 0 445.5 21.5">
									<path class="fill-primary opacity-7" d="M409.9,2.6c-9.7-0.6-19.5-1-29.2-1.5c-3.2-0.2-6.4-0.2-9.7-0.3c-7-0.2-14-0.4-20.9-0.5 c-3.9-0.1-7.8-0.2-11.7-0.3c-1.1,0-2.3,0-3.4,0c-2.5,0-5.1,0-7.6,0c-11.5,0-23,0-34.5,0c-2.7,0-5.5,0.1-8.2,0.1 c-6.8,0.1-13.6,0.2-20.3,0.3c-7.7,0.1-15.3,0.1-23,0.3c-12.4,0.3-24.8,0.6-37.1,0.9c-7.2,0.2-14.3,0.3-21.5,0.6 c-12.3,0.5-24.7,1-37,1.5c-6.7,0.3-13.5,0.5-20.2,0.9C112.7,5.3,99.9,6,87.1,6.7C80.3,7.1,73.5,7.4,66.7,8 C54,9.1,41.3,10.1,28.5,11.2c-2.7,0.2-5.5,0.5-8.2,0.7c-5.5,0.5-11,1.2-16.4,1.8c-0.3,0-0.7,0.1-1,0.1c-0.7,0.2-1.2,0.5-1.7,1 C0.4,15.6,0,16.6,0,17.6c0,1,0.4,2,1.1,2.7c0.7,0.7,1.8,1.2,2.7,1.1c6.6-0.7,13.2-1.5,19.8-2.1c6.1-0.5,12.3-1,18.4-1.6 c6.7-0.6,13.4-1.1,20.1-1.7c2.7-0.2,5.4-0.5,8.1-0.7c10.4-0.6,20.9-1.1,31.3-1.7c6.5-0.4,13-0.7,19.5-1.1c2.7-0.1,5.4-0.3,8.1-0.4 c10.3-0.4,20.7-0.8,31-1.2c6.3-0.2,12.5-0.5,18.8-0.7c2.1-0.1,4.2-0.2,6.3-0.2c11.2-0.3,22.3-0.5,33.5-0.8 c6.2-0.1,12.5-0.3,18.7-0.4c2.2-0.1,4.4-0.1,6.7-0.1c11.5-0.1,23-0.2,34.6-0.4c7.2-0.1,14.4-0.1,21.6-0.1c12.2,0,24.5,0.1,36.7,0.1 c2.4,0,4.8,0.1,7.2,0.2c6.8,0.2,13.5,0.4,20.3,0.6c5.1,0.2,10.1,0.3,15.2,0.4c3.6,0.1,7.2,0.4,10.8,0.6c10.6,0.6,21.1,1.2,31.7,1.8 c2.7,0.2,5.4,0.4,8,0.6c2.9,0.2,5.8,0.4,8.6,0.7c0.4,0.1,0.9,0.2,1.3,0.3c1.1,0.2,2.2,0.2,3.2-0.4c0.9-0.5,1.6-1.5,1.9-2.5 c0.6-2.2-0.7-4.5-2.9-5.2c-1.9-0.5-3.9-0.7-5.9-0.9c-1.4-0.1-2.7-0.3-4.1-0.4c-2.6-0.3-5.2-0.4-7.9-0.6 C419.7,3.1,414.8,2.9,409.9,2.6z"/>
								</svg>
							</span>
							<!-- SVG END -->
						</span>
					</h3>
					<!-- Info -->
					<p class="mb-4">Wonderway와 함께 머무를 숙소를 검색해보세요</p>

				</div>
				
				<!-- Image -->
				<div class="col-lg-6 position-relative">

					<img src="/resources/booking/assets/images/bg/06.jpg" class="rounded" alt="" style="height:500px; width:100%">

					<!-- Svg decoration -->
					<figure class="position-absolute end-0 bottom-0">
						<svg width="163px" height="163px" viewBox="0 0 163 163">
							<path class="fill-warning" d="M145.6,66.2c-0.9-0.3-1.6,0.2-2.1-0.4c-0.5-0.7-1-1.5-1-2.4c0-3.1,0.1-6.2,0-9.3c0-0.7,0.3-1.3,0.5-1.9 c0.8-1.6,1.6-3.2,2.7-4.5c0.5-0.6,1.2-1.2,2-1.5c0.4-0.2,0.8,0.4,1.3-0.1c0.4-0.4,1,0.7,1.6,0.7c0.4,1-0.4,1.5-1,2.1 c0.7,0.3,1.4,0.3,2.1,0.7c0.6,0.4,1.2,0.7,1,1.5c-0.2,1,0.6,1.3,1,1.9c-0.2,0.3-0.6,0.4-0.5,0.8c1.2,3.2,0.3,5.4-0.7,8.1 c-0.3,0.7-0.7,1.6-0.7,2.2c-0.1,1.5-1.2,2.7-1.4,4.1c-0.2,1.1-0.9,1.7-2.1,1.6c-0.2,0-0.4,0.5-1,0.4c-0.2-0.2-0.7-0.5-0.7-0.8 c0-1-0.1-1.7-1.1-2.1C145.5,67.2,145.6,66.6,145.6,66.2"/>
							<path class="fill-warning" d="M94.3,143.5c1.1,0.3,2.4-0.5,3.2,0.7c-0.4,0.7-0.7,1.4-1,2.1c0.5,0.5,0.7,0.2,1.2,0.1c1.6-0.6,2-0.4,2.5,1.2 c0.1,0.2,0,0.6,0.3,0.6c1.8,0.4,1.4,2.2,2.1,3.2c-0.8,0.9,0.5,1.8,0.1,2.6c-0.5,0.8-0.3,2-1.3,2.6c-0.3,0.2-0.1,0.5-0.2,0.7 c-0.3,2.1-1.2,3.7-3.4,4.4c-0.3,0.1-0.4,0.6-1,0.4c-0.3-0.6-0.6-1.3-1-1.9c-0.5-0.2-1.5,0.3-1.4-1h-3c-0.2-1.4,0-2.9-1.1-3.9 c-0.1-0.1-0.1-0.4,0-0.5c0.7-1.2,0.2-2.6,0.7-3.8c0.3-0.6,0.4-1,0.1-1.6c-0.9-1.3,0-2.4,0.7-3.3C92.5,145,93.4,144.3,94.3,143.5"/>
							<path class="fill-warning" d="M119.6,77.3c-0.4,0.8-1.1,0.6-2,0.8c0.2,1.1-0.4,2.2,0.5,3.3c-0.8,0-0.8,0-1.2-0.3c-0.6,0.3-0.8,1-1.2,1.6 c0.1-1.9-0.6-3.2-2-4.1c-0.6-0.1-0.7,0.3-1,0.5c-1-1.9-1-2.8-0.2-7.7c0.4-2.5,1.7-4.6,3.6-6.8c0.6-0.1,1.5,1.5,2.3,0 c0.8,1.5-0.7,2.3-0.8,3.7c0.8-0.4,1.6-0.7,2.4-0.4c0.4,0.4-0.1,1,0.3,1.4c0.8,0.6,1.4,1.3,0.4,2.3c1.1,0.8-0.3,1.5-0.1,2.4 c0.2,0.8,0,1.7,0,2.5c-0.8-0.2-1-1.1-1.8-1C118.2,76.4,119.5,76.5,119.6,77.3"/>
							<path class="fill-warning" d="M25,131c-0.3-0.6-1.2-0.3-1.7-0.5v-1.2c-0.1-0.1-0.1-0.2-0.2-0.2c-1.4,0.5-2.2-1-3.4-1.2 c-1.2-0.1-1.9-1-2.1-2.2c-0.1-0.5,0.1-0.8,0.5-1.1c-2-1.7-0.8-3.4-0.1-5.1c0.8-2.2,2.6-2.5,4.6-2.4c0.4,1.1,0.2,2-0.6,2.7 c1.5,1,2-0.5,3-0.8c0.3,0.6,0.6,1.2,0.9,1.6c0,0.6-0.8,0.8-0.4,1.4c0.7,0.8,0.9-0.5,1.7-0.3c1,0.9,0.9,2.2,0.8,3.4 c0.4,0.1,0.6,0.2,1,0.3c-0.1,0.6-1,0.8-1,1.5c0,0.8,0.8,0.2,1,0.7C27.7,128.8,26.9,130.3,25,131"/>
							<path class="fill-warning" d="M84.9,95H87c0.4,0.4,0.3,1.6-0.3,2.8c1.2,1,1.7-0.5,2.4-0.8c0.8,0,0.8,0.6,1.2,0.7c0.2,0.8-0.7,0.9-0.4,1.7 c0.5,0.3,1.7,0,1.9,0.9c0.2,0.7,0.3,1.5-0.5,2.1c0.3,0.1,0.6,0.2,0.9,0.3c-0.1,0.7-1.1,1.3-0.5,2.2c-1.1,1.5-3,2.1-4.4,3.3 c-0.3,0.2-0.8,1-1.5,0.5c-0.3-0.4,0.4-0.4,0.3-0.8c-0.7-0.5-1.6,0.1-2.4-0.3c-0.2-0.6,0.1-1.4-0.8-1.8c-1.1,0.5-2.2,0.7-3.2-0.8 c1.3-0.8,3-1.1,3.2-3c-1,0-1.7,0.9-2.7,1c-0.2-0.2-0.5-0.4-0.8-0.7c-0.1-0.1,0.1-0.1,0.2-0.3c0.6-1.1,2.4-1,2.5-2.5 c1.2-0.5,1.1-1.7,1.3-2.5C83.8,96.3,84.3,95.7,84.9,95"/>
							<path class="fill-warning" d="M41.2,153.9c0.3-0.7,0.9-0.8,0.4-1.6c-0.3-0.3-1.1,0.2-1.8-0.2c0-0.2-0.1-0.4-0.1-0.7c-0.1-0.1-0.2-0.2-0.3,0 c-0.3,0.4-0.7,0.4-1.1,0.4c-1.3,0-1.5-0.4-1.6-1.7c0-0.6,0.4-0.8,0.5-1.4c-0.4,0-0.8-0.1-1.4-0.1c-0.4-1.9,0.7-3.6,1.1-5.4 c0.2-0.9,1.6-1.3,2.7-1.3c0.4,0.2,0.3,0.6,0.3,0.7c0.2,0.4,0.3,0.3,0.4,0.1c0.6-0.5,1.3-0.6,1.7,0.1c0.5,0.7,1.1,0.6,1.8,0.7 c0.4,0.4,0.1,0.8,0.2,1.2c0.3,0.4,0.8,0.2,1.3,0.3c1,0.7,0.5,2.1,1.3,2.9C43.8,152.3,43.1,153.1,41.2,153.9"/>
							<path class="fill-warning" d="M70.9,43.4c-0.3-1.4-1.2-1.8-2.6-1.5c-1.2-2.3-0.8-4.8-0.5-7.2c0.1-0.5,0.4-1.1,0.3-1.7 c-0.2-1.1,0.5-1.9,0.6-2.9c0.1-0.7,1.3-0.9,2-1.3c0.9,0.8,0.9,0.8,1.2,2c0.3,0,0.6,0,0.4,0c1.3,0,0.8,0.9,1.3,1.2 c0.3,0.1,0.8,0.5,0.7,1c-0.2,0.8,1,1.4,0.5,2.1c-0.5,0.7-0.2,1.5-0.5,2.1c-0.8,1.5-1,3.2-1.5,4.8C72.6,43.1,72,43.4,70.9,43.4"/>
							<path class="fill-warning" d="M125.4,118.4c-0.4-0.3-0.6-0.7-1.3-0.8c-1.6-0.1-1.6-0.2-1.9-1.9c-1.1-0.4-2.2,0-3.2,0.4 c-0.5-0.5-0.2-0.9-0.4-1.4c0.4-0.1,0.7-0.2,1-0.4v-3c-0.5,0.2-1,0.3-1.7,0.5c-0.3,0-0.4-0.6-0.8-0.7c0.6-1.5,1.8-2.4,2.8-3.5 c1.3,0.3,2.6-1.1,3.8,0.4c0,0.1-0.1,1.8,0,2.1c-0.2,0-0.5,0.1-0.7,0.1c-0.2,0-0.3,0-0.5,0c-0.4,0.4-0.1,1.1-0.7,1.5 c1.3-0.5,2.4-1,3.3-2c0.4,0.4,0.7,0.8,1.4,0.6c-1.1,0.9,0.4,2.1-1,2.9c1,0,1.1-0.6,1.5-0.8c0.4-0.1,0.8-0.1,1.2-0.2 c0.5,1,1.1,1.8,0.6,3c-0.7,0.6-2.2,0.4-2.5,2.1c1.2-0.2,1.9-0.9,2.5-1.5c0.7,0.1,0.7,0.5,0.6,0.8c-1.3-0.1-1.2,1.5-2.3,1.9 c-0.9,0.3-1.6,1-2.7,1.8C124.7,119.5,125.1,119,125.4,118.4"/>
							<path class="fill-warning" d="M101.7,41c-0.3,0.3-0.6,0.6-0.9,0.9c0.9,0.6-0.9,1.6,0.4,2.1c-2,2.3-2,2.4-2.1,4.8h-2.4c-0.2-0.1,0-0.5-0.2-0.8 c-2.4-0.3-2.9-0.8-3-3.3c0-0.6,0.2-1.4-0.5-1.8c0.5-0.7,0.2-1.6,0.7-2.4c1-1.5,2.3-2.7,3.5-3.9c0.5-0.2,1-0.1,1.4,0 c0.2,1-1.1,1.6-0.2,2.6c0.3-0.4,0.6-0.8,0.9-1.3C100.2,39.2,101.7,39.5,101.7,41"/>
							<path class="fill-warning" d="M140.4,5.4c-0.4,0.6-1.2-0.1-1.5,0.6c0.7,0.4,1.5,0.1,2.3,0.2c0.3,1.1,0.9,2.1,1.3,3.2c0.9,2.4,0.3,4.4-0.6,6.6 c-0.4,0.9-0.9,1.2-1.9,1c-0.2-0.5-0.5-1.2-0.9-1.9c-0.6-0.2-1.5,0-1.9-1c0.1-1.7,0.1-3.6-1.1-5.2c0.4-0.7,0.7-1.3,1.1-1.9 c-0.3-0.1-0.6-0.2-1-0.4c0.2-0.8,0.5-1.6,1.3-2.3h2.2C140,4.6,140.5,4.8,140.4,5.4"/>
							<path class="fill-warning" d="M65.7,68.8c-0.4,0.6-0.9,0.4-1.4,0.4c-1.2-1.1-0.4-2.9-1.4-4.1c1.5-3,1.5-3,4.1-4.2c0.5,0.1,0.8,0.5,1,1 c0.1,0.6-0.8,0.7-0.5,1.3c0.5,0.6,0.9,0.2,1.2-0.2c1.5,0.6,1.1,2.5,2.4,3.3c-0.1,1.1,0.2,2.2-0.2,3.2L69,72.2c-0.3,0-0.7,0-1,0 c-0.3-0.5-0.9-2.2-0.8-2.4C66.7,69.6,66.2,69.2,65.7,68.8"/>
							<path class="fill-warning" d="M37.5,69.7c-0.5,0.2,0,0.9-0.4,1c-0.7,0.2-1-0.2-1.2-0.6c-0.4-0.7,0.1-1.6-0.2-2.2c-0.5-0.7-0.6-1.2-0.1-2 c0.5-0.6,0.2-1.5,0.6-2.3c0.9-2,0.9-2.1,3-2.1c0.1,0.1,0.2,0.1,0.2,0.2c0,0.3,0,0.7,0,1.1c0.7,0.4,1.7,0.1,2.1,1.3 c0.3,0.9,1.2,1.5,1,2.7c-0.2,0.9,0.1,1.8-0.8,2.5c-0.4,0.4-0.8,1.1-0.8,2c0,0.6-0.5,1-1.2,1.1c-0.6,0.1-1-0.3-1.2-0.7 C38,71,37.8,70.3,37.5,69.7"/>
							<path class="fill-warning" d="M53.9,87.8c0.7,0,1.4,0,2.1,0c0.5,0.3,0.1,1,0.4,1.4c0.4,0.3,0.8,0.1,1.2,0.2c0.6,1.2,1.4,2.4,1.7,3.6 c0.4,1.4-0.2,2.7-0.7,4c-1,0.4-1.5-0.4-2.1-0.9c-0.7,0-1.4,0-2.1,0c-0.4-1-0.8-1.8-2.1-1.5c-0.6-0.7,0.2-1.8-0.7-2.3 c0.5-0.6,0.9-1.3,1-2.1C52.8,89.2,53.2,88.5,53.9,87.8"/>
							<path class="fill-warning" d="M0.1,95.7c0.9-1.3,2.3-1.7,3.8-1.8c1,1.2-0.7,1.5-0.8,2.3c1.1,1,2-0.7,3.1,0c0.6,0.6-0.2,0.8-0.3,1.2 c0.4,0.5,1,0,1.4,0.3c0.4,1.1-0.3,2.3,0.6,3.3c-0.8,0.8-0.7,2.2-1.9,2.8c-1.1-0.2-1.8-1-2.6-1.7c-0.7-0.6-1.9-0.5-2.6-1.9 C1,98.9-0.4,97.4,0.1,95.7"/>
							<path class="fill-warning" d="M155.5,91.5c-0.9-0.5-1.7-0.7-2.3-1.6c0.4-0.2,0.8-0.5,1.2-0.7c-1.2-0.4-2.1,0.7-3.1,0c0.6-1,1.8-1,2.5-1.7 c0.1-0.6-0.3-0.6-0.7-0.7c-0.7-0.2-0.9,0.9-1.6,0.5c-0.3-0.3-0.4-0.7-0.1-0.9c1.7-1,3-2.3,4.5-3.5c0.9-0.7,1.1-0.9,2.5-1.2 c-0.1,0.5-0.6,0.7-0.9,1.1c0.7,0.7,1.3,0.1,1.9-0.2c0.1,1.1,0.9,1.9,0.5,3.4C158.3,87.4,157.4,89.8,155.5,91.5"/>
						</svg>
					</figure>


					<!-- Round image group -->
					<div class="vstack gap-5 align-items-center position-absolute top-0 start-0 d-none d-md-flex mt-4 ms-n3">
						<img class="icon-lg shadow-lg border border-3 border-white rounded-circle" src="/resources/booking/assets/images/category/hotel/4by3/11.jpg" alt="avatar">
						<img class="icon-xl shadow-lg border border-3 border-white rounded-circle" src="/resources/booking/assets/images/category/hotel/4by3/12.jpg" alt="avatar">
					</div>
				</div>
			</div>
			<!-- Content and Image END -->
			
		<!-- 검색 START -->
		<div class="row" style="margin-top:-14rem;">
			<div class="col-xl-10 position-relative">
				<!-- Title -->
				
				<!-- Tabs START -->
				<div class="col-11 col-lg-8 col-xl-6 mx-auto">
					<ul class="nav nav-tabs nav-bottom-line nav-justified nav-responsive bg-mode rounded-top z-index-9 position-relative pt-2 pb-0 px-4">
						<li class="nav-item"> 
							<a class="nav-link mb-0 active" data-bs-toggle="tab" href="#tab1">날짜/인원/방개수로 검색</a> 
						</li>
						<li class="nav-item">
							<a class="nav-link mb-0" data-bs-toggle="tab" href="#tab2">숙소명으로 검색</a>
							 
						</li>
					</ul>
				</div>
				<!-- Tabs END -->
				
				<div class="tab-content" id="nav-tabContent">
				<!--탭 1  -->
				<div class="tab-pane fade show active" id="tab1">
				<!-- Booking from START -->
				<form class="card shadow rounded-3 position-relative p-4 pe-md-5 pb-5 pb-md-4"
						action="/member/acm/search" method="post">
				<div class="row g-4 align-items-center" >
						<!-- Location -->
						<div class="col-lg-4">
							<div class="form-control-border form-control-transparent form-fs-md d-flex">
								<!-- Icon -->
								<i class="bi bi-geo-alt fs-3 me-2 mt-2"></i>
								<!-- Select input -->
								<div class="flex-grow-1">
									<label class="form-label">숙소 위치</label>
									<select name="busiLoc" class="form-select js-choice" data-search-enabled="true">
										<option value="">어디로 떠나시나요?</option>
										
										<%
										  	String[] locArray = {"서울", "부산","인천","대구","대전", "광주","울산","세종","제주","경기도 수원시",
										  						"경기도 고양시 ","경기도 용인시", "경상남도 창원시", "경기도 성남시","충척북도 청주시","충청남도 태안군","충청남도 천안시"};
										%>
										<% for (String loc:locArray) {%>
											<option><%=loc%></option>
										<%}%>
									</select>
								</div>
							</div>
						</div>

						<!-- Check in -->
						<div class="col-lg-4">
							<div class="d-flex">
								<!-- Icon -->
								<i class="bi bi-calendar fs-3 me-2 mt-2"></i>
								<!-- Date input -->
								<div class="form-control-border form-control-transparent form-fs-md">
									<label class="form-label">체크인-아웃 날짜</label>
									<input type="text" name="checkInOut" class="form-control flatpickr" data-mode="range" data-date-format="y/m/d" placeholder="얼마나 머무시나요?" value="">
								</div>
							</div>
						</div>

						<!-- Guest -->
						<div class="col-lg-4">
							<div class="form-control-border form-control-transparent form-fs-md d-flex">
								<!-- Icon -->
								<i class="bi bi-person fs-3 me-2 mt-2"></i>
								<!-- Dropdown input -->
								<div class="w-100">
									<label class="form-label">인원&방 개수</label>
									<div class="dropdown guest-selector me-2">
										<input type="text" name="guestRoomNum" class="form-guest-selector form-control selection-result" value="" placeholder="클릭 후 선택해주세요" data-bs-auto-close="outside" data-bs-toggle="dropdown" readonly/>
									
										<!-- dropdown items -->
										<ul class="dropdown-menu guest-selector-dropdown">
											<!-- Adult -->
											<li class="d-flex justify-content-between">
												<div>
													<h6 class="mb-0">인원 수</h6>
													<small>아동 포함</small>
												</div>

												<div class="hstack gap-1 align-items-center">
													<button type="button" class="btn btn-link adult-remove p-0 mb-0"><i class="bi bi-dash-circle fs-5 fa-fw"></i></button>
													<h6 class="guest-selector-count mb-0 adults">2</h6>
													<button type="button" class="btn btn-link adult-add p-0 mb-0"><i class="bi bi-plus-circle fs-5 fa-fw"></i></button>
												</div>
											</li>

											<!-- Divider -->
											<li class="dropdown-divider"></li>


											<!-- Rooms -->
											<li class="d-flex justify-content-between">
												<div>
													<h6 class="mb-0">방 개수</h6>
												</div>

												<div class="hstack gap-1 align-items-center">
													<button type="button" class="btn btn-link room-remove p-0 mb-0" ><i class="bi bi-dash-circle fs-5 fa-fw"></i></button>
													<h6 class="guest-selector-count mb-0 rooms">1</h6>
													<button type="button" class="btn btn-link room-add p-0 mb-0"><i class="bi bi-plus-circle fs-5 fa-fw"></i></button>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 검색버튼 -->
					<div class="btn-position-md-middle">
						<button id="btnSearch" type="submit" class="icon-lg btn btn-round btn-primary mb-0"><i class="bi bi-search fa-fw"></i></button>
					</div>
					
					<sec:csrfInput />
				</form>
				</div>
					
				<!-- Booking from END -->
				<!--탭 1  -->
				
				
				
				
				<!--탭 2  -->
				<div class="tab-pane fade" id="tab2">
				<!-- Booking from START -->
				<form class="card shadow rounded-3 position-relative p-4 pe-md-5 pb-5 pb-md-4"
						action="/member/acm/search" method="post">
				<div class="row g-4 align-items-center" >
						<!-- Location -->
						<div class="col-lg-4">
							<div class="form-control-border form-control-transparent form-fs-md d-flex">
								<!-- Icon -->
								<i class="bi bi-geo-alt fs-3 me-2 mt-2"></i>
								<!-- Select input -->
								<div class="flex-grow-1">
									<label class="form-label">숙소 위치</label>
									<select name="busiLoc" class="form-select js-choice" data-search-enabled="true">
										<option value="">어디로 떠나시나요?</option>
										<% for (String loc:locArray) {%>
											<option><%=loc%></option>
										<%}%>
									</select>
								</div>
							</div>
						</div>

						<!-- Check in -->
						<div class="col-lg-8">
							<div class="d-flex">
								<!-- Icon -->
								<i class="bi bi-building fs-3 me-2 mt-2"></i>
								<!-- Date input -->
								<div class="form-control-border form-control-transparent form-fs-md">
									<label class="form-label">숙소명 입력</label>
									<div class="form d-flex" style="height:3rem;">
										<input id="search_console" type="text" name="busiNm" class="form-control data-mode="range" placeholder="숙소명을 입력해주세요" value=""
										style="width:20rem;">
								        <button type="button" class="btn btn-success mx-2" onclick="startRecord()" data-bs-toggle="tooltip" data-bs-placement="top" title="음성인식으로도 검색이 가능합니다">음성인식</button>
								        <button type="button" class="btn btn-danger" onclick="endRecord()">중지</button>
								    </div>
								</div>
							</div>
						</div>

					</div>
					<!-- 검색버튼 -->
					<div class="btn-position-md-middle">
						<button  type="submit" class="icon-lg btn btn-round btn-primary mb-0"><i class="bi bi-search fa-fw"></i></button>
					</div>
					<sec:csrfInput />
				</form>
				</div>
					
				<!--탭 2  -->
				</div>
				
				
			</div>
		</div>
		<!-- Search END -->
	</div>
</section>
<!-- =======================
Main Banner END -->

<!-- =======================
Best deal START -->
<section class="pb-2 pb-lg-5">
	<div class="container">
						<!--  표 위에 슬라이더 -->
				<div class="container">
					<!-- Slider START -->
					<div class="tiny-slider arrow-round arrow-blur arrow-hover">
						<div class="tiny-slider-inner" data-autoplay="true"
							data-arrow="true" data-edge="2" data-dots="false"
							data-items-xl="3" data-items-lg="2" data-items-md="1">
							
							<!-- Slider 1 item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<img alt="001" src="/resources/booking/assets/images/advertise/bottom/001.png">
									</div>
								</div>
							</div>
							
							<!-- Slider 2 item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<img alt="002" src="/resources/booking/assets/images/advertise/bottom/002.png">
									</div>
								</div>
							</div>
							
							<!-- Slider 3 item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<img alt="003" src="/resources/booking/assets/images/advertise/bottom/003.png">
									</div>
								</div>
							</div>
							
							<!-- Slider 4 item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<img alt="004" src="/resources/booking/assets/images/advertise/bottom/004.png">
									</div>
								</div>
							</div>
							
							<!-- Slider 5 item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<img alt="005" src="/resources/booking/assets/images/advertise/bottom/005.png">
									</div>
								</div>
							</div>
							
							<!-- Slider 6 item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<img alt="006" src="/resources/booking/assets/images/advertise/bottom/006.png">
									</div>
								</div>
							</div>
							

						</div>
					</div>
					<!-- Slider END -->
				</div>
				<!--  표 위에 슬라이더 END -->
	</div>
</section>
<!-- =======================
Best deal END -->




</main>

</body>
</html>