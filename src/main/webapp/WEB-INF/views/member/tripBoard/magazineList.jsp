<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<!-- **************** MAIN CONTENT START **************** -->
<main>

	<!-- ======================= Blog grid START -->


	<section class="pt-0 pt-sm-5">
		<div class="container">
			<div class="row mb-4">
				<!-- Title -->

				<div class="col-12 text-center">
					<h2 class="mb-0">여행지 매거진
						<a id="init" href="#s" class="h5 mb-0 text-body" >
							<i class="bi bi-arrow-clockwise"></i>
						</a>
					</h2>
				</div>
			</div>

			<!-- Filters START -->
			<form class="row g-4 align-items-center mb-4" id="frm01">
				<div class="col-lg-5">
					<h1 class="h3 mb-3 mb-sm-0">
						
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
							<input id="calender" type="text" class="form-control flatpickr-input" data-mode="range" placeholder="Select date" 
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


			<!-- Blog grid -->
			<div class="row g-4">
				<!-- Blog item START -->
				<c:forEach var="brdVO" items="${data.content}" varStatus="stat">
					<div class="col-md-6 col-lg-4">
						<div class="card bg-transparent">
							<!-- Image -->
							<div class="position-relative">
								<a href="/member/tripBoard/tripDetail"> <img
									src="
										<c:choose>
											<c:when test="${empty brdVO.attachVOList.get(0).attachDeVOList.get(0).savePath}">/resources/booking/assets/images/blog/13.jpg</c:when>
											<c:otherwise>/resources/upload${brdVO.attachVOList.get(0).attachDeVOList.get(0).savePath}</c:otherwise>
										</c:choose>
									"
									class="card-img" alt="대표사진">
								</a>
								<!-- Badge -->
								<div class="card-img-overlay p-3">
									<a href="#" class="badge text-bg-warning"><i
										class="fa-solid fa-heart" style="color: #ffffff;">${brdVO.brdLike}</i></a>
								</div>
							</div>

							<!-- Card body -->
							<div class="card-body p-3 pb-0">
								<!-- Title -->
								<div>
									<i class="bi bi-calendar2-plus me-2"></i>
									<fmt:formatDate var="frstDt" value="${brdVO.frstDt}" pattern="yyyy-MM-dd" />${frstDt}</div>
								<h5 class="card-title mt-2">
									<a href="/member/tripBoard/magazineDetail?brdId=${brdVO.brdId}">${brdVO.brdTt}</a>
								</h5>
								<span class="author">By <a href="#">${brdVO.lastWrtr} </a></span>
								<span class="views"> |  <i class="fa-solid fa-eye" style="color: #cdced0;"></i> ${brdVO.inqCnt}</span>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- Blog item END -->

			</div>


			<!-- 페이징처리 -->
			<div class="card-footer pt-0 mt-3">
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
						<ul class="pagination pagination-sm pagination-primary-soft mb-0 ">
							<li
								class="page-item <c:if test='${data.startPage < 6}'>disabled</c:if>"
								id="dataTable_previous"><a class="page-link"
								href="/member/tripBoard/magazineList?currentPage=${data.startPage-5}&sort=${param.sort}&keyword=${param.keyword}"
								aria-controls="dataTable" data-dt-idx="0" tabindex="-1">Prev</a>
							</li>
							<c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage}">
								<li class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
									<a
									href="/member/tripBoard/magazineList?currentPage=${pNo}&sort=${param.sort}&keyword=${param.keyword}"
									aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0"
									class="page-link">${pNo}</a>
								</li>
							</c:forEach>
							<li
								class="page-item <c:if test='${data.endPage == data.totalPages}'>disabled</c:if>"
								id="dataTable_next"><a class="page-link" href="/member/tripBoard/magazineList?currentPage=${brdPage.startPage+5}&sort=${param.sort}&keyword=${param.keyword}"
								aria-controls="dataTable" data-dt-idx="7" tabindex="-1">Next</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- Card footer END -->
		</div>


	</section>
	<!-- ======================= Blog grid END -->



</main>
<!-- **************** MAIN CONTENT END **************** -->


<!-- Back to top -->
<div class="back-top"></div>

<!-- Bootstrap JS -->
<script
	src="/resources/booking/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- ThemeFunctions -->
<script src="/resources/booking/assets/js/functions.js"></script>

</body>
</html>

<script type="text/javascript">
	//정렬 조회
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
