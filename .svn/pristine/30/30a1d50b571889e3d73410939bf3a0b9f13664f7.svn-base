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
		$(".cupnDetail").on("click", function() {
			let cupnId = $(this).data("cupnId");
			console.log("cupnId : " + cupnId);
			$("#detailModal").html();
			$.ajax({
				url : "/admin/cupn/cupnDetailPost",
				data : {
					"cupnId" : cupnId
				},
				type : "post",
				dataType : "json",
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					console.log(result.cupnCl + " : " + result.cupnDc + " : " + result.cupnRt + " : " + result.gradNm);
					
					let str = "";
					str = `<ul class='list-group list-group-borderless'>`;
					str += `<li class='list-group-item mb-3'> <span>쿠폰명:</span> <span id='cupnId' data-cupn-id='\${result.cupnId}' class='h6 fw-normal ms-1 mb-0'>\${result.cupnDc}</span> </li>`;
					str += `<li class='list-group-item mb-3'> <span>쿠폰 종류:</span> <span class='h6 fw-normal ms-1 mb-0'>\${result.cupnCl}</span> </li>`;
					str += `<li class='list-group-item mb-3'> <span>할인율:</span> <span class='h6 fw-normal ms-1 mb-0'>\${result.cupnRt}%</span> </li>`;
					str += `<li class='list-group-item mb-3'> <span>이용 가능 등급:</span>&ensp;&ensp;`;
					if(result.gradId == "G01") {
						str += `<div class="badge bg-danger bg-opacity-10 text-danger">\${result.gradNm}</div>`;
					} else if(result.gradId == "G02") {
						str += `<div class="badge bg-secondary bg-opacity-10 text-secondary">\${result.gradNm}</div>`;
					} else if(result.gradId == "G03") {
						str += `<div class="badge bg-warning bg-opacity-10 text-warning">\${result.gradNm}</div>`;
					} else if(result.gradId == "G04") {
						str += `<div class="badge bg-info bg-opacity-10 text-info">\${result.gradNm}</div>`;
					} else {
						str += `<div class="badge bg-success bg-opacity-10 text-success">\${result.gradNm}</div>`;
					}
					str += `</li>`;
					str += `<li class='list-group-item mb-3'> <span>유효 기간:</span> <span class='h6 fw-normal ms-1 mb-0'>&#8275;&ensp;\${result.cupnExpStr}</span> </li>`;
					str += `</ul>`;
		
					$("#detailModal").html(str);
				}
			});
		});
		
		$("#cupnUnable").on("click", function() {
			let cupnId = $("#cupnId").data("cupnId");
			$.ajax({
				url : "/admin/cupn/cupnUnablePost",
				data : {
					"cupnId" : cupnId
				},
				type : "post",
				dataType : "json",
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					if(result != null)	{
						let cupnNm = result.cupnDc;
						alert(cupnNm + " 이 비활성화 되었습니다.");
						
						window.location = 'list';
					}
				}
			});
		});
		
		$("#cupnRegist").on("click", function() {
			let cupnDc = $("#cupnDc").val();
			let grad = $("#selectGrad").val();
			let rate = $("#selectRate").val();
			let period = $("#calender").val();
			
			if(grad == "none" || rate == "none") {
				return false;
			}
			
			console.log("data : ", grad, rate, calender);
			
			$.ajax({
				url : "/admin/cupn/cupnRegistPost",
				data : {
					"cupnDc" : cupnDc,
					"grad" : grad,
					"rate" : rate,
					"period" : period
				},
				type : "post",
				async : false,
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					if(result != null) {
						alert(cupnDc + "이(가) 등록되었습니다.")
					} else {
						alert("등록 중 오류 발생");
					}
					window.location = "list";
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
			console.log("flag : ", date);
			$("#calender").val(date);
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
					<h1 class="h3 mb-3 mb-sm-0">쿠폰 목록
						<a id="init" href="#s" class="h5 mb-0 text-body" >
							<i class="bi bi-arrow-clockwise"></i>
						</a>
					</h1>
				</div>
				
				<div class="d-flex align-items-center col-md-6 col-lg-3">
					<button type="button" class="btn btn-primary" style="margin-left: 200px; margin-top: 5px"
							data-toggle="modal" data-target=".bd-cupnRegist-modal-lg">등록</button>
				</div>
				
				<!-- 검색 -->
				<div class="d-flex align-items-center col-md-6 col-lg-2">
					<input class="form-control bg-transparent pe-5" type="search" placeholder="Search" aria-label="Search" name="keyword" value="${param.keyword}">
					<button class="bg-transparent p-2 position-absolute translate-middle-y border-0 text-primary-hover text-reset" type="submit" 
						style="margin-left: 140px; margin-top: 45px">
						<i class="fas fa-search fs-6"></i>
					</button>
				</div>
				
				<!-- 정렬 -->
				<div class="col-md-6 col-lg-2">
					<select class="form-select js-choice" aria-label=".form-select-sm" name="sort" id="sort">
						<option value="" >선택해주세요</option>
						<option value="cupnKind" <c:if test="${param.sort=='cupnKind'}">selected</c:if>>쿠폰 종류</option>
						<option value="cupnRtAsc" <c:if test="${param.sort=='cupnRtAsc'}">selected</c:if>>할인율 ↑</option>
						<option value="cupnRtDesc" <c:if test="${param.sort=='cupnRtDesc'}">selected</c:if>>할인율 ↓</option>
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
								<h6 class="mb-0">쿠폰명</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">쿠폰 종류</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">할인율</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">이용 등급</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">유효 기간</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">상세</h6>
							</div>
						</div>
					</div>

					<!-- Table data -->
					<c:forEach var="cupnVO" items="${data.content}" varStatus="stat">
						<div class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4"
						     >
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">쿠폰명:</small>
								<div class="d-flex align-items-center" style="margin-left: 10px">
									<!-- Avatar -->
									<div class="avatar avatar-xs flex-shrink-0">
										<img class="avatar-img rounded-circle"
											src="/resources/booking/assets/images/avatar/09.jpg"
											alt="avatar">
									</div>
									<!-- Info -->
									<div class="ms-3">
										<h6 class="mb-0 fw-light" >${cupnVO.cupnDc}</h6>
									</div>
								</div>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center; margin-left: 6px">
								<small class="d-block d-lg-none">쿠폰 종류:</small>
								<h6 class="mb-0 fw-normal">${cupnVO.cupnCl}</h6>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<small class="d-block d-lg-none">할인율:</small>
								<h6 class="mb-0 fw-normal"><fmt:formatNumber type="number" pattern="#,###" value="${cupnVO.cupnRt}" />%</h6>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<small class="d-block d-lg-none">이용 등급:</small>
								<c:choose>
									<c:when test="${cupnVO.gradId eq 'G01'}">
										<div class="badge bg-danger bg-opacity-10 text-danger">${cupnVO.gradNm}</div>
									</c:when>
									<c:when test="${cupnVO.gradId eq 'G02'}">
										<div class="badge bg-secondary bg-opacity-10 text-secondary">${cupnVO.gradNm}</div>
									</c:when>
									<c:when test="${cupnVO.gradId eq 'G03'}">
										<div class="badge bg-warning bg-opacity-10 text-warning">${cupnVO.gradNm}</div>
									</c:when>
									<c:when test="${cupnVO.gradId eq 'G04'}">
										<div class="badge bg-info bg-opacity-10 text-info">${cupnVO.gradNm}</div>
									</c:when>
									<c:otherwise>
										<div class="badge bg-success bg-opacity-10 text-success">${cupnVO.gradNm}</div>
									</c:otherwise>
								</c:choose>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<small class="d-block d-lg-none">유효 기간:</small>
								<h6 class="mb-0 fw-normal">&#8275;&ensp;<fmt:formatDate value="${cupnVO.cupnExp}" pattern="yyyy/MM/dd" /></h6>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<a href="#" class="btn btn-sm btn-info-soft cupnDetail"
									data-toggle="modal" data-cupn-id="${cupnVO.cupnId}"
									data-target=".bd-cupnDetail-modal-lg">상세</a>
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
									<a class="page-link" href="/admin/cupn/list?currentPage=${data.startPage-5}&keyword=${param.keyword}&sort=${param.sort}&page=${param.page}" aria-controls="dataTable" data-dt-idx="0"  tabindex="-1">Prev</a>
								</li>
								<c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage}">
									<li class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
										<a href="/admin/cupn/list?currentPage=${pNo}&keyword=${param.keyword}&sort=${param.sort}&page=${param.page}" aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0" class="page-link">${pNo}</a>
									</li>
								</c:forEach>
								<li class="page-item <c:if test='${data.endPage == data.totalPages}'>disabled</c:if>" id="dataTable_next">
									<a class="page-link" href="/admin/cupn/list?currentPage=${data.startPage+5}&keyword=${param.keyword}&sort=${param.sort}&page=${param.page}" aria-controls="dataTable" data-dt-idx="7"  tabindex="-1">Next</a>
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
		
		<!-- 상세 Modal -->
		<div class="modal fade bd-cupnDetail-modal-lg" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">쿠폰 상세</h5>
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
						<button id="cupnUnable" type="button" class="btn btn-sm btn-danger-soft"
							data-dismiss="modal">비활성화</button>
						<button type="button" class="btn btn-sm btn-dark-soft"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 등록 Modal -->
		<div class="modal fade bd-cupnRegist-modal-lg" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">프로모션 쿠폰 등록</h5>
						<button type="button" class="btn" data-dismiss="modal"
							style="font-size: 1.5rem; font-weight: 700; line-height: 1; color: #000; text-shadow: 0 1px 0 #fff;"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row g-6">
							<div class="col-12" style="text-align: center;">
								<label class="form-label">쿠폰명</label>
								<input id="cupnDc" type="text" class="form-control" value="" placeholder="쿠폰명을 입력해주세요">
							</div>
	
							<div class="col-md-6" style="text-align: center;">
								<label class="form-label">등급 제한</label>
								<select id="selectGrad" class="form-select js-choice" aria-label=".form-select-sm">
									<option value="">전체</option>
									<option value="G01">브론즈</option>
									<option value="G02">실버</option>
									<option value="G03">골드</option>
									<option value="G04">다이아몬드</option>
								</select>
							</div>
	
							<div class="col-md-6" style="text-align: center;">
								<label class="form-label">할인율</label>
								<select id="selectRate" class="form-select js-choice" aria-label=".form-select-sm">
									<option value="3">3 %</option>
									<option value="5">5 %</option>
									<option value="7">7 %</option>
									<option value="10">10 %</option>
								</select>
							</div>

							<div class="col-md-12" style="text-align: center;">
								<label class="form-label">유효기간 설정</label>
								<!-- 기간 설정 -->
								<div class="d-flex">
									<i class="bi bi-calendar fs-5 me-2 mt-2"></i>
									<div class="form-control-border form-control-transparent form-fs-md">
										<input id="calender" type="text" class="form-control flatpickr-input" data-mode="range" placeholder="Select date" 
											   name="period" value="" readonly>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button id="cupnRegist" type="button" class="btn btn-sm btn-primary-soft"
							data-dismiss="modal">등록</button>
						<button type="button" class="btn btn-sm btn-dark-soft"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- **************** MAIN CONTENT END **************** -->
</body>
