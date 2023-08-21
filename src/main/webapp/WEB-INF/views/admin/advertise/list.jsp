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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="/resources/booking/assets/vendor/choices/js/choices.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


<script type="text/javascript">
	$(function() {
		$(".advDetail").on("click", function() {
			//data-advertise-id="a001"
			let advId = $(this).data("advId");
			console.log("advId : " + advId);
			$("#detailModal").html();
			$.ajax({
				url : "/admin/advertise/advDetailPost",
				data : {
					"advId" : advId
				},
				type : "post",
				dataType : "json",
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					console.log(result.busiNm + " : " + result.adDc + " : " + result.existPay + " : " + result.remainDate);
					
					let str = "";
					str = `<ul class='list-group list-group-borderless'>`;
					str += `<li class='list-group-item mb-3'> <span>업체명:</span> <span class='h6 fw-normal ms-1 mb-0'>\${result.busiNm}</span> </li>`;
					str += `<li class='list-group-item mb-3'> <span>광고 종류:</span> <span class='h6 fw-normal ms-1 mb-0'>\${result.adDc}</span> </li>`;
					str += `<li class='list-group-item mb-3'> <span>게시 관리자명:</span> <span class='h6 fw-normal ms-1 mb-0'>\${result.adminNm}</span> </li>`;
					str += `<li class='list-group-item mb-3'> <span>금액:</span> <span id="adPr" class='h6 fw-normal ms-1 mb-0'>&#8361;\${result.adPr}</span> </li>`;
					str += `<li class='list-group-item mb-3'> <span>광고 기간:</span> <span class='h6 fw-normal ms-1 mb-0'>\${result.adPeriod}</span> </li>`;
					if(result.remainDate > 15 && result.remainDate <= 30) {
						str += `<li class='list-group-item mb-3'> <span>게시 여부:</span> <span class="badge bg-warning bg-opacity-10 text-warning">활성화</span> </li>`;
					} else if(result.remainDate > 0 && result.remainDate <= 15) {
						str += `<li class='list-group-item mb-3'> <span>게시 여부:</span> <span class="badge bg-danger bg-opacity-15 text-danger">만료 임박</span> </li>`;
					} else if(result.remainDate <= 0) {
						str += `<li class='list-group-item mb-3'> <span>게시 여부:</span> <span class="badge bg-secondary bg-opacity-15 text-secondary">만료</span> </li>`;
					} else {
						str += `<li class='list-group-item mb-3'> <span>게시 여부:</span> <span class="badge bg-success bg-opacity-15 text-success">활성화</span> </li>`;
					}
					str += `</ul>`;
		
					$("#detailModal").html(str);
		
					changeRsvDt();
		
				}
			});
		});
		
		$("#sort").on("change",function(){
			$("#frm01").submit();
		});
		
		let fp = $("#calender").flatpickr({
			enableTime: false,
		    dateFormat: "Y/m/d"
		});
		
		fp.config.onClose.push(function() {
			let date = $("#calender").val();
			console.log("flag : " + date);
			$("#calender").val(date);
			$("#frm01").submit();
		});
		
		$("#init").on("click", function() {
			$("#calender").val("");
			$("input[name=keyword]").val("");
			$("#sort").val("");
			
			$("#frm01").submit();
		});
	});

	function changeRsvDt() {
		// 금액 천단위 처리
		let obj = document.getElementById("adPr");
		let str = obj.innerHTML.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

		console.log("adPr : " + str);

		document.getElementById("adPr").innerHTML = str;
	}
</script>
</head>

<body>
	<!-- **************** MAIN CONTENT START **************** -->
	<main>

		<!-- Page main content START -->
		<div class="page-content-wrapper p-xxl-4">
			<!-- 개수 Start -->
			<div class="row g-4">
				<!-- Block item -->
				<div class="col-sm-6 col-xxl-4">
					<div class="card card-body bg-light p-4 h-100">
						<h6 class="mb-0">광고 중</h6>
						<br />
						<h4 class="mb-2 mt-2">
							${cntAdvActive }
						</h4>
					</div>
				</div>

				<!-- Block item -->
				<div class="col-sm-6 col-xxl-4">
					<div class="card card-body bg-light p-4 h-100">
						<h6 class="mb-0">만료 임박</h6>
						<br />
						<h4 class="mb-2 mt-2">
							${cntAdvExp }
						</h4>
					</div>
				</div>

				<!-- Block item -->
				<div class="col-sm-6 col-xxl-4" >
					<div class="card card-body bg-light p-4 h-100">
						<h6 class="mb-0">총 광고 금액 합계</h6>
						<br />
						<h4 class="mb-2 mt-2">
							&#8361; <fmt:formatNumber type="number" pattern="#,###" value="${sumAdvActive }" />
						</h4>
					</div>
				</div>
			</div>
			<!-- 개수 End -->
			<div class="card shadow mt-5">
				<!-- Filters START -->
				<form class="card-header border-bottom" id="frm01">
					<div class="row g-4 align-items-center">
						<div class="col-lg-5">
							<h5 class="h4 mb-3 mb-sm-0">광고 목록
								<a id="init" href="#s" class="h5 mb-0 text-body" >
									<i class="bi bi-arrow-clockwise"></i>
								</a>
							</h5>
						</div>
				
						<!-- 검색 -->
						<div class="d-flex align-items-center col-md-6 col-lg-2">
							<input class="form-control bg-transparent pe-5" type="search" placeholder="업체명" aria-label="Search" name="keyword" value="${param.keyword}">
							<button class="bg-transparent p-2 position-absolute translate-middle-y border-0 text-primary-hover text-reset" type="submit" 
								style="margin-left: 130px; margin-top: 45px">
								<i class="fas fa-search fs-6"></i>
							</button>
						</div>
						
						<!-- 기간 설정 -->
						<div class="d-flex align-items-center col-md-6 col-lg-3">
							<i class="bi bi-calendar fs-5 me-2 mt-2"></i>
							<div class="d-flex">
								<!-- Icon -->
								<!-- Date input -->
								<div class="form-control-border form-control-transparent form-fs-md">
									<input id="calender" type="text" class="form-control flatpickr-input" data-mode="range" placeholder="등록 일자를 선택하세요" 
										   name="period" value="<c:if test="${param.period!=''}">${param.period}</c:if>" readonly>
								</div>
							</div>
						</div>
				
						<!-- 정렬 -->
						<div class="col-md-6 col-lg-2">
							<select class="form-select js-choice" aria-label=".form-select-sm" name="sort" id="sort">
								<option value="" >선택해주세요</option>
								<option value="advKind" <c:if test="${param.sort=='advKind'}">selected</c:if>>광고 종류</option>
								<option value="advMtAsc" <c:if test="${param.sort=='advMtAsc'}">selected</c:if>>금액 ↑</option>
								<option value="advMtDesc" <c:if test="${param.sort=='advMtDesc'}">selected</c:if>>금액 ↓</option>
								<option value="busiNmAsc" <c:if test="${param.sort=='busiNmAsc'}">selected</c:if>>업체명 ↑</option>
								<option value="busiNmDesc" <c:if test="${param.sort=='busiNmDesc'}">selected</c:if>>업체명 ↓</option>
								<option value="active" <c:if test="${param.sort=='active'}">selected</c:if>>활성화 여부</option>
							</select>
						</div>
					</div>
				</form>
				<!-- Filters END -->

			<!-- Guest list START -->
				<!-- Card body START -->
				<div class="card-body">
					<!-- Table head -->
					<div class="bg-light rounded p-3 d-none d-lg-block">
						<div class="row row-cols-7 g-4">
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">업체명</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">등록 일자</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">광고 기간</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">광고 종류</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">게시 여부</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">상세</h6>
							</div>
						</div>
					</div>

					<!-- Table data -->
					<c:forEach var="advListVO" items="${data.content}" varStatus="stat">
						<div class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">회원명:</small>
								<div class="d-flex align-items-center" style="margin-left: 10px">
									<!-- Avatar -->
									<div class="avatar avatar-xs flex-shrink-0">
										<img class="avatar-img rounded-circle"
											src="/resources/booking/assets/images/avatar/09.jpg"
											alt="avatar">
									</div>
									<!-- Info -->
									<div class="ms-2" style="text-align: center;">
										<c:if test="${advListVO.remainDate < 0}">
											<del class="mb-0 fw-light" style="color:#aaaaaa;">${advListVO.busiNm}</del>
										</c:if>
										<c:if test="${advListVO.remainDate >= 0}">
											<h6 class="mb-0 fw-light">${advListVO.busiNm}</h6>
										</c:if>
									</div>
								</div>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<small class="d-block d-lg-none">등록 일자:</small>
								<h6 class="mb-0 fw-normal">
									<fmt:formatDate value="${advListVO.cnfmDt}" pattern="yyyy/MM/dd" />
								</h6>
							</div>

							<!-- Data item -->
							<div class="col" 
								 style="text-align: center;" >
								<small class="d-block d-lg-none">광고 기간:</small>
								<h6 class="mb-0 fw-normal"
									style="<c:choose>
												<c:when test="${advListVO.remainDate > 15 && advListVO.remainDate <= 30}">
													color:#FFC341;
												</c:when>
												<c:when test="${advListVO.remainDate > 0 && advListVO.remainDate <= 15}">
													color:#EB0000;
												</c:when>
												<c:when test="${advListVO.remainDate <= 0}">
													color:#aaaaaa;
												</c:when>
											</c:choose>">${advListVO.adPeriod}</h6>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<small class="d-block d-lg-none">광고 종류:</small>
								<h6 class="mb-0 fw-normal">${advListVO.adDc}</h6>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<small class="d-block d-lg-none">게시 여부:</small>
								<c:choose>
									<c:when test="${advListVO.remainDate <= 0}">
										<div class="badge bg-secondary bg-opacity-10 text-secondary">만료</div>
									</c:when>
									<c:when test="${advListVO.remainDate > 0 && advListVO.remainDate <= 15}">
										<div class="badge bg-danger bg-opacity-10 text-danger">만료 임박</div>
									</c:when>
									<c:when test="${advListVO.remainDate > 15 && advListVO.remainDate <= 30}">
										<div class="badge bg-warning bg-opacity-10 text-warning">활성화</div>
									</c:when>
									<c:otherwise>
										<div class="badge bg-success bg-opacity-10 text-success">활성화</div>
									</c:otherwise>
								</c:choose>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<a href="#" class="btn btn-sm btn-info-soft advDetail"
									data-toggle="modal" data-adv-id="${advListVO.adReqId}"
									data-target=".bd-advertiseDetail-modal-lg">상세</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- Card body END -->

				<!-- Card footer START -->
				<div class="card-footer pt-0">
					<!-- Pagination and content -->
					<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
						<!-- Content -->
						<c:set var="endRow" value="${data.currentPage * data.size}" />
						<c:set var="startRow" value="${endRow - (data.size - 1)}" />
						<c:set var="total" value="${data.total}" />
						<c:if test="${endRow>total}">
							<c:set var="endRow" value="${total}" />
						</c:if>
						<p class="mb-sm-0 text-center text-sm-start">Showing ${startRow} to ${endRow} of ${total} entries</p>
						<!-- Pagination -->
						<nav class="mb-sm-0 d-flex justify-content-center" aria-label="navigation">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0 ">
								<li class="page-item <c:if test='${data.startPage < 6}'>disabled</c:if>" id="dataTable_previous">
									<a class="page-link" href="/admin/advertise/list?currentPage=${data.startPage-5}&keyword=${param.keyword}&sort=${param.sort}&period=${param.period}" aria-controls="dataTable" data-dt-idx="0"  tabindex="-1">Prev</a>
								</li>
								<c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage}">
									<li class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
										<a href="/admin/advertise/list?currentPage=${pNo}&keyword=${param.keyword}&sort=${param.sort}&period=${param.period}" aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0" class="page-link">${pNo}</a>
									</li>
								</c:forEach>
								<li class="page-item <c:if test='${data.endPage == data.totalPages}'>disabled</c:if>" id="dataTable_next">
									<a class="page-link" href="/admin/advertise/list?currentPage=${data.startPage-5}&keyword=${param.keyword}&sort=${param.sort}&period=${param.period}" aria-controls="dataTable" data-dt-idx="7"  tabindex="-1">Next</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
				<!-- Card footer END -->
			</div>
			<!-- Guest list END -->
		</div>
		<!-- Page main content END -->
		<div class="modal fade bd-advertiseDetail-modal-lg" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">광고 상세</h5>
						<button type="button" class="btn" data-dismiss="modal"
							style="font-size: 1.5rem; font-weight: 700; line-height: 1; color: #000; text-shadow: 0 1px 0 #fff;"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div id="detailModal"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-dark-soft"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>

	</main>
	<!-- **************** MAIN CONTENT END **************** -->
</body>
