<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
	$(function() {
		let fp = $("#calender").flatpickr({
			enableTime : false,
			dateFormat : "Y/m/d"
		});

		fp.config.onClose.push(function() {
			let date = $("#calender").val();
			console.log("flag : " + date);
			$("#calender").val(date);
			$("#frm01").submit();
		});

	});
</script>
<body class="pt-0">
	<br />
	<br />
	<div class="container vstack gap-4">
		<!-- Title START -->
		<div class="row">
			<div class="col-12">
				<h1 class="fs-4 mb-0">
					<i class="bi bi-calendar-x fa-fw me-1"></i>취소/환불 목록
				</h1>
			</div>
		</div>
		<!-- Title END -->
		<!-- Booking table START -->
		<div class="row">
			<div class="col-12">

				<!-- 기간 설정 -->

				<form class="row g-4 align-items-center" id="frm01">
					<div class="card-body">
						<!-- Search and select START -->
						<div
							class="row g-3 align-items-center justify-content-between mb-3">
							<!-- Search -->
							<div class="col-md-8">
								<form class="rounded position-relative">
									<input class="form-control bg-transparent pe-5" type="search"
										placeholder="검색" aria-label="Search" name="keyword"
										value="${param.keyword}">
									<button
										class="btn border-0 px-3 py-0 position-absolute top-50 end-0 translate-middle-y"
										type="submit">
									</button>
								</form>
							</div>
							<div class="col-md-3">
								<div class="d-flex align-items-center">
									<i class="bi bi-calendar fs-5 me-2 mt-2"></i>
									<div class="d-flex">
										<div
											class="form-control-border form-control-transparent form-fs-md"">
											<input id="calender" type="text"
												class="form-control flatpickr-input" data-mode="range"
												placeholder="날짜 검색" name="period"
												value="<c:if test="${param.period!=''}">${param.period}</c:if>"
												readonly style="width: 300px; height: 40px;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<!-- Hotel room list START -->
				<div class="card shadow mt-5">
					<!-- Card body START -->
					<div class="card-body">
						<!-- Table head -->
						<div class="bg-light rounded p-3 d-none d-lg-block">
							<div class="row row-cols-7 g-4">
								<div class="col"style="text-align: center;">
									<h6 class="mb-0">NO</h6>
								</div>
								<div class="col"style="text-align: center;">
									<h6 class="mb-0">방 이름</h6>
								</div>
								<div class="col"style="text-align: center;">
									<h6 class="mb-0">방 번호</h6>
								</div>
								<div class="col"style="text-align: center;">
									<h6 class="mb-0">회원 명</h6>
								</div>
								<div class="col"style="text-align: center;">
									<h6 class="mb-0">연락처</h6>
								</div>
								<div class="col"style="text-align: center;">
									<h6 class="mb-0">환불 금액</h6>
								</div>
								<div class="col"style="text-align: center;">
									<h6 class="mb-0">환불 상태</h6>
								</div>
								<div class="col"style="text-align: center;">
									<h6 class="mb-0">환불 날짜</h6>
								</div>
							</div>
						</div>
						<!-- Table body START -->
						<c:forEach var="bsRfdListVO" items="${data.content}"
							varStatus="stat">
							<div
								class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
								<!-- Data item -->
								<div class="col" style="text-align: center;">
									<small class="d-block d-lg-none">NO:</small>
									<h6 class="mb-0 fw-normal">${bsRfdListVO.no}</h6>
								</div>

								<!-- Data item -->
								<div class="col"style="text-align: center;">
									<small class="d-block d-lg-none"></small>
									<h6 class="mb-0 fw-normal">${bsRfdListVO.rmNm}</h6>
								</div>

								<!-- Data item -->
								<div class="col"style="text-align: center;">
									<small class="d-block d-lg-none">방 번호</small>
									<h6 class="mb-0 fw-normal">${bsRfdListVO.rmNum}</h6>
								</div>

								<!-- Data item -->
								<div class="col"style="text-align: center;">
									<small class="d-block d-lg-none">회원 명</small>
									<h6 class="mb-0 fw-normal">${bsRfdListVO.memNm}</h6>
								</div>
								<!-- Data item -->
								<c:set var="memTel" value="${bsRfdListVO.memTel}" />
								<c:set var="formattedTel" value="${memTel.substring(0, 3)}-${memTel.substring(3, 7)}-${memTel.substring(7)}" />
								<div class="col"style="text-align: center;">
									<small class="d-block d-lg-none">연락처</small>
									<h6 class="mb-0 fw-normal">${formattedTel}</h6>
								</div>
								<!-- Data item -->
								<div class="col"style="text-align: center;">
									<small class="d-block d-lg-none">환불 금액</small>
									<h6 class="mb-0 fw-normal"><fmt:formatNumber value="${bsRfdListVO.payPr}" pattern="#,###,###" /></h6>
								</div>
								<div class="col"style="text-align: center;">
									<small class="d-block d-lg-none">환불 상태:</small>
									<c:if test="${bsRfdListVO.rsvCode eq '환불요청'}">
										<div class="badge bg-danger bg-opacity-10 text-danger">${bsRfdListVO.rsvCode}</div>
									</c:if>
									<c:if test="${bsRfdListVO.rsvCode eq '환불완료'}">
										<div class="badge bg-info bg-opacity-10 text-info">${bsRfdListVO.rsvCode}</div>
									</c:if>
								</div>
								<!-- Data item -->
								<div class="col"style="text-align: center;">
									<small class="d-block d-lg-none">환불 승인 일</small>
									<h6 class="mb-0 fw-normal">
										<fmt:formatDate value="${bsRfdListVO.rfdDt}"
											pattern="yyyy/MM/dd" />
									</h6>
								</div>
						</c:forEach>
						<!-- Table body END -->
					</div>
					<!-- Hotel room list END -->
				</div>
				<!-- Card body END -->
				<!-- Card footer START -->
				<div class="card-footer pt-0">
					<!-- Pagination and content -->
					<div
						class="d-sm-flex justify-content-sm-between align-items-sm-center">
						<!-- Content -->
						<c:set var="endRow" value="${data.currentPage * data.size}" />
						<c:set var="startRow" value="${endRow - (data.size - 1)}" />
						<c:set var="total" value="${data.total}" />
						<c:if test="${endRow>total}">
							<c:set var="endRow" value="${total}" />
						</c:if>
						<p class="mb-sm-0 text-center text-sm-start">Showing
							${startRow} to ${endRow} of ${total} entries</p>
						<!-- Pagination -->
						<nav class="mb-sm-0 d-flex justify-content-center"
							aria-label="navigation">
							<ul
								class="pagination pagination-sm pagination-primary-soft mb-0 ">
								<li
									class="page-item <c:if test='${data.startPage < 6}'>disabled</c:if>"
									id="dataTable_previous"><a class="page-link"
									href="/business/reserve/rfdList?currentPage=${data.startPage-5}&keyword=${param.keyword}&sort=${param.sort}&period=${param.period}"
									aria-controls="dataTable" data-dt-idx="0" tabindex="-1">Prev</a>
								</li>
								<c:forEach var="pNo" begin="${data.startPage}"
									end="${data.endPage}">
									<li
										class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
										<a
										href="/business/reserve/rfdList?currentPage=${pNo}&keyword=${param.keyword}&sort=${param.sort}&period=${param.period}"
										aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0"
										class="page-link">${pNo}</a>
									</li>
								</c:forEach>
								<li
									class="page-item <c:if test='${data.endPage == data.totalPages}'>disabled</c:if>"
									id="dataTable_next"><a class="page-link"
									href="/business/reserve/rfdList?currentPage=${data.startPage-5}&keyword=${param.keyword}&sort=${param.sort}&period=${param.period}"
									aria-controls="dataTable" data-dt-idx="7" tabindex="-1">Next</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
