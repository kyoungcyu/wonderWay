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
</script>
</head>

<body>
	<!-- **************** MAIN CONTENT START **************** -->
	<main>
		<!-- Page main content START -->
		<div class="page-content-wrapper p-xxl-4">
			<form class="row g-4 align-items-center" id="frm01">
				<div class="col-lg-5">
					<h1 class="h3 mb-3 mb-sm-0">여행지 매거진 관리
						<a id="init" href="#s" class="h5 mb-0 text-body" >
							<i class="bi bi-arrow-clockwise"></i>
						</a>
					</h1>
				</div>
				
				<!-- 검색 -->
				<div class="d-flex align-items-center col-md-6 col-lg-2">
					<input class="form-control bg-transparent pe-5" type="search" placeholder="여행지명" aria-label="Search" name="keyword" value="${param.keyword}">
					<button class="bg-transparent p-2 position-absolute translate-middle-y border-0 text-primary-hover text-reset" type="submit" 
						style="margin-left: 140px; margin-top: 45px">
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
						<option value="tourNmAsc" <c:if test="${param.sort=='tourNmAsc'}">selected</c:if>>여행지명 ↑</option>
						<option value="tourNmDesc" <c:if test="${param.sort=='tourNmDesc'}">selected</c:if>>여행지명 ↓</option>
						<option value="dateAsc" <c:if test="${param.sort=='dateAsc'}">selected</c:if>>등록일 ↑</option>
						<option value="dateDesc" <c:if test="${param.sort=='dateDesc'}">selected</c:if>>등록일 ↓</option>
					</select>
				</div>
			</form>
			<!-- Filters END -->

			<!-- Guest list START -->
			<div class="card shadow mt-5">
				<!-- Card body START -->
				<div class="card-body">
					<!-- Table head -->
					<div class="bg-light rounded p-3 d-none d-lg-block">
						<div class="row row-cols-7 g-4">
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">제목</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">여행지명</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">등록일</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">최종 수정일</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">작성자</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">조회수</h6>
							</div>
							<div class="col" style="text-align: center;">
							</div>
						</div>
					</div>

					<!-- Table data -->
					<c:forEach var="brdVO" items="${data.content}" varStatus="stat">
						<div class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4"
						     >
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">제목:</small>
								<div class="d-flex align-items-center" style="margin-left: 10px">
									<!-- Avatar -->
									<div class="avatar align-middle avatar-s">
									  <img class="avatar-img rounded" src='
									  	<c:choose>
											<c:when test="${empty brdVO.attachVOList.get(0).attachDeVOList.get(0).savePath}">/resources/booking/assets/images/blog/13.jpg</c:when>
											<c:otherwise>/resources/upload${brdVO.attachVOList.get(0).attachDeVOList.get(0).savePath}</c:otherwise>
										</c:choose>
									  ' alt="avatar">
									</div>
									<!-- Info -->
									<div class="ms-3">
										<h6 class="mb-0 fw-light" >${brdVO.brdTt}</h6>
									</div>
								</div>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<small class="d-block d-lg-none">여행지명:</small>
								<h6 class="mb-0 fw-normal">${brdVO.tourId}</h6>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<small class="d-block d-lg-none">등록일:</small>
								<h6 class="mb-0 fw-normal">
									<fmt:formatDate value="${brdVO.frstDt}" pattern="yyyy/MM/dd" />
								</h6>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center; ">
								<small class="d-block d-lg-none">최종 수정일:</small>
								<h6 class="mb-0 fw-normal">
									<fmt:formatDate value="${brdVO.lastDt}" pattern="yyyy/MM/dd" />
								</h6>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<small class="d-block d-lg-none">작성자:</small>
								<h6 class="mb-0 fw-normal" style="margin-right: 6px">${brdVO.lastWrtr}</h6>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center; ">
								<small class="d-block d-lg-none">조회수:</small>
								<h6 class="mb-0 fw-normal" style="margin-right: 6px">${brdVO.inqCnt}</h6>
							</div>
							
							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<a href="/member/tripBoard/magazineDetail?brdId=${brdVO.brdId}" class="btn btn-sm btn-info-soft tourDetail">
									<i class="bi bi-box-arrow-up-right"></i>&ensp;상세
								</a>
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
									<a class="page-link" href="/admin/tour/list?currentPage=${data.startPage-5}&keyword=${param.keyword}&sort=${param.sort}" aria-controls="dataTable" data-dt-idx="0"  tabindex="-1">Prev</a>
								</li>
								<c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage}">
									<li class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
										<a href="/admin/tour/list?currentPage=${pNo}&keyword=${param.keyword}&sort=${param.sort}" aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0" class="page-link">${pNo}</a>
									</li>
								</c:forEach>
								<li class="page-item <c:if test='${data.endPage == data.totalPages}'>disabled</c:if>" id="dataTable_next">
									<a class="page-link" href="/admin/tour/list?currentPage=${data.startPage+5}&keyword=${param.keyword}&sort=${param.sort}" aria-controls="dataTable" data-dt-idx="7"  tabindex="-1">Next</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
				<!-- Card footer END -->
			</div>
			<!-- Guest list END -->
			<a href="magazineRegist" type="button" class="btn btn-primary" style="width:11%; margin-left: 1030px; margin-top: 10px;">매거진 등록</a>
		</div>
		<!-- Page main content END -->
	</main>
	<!-- **************** MAIN CONTENT END **************** -->
</body>
