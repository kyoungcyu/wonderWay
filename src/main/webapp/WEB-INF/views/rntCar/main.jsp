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

    /* 슬라이더 이미지 크기 조정 */
 .slider-image {
     width: 100%;
     height: 230px; /* 원하는 높이로 조정 */
     object-fit: cover;
 }
.bg-light-custom {
        color: white;
        background-color: #E5E8E8   ;
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
							data-items-xl="2" data-items-lg="2" data-items-md="1">
							
							<!-- Slider item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<!-- Title and content -->
										<div class="col-sm-6">
											<div class="card-body px-3">
												<h6 class="card-title">
													<a href="/rntCar/reserve/rsvCarList" class="stretched-link">오늘
														예약 <span style="font-size: large; color: blue;">${tdCar.total} </span>건</a>
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
													<a  class="stretched-link">오늘 
														반납  <span style="font-size: large; color: red;">${tdRf.total}</span>건</a>
												</h6>
											</div>
										</div>
									</div>
								</div>
								<P>
							</div>
						</div>
					</div>
					<!-- Slider END -->
				</div>
				<!--  표 위에 슬라이더 END -->
				
				<div class="container">
			    <!-- Slider START -->
				    <div class="tiny-slider arrow-round arrow-blur arrow-hover">
				        <div class="tiny-slider-inner" data-autoplay="true"
				            data-arrow="true" data-edge="2" data-dots="false"
				            data-items-xl="3" data-items-lg="2" data-items-md="1">
				
							<c:forEach var="tdImg" items="${tdCar.content}">
				            <!-- Slider item -->
				            <div class="card border rounded-3 overflow-hidden">
				                <img src="${tdImg.carImg}" class="rounded-3 slider-image" alt="" >
				                <div class="card-img-overlay d-flex align-items-start flex-column p-3 brdList">
			                         <a tabindex="0" class="badge text-bg-secondary" role="button"
										data-bs-toggle="popover" data-bs-trigger="focus"
										data-bs-placement="top"  
										<c:set var="memTel" value="${tdImg.memTel}" />
										<c:set var="formattedTel" value="${memTel.substring(0, 3)}-${memTel.substring(3, 7)}-${memTel.substring(7)}" />
										data-html="true"
										data-bs-content="${formattedTel} "
										data-bs-original-title="회원 번호" title=""> 
										<i
										class="bi bi-file-earmark-person style="color: #ffffff;">${tdImg.memNm}</i>
									</a>     
			                     </div>
				                <a href="/business/review/bsReview"></a>
				                <div class="hover-element w-100 h-100">
				                </div>
				            </div>
				            </c:forEach>
					    </div>
					</div>
				</div>
				
				
				<div class="row g-4">
					<!-- 오늘 입실 자  START -->
					<div class="col-lg-7 col-xl-6">
						<!-- Chart START -->
						<div class="card border h-100">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<h5 class="card-header-title">당일 출고차량 
								
								
							</div>
							<!-- Card body -->
							<div class="card-body ">
								<!-- Table head -->
								<div class="bg-light-custom rounded p-3 d-none d-lg-block">
									<div class="row row-cols-7 g-4">
										
										<div class="col" style="text-align: center;">
											<h6 class="mb-0">차 종류(번호)</h6>
										</div>
										<div class="col" style="text-align: center;">
											<h6 class="mb-0">회원명</h6>
										</div>
										<div class="col" style="text-align: center;">
											<h6 class="mb-0">출고 여부</h6>
										</div>
									</div>
								</div>
								<!-- Table body START -->
								<c:forEach var="tdCar" items="${tdCar.content}">
								<div
										class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
										<!-- 										<div class="col" style="text-align: center;"> -->
										<!-- 											<small class="d-block d-lg-none">NO</small> -->
										<%-- 											<h6 class="mb-0 fw-normal">${checkInList.rnum}</h6> --%>
										<!-- 										</div> -->
											<div class="col" style="text-align: center;">
												<small class="d-block d-lg-none">차종류</small>
												<h6 class="mb-0 fw-normal">${tdCar.carKnd}<br/>(${tdCar.carNum})</h6>
											</div>
	
											<div class="col" style="text-align: center;">
												<small class="d-block d-lg-none">name</small>
												<h6 class="mb-0 fw-normal">${tdCar.memNm}
													<a tabindex="0" class="h6 mb-0" role="button"
														data-bs-toggle="popover" data-bs-trigger="focus"
														data-bs-placement="top"
														<c:set var="memTel" value="${tdCar.memTel}" />
														<c:set var="formattedTel" value="${memTel.substring(0, 3)}-${memTel.substring(3, 7)}-${memTel.substring(7)}" />
														data-bs-content="번호 : ${formattedTel}"
														data-bs-original-title="회원정보" title=""> <i
														class="bi bi-info-circle small"></i>
													</a>
												</h6>
											</div>
											<!-- 체크인 버튼 -->
											<div class="col " style="text-align: center;">
													<label for="myCheckbox"></label>
	  													<input type="checkbox"  id="${tdCar.rsvId}" class="checkSt"
	  													<c:if test="${not empty tdCar.rntSt}">
	  														checked
	  													</c:if>
	  													/>
	  													 <span class="checkmark"></span>
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
										<p class="mb-sm-0 text-center text-sm-start">Showing
											${currentPage1*5-4} to
											   <c:if test="${tdCar.total <= currentPage1*5}">
					                              ${tdCar.total}
					                           </c:if>
					                           <c:if test="${tdCar.total > currentPage1*5}">
					                              ${currentPage1*5}
					                           </c:if>
											 of
											${tdCar.total} entries</p>
										<!-- Content -->
										<!-- Pagination -->
										<nav class="mb-sm-0 d-flex justify-content-center"
											aria-label="navigation">
											<ul
												class="pagination pagination-sm pagination-primary-soft mb-0">
												<li
													class="page-item  <c:if test='${tdCar.startPage < 5}'>disabled</c:if>">
													<a class="page-link"
													href="/rntCar/main?currentPage1=${tdCar.startPage-3}&currentPage2=${param.currentPage2}">Prev</a>
												</li>
												<c:forEach var="pNo" begin="${tdCar.startPage}"
													end="${tdCar.endPage}">
													<li
														class="page-item <c:if test='${pNo==currentPage1}'>active</c:if>"
														id="${pNo}"><a class="page-link"
														href="/rntCar/main?currentPage1=${pNo}&currentPage2=${param.currentPage2}">${pNo}</a></li>
												</c:forEach>

												<li
													class="page-item  <c:if test='${tdCar.endPage == tdCar.totalPages}'>disabled</c:if>">
													<a class="page-link"
													href="/rntCar/main?currentPage1=${tdCar.startPage+3}&currentPage2=${param.currentPage2}">Next</a>
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
								<h5 class="card-header-title">당일 반납차량</h5>
							</div>
							<!-- Card body -->
							<div class="card-body ">
								<!-- Table head -->
								<div class="bg-light-custom rounded p-3 d-none d-lg-block">
									<div class="row row-cols-7 g-4">
										<div class="col" style="text-align: center;">
											<h6 class="mb-0">차 종류(번호)</h6>
										</div>
										<div class="col" style="text-align: center;">
											<h6 class="mb-0">회원명</h6>
										</div>
										<div class="col" style="text-align: center;">
											<h6 class="mb-0">반납 여부</h6>
										</div>
									</div>
								</div>
								<!-- Table body START -->
								<c:forEach var="tdRf" items="${tdRf.content}">
									<div
										class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
											<div class="col" style="text-align: center;">
												<small class="d-block d-lg-none">차종류</small>
												<h6 class="mb-0 fw-normal">${tdRf.carKnd}<br/>(${tdRf.carNum})</h6>
											</div>
	
											<div class="col" style="text-align: center;">
												<small class="d-block d-lg-none">name</small>
												<h6 class="mb-0 fw-normal">${tdRf.memNm}
													<a tabindex="0" class="h6 mb-0" role="button"
														data-bs-toggle="popover" data-bs-trigger="focus"
														data-bs-placement="top"
														<c:set var="memTel" value="${tdRf.memTel}" />
														<c:set var="formattedTel" value="${memTel.substring(0, 3)}-${memTel.substring(3, 7)}-${memTel.substring(7)}" />
														data-bs-content="번호 : ${formattedTel}"
														data-bs-original-title="회원정보" title=""> <i
														class="bi bi-info-circle small"></i>
													</a>
												</h6>
											</div>
											<!-- 체크인 버튼 -->
											<div class="col" style="text-align: center;">
													<label for="myCheckbox" ></label>
	  													<input type="checkbox" id="${tdRf.rsvId}"  class="checkEd"
	  													<c:if test="${not empty tdRf.rntEd}">
	  														checked
	  													</c:if>
	  													/>
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
										<p class="mb-sm-0 text-center text-sm-start">Showing
											${currentPage2*5-4} to
											 <c:if test="${tdRf.total <=  currentPage2*5}">
					                              ${tdRf.total}
					                           </c:if>
					                           <c:if test="${tdRf.total > currentPage2*5}">
					                               ${currentPage2*5} 
					                           </c:if>
												of	${tdRf.total} entries</p>
										<!-- Pagination -->
										<nav class="mb-sm-0 d-flex justify-content-center"
											aria-label="navigation">
											<ul
												class="pagination pagination-sm pagination-primary-soft mb-0">
												<li
													class="page-item  <c:if test='${tdRf.startPage < 6}'>disabled</c:if>">
													<a class="page-link"
													href="/rntCar/main?currentPage1=${param.currentPage1}&currentPage2=${tdRf.startPage-3}">Prev</a>
												</li>
												<c:forEach var="pNo" begin="${tdRf.startPage}"
													end="${tdRf.endPage}">
													<li
														class="page-item <c:if test='${pNo==currentPage2}'>active</c:if>"
														id="${pNo}"><a class="page-link"
														href="/rntCar/main?currentPage1=${param.currentPage1}&currentPage2=${pNo}">${pNo}</a>
													</li>
												</c:forEach>

												<li
													class="page-item  <c:if test='${tdRf.endPage == tdRf.totalPages}'>disabled</c:if>">
													<a class="page-link"
													href="/rntCar/main?currentPage1=${param.currentPage1}&currentPage2=${tdRf.startPage+3}">Next</a>
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
				
				
				
				
				
				
		</section>
		<!-- =======================
Content END -->

	</main>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(function(){
	
$(".checkSt").on("click",function(e){
	var rsvId= e.target.id
	console.log(rsvId+'RddRR');
	data={
		"rsvId" : rsvId
	}
	console.log("data:", data);
	$.ajax({
			type : "POST",
			url : "/rntCar/main/checkSt",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr) {
			xhr.setRequestHeader(
			"${_csrf.headerName}","${_csrf.token}");
			},
			success : function(data) {
				swal({  icon: "success",
					text: "차량 대여 시작!",
				   
				});
				console.log(data);
		}
	});
});
$(".checkEd").on("click",function(e){
	var rsvId= e.target.id
	console.log(rsvId+'RddRR');
	data={
		"rsvId" : rsvId
	}
	console.log("data:", data);
	$.ajax({
			type : "POST",
			url : "/rntCar/main/checkEd",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr) {
			xhr.setRequestHeader(
			"${_csrf.headerName}","${_csrf.token}");
			},
			success : function(result) {
				console.log(result);
				
				$.ajax({
					type : "POST",
					url : "/rntCar/main/plusFee",
					data : {
						"rsvId" : rsvId
					},
					dataType : "json",
					beforeSend : function(xhr) {
					xhr.setRequestHeader(
					"${_csrf.headerName}","${_csrf.token}");
					},
					success : function(data) {
						var plusFee = data;
						function formatNumberWithCommas(number) {
							  return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
							}

							// 패턴으로 포맷팅된 결과
							var formattedPlusFee = formatNumberWithCommas(plusFee);
							
						swal({  icon: "warning",
								text: "추가 요금 발생!",
							    title: formattedPlusFee +"원",
							});
				}
			});
				
		}
	});
});
	
});

</script>



</body>
</html>