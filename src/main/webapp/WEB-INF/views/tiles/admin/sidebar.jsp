<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Sidebar START -->
<nav class="navbar sidebar navbar-expand-xl navbar-light">
	<!-- Navbar brand for xl START -->
	<div class="d-flex align-items-center">
		<a class="navbar-brand" href="/member/main">
			<img class="light-mode-item navbar-brand-item" src="/resources/booking/assets/images/logo.png" alt="logo">
		</a>
	</div>
	<!-- Navbar brand for xl END -->
	
	<div class="offcanvas offcanvas-start flex-row custom-scrollbar h-100" data-bs-backdrop="true" tabindex="-1" id="offcanvasSidebar">
		<div class="offcanvas-body sidebar-content d-flex flex-column pt-4">

			<!-- Sidebar menu START -->
			<ul class="navbar-nav flex-column" id="navbar-sidebar">
				<!-- Menu item -->
				<li class="nav-item"><a href="/admin/main" class="nav-link active">관리자 페이지</a></li>

				<!-- Title -->
				<li class="nav-item ms-2 my-2">Pages</li>

				<!-- Menu item -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#memmanage" role="button" aria-expanded="false" aria-controls="memmanage">
					회원 관리
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="memmanage" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="/admin/mem/list">전체 회원</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/mem/restriction">부적절 회원 관리</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/mem/counseling">회원 상담/채팅</a></li>
					</ul>
				</li>
				<!-- Menu item -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#accmmanage" role="button" aria-expanded="false" aria-controls="accmmanage">
					업체 관리
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="accmmanage" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="/admin/busi/sty">숙박 업체</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/busi/rnt">렌터카 업체</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/busi/counseling">업체 상담/채팅</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/busi/busiSales">업체별 정산 내역</a></li>
					</ul>
				</li>
				<!-- Menu item -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#boardmanage" role="button" aria-expanded="false" aria-controls="boardmanage">
					커뮤니티 관리
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="boardmanage" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="/admin/brd/list">전체 게시판</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/brd/notice">공지사항</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/brd/review">리뷰</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/brd/faq">자주 묻는 질문</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/brd/inquiry">고객 문의</a></li>
					</ul>
				</li>
				
				<!-- 예약 관리 -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#reservemanage" role="button" aria-expanded="false" aria-controls="reservemanage">
					예약 관리
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="reservemanage" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="/admin/reserve/list">예약 목록</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/reserve/refund">환불 처리</a></li>
					</ul>
				</li>

				<!-- 광고 관리 -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#admanage" role="button" aria-expanded="false" aria-controls="admanage">
					광고 관리
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="admanage" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="/admin/advertise/list">광고 목록</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/advertise/request">광고 요청</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/advertise/setting">광고 설정</a></li>
					</ul>
				</li>

				<!-- 쿠폰 관리 -->
				<li class="nav-item"> <a class="nav-link" href="/admin/cupn/list">쿠폰 관리</a></li>

				<!-- 등급 관리 -->
				<li class="nav-item"> <a class="nav-link" href="/admin/grad/manage">등급 관리</a></li>
				
				<!-- 여행지 관리 -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#travelmanage" role="button" aria-expanded="false" aria-controls="travelmanage">
					여행지 관리
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="travelmanage" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="/admin/tour/list">여행지 목록</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/tour/magazineList">여행 매거진 관리</a></li>
					</ul>
				</li>

				<!-- 매출 관리 -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#salarymanage" role="button" aria-expanded="false" aria-controls="salarymanage">
						매출 관리
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="salarymanage" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="/admin/sales/salesList">매출 내역</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/sales/salesStats">매출 통계</a></li>
					</ul>
				</li>
			</ul>
			<!-- Sidebar menu end -->

			<!-- Sidebar footer START -->
			<div class="d-flex align-items-center justify-content-between text-primary-hover mt-auto p-3">
				<a class="h6 fw-light mb-0 text-body" href="#" onclick="logout()" data-bs-toggle="tooltip" data-bs-placement="top" aria-label="Sign out">
					<i class="fa-solid fa-arrow-right-from-bracket"></i> Log out
				</a>
				<sec:csrfInput/>
			</div>
			<!-- Sidebar footer END -->
			
		</div>
	</div>
</nav>
<!-- Sidebar END -->

<script>
function logout() {
    var csrfToken = document.querySelector('input[name=_csrf]').value;
    
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/logout');
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
    xhr.onload = function() {
        if (xhr.status === 200) {
            location.href = "/member/main";
        } else {
            console.error('로그아웃 요청 중 오류 발생:', xhr.statusText);
        }
    };
    xhr.onerror = function() {
        console.error('로그아웃 요청 중 네트워크 오류 발생');
    };
    xhr.send();
}
 
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
