<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@page import="kr.or.ddit.vo.MbtiStyRcmVO"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<style>
.card-img{
width : 540px;
height : 540px;

}
.mb-0 {
            background-color: white;
            padding: 10px; /* 제목 주위에 적절한 여백을 추가할 수 있습니다 */
        }
</style>
	<title>Booking - Multipurpose Online Booking Theme</title>

	<!-- Meta Tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Booking - Multipurpose Online Booking Theme">


	<!-- Favicon -->
	<link rel="shortcut icon" href="/resources/booking/assets/images/favicon.ico">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/bootstrap-icons/bootstrap-icons.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/css/style.css">


<body>

<!-- **************** MAIN CONTENT START **************** -->
<main>

<!-- =======================
Main banner START -->
<section class="pt-4 pt-md-5">
	<div class="container">
		<div class="row g-4 justify-content-between">
			<!-- Title -->
			<div class="col-lg-7 col-xl-8">
				<h1 class="mb-4">MBTI별 </br>인기있는 숙소가 </br>
					<span class="position-relative z-index-9">궁금하신가요?
						<!-- SVG START -->
						<span class="position-absolute top-50 start-50 translate-middle z-index-n1 d-none d-sm-block mt-4">
							<svg width="390.5px" height="21.5px" viewBox="0 0 445.5 21.5">
								<path class="fill-primary opacity-7" d="M409.9,2.6c-9.7-0.6-19.5-1-29.2-1.5c-3.2-0.2-6.4-0.2-9.7-0.3c-7-0.2-14-0.4-20.9-0.5 c-3.9-0.1-7.8-0.2-11.7-0.3c-1.1,0-2.3,0-3.4,0c-2.5,0-5.1,0-7.6,0c-11.5,0-23,0-34.5,0c-2.7,0-5.5,0.1-8.2,0.1 c-6.8,0.1-13.6,0.2-20.3,0.3c-7.7,0.1-15.3,0.1-23,0.3c-12.4,0.3-24.8,0.6-37.1,0.9c-7.2,0.2-14.3,0.3-21.5,0.6 c-12.3,0.5-24.7,1-37,1.5c-6.7,0.3-13.5,0.5-20.2,0.9C112.7,5.3,99.9,6,87.1,6.7C80.3,7.1,73.5,7.4,66.7,8 C54,9.1,41.3,10.1,28.5,11.2c-2.7,0.2-5.5,0.5-8.2,0.7c-5.5,0.5-11,1.2-16.4,1.8c-0.3,0-0.7,0.1-1,0.1c-0.7,0.2-1.2,0.5-1.7,1 C0.4,15.6,0,16.6,0,17.6c0,1,0.4,2,1.1,2.7c0.7,0.7,1.8,1.2,2.7,1.1c6.6-0.7,13.2-1.5,19.8-2.1c6.1-0.5,12.3-1,18.4-1.6 c6.7-0.6,13.4-1.1,20.1-1.7c2.7-0.2,5.4-0.5,8.1-0.7c10.4-0.6,20.9-1.1,31.3-1.7c6.5-0.4,13-0.7,19.5-1.1c2.7-0.1,5.4-0.3,8.1-0.4 c10.3-0.4,20.7-0.8,31-1.2c6.3-0.2,12.5-0.5,18.8-0.7c2.1-0.1,4.2-0.2,6.3-0.2c11.2-0.3,22.3-0.5,33.5-0.8 c6.2-0.1,12.5-0.3,18.7-0.4c2.2-0.1,4.4-0.1,6.7-0.1c11.5-0.1,23-0.2,34.6-0.4c7.2-0.1,14.4-0.1,21.6-0.1c12.2,0,24.5,0.1,36.7,0.1 c2.4,0,4.8,0.1,7.2,0.2c6.8,0.2,13.5,0.4,20.3,0.6c5.1,0.2,10.1,0.3,15.2,0.4c3.6,0.1,7.2,0.4,10.8,0.6c10.6,0.6,21.1,1.2,31.7,1.8 c2.7,0.2,5.4,0.4,8,0.6c2.9,0.2,5.8,0.4,8.6,0.7c0.4,0.1,0.9,0.2,1.3,0.3c1.1,0.2,2.2,0.2,3.2-0.4c0.9-0.5,1.6-1.5,1.9-2.5 c0.6-2.2-0.7-4.5-2.9-5.2c-1.9-0.5-3.9-0.7-5.9-0.9c-1.4-0.1-2.7-0.3-4.1-0.4c-2.6-0.3-5.2-0.4-7.9-0.6 C419.7,3.1,414.8,2.9,409.9,2.6z"></path>
							</svg>
						</span>
						<!-- SVG END -->
					</span>
				</h1>
				<p class="lead mb-0">문항은 총 12문항입니다.</p>
			</div>

		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Main banner START -->

<!-- =======================
Team START -->
<section class = "pt-0">
<section class="py-0">
	<div class="container">
	<form action="/member/rcm/styMbtiResult" method="post">
		<!-- Team START -->
		<div class="row g-4">
		
					<!-- 1번 -->
					<div id="question1" >
					<div class="row" id="firstTest" >
						<div class="col-lg-10 m-auto text-center">
							<h3>이번 여행은 어디로 떠나볼까?</h3>
						</div>
					</div>
					
					<!-- 1번 -->
					<div class="row">
						<div class="col-6">
							<div class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
									<img src="/resources/upload/mbti/1.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test1-1"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">수많은 리뷰로 </br>검증된 장소로 가자</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->

						<div class="col-6">
							<div
								class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
									<img src="/resources/upload/mbti/24.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div
										class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test1-2"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">아무도 안 가본 </br> 새로운 장소로 떠나자</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->
					</div>
					<!-- 1번 끝 -->
					</div>
					
					
					<!-- 2번 -->
					<div id="question2" style="display: none;">
					<div class="row" id="secTest">
						<div class="col-lg-10 m-auto text-center">
							<h2>자, 그럼 여행 일정을 정해보자.</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-6">
							<div class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
										<img src="/resources/upload/mbti/2.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test2-1"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">주어진 일정 중 </br> 가장 많은 멤버가 가능한 날짜로 정한다.</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->

						<div class="col-6">
							<div
								class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
										<img src="/resources/upload/mbti/3.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div
										class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test2-2"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">일정이 늦춰지더라도 </br> 모든 멤버가 가능한 날짜로 정한다.</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->
					</div>
					<!-- 2번 끝 -->
					</div>
					
					<!-- 3번 -->
					<div id="question3" style="display: none;">
					<div class="row" id="trdTest">
						<div class="col-lg-10 m-auto text-center">
							<h2>여행이 끝나고 난 뒤 나는?</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-6">
							<div class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
										<img src="/resources/upload/mbti/4.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test3-1"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">단톡방에서 </br>사진 공유 및 정산을 마치면 </br>바로 일상으로 돌아간다</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->

						<div class="col-6">
							<div
								class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
										<img src="/resources/upload/mbti/5.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div
										class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test3-2"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">다음 여행이 필요해..! </br> 여행에서 찍은 사진을</br> 계속 보며</br> 후유증에 시달린다.</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->
					</div>
					<!-- 3번 끝 -->
					</div>
					
					
					<!-- 4번 -->
					<div id="question4" style="display: none;">
					<div class="row" id="fourTest">
						<div class="col-lg-10 m-auto text-center">
							<h2>자, 이제 숙소를 예약해보자!</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-6">
							<div class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
										<img src="/resources/upload/mbti/6.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test4-1"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">새로운 인연을 만나서 </br>파티 할 수 있는</br> 게스트하우스도 좋아</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->

						<div class="col-6">
							<div
								class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
										<img src="/resources/upload/mbti/7.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div
										class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test4-2"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">우리끼리</br> 프라이빗하게 </br>놀 수 있는</br> 펜션이나 호텔 아니면 불편해</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->
					</div>
					<!-- 4번 끝 -->
					</div>
					
					
					<!-- 5번 -->
					<div id="question5" style="display: none;">
					<div class="row" id="fitTest">
						<div class="col-lg-10 m-auto text-center">
							<h2>우리 여행지 가서 뭐할까?</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-6">
							<div class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
										<img src="/resources/upload/mbti/8.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test5-1"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">자전거, 카약 등</br> 다양한 액티비티를 하자</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->

						<div class="col-6">
							<div
								class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
										<img src="/resources/upload/mbti/9.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div
										class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test5-2"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">편안한 장소에서</br> 느긋하게 힐링하자</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->
					</div>
					<!-- 5번 끝 -->
					</div>
					
					<!-- 6번 -->
					<div id="question6" style="display: none;">
					<div class="row" id="sixTest">
						<div class="col-lg-10 m-auto text-center">
							<h2>피곤한 상태인데 다같이 엑티비티를 하러 가자고 한다면?</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-6">
							<div class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
										<img src="/resources/upload/mbti/10.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test6-1"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">다 같이 왔는데, </br>조금 피곤해도 함께 가야지!</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->

						<div class="col-6">
							<div
								class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
										<img src="/resources/upload/mbti/11.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div
										class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test6-2"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">난 숙소에 있을게.</br> 너네끼리 다녀와</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->
					</div>
					<!--6번 끝 -->
					</div>
					
					<!-- 7번 -->
					<div id="question7" style="display: none;">
					<div class="row" id="sevTest">
						<div class="col-lg-10 m-auto text-center">
							<h2>드디어 여행 스타트,</br> 멋진 풍경이 눈 앞에 펼쳐졌다!</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-6">
							<div class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
									<img src="/resources/upload/mbti/12.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test7-1"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">남는 건 사진 뿐!</br> 자, 다들 일단 사진부터 찍자</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->

						<div class="col-6">
							<div
								class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
									<img src="/resources/upload/mbti/13.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div
										class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test7-2"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">사진은 너네끼리 찍어~</br>난 멋진 풍경 좀 볼게!</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->
					</div>
					<!--7번 끝 -->
					</div >
					
						<!-- 8번 -->
						<div id="question8" style="display: none;">
					<div class="row" id="eigest">
						<div class="col-lg-10 m-auto text-center">
							<h2>소문난 맛집에 도착! 그런데 대기 시간이 2시간이라면?!</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-6">
							<div class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
									<img src="/resources/upload/mbti/14.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test8-1"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">기다리다 지친다!</br>포기하고</br>근처의 다른 식당으로 간다</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->

						<div class="col-6">
							<div
								class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
									<img src="/resources/upload/mbti/15.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div
										class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test8-2"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">기다리는 것도</br> 맛집 탐방의 컨텐츠지! </br>기다려서 먹는다</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->
					</div>
					<!--8번 끝 -->
					</div>
					
					
						<!-- 9번 -->
						<div id="question9" style="display: none;">
					<div class="row" id="nineTest">
						<div class="col-lg-10 m-auto text-center">
							<h2>드디어 맛있는 음식 서빙 완료!</br> 먹음직스러운 비쥬얼이 눈 앞에!</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-6">
							<div class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
									<img src="/resources/upload/mbti/16.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test9-1"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">너무 배가 고프다 ..</br>일단 빨리 먹자</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->

						<div class="col-6">
							<div
								class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
									<img src="/resources/upload/mbti/17.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div
										class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test9-2"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">잠깐 기다려! </br>초근접샷부터 항공샷까지... </br>이 순간을 추억하기 위한</br>인증샷은 필수라고!</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->
					</div>
					<!--9번 끝 -->
					</div>
					
					<!-- 10번 -->
					<div id="question10" style="display: none;">
					<div class="row" id="tenTest">
						<div class="col-lg-10 m-auto text-center">
							<h2>드디어 여행 장소를 정했다!</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-6">
							<div class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
									<img src="/resources/upload/mbti/18.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test10-1"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">맛집, 볼거리 등 </br>여행지 정보를 미리 알아본다</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->

						<div class="col-6">
							<div
								class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
									<img src="/resources/upload/mbti/19.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div
										class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test10-2"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">교통이나 숙소 외에는</br> 일단 여행지에 가서</br>끌리는 곳으로 간다.</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->
					</div>
					<!--10번 끝 -->
					</div>
					
					
					
					<!-- 11번 -->
					<div id="question11" style="display: none;">
					<div class="row" id="eleTest">
						<div class="col-lg-10 m-auto text-center">
							<h2>여행 계획을 짜볼까?</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-6">
							<div class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
									<img src="/resources/upload/mbti/20.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test11-1"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">혼란의 단톡방, </br>내가 세밀하게 </br>장소와 활동,</br>동선을 계획한다.</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->

						<div class="col-6">
							<div
								class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
									<img src="/resources/upload/mbti/21.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div
										class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test11-2"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">그거 좋다! </br>친구들이 짠 계획에 </br>열심히 호응하고 </br>군말없이 따라간다.</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->
					</div>
					<!--11번 끝 -->
					</div>
					
					
					
					
					
					
					
					
					<!-- 12번 -->
					<div id="question12" style="display: none;">
					<div class="row" id="tweTest">
						<div class="col-lg-10 m-auto text-center">
							<h2>차가 막혀서 계획한 시간보다 일정이 늦어졌다면?</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-6">
							<div class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
									<img src="/resources/upload/mbti/22.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test12-1"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">변경된 시간에 맞춰서</br> 일정을 새로 계획한다.</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->

						<div class="col-6">
							<div
								class="card card-img-scale card-element-hover overflow-hidden bg-transparent">
								<div class="card-img-scale-wrapper rounded-3">
									<!-- Image -->
									<img src="/resources/upload/mbti/23.jpg"
										class="card-img" alt="">
									<!-- Card overlay -->
									<div
										class="card-img-overlay d-flex align-items-center justify-content-center p-3">
										<!-- Social button -->
										<button type="button" id="test12-2"
											class="btn btn-lg text-white bg-transparent border-0">
											<h3 class="mb-0">늦으면 뭐 어때!</br>느긋하게 즐기고 </br>새로운 장소로 간다.</h3>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Team item END -->
					</div>
					<!--12번 끝 -->
					</div>
					
					

				</div>
		<!-- Team END -->
		</form>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</section>
</section>
<!-- =======================
Team END -->


</main>
<!-- **************** MAIN CONTENT END **************** -->


<!-- Back to top -->
<div class="back-top"></div>

<!-- Bootstrap JS -->
<script src="/resources/booking/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- ThemeFunctions -->
<script src="/resources/booking/assets/js/functions.js"></script>

<script type="text/javascript">
// 초기 상태 설정
var question1 = document.getElementById('question1');
var question2 = document.getElementById('question2');
var question3 = document.getElementById('question3');
var question4 = document.getElementById('question4');
var question5 = document.getElementById('question5');
var question6 = document.getElementById('question6');
var question7 = document.getElementById('question7');
var question8 = document.getElementById('question8');
var question9 = document.getElementById('question9');
var question10 = document.getElementById('question10');
var question11 = document.getElementById('question11');
var question12 = document.getElementById('question12');

/* var estj = 0;
var esfj = 0;
var enfj = 0;
var entj = 0;
var estp = 0;
var esfp = 0;
var enfp = 0;
var entp = 0;
var istj = 0;
var isfj = 0;
var infj = 0;
var intj = 0;
var istp = 0;
var isfp = 0;
var infp = 0;
var intp = 0;
 */
 var e = 0;
 var i = 0;
 var n = 0;
 var s = 0;
 var f =0;
 var t = 0;
 var p = 0;
 var j = 0;

$(function() {
	// 1번 문제의 버튼 클릭 이벤트 처리
	document.getElementById('test1-1').addEventListener('click', function() {
		s = s +1;
	  question1.style.display = 'none';  // 1번 문제 숨기기
	  question2.style.display = 'block'; // 2번 문제 보이기
	  
	});	
	document.getElementById('test1-2').addEventListener('click', function() {
		n= n+1;
	  question1.style.display = 'none';  // 1번 문제 숨기기
	  question2.style.display = 'block'; // 2번 문제 보이기
	});
})

$(function() {
	// 2번 문제의 버튼 클릭 이벤트 처리
	document.getElementById('test2-1').addEventListener('click', function() {
		s = s +1;
	  question2.style.display = 'none';  // 2번 문제 숨기기
	  question3.style.display = 'block'; // 3번 문제 보이기
	});	
	document.getElementById('test2-2').addEventListener('click', function() {
		n= n+1;
	  question2.style.display = 'none';  // 2번 문제 숨기기
	  question3.style.display = 'block'; // 3번 문제 보이기
	});
})
$(function() {
	// 3번 문제의 버튼 클릭 이벤트 처리
	document.getElementById('test3-1').addEventListener('click', function() {
		s = s +1;
	  question3.style.display = 'none';  // 3번 문제 숨기기
	  question4.style.display = 'block'; // 4번 문제 보이기
	});	
	document.getElementById('test3-2').addEventListener('click', function() {
		n= n+1;
	  question3.style.display = 'none';  // 1번 문제 숨기기
	  question4.style.display = 'block'; // 2번 문제 보이기
	});
})
$(function() {
	// 4번 문제의 버튼 클릭 이벤트 처리
	document.getElementById('test4-1').addEventListener('click', function() {
		e=e+1;
	  question4.style.display = 'none';  // 4번 문제 숨기기
	  question5.style.display = 'block'; // 5번 문제 보이기
	});	
	document.getElementById('test4-2').addEventListener('click', function() {
		i = i+1;
	  question4.style.display = 'none';  // 4번 문제 숨기기
	  question5.style.display = 'block'; // 5번 문제 보이기
	});
})

$(function() {
	// 5번 문제의 버튼 클릭 이벤트 처리
	document.getElementById('test5-1').addEventListener('click', function() {
		e=e+1;
	  question5.style.display = 'none';  // 5번 문제 숨기기
	  question6.style.display = 'block'; // 6번 문제 보이기
	});	
	document.getElementById('test5-2').addEventListener('click', function() {
		i = i+1;
	  question5.style.display = 'none';  // 5번 문제 숨기기
	  question6.style.display = 'block'; // 6번 문제 보이기
	});
})
$(function() {
	// 6번 문제의 버튼 클릭 이벤트 처리
	document.getElementById('test6-1').addEventListener('click', function() {
		e=e+1;
	  question6.style.display = 'none';  // 6번 문제 숨기기
	  question7.style.display = 'block'; // 7번 문제 보이기
	});	
	document.getElementById('test6-2').addEventListener('click', function() {
		i = i+1;
		  question6.style.display = 'none';  // 6번 문제 숨기기
		  question7.style.display = 'block'; // 7번 문제 보이기
	});
})
$(function() {
	// 7번 문제의 버튼 클릭 이벤트 처리
	document.getElementById('test7-1').addEventListener('click', function() {
		t=t+1;
	  question7.style.display = 'none';  // 7번 문제 숨기기
	  question8.style.display = 'block'; // 8번 문제 보이기
	});	
	document.getElementById('test7-2').addEventListener('click', function() {
		f = f+1;
		  question7.style.display = 'none';  // 7번 문제 숨기기
		  question8.style.display = 'block'; // 8번 문제 보이기
	});
})
$(function() {
	// 8번 문제의 버튼 클릭 이벤트 처리
	document.getElementById('test8-1').addEventListener('click', function() {
		t=t+1;
	  question8.style.display = 'none';  // 8번 문제 숨기기
	  question9.style.display = 'block'; // 9번 문제 보이기
	});	
	document.getElementById('test8-2').addEventListener('click', function() {
		f = f+1;
	  question8.style.display = 'none';  // 8번 문제 숨기기
	  question9.style.display = 'block'; // 9번 문제 보이기
	});
})
$(function() {
	// 9번 문제의 버튼 클릭 이벤트 처리
	document.getElementById('test9-1').addEventListener('click', function() {
		t=t+1;
	  question9.style.display = 'none';  // 9번 문제 숨기기
	  question10.style.display = 'block'; // 10번 문제 보이기
	});	
	document.getElementById('test9-2').addEventListener('click', function() {
		f = f+1;
		  question9.style.display = 'none';  // 9번 문제 숨기기
		  question10.style.display = 'block'; // 10번 문제 보이기
	});
})
$(function() {
	// 10번 문제의 버튼 클릭 이벤트 처리
	document.getElementById('test10-1').addEventListener('click', function() {
		j = j+1;
	  question10.style.display = 'none';  // 10번 문제 숨기기
	  question11.style.display = 'block'; // 11번 문제 보이기
	});	
	document.getElementById('test10-2').addEventListener('click', function() {
		p = p+1;
	  question10.style.display = 'none';  // 10번 문제 숨기기
	  question11.style.display = 'block'; // 11번 문제 보이기
	});
})
$(function() {
	// 11번 문제의 버튼 클릭 이벤트 처리
	document.getElementById('test11-1').addEventListener('click', function() {
		j = j+1;
	  question11.style.display = 'none';  // 11번 문제 숨기기
	  question12.style.display = 'block'; // 12번 문제 보이기
	});	
	document.getElementById('test11-2').addEventListener('click', function() {
		p = p+1;
		  question11.style.display = 'none';  // 6번 문제 숨기기
		  question12.style.display = 'block'; // 7번 문제 보이기
	});
})
$(function() {
	// 12번 문제의 버튼 클릭 이벤트 처리
	document.getElementById('test12-1').addEventListener('click', function() {
		j = j+1;
	  question12.style.display = 'none';  // 12번 문제 숨기기
	  console.log(e,i,n,s,t,p,j,p)
	  
	  
	  if(e>i){
		  var first= "E";
	  }else{
		  var first= "I";
	  }
	  if(n>s){
		  var second="N";
	  }else{
		  var second="S";
	  }
	  if(t>f){
		  var third="T";
	  }else{
		  var third="F";
	  }
	  if(p>j){
		  var fourth="P";
	  }else{
		  var fourth="J";
	  }
	  
	  var mbti = first+second+third+fourth;
	  console.log(mbti) ;
	  var data = {'styMbti':mbti};
	  console.log("data : " + JSON.stringify(data)); 
	  
	  $.ajax({
		  url : "/member/rcm/testMbtiPost",
		  contentType : "application/json",
		  data:JSON.stringify(data),
		  type: "POST",
		  dataType: "text",
		  beforeSend : function (xhr) {
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
		  success: function(list){
			  console.log("data : "+ data);
			  if (list != null) {
				  location.href = "/member/rcm/styMbtiResult?styMbti="+mbti;
				} else {
					alert("문제가 발생했습니다.");
				}
		  }
			
		  
	  });
	  
	  
	});	
	
	
	document.getElementById('test12-2').addEventListener('click', function() {
		p = p+1;
	  question12.style.display = 'none';  // 12번 문제 숨기기
	  
	  
	  console.log(e,i,n,s,t,p,j,p)
	  
	  
	  if(e>i){
		  var first= "E";
	  }else{
		  var first= "I";
	  }
	  if(n>s){
		  var second="N";
	  }else{
		  var second="S";
	  }
	  if(t>f){
		  var third="T";
	  }else{
		  var third="F";
	  }
	  if(p>j){
		  var fourth="P";
	  }else{
		  var fourth="J";
	  }
	  
	  var mbti = first+second+third+fourth;
	  console.log(mbti) ;
	  var data = {'styMbti':mbti};
	  console.log("data : " + JSON.stringify(data)); 
	  
	  $.ajax({
		  url : "/member/rcm/testMbtiPost",
		  contentType : "application/json",
		  data:JSON.stringify(data),
		  type: "POST",
		  dataType: "text",
		  beforeSend : function (xhr) {
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
		  success: function(list){
			  console.log("data : "+ data);
			  if (list != null) {
				  location.href = "/member/rcm/styMbtiResult?styMbti="+mbti;
				} else {
					alert("문제가 발생했습니다.");
				}
		  }
			
		  
	  })
	  
	});
	
})


</script>



