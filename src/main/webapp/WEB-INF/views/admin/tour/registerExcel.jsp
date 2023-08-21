<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description"
	content="Booking - Multipurpose Online Booking Theme">


<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/choices/css/choices.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/stepper/css/bs-stepper.min.css">
<script src="/resources/booking/assets/vendor/choices/js/choices.min.js"></script>

<script type="text/javascript">
	$(function() {
		console.log("Welcome");		
		
		$("#inputGroupFile04").on("change", function() {
			console.log("onChanged");
			let formData = new FormData($("#frm01").get(0));
			
			$.ajax({
				url : "/admin/tour/detailExcelPost",
				type : "post",
				data : formData,
				processData : false,
				contentType : false,
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(success) {
// 					console.log("success : " + JSON.stringify(success));
					let str = "";
					if(success != null) {
						success.forEach(function(tourVO) {
							str += `<div class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">`;
							str += `<div class="col" style="text-align: center;">`;
							str += `<small class="d-block d-lg-none">명칭:</small>`;
							str += `<h6 class="mb-0 fw-normal">\${tourVO.tourNm}</h6>`;
							str += `</div>`;
							str += `<div class="col" style="text-align: center;">`;
							str += `<small class="d-block d-lg-none">지역:</small>`;
							str += `<h6 class="mb-0 fw-normal">\${tourVO.tourLoc}</h6>`;
							str += `</div>`;
							str += `<div class="col" style="text-align: center;">`;
							str += `<small class="d-block d-lg-none">위도:</small>`;
							str += `<h6 class="mb-0 fw-normal">\${tourVO.lati}</h6>`;
							str += `</div>`;
							str += `<div class="col" style="text-align: center;">`;
							str += `<small class="d-block d-lg-none">경도:</small>`;
							str += `<h6 class="mb-0 fw-normal">\${tourVO.longi}</h6>`;
							str += `</div>`;
							str += `<div class="col" style="text-align: center;">`;
							str += `<small class="d-block d-lg-none">개요:</small>`;
							str += `<h6 class="mb-0 fw-normal">\${tourVO.tourDc}</h6>`;
							str += `</div>`;
							str += `</div>`;
						});
						
						$("#textMain").append(str);
					}
				}
			});
		});
		
		$("#btnTourRegist").on("click", function() {
			console.log("onChanged");
// 			$("#frm01").attr("action", "/admin/tour/tourExcelRegister");
			$("#frm01").submit();
		});
	});
</script>
</head>

<body>
	<!-- **************** MAIN CONTENT START **************** -->
	<main>
		<!-- Page main content START -->
		<div class="page-content-wrapper p-xxl-4">
			<div class="row g-4 align-items-center">
				<div class="col-lg-5">
					<h1 class="h3 mb-3 mb-sm-0">여행지 등록</h1>
				</div>
			</div>
			<!-- Filters END -->
			<!-- Guest list START -->
			<div class="card shadow mt-5">
				<!-- Card body START -->
				<div class="card-body">
					<!-- Table head --> 
					<div class="row g-4">
						<!-- Profile setting -->
						<div class="col-lg-12">
							<div class="card shadow">
								<div class="card-header border-bottom">
									<h5 class="card-header-title">파일 등록</h5>
								</div>
								<form id="frm01" name="frm01" action="/admin/tour/tourExcelRegister" method="post" enctype="multipart/form-data">
									<div class="card-body">
										<div class="row g-4 align-items-center">
											<div class="col-xl-8">
												<label class="form-label">파일 선택(.xls, .xlsx)</label>
												<input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" 
													  		 name="file" accept="application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" aria-label="Upload">
											</div>										
											<div class="col-xl-4">
												<label class="form-label">여행지 분류</label>
												<select id="selectCode" name="tourCode" class="form-select js-choice" aria-label=".form-select-sm" >
													<option value="">선택해주세요</option>
													<option value="SL">레포츠</option>
													<option value="SS">공연</option>
													<option value="SV">휴양관광지</option>
													<option value="SC">문화시설</option>
													<option value="SF">축제,행사</option>
													<option value="SN">자연관광지</option>
													<option value="SH">역사관광지</option>
												</select>
											</div>	
											<div class="col-xl-6">
											</div>									
											<div class="col-xl-6" >
												<ul class="pagination pagination-sm pagination-primary-soft mb-0 " style="float: right;">
													<li class="page-item">
														<button id="btnTourRegist" type="button" class="btn btn-primary" >등록</button>
													</li>
													<li class="page-item">
														<a href="list" type="button" class="btn btn-secondary" >취소</a>
													</li>
												</ul>
											</div>									
										</div>
									</div>
									<sec:csrfInput />
								</form>
							</div>
						</div>
						<!-- Notification Setting -->
						<div class="col-lg-12">
							<div class="card shadow">
								<div class="card-header border-bottom">
									<h5 class="card-title mb-0">여행지 목록</h5>
								</div>
								<div id="textMain" class="card-body">
									<!-- Table head -->
									<div class="bg-light rounded p-3 d-none d-lg-block">
										<div class="row row-cols-7 g-4">
											<div class="col" style="text-align: center;">
												<h6 class="mb-0">명칭</h6>
											</div>
											<div class="col" style="text-align: center;">
												<h6 class="mb-0">주소</h6>
											</div>
											<div class="col" style="text-align: center;">
												<h6 class="mb-0">위도</h6>
											</div>
											<div class="col" style="text-align: center;">
												<h6 class="mb-0">경도</h6>
											</div>
											<div class="col" style="text-align: center;">
												<h6 class="mb-0">개요</h6>
											</div>
										</div>
									</div>
				
									<!-- Table data -->
<%-- 									<c:forEach var="tourVO" items="${data}" varStatus="stat"> --%>
<!-- 										<div class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4"> -->

<!-- 											<div class="col" style="text-align: center;"> -->
<!-- 												<small class="d-block d-lg-none">명칭:</small> -->
<%-- 												<h6 class="mb-0 fw-normal">${tourVO.tourNm}</h6> --%>
<!-- 											</div> -->
				
<!-- 											Data item -->
<!-- 											<div class="col" style="text-align: center; margin-left: 6px"> -->
<!-- 												<small class="d-block d-lg-none">주소:</small> -->
<%-- 												<h6 class="mb-0 fw-normal">${tourVO.tourLoc}</h6> --%>
<!-- 											</div> -->
				
<!-- 											Data item -->
<!-- 											<div class="col" style="text-align: center;"> -->
<!-- 												<small class="d-block d-lg-none">위도:</small> -->
<%-- 												<h6 class="mb-0 fw-normal">${tourVO.lati}</h6> --%>
<!-- 											</div> -->
				
<!-- 											Data item -->
<!-- 											<div class="col" style="text-align: center;"> -->
<!-- 												<small class="d-block d-lg-none">경도:</small> -->
<%-- 												<h6 class="mb-0 fw-normal">${tourVO.longi}</h6> --%>
<!-- 											</div> -->

<!-- 											Data item -->
<!-- 											<div class="col" style="text-align: center;"> -->
<!-- 												<small class="d-block d-lg-none">개요:</small> -->
<%-- 												<h6 class="mb-0 fw-normal">${tourVO.tourDc}</h6> --%>
<!-- 											</div> -->
<!-- 										</div> -->
<%-- 									</c:forEach> --%>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Card body END -->
		
				<!-- Card footer START -->
				<div class="card-footer pt-0">
					<!-- Pagination and content -->
					<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
						<p class="mb-sm-0 text-center text-sm-start"></p>
						<!-- Pagination -->
						<div class="bs-stepper-header" role="tablist">
							<!-- Step 1 -->
							<div class="step" data-target="#step-1">
								<div class="text-center">
									<button type="button" class="btn btn-link step-trigger mb-0" role="tab" id="steppertrigger1" aria-controls="step-1" aria-selected="true">
										<span class="bs-stepper-circle">1</span>
									</button>
								</div>
							</div>
			
							<!-- Step 2 -->
							<div class="step" data-target="#step-2">
								<div class="text-center">
									<button type="button" class="btn btn-link step-trigger mb-0" role="tab" id="steppertrigger2" aria-controls="step-2" aria-selected="false">
										<span class="bs-stepper-circle">2</span>
									</button>
								</div>
							</div>
			
							<!-- Step 3 -->
							<div class="step active" data-target="#step-3">
								<div class="text-center">
									<button type="button" class="btn btn-link step-trigger mb-0" role="tab" id="steppertrigger3" aria-controls="step-3" aria-selected="false">
										<span class="bs-stepper-circle">3</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Card footer END -->
			</div>
		</div>
	</main>
	<!-- **************** MAIN CONTENT END **************** -->
</body>
