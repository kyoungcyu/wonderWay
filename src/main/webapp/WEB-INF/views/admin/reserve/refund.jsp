<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description" content="Booking - Multipurpose Online Booking Theme">

<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/choices/css/choices.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/flatpickr/css/flatpickr.min.css">
<script src="/resources/booking/assets/vendor/choices/js/choices.min.js"></script>
<script src="/resources/booking/assets/vendor/flatpickr/js/flatpickr.min.js"></script>

<script type="text/javascript">
	$(function() {
		$(".rfdDetail").on("click", function() {
			// data-mem-id="a001"
			let payId = $(this).data("payId");
			console.log("payId : " + payId);
			$("#detailModal").html();
			$.ajax({
				url : "/admin/reserve/rfdDetailPost",
				data : {
					"payId" : payId
				},
				type : "post",
				dataType : "json",
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					console.log("result : " + result.memNm);
					let str = "";
					str = `<ul class='list-group list-group-borderless'>`;
					str += `<li class='list-group-item mb-3'> <span>업체명:</span> <span class='h6 fw-normal ms-1 mb-0'>\${result.busiNm}</span> </li>`;
					str += `<li class='list-group-item mb-3'> <span>요청 고객명:</span> <span class='h6 fw-normal ms-1 mb-0'>\${result.memNm}</span> </li>`;
					str += `<li class='list-group-item mb-3'> <span>환불 사유:</span><hr/> <span class='h6 fw-bold ms-3 mb-0'>\${result.rfdResn}</span> </li>`;
					str += `</ul>`;
		
					$("#detailModal").html(str);
					$("#rfdAccept").attr("acceptId", payId);
					$("#rfdDenied").attr("deniedId", payId);
				}
			});
		});
		
		$("#rfdAccept").on("click", function() {
			let payId = $(this).attr("acceptId");
			console.log("acceptId : " + payId);
			$.ajax({
				url : "/admin/reserve/rfdAccept",
				data : {
					"acceptId" : payId
				},
				type : "post",
				async : false,
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					console.log("result : " + result);
					if(result == "success") {
						alert("승인되었습니다.");
						window.location.href = "/admin/reserve/refund";
					}
				}
			});
		});
		
		
		$("#rfdDenied").on("click", function() {
			let payId = $(this).attr("deniedId");
			console.log("deniedId : " + payId);
			$.ajax({
				url : "/admin/reserve/rfdDenied",
				data : {
					"deniedId" : payId
				},
				type : "post",
				async : false,
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					if(result == "success") {
						alert("거절되었습니다.");
						window.location.href = "/admin/reserve/refund";
					}
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

		$("#btnradio1").on("click", function() {
			$(".radioFee1").data("radioFee", "B01");
			
			let a = $(".radioFee1").data("radioFee");
			console.log(a);
		});
		
		$("#btnradio2").on("click", function() {
			$(".radioFee2").data("radioFee", "B02");
			
			let a = $(".radioFee2").data("radioFee");
			console.log(a);
		});
		
		$("#btnModal").on("click", function() {
			let rd = "";
			if($(".radioFee1").data("radioFee") != "") {
				rd = $(".radioFee1").data("radioFee");
			} else if($(".radioFee2").data("radioFee") != "") {
				rd = $(".radioFee2").data("radioFee");
			}
			
			let slct = $("select[name=selectPeriod]").val();
			let valFee = $("input[name=valFee]").val();
			
			console.log(rd + " " + slct + " " + valFee);
			
			$.ajax({
				url : "/admin/reserve/rfdFeePost",
				data : {
					"radioFee" : rd,
					"selectFee" : slct,
					"inputFee" : valFee
				},
				type : "post",
				async : false,
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					if(result == "success") {
						alert("수정되었습니다");
					}
					$(".radioFee1").data("radioFee", "");
					$(".radioFee2").data("radioFee", "");
					$("input[name=valFee]").val("");
				}
			});
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
<!-- Page main content START -->
<div class="page-content-wrapper p-xxl-4">
	<!-- 개수 Start -->
	<div class="row g-4">
		<!-- Block item -->
		<div class="col-sm-6 col-xxl-4">
			<div class="card card-body bg-light p-4 h-100">
				<h6 class="mb-0">미처리 요청 건 수</h6>
				<br />
				<h4 class="mb-2 mt-2">
					${cntRfdAll }
				</h4>
			</div>
		</div>

		<!-- Block item -->
		<div class="col-sm-6 col-xxl-4">
			<div class="card card-body bg-light p-4 h-100">
				<h6 class="mb-0">승인 요청 건 수</h6>
				<br />
				<h4 class="mb-2 mt-2">
					${cntRfdAcceptAll }
				</h4>
			</div>
		</div>

		<!-- Block item -->
		<div class="col-sm-6 col-xxl-4" >
			<div class="card card-body bg-light p-4 h-100">
				<h6 class="mb-0">월 전체 환불 금액</h6>
				<br />
				<h4 class="mb-2 mt-2">
					&#8361; <fmt:formatNumber type="number" pattern="#,###" value="${sumRfdAll }" />
				</h4>
			</div>
		</div>
	</div>
	<!-- 개수 End -->
	
	<!-- Filters START -->
	<div class="card shadow mt-5">
	<form id="frm01" class="card-header border-bottom">
		<div class="row g-4 align-items-center">
			<div class="d-flex align-items-center col-md-6 col-lg-5">
				<h5 class="h4 mb-3 mb-sm-0">환불 처리
					<a href="#s" class="h5 mb-0 text-body" data-bs-toggle="tab" data-toggle="modal" data-target=".bd-reserveFee-modal-lg">
							<i class="bi bi-gear-fill"></i>
					</a>
					<a id="init" href="#s" class="h5 mb-0 text-body" >
							<i class="bi bi-arrow-clockwise"></i>
					</a>
				</h5>
			</div>
			
			<!-- 검색 -->
			<div class="d-flex align-items-center col-md-6 col-lg-2">
				<input class="form-control bg-transparent pe-5" type="search" placeholder="요청자명" aria-label="Search" name="keyword" value="${param.keyword}">
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
						<input id="calender" type="text" class="form-control flatpickr-input" data-mode="range" placeholder="요청 일자를 선택하세요"  
							   name="period" value="<c:if test="${param.period!=''}">${param.period}</c:if>" readonly>
					</div>
				</div>
			</div>
			
			<!-- 정렬 -->
			<div class="col-md-6 col-lg-2">
				<select class="form-select js-choice" aria-label=".form-select-sm" name="sort" id="sort">
					<option value="" >선택해주세요</option>
					<option value="rfdAsc" <c:if test="${param.sort=='rfdAsc'}">selected</c:if>>요청 일자 &#8593;</option>
					<option value="rfdDesc" <c:if test="${param.sort=='rfdDesc'}">selected</c:if>>요청 일자 &#8595;</option>
					<option value="memNmAsc" <c:if test="${param.sort=='memNmAsc'}">selected</c:if>>회원명 &#8593;</option>
					<option value="memNmDesc" <c:if test="${param.sort=='memNmDesc'}">selected</c:if>>회원명 &#8595;</option>
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
						<h6 class="mb-0">요청자명</h6>
					</div>
					<div class="col" style="text-align: center;">
						<h6 class="mb-0">업체명</h6>
					</div>
					<div class="col" style="text-align: center;">
						<h6 class="mb-0">결제 금액</h6>
					</div>
					<div class="col" style="text-align: center;">
						<h6 class="mb-0">요청 일자</h6>
					</div>
					<div class="col" style="text-align: center;">
						<h6 class="mb-0">상세</h6>
					</div>
				</div>
			</div>

			<!-- Table data -->
			<c:forEach var="rfdListVO" items="${data.content}" varStatus="stat">
				<div class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
					<!-- Data item -->
					<div class="col" >
						<small class="d-block d-lg-none">요청자명:</small>
						<div class="d-flex align-items-center">
							<!-- Avatar -->
							<div class="avatar avatar-xs flex-shrink-0" style="margin-left: 50px;">
								<img class="avatar-img rounded-circle"
									src="/resources/booking/assets/images/avatar/09.jpg"
									alt="avatar">
							</div>
							<!-- Info -->
							<div class="ms-2" style="text-align: center;">
								<h6 class="mb-0 fw-light">${rfdListVO.memNm}</h6>
							</div>
						</div>
					</div>

					<!-- Data item -->
					<div class="col" style="text-align: center;">
						<small class="d-block d-lg-none">업체명:</small>
						<h6 class="mb-0 fw-normal">${rfdListVO.busiNm}</h6>
					</div>

					<!-- Data item -->
					<div class="col" style="text-align: center;">
						<small class="d-block d-lg-none">결제 금액:</small>
						<h6 class="mb-0 fw-normal">&#8361;<fmt:formatNumber type="number" pattern="#,###" value="${rfdListVO.rfdPr}" /></h6>
					</div>

					<!-- Data item -->
					<div class="col" style="text-align: center;">
						<small class="d-block d-lg-none">요청 일자:</small>
						<h6 class="mb-0 fw-normal">
							<fmt:formatDate value="${rfdListVO.rfdReqDt}" pattern="yyyy/MM/dd" />
						</h6>
					</div>

					<!-- Data item -->
					<div class="col" style="text-align: center;">
						<a href="#" class="btn btn-sm btn-info-soft rfdDetail"
							data-toggle="modal" data-pay-id="${rfdListVO.payId}"
							data-target=".bd-reserveDetail-modal-lg">상세</a>
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
							<a class="page-link" href="/admin/reserve/refund?currentPage=${data.startPage-5}&keyword=${param.keyword}&sort=${param.sort}&period=${param.period}" aria-controls="dataTable" data-dt-idx="0"  tabindex="-1">Prev</a>
						</li>
						<c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage}">
							<li class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
								<a href="/admin/reserve/refund?currentPage=${pNo}&keyword=${param.keyword}&sort=${param.sort}&period=${param.period}" aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0" class="page-link">${pNo}</a>
							</li>
						</c:forEach>
						<li class="page-item <c:if test='${data.endPage == data.totalPages}'>disabled</c:if>" id="dataTable_next">
							<a class="page-link" href="/admin/reserve/refund?currentPage=${data.startPage+5}&keyword=${param.keyword}&sort=${param.sort}&period=${param.period}" aria-controls="dataTable" data-dt-idx="7"  tabindex="-1">Next</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- Card footer END -->
	</div>
	<!-- Guest list END -->
	
	<!-- Detail Modal START -->
	<div class="modal fade bd-reserveDetail-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">환불 상세</h5>
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
					<button id="rfdAccept" type="button" class="btn btn-sm btn-success-soft" 
						data-dismiss="modal">승인</button>
					<button id="rfdDenied" type="button" class="btn btn-sm btn-danger-soft" 
						data-dismiss="modal">거절</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Detail Modal END -->

	<!-- Refund Fee Set START -->
	<div class="modal fade bd-reserveFee-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">환불 설정</h5>
					<button type="button" class="btn" data-dismiss="modal"
						style="font-size: 1.5rem; font-weight: 700; line-height: 1; color: #000; text-shadow: 0 1px 0 #fff;"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group" style="margin-left: 150px">
						<input type="radio" class="btn-check" name="btnradio" id="btnradio1">
						<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee1" data-radio-fee="" for="btnradio1">숙박</label>
						
						<input type="radio" class="btn-check" name="btnradio" id="btnradio2">
						<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee2" data-radio-fee="" for="btnradio2">렌터카</label>
					</div>
					<hr />
					<h5 class="fw-bold" style="text-align: center;">기간 설정</h5>
					<div class="col-md-8 col-lg-7" style="margin-left: 100px">
						<select name="selectPeriod" class="form-select js-choice" aria-label=".form-select-sm">
							<option value="MT1">예약일 1달 이전</option>
							<option value="WEEK2">예약일 2주 이전</option>
							<option value="WEEK1">예약일 1주 이전</option>
							<option value="DE4">예약일 4일 이전</option>
						</select>
					</div>
					<hr />
					<h5 class="fw-bold" style="text-align: center;">수수료 비율</h5>
					<div class="col-md-8 col-lg-7" style="margin-left: 100px">
						<input name="valFee" type="text" class="form-control form-control-lg" placeholder="수수료 비율을 입력해주세요" value="" required>
						<h8 class="mb-0" style="font-size: small">단위 : 퍼센트(%)</h8>
					</div>
				</div>
				<div class="modal-footer">
					<button id="btnModal" type="button" class="btn btn-sm btn-success-soft" style="margin-left: 100px" data-dismiss="modal">완료</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Refund Fee Set END -->
	
	
	<div class="flatpickr-calendar rangeMode arrowLeft arrowTop"
		tabindex="-1" style="top: 559.2px; left: 747.213px; right: auto;">
		<div class="flatpickr-months">
			<span class="flatpickr-prev-month"><svg version="1.1"
					xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 17 17">
					<g></g>
					<path
						d="M5.207 8.471l7.146 7.147-0.707 0.707-7.853-7.854 7.854-7.853 0.707 0.707-7.147 7.146z"></path></svg></span>
			<div class="flatpickr-month">
				<div class="flatpickr-current-month">
					<select class="flatpickr-monthDropdown-months" aria-label="Month"
						tabindex="-1"><option
							class="flatpickr-monthDropdown-month" value="0" tabindex="-1">January</option>
						<option class="flatpickr-monthDropdown-month" value="1"
							tabindex="-1">February</option>
						<option class="flatpickr-monthDropdown-month" value="2"
							tabindex="-1">March</option>
						<option class="flatpickr-monthDropdown-month" value="3"
							tabindex="-1">April</option>
						<option class="flatpickr-monthDropdown-month" value="4"
							tabindex="-1">May</option>
						<option class="flatpickr-monthDropdown-month" value="5"
							tabindex="-1">June</option>
						<option class="flatpickr-monthDropdown-month" value="6"
							tabindex="-1">July</option>
						<option class="flatpickr-monthDropdown-month" value="7"
							tabindex="-1">August</option>
						<option class="flatpickr-monthDropdown-month" value="8"
							tabindex="-1">September</option>
						<option class="flatpickr-monthDropdown-month" value="9"
							tabindex="-1">October</option>
						<option class="flatpickr-monthDropdown-month" value="10"
							tabindex="-1">November</option>
						<option class="flatpickr-monthDropdown-month" value="11"
							tabindex="-1">December</option></select>
					<div class="numInputWrapper">
						<input class="numInput cur-year" type="number" tabindex="-1"
							aria-label="Year"><span class="arrowUp"></span><span
							class="arrowDown"></span>
					</div>
				</div>
			</div>
			<span class="flatpickr-next-month">
				<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 17 17">
					<g></g>
					<path d="M13.207 8.472l-7.854 7.854-0.707-0.707 7.146-7.146-7.146-7.148 0.707-0.707 7.854 7.854z"></path>
				</svg>
			</span>
		</div>
		<div class="flatpickr-innerContainer">
			<div class="flatpickr-rContainer">
				<div class="flatpickr-weekdays">
					<div class="flatpickr-weekdaycontainer">
						<span class="flatpickr-weekday"> Sun</span><span
							class="flatpickr-weekday">Mon</span><span
							class="flatpickr-weekday">Tue</span><span
							class="flatpickr-weekday">Wed</span><span
							class="flatpickr-weekday">Thu</span><span
							class="flatpickr-weekday">Fri</span><span
							class="flatpickr-weekday">Sat </span>
					</div>
				</div>
				<div class="flatpickr-days" tabindex="-1">
					<div class="dayContainer">
						<span class="flatpickr-day prevMonthDay"
							aria-label="August 27, 2023" tabindex="-1">27</span><span
							class="flatpickr-day prevMonthDay" aria-label="August 28, 2023"
							tabindex="-1">28</span><span class="flatpickr-day prevMonthDay"
							aria-label="August 29, 2023" tabindex="-1">29</span><span
							class="flatpickr-day prevMonthDay" aria-label="August 30, 2023"
							tabindex="-1">30</span><span class="flatpickr-day prevMonthDay"
							aria-label="August 31, 2023" tabindex="-1">31</span><span
							class="flatpickr-day " aria-label="September 1, 2023"
							tabindex="-1">1</span><span class="flatpickr-day "
							aria-label="September 2, 2023" tabindex="-1">2</span><span
							class="flatpickr-day " aria-label="September 3, 2023"
							tabindex="-1">3</span><span class="flatpickr-day "
							aria-label="September 4, 2023" tabindex="-1">4</span><span
							class="flatpickr-day " aria-label="September 5, 2023"
							tabindex="-1">5</span><span class="flatpickr-day "
							aria-label="September 6, 2023" tabindex="-1">6</span><span
							class="flatpickr-day " aria-label="September 7, 2023"
							tabindex="-1">7</span><span class="flatpickr-day "
							aria-label="September 8, 2023" tabindex="-1">8</span><span
							class="flatpickr-day " aria-label="September 9, 2023"
							tabindex="-1">9</span><span class="flatpickr-day "
							aria-label="September 10, 2023" tabindex="-1">10</span><span
							class="flatpickr-day " aria-label="September 11, 2023"
							tabindex="-1">11</span><span class="flatpickr-day "
							aria-label="September 12, 2023" tabindex="-1">12</span><span
							class="flatpickr-day " aria-label="September 13, 2023"
							tabindex="-1">13</span><span class="flatpickr-day "
							aria-label="September 14, 2023" tabindex="-1">14</span><span
							class="flatpickr-day " aria-label="September 15, 2023"
							tabindex="-1">15</span><span class="flatpickr-day "
							aria-label="September 16, 2023" tabindex="-1">16</span><span
							class="flatpickr-day " aria-label="September 17, 2023"
							tabindex="-1">17</span><span class="flatpickr-day "
							aria-label="September 18, 2023" tabindex="-1">18</span><span
							class="flatpickr-day selected startRange"
							aria-label="September 19, 2023" tabindex="-1">19</span><span
							class="flatpickr-day inRange" aria-label="September 20, 2023"
							tabindex="-1">20</span><span class="flatpickr-day inRange"
							aria-label="September 21, 2023" tabindex="-1">21</span><span
							class="flatpickr-day inRange" aria-label="September 22, 2023"
							tabindex="-1">22</span><span class="flatpickr-day inRange"
							aria-label="September 23, 2023" tabindex="-1">23</span><span
							class="flatpickr-day inRange" aria-label="September 24, 2023"
							tabindex="-1">24</span><span class="flatpickr-day inRange"
							aria-label="September 25, 2023" tabindex="-1">25</span><span
							class="flatpickr-day inRange" aria-label="September 26, 2023"
							tabindex="-1">26</span><span class="flatpickr-day inRange"
							aria-label="September 27, 2023" tabindex="-1">27</span><span
							class="flatpickr-day selected endRange"
							aria-label="September 28, 2023" tabindex="-1">28</span><span
							class="flatpickr-day " aria-label="September 29, 2023"
							tabindex="-1">29</span><span class="flatpickr-day "
							aria-label="September 30, 2023" tabindex="-1">30</span><span
							class="flatpickr-day nextMonthDay" aria-label="October 1, 2023"
							tabindex="-1">1</span><span class="flatpickr-day nextMonthDay"
							aria-label="October 2, 2023" tabindex="-1">2</span><span
							class="flatpickr-day nextMonthDay" aria-label="October 3, 2023"
							tabindex="-1">3</span><span class="flatpickr-day nextMonthDay"
							aria-label="October 4, 2023" tabindex="-1">4</span><span
							class="flatpickr-day nextMonthDay" aria-label="October 5, 2023"
							tabindex="-1">5</span><span class="flatpickr-day nextMonthDay"
							aria-label="October 6, 2023" tabindex="-1">6</span><span
							class="flatpickr-day nextMonthDay" aria-label="October 7, 2023"
							tabindex="-1">7</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>
<!-- Page main content END -->
