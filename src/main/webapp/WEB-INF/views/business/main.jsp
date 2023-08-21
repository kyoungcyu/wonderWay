<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap')
	;
</style>
<head>
<title>Booking - main</title>

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap')
	;

.rounded-image-container {
	height: 100px;
	overflow: hidden;
	border-radius: 30px;
	opacity: 0.3;
	position: relative;
}

.rounded-image-container img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	pointer-events: none;
}

#txt {
	position: absolute;
	left: 300px;
	bottom: 20px;
	font-size: xxx-large;
	font-family: 'Black Han Sans', sans-serif;
}

.hi {
	height: 100px;
}
</style>

</head>

<body>
	<main>



		<!-- =======================
Content START -->
		<section class="pt-0">
			<div class="container vstack gap-4">

				<!-- Title START -->
				<!-- 				<div class="row"> -->
				<!-- 					<div class="col-12"> -->
				<!-- 						<h1 class="fs-4 mb-0"> -->
				<!-- 							<i class="bi bi-house-door fa-fw me-1"></i>업체 현황 (예약,문의,리뷰) -->
				<!-- 						</h1> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!-- Title END -->


				<c:set var="busiVO" value="${data}" />
				<div class="container">
					<div class="card rounded-3 p-3 pb-2">
						<div class="rounded-image-container">
							<img src="/resources/upload/busi${busiVO.busiImg}" alt="">
						</div>
						<h4 id="txt" class="mb-2 mb-sm-0 ms-sm-3">
							<span class="fw-light">${busiVO.rprsvNm} 사장님 반갑습니다.</span>
						</h4>
					</div>
				</div>
				<!--  표 위에 슬라이더 -->
				<div class="container">
					<!-- Slider START -->
					<div class="tiny-slider arrow-round arrow-blur arrow-hover">
						<div class="tiny-slider-inner" data-autoplay="true"
							data-arrow="true" data-edge="2" data-dots="false"
							data-items-xl="3" data-items-lg="2" data-items-md="1">
							
							<!-- Slider item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<!-- Title and content -->
										<div class="col-sm-6">
											<div class="card-body px-3">
												<h6 class="card-title">
													<a href="/business/reserve/resList" class="stretched-link">오늘
														예약  <span style="font-size: large; color: blue;">${todayRsv}</span>건</a>
												</h6>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Slider item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<!-- Title and content -->
										<div class="col-sm-6">
											<div class="card-body px-3">
												<h6 class="card-title">
													<a href="/business/reserve/rfdList" class="stretched-link">오늘 예약
														취소  <span style="font-size: large; color: fuchsia;">${todayRfd}</span>건</a>
												</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<!-- Slider item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<!-- Image -->

										<!-- Title and content -->
										<div class="col-sm-6">
											<div class="card-body px-3">
												<h6 class="card-title">
													<a href="/business/review/bsReview" class="stretched-link">오늘
														리뷰  <span style="font-size: large; color: purple;">${todayRvw}</span>개</a>
												</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							

						</div>
					</div>
					<!-- Slider END -->
				</div>
				<!--  표 위에 슬라이더 END -->









				<!-- Graph START -->
				<div class="row g-4">

					<!-- 오늘 입실 자  START -->
					<div class="col-lg-7 col-xl-6">
						<!-- Chart START -->
						<div class="card border h-100">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<h5 class="card-header-title">오늘 입실하는 방</h5>
							</div>
							<!-- Card body -->
							<div class="card-body ">
								<!-- Table head -->
								<div class="bg-warning rounded p-3 d-none d-lg-block">
									<div class="row row-cols-7 g-4">
										<!-- 										<div class="col" style="text-align: center;"> -->
										<!-- 											<h6 class="mb-0">NO</h6> -->
										<!-- 										</div> -->
										<div class="col" style="text-align: center;">
											<h6 class="mb-0">예약된 객실</h6>
										</div>
										<div class="col" style="text-align: center;">
											<h6 class="mb-0">예약자</h6>
										</div>
										<div class="col" style="text-align: center;">
											<h6 class="mb-0">체크인</h6>
										</div>
									</div>
								</div>

								<!-- Table body START -->
								<c:forEach var="checkInList" items="${checkInData.content}"
									varStatus="stat">
									<div
										class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
										<!-- 										<div class="col" style="text-align: center;"> -->
										<!-- 											<small class="d-block d-lg-none">NO</small> -->
										<%-- 											<h6 class="mb-0 fw-normal">${checkInList.rnum}</h6> --%>
										<!-- 										</div> -->

										<div class="col" style="text-align: center;">
											<small class="d-block d-lg-none">방</small>
											<h6 class="mb-0 fw-normal">${checkInList.rmNum}
												(${checkInList.rmNm})</h6>
										</div>

										<div class="col" style="text-align: center;">
											<small class="d-block d-lg-none">name</small>
											<h6 class="mb-0 fw-normal">${checkInList.memNm}
												<a tabindex="0" class="h6 mb-0" role="button"
													data-bs-toggle="popover" data-bs-trigger="focus"
													data-bs-placement="top"
													data-bs-content="${checkInList.memTel}"
													data-bs-original-title="${checkInList.memNm} (${checkInList.memGen})" title=""> <i
													class="bi bi-info-circle small"></i>
												</a>
											</h6>


										</div>

										<!-- 체크인 버튼 -->
										<div class="col" style="text-align: center;">
											<c:if test="${checkInList.checkIn eq 'Y'}">
												<div class="badge bg-success bg-opacity-10 text-info">체크인
													완료</div>
											</c:if>
											<c:if test="${checkInList.checkIn eq 'N'}">
												<a href="#" id="${checkInList.rsvId}" class="btn btn-sm btn-danger-soft checkin">CHECK
													IN</a>
											</c:if>

										</div>
									</div>
								</c:forEach>
							</div>

							<!-- Card footer START -->
							<div class="card-footer pt-0">

								<!-- 페이징 처리 시작 -->
								<c:set var="currentPage1" value="${param.currentPage1}" />
								<c:if test="${fn:length(currentPage1) < 1}">
									<c:set var="currentPage1" value="1" />
								</c:if>

								<div class="card-footer pt-0">
									<!-- Pagination and content -->
									<div
										class="d-sm-flex justify-content-sm-between align-items-sm-center">
										<!-- Content -->
										<p class="mb-sm-0 text-center text-sm-start">
									Showing 
									<c:if test="${checkInData.total == 0}">
										${checkInData.total}
									</c:if>
									<c:if test="${checkInData.total > 0}">
										${currentPage1*4-3} 
									</c:if>
									to
									<c:if test="${checkInData.total <= currentPage1*4}">
										${checkInData.total}
									</c:if>
									<c:if test="${checkInData.total > currentPage1*4}">
										${currentPage1*4}
									</c:if>
									
									 of ${checkInData.total} entries
								</p>
										<!-- Pagination -->
										<nav class="mb-sm-0 d-flex justify-content-center"
											aria-label="navigation">
											<ul
												class="pagination pagination-sm pagination-primary-soft mb-0">
												<li
													class="page-item  <c:if test='${checkInData.startPage < 4}'>disabled</c:if>">
													<a class="page-link"
													href="/business/main?currentPage1=${checkInData.startPage-3}&currentPage2=${param.currentPage2}">Prev</a>
												</li>
												<c:forEach var="pNo" begin="${checkInData.startPage}"
													end="${checkInData.endPage}">
													<li
														class="page-item <c:if test='${pNo==currentPage1}'>active</c:if>"
														id="${pNo}"><a class="page-link"
														href="/business/main?currentPage1=${pNo}&currentPage2=${param.currentPage2}">${pNo}</a></li>
												</c:forEach>

												<li
													class="page-item  <c:if test='${checkInData.endPage == checkInData.totalPages}'>disabled</c:if>">
													<a class="page-link"
													href="/business/main?currentPage1=${checkInData.startPage+3}&currentPage2=${param.currentPage2}">Next</a>
												</li>
											</ul>
										</nav>
									</div>
								</div>
								<!-- 페이징 처리 끝 -->


							</div>
						</div>
						<!-- Chart END -->
					</div>
					<!-- 오늘 입실 자  END -->



					<!-- 오늘 퇴실 자  START -->
					<div class="col-lg-7 col-xl-6">
						<!-- Chart START -->
						<div class="card border h-100">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<h5 class="card-header-title">오늘 퇴실하는 방</h5>
							</div>
							<!-- Card body -->
							<div class="card-body ">
								<!-- Table head -->
								<div class="bg-success rounded p-3 d-none d-lg-block">
									<div class="row row-cols-7 g-4">
										<!-- 										<div class="col" style="text-align: center;"> -->
										<!-- 											<h6 class="mb-0">NO</h6> -->
										<!-- 										</div> -->
										<div class="col" style="text-align: center;">
											<h6 class="mb-0">나가는 객실</h6>
										</div>
										<div class="col" style="text-align: center;">
											<h6 class="mb-0">퇴실자</h6>
										</div>
										<div class="col" style="text-align: center;">
											<h6 class="mb-0">체크아웃</h6>
										</div>
									</div>
								</div>

								<!-- Table body START -->
								<c:forEach var="checkOutList" items="${checkOutData.content}"
									varStatus="stat">
									<div
										class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
										<!-- 										<div class="col" style="text-align: center;"> -->
										<!-- 											<small class="d-block d-lg-none">NO</small> -->
										<!-- 											<h6 class="mb-0 fw-normal">1</h6> -->
										<!-- 										</div> -->

										<div class="col" style="text-align: center;">
											<small class="d-block d-lg-none">나가는 객실</small>
											<h6 class="mb-0 fw-normal">${checkOutList.rmNum}
												(${checkOutList.rmNm})</h6>
										</div>

										<div class="col" style="text-align: center;">
											<small class="d-block d-lg-none">퇴실자</small>
											<h6 class="mb-0 fw-normal">${checkOutList.memNm}
												<a tabindex="0" class="h6 mb-0" role="button"
													data-bs-toggle="popover" data-bs-trigger="focus"
													data-bs-placement="top"
													data-bs-content="${checkOutList.memTel}"
													data-bs-original-title="${checkOutList.memNm} (${checkOutList.memGen})" title=""> <i
													class="bi bi-info-circle small"></i>
												</a>
											</h6>
										</div>

										<!-- 체크아웃 버튼 -->
										<div class="col" style="text-align: center;">
											<c:if test="${checkOutList.checkOut eq 'Y'}">
												<div class="badge bg-success bg-opacity-10 text-info">체크아웃
													완료</div>
											</c:if>
											<c:if test="${checkOutList.checkOut eq 'N'}">
												<a href="#" id="${checkOutList.rsvId}" class="btn btn-sm btn-warning-soft checkout">CHECK
													OUT</a>
											</c:if>
										</div>
									</div>
								</c:forEach>
							</div>

							<!-- Card footer START -->
							<div class="card-footer pt-0">




								<!-- 페이징 처리 시작 -->
								<c:set var="currentPage2" value="${param.currentPage2}" />
								<c:if test="${fn:length(currentPage2) < 1}">
									<c:set var="currentPage2" value="1" />
								</c:if>

								<div class="card-footer pt-0">
									<!-- Pagination and content -->
									<div
										class="d-sm-flex justify-content-sm-between align-items-sm-center">
										<!-- Content -->
										<p class="mb-sm-0 text-center text-sm-start">
									Showing 
									<c:if test="${checkOutData.total == 0}">
										${checkOutData.total}
									</c:if>
									<c:if test="${checkOutData.total > 0}">
										${currentPage1*4-3} 
									</c:if>
									to
									<c:if test="${checkOutData.total <= currentPage1*4}">
										${checkOutData.total}
									</c:if>
									<c:if test="${checkOutData.total > currentPage1*4}">
										${currentPage1*4}
									</c:if>
									
									 of ${checkOutData.total} entries
								</p>
										<!-- Pagination -->
										<nav class="mb-sm-0 d-flex justify-content-center"
											aria-label="navigation">
											<ul
												class="pagination pagination-sm pagination-primary-soft mb-0">
												<li
													class="page-item  <c:if test='${checkOutData.startPage < 6}'>disabled</c:if>">
													<a class="page-link"
													href="/business/main?currentPage1=${param.currentPage1}&currentPage2=${checkOutData.startPage-3}">Prev</a>
												</li>
												<c:forEach var="pNo" begin="${checkOutData.startPage}"
													end="${checkOutData.endPage}">
													<li
														class="page-item <c:if test='${pNo==currentPage2}'>active</c:if>"
														id="${pNo}"><a class="page-link"
														href="/business/main?currentPage1=${param.currentPage1}&currentPage2=${pNo}">${pNo}</a>
													</li>
												</c:forEach>

												<li
													class="page-item  <c:if test='${checkOutData.endPage == checkOutData.totalPages}'>disabled</c:if>">
													<a class="page-link"
													href="/business/main?currentPage1=${param.currentPage1}&currentPage2=${checkOutData.startPage+3}">Next</a>
												</li>
											</ul>
										</nav>
									</div>
								</div>
								<!-- 페이징 처리 끝 -->

							</div>
						</div>
						<!-- Chart END -->
					</div>
					<!-- 오늘 퇴실 자  END -->
				</div>


			</div>
		</section>
		<!-- =======================
Content END -->

	</main>

<script type="text/javascript">
$(".checkin").on("click",function(e){
	e.preventDefault();
	var rsvId = e.target.id;
	console.log("checkin/rsvId"+rsvId);
	
	$.ajax({
	    url:'/business/main/checkInAjax',
	    type:'post',
	    data:{'rsvId':rsvId}, //보낼 데이터
	    beforeSend : function (xhr) {
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
	    success: function(data) {
	        if(data == 1){
	        	alert("체크인이 완료되었습니다.");
	        	window.location.href="/business/main?currentPage1=${param.currentPage1}&currentPage2=${param.currentPage2}"
	        }else{
	        	alert("체크인을 정상적으로 완료하지 못했습니다.");
	        }
	    },
	    error: function(err) {
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
	    }
	});

	
});

$(".checkout").on("click",function(e){
	e.preventDefault();
	var rsvId = e.target.id;
	console.log("checkout/rsvId"+rsvId);
	
	$.ajax({
	    url:'/business/main/checkOutAjax',
	    type:'post',
	    data:{'rsvId':rsvId}, //보낼 데이터
	    beforeSend : function (xhr) {
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
	    success: function(data) {
	        if(data == 1){
	        	alert("체크아웃이 완료되었습니다.");
	        	window.location.href="/business/main?currentPage1=${param.currentPage1}&currentPage2=${param.currentPage2}"
	        }else{
	        	alert("체크아웃을 정상적으로 완료하지 못했습니다.");
	        }
	    },
	    error: function(err) {
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
	    }
	});
	
});

</script>



</body>
</html>