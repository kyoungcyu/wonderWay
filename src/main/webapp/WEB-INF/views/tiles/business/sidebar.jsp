<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Sidebar START -->
<nav class="navbar sidebar navbar-expand-xl navbar-light">
	<!-- Navbar brand for xl START -->
	<div class="d-flex align-items-center">
		<a class="navbar-brand" href="/business/main">
			<img class="light-mode-item navbar-brand-item" src="/resources/booking/assets/images/logo.png" alt="logo">
		</a>
	</div>
	<!-- Navbar brand for xl END -->
	
	<div class="offcanvas offcanvas-start flex-row custom-scrollbar h-100" data-bs-backdrop="true" tabindex="-1" id="offcanvasSidebar">
		<div class="offcanvas-body sidebar-content d-flex flex-column pt-4">

			<!-- Sidebar menu START -->
			<ul class="navbar-nav flex-column" id="navbar-sidebar">
				<!-- Menu item -->
				<li class="nav-item"><a href="/business/main" class="nav-link active">HOME</a></li>

				<!-- Title -->
				<li class="nav-item ms-2 my-2"></li>

				<!-- Menu item -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#reserve" role="button" aria-expanded="false" aria-controls="reserve">
					예약 관리
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="reserve" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="/business/reserve/resList?currentPage=1">예약 내역</a></li>
						<li class="nav-item"> <a class="nav-link" href="/business/reserve/rfdList?currentPage=1">취소 내역</a></li>
					</ul>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#room" role="button" aria-expanded="false" aria-controls="room">
					업체 관리 
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="room" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="/business/room/mngRm">편의시설 관리</a></li>
						<li class="nav-item"> <a class="nav-link" href="/business/room/rmList?currentPage=1">방 관리</a></li>
						<li class="nav-item"> <a class="nav-link" href="/business/room/addRm">방 등록</a></li>
						<li class="nav-item"> <a class="nav-link" href="/business/myBusi/unmannedCheckIn">무인 체크인</a></li>
						<li class="nav-item"> <a class="nav-link" href="/business/myBusi/carNum">주차번호판 인식</a></li>
						<li class="nav-item"> <a class="nav-link" href="/business/parking">주차장 현황</a></li>
					</ul>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#calculate" role="button" aria-expanded="false" aria-controls="calculate">
					정산 내역관리
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="calculate" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="/business/calcul/bsCalculate"> 정산 내역 조회</a></li>
					</ul>
				</li>
				<!-- Menu item -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#contactManagement" role="button" aria-expanded="false" aria-controls="contactManagement">
					문의 관리
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="contactManagement" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="/business/inquiry/msgbox?tab=1">(회원과) 쪽지함</a></li>
						<li class="nav-item"> <a class="nav-link" href="/business/inquiry/chatting">(회원과) 실시간 채팅</a></li>
						<li class="nav-item"> <a class="nav-link" href="/business/inquiry/adminChatting">(원더웨이와) 채팅</a></li>
					</ul>
				</li>
				<!-- Menu item -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#review" role="button" aria-expanded="false" aria-controls="review">
					리뷰 관리
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="review" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="/business/review/bsReview">전체 리뷰 조회</a></li>
					</ul>
				</li>
				<!-- Menu item -->
				
				
				
				<!-- Menu item -->
				<li class="nav-item"> <a class="nav-link" href="/business/advertize/bsAd">광고</a></li>

				<!-- Menu item -->
				<li class="nav-item"> <a class="nav-link" href="/business/statis/bsStatis">통계</a></li>



			<div class="d-flex align-items-center justify-content-between text-primary-hover mt-auto p-3">
				<a class="h6 fw-light mb-0 text-body" href="/business/log/bsSignIn" data-bs-toggle="tooltip" data-bs-placement="top" aria-label="Sign out">
					<i class="fa-solid fa-arrow-right-from-bracket"></i> Log out
				</a>
			</div>
			
			<!-- Sidebar footer END -->
			
		</div>
	</div>
</nav>
<!-- Sidebar END -->

<script type="text/javascript">

$(function () {
	   // 현재 페이지 URL 가져오기
	   var nowLocation = window.location.href;

	   // 메뉴 항목의 링크와 현재 페이지 URL 비교하여 active 클래스 추가
	   $(".navbar-nav .nav-link").each(function () {
	      var link = $(this).attr("href");
	      if (nowLocation.indexOf(link) > -1) {
	         $(this).addClass("active");
	         // 상위 메뉴의 collapse 영역 열기
	         $(this).parents(".collapse").addClass("show");
	      }
	   });
	});


</script>