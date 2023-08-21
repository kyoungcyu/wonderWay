<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<script
	src="/resources/booking/assets/vendor/flatpickr/js/flatpickr.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/flatpickr/css/flatpickr.min.css">
<style>

.hi {
	display: flex;
	justify-content: flex-end;
}
</style>
<body>
	<br />
	<div class="container vstack gap-4">
		<!-- Title START -->
		<div class="row">
			<div class="col-12">
				<h1 class="fs-4 mb-0">
					<i class="bi bi-caret-right-square fa-fw me-1"></i>사업자 등록증 인식 시연영상
				</h1>
			<a href="javascript:history.go(-1)" class="btn btn-sm btn-primary-soft mb-0"> <i class="bi bi-reply me-1"></i> 뒤로 가기
			</a>
			</div>
		</div>
		<!-- Title END -->

		<!-- Counter START -->
		<div class="row">
			<div class="col-12">
				<div class="card border h-100">
				
					<!-- Card header START -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">사업자 등록증 사진찍고 텍스트 추출하여 정보 자동입력하는 인공지능(기능)</h5>
					</div>
					<!-- Card header END -->

					<!-- Card body START -->
					<div class="card-body">
						<video width="640" height="640" controls>
							<source src="/resources/upload/testing/registerTesting.mp4" type="video/mp4">
						</video>
					</div>

					<!-- Card body END -->
					
					
				</div>
			</div>
		</div>
	</div>
</body>

