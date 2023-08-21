<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@page import="kr.or.ddit.vo.AnsVO"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<style>
.hs-td-shorten {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	max-width: 50px !important;
}
</style>


<head>
<title>Booking - Multipurpose Online Booking Theme</title>

<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description"
	content="Booking - Multipurpose Online Booking Theme">


<!-- Favicon -->
<link rel="shortcut icon"
	href="/resources/booking/assets/images/favicon.ico">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/quill/css/quill.snow.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/tiny-slider/tiny-slider.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/glightbox/css/glightbox.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/choices/css/choices.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/flatpickr/css/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/dropzone/css/dropzone.css">
<!-- Theme CSS -->
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/css/style.css">

</head>

<body>

	<main>

		<!-- =======================
Main Banner START -->
		<section class="pt-0">
			<div class="container position-relative">
				<!-- Bg image -->
				<div class="rounded-3 p-4 p-sm-5"
					style="background-image: url(/resources/upload/qna.jpg); background-position: center center; background-repeat: no-repeat; background-size: cover;">
					<!-- Banner title -->
					<div class="row justify-content-be	tween pt-0 pb-5">
						<div class="col-md-7 col-lg-8 col-xxl-7 pb-5 mb-0 mb-lg-5">
							<a href="/member/qnaBoard/qnaMain">
								<h1 class="text-white">
									WonderWay</br> 질문답변 게시판
								</h1>
							</a>
							<p class="text-white mb-0">
								Life is either a daring adventure or nothing. </br>여행의 목적지는 장소가 아니라
								사물을 바라보는 새로운 시각이다.
							</p>
						</div>

					</div>
				</div>

				<!-- Search START -->
				<div class="row mt-n7">
					<div class="col-11 mx-auto">
						<!-- Booking from START -->
						<form class="bg-mode shadow rounded-3 p-4">
							<div class="row g-4 align-items-center">

								<div class="col-xl-10">
									<div class="row g-4">
										<!-- Guest -->
										<div class="col-md-1 col-lg-10">
											<!-- Input field -->
											<input class="form-control bg-transparent" type="search" placeholder="검색어를 입력해주세요" name="keyword" value="${param.keyword}" aria-label="Search">
										</div>
									</div>
								</div>

								<!-- 질문 Button -->
								<div class="col-xl-2">
									<div class="d-grid">
										<!-- 로그인한 회원 -->
										<sec:authorize access="isAuthenticated()">
											<sec:authentication property="principal.memVO" var="memVO" />
											<c:if test="${memVO.memId!=null}">
												<a href="#" class="btn btn-lg btn-dark mb-0" id="makeQ">질문하기</a>
											</c:if>
										</sec:authorize>
										<!-- 비로그인  -->
										<sec:authorize access="isAnonymous()">
											<a href="#" class="btn btn-lg btn-dark mb-0" id="noMakeQ">질문하기</a>
										</sec:authorize>
									</div>
								</div>
							</div>
						</form>
						<!-- Booking from END -->
					</div>
				</div>
				<!-- Search END -->












			</div>
		</section>
		<!-- =======================
Main Banner END -->


		</section>

		<section class="pt-0 pt-md-5">
			<div class="container">
				<!-- Title -->
				<div class="row mb-4">
					<div class="col-12 text-center">
						<h2 class="mb-0">WONDERWAY Q&A !</h2>
					</div>
				</div>

				<!-- Booking table START -->
				<div class="row">
					<div class="col-12">
						<div class="card border">
							<!-- Card header START -->
							<div class="card-header border-bottom">
								<div class="row align-items-center">
									<div class="col-md-6 col-lg-2">
										<!-- 왼쪽 정렬 -->
										<span class="badge bg-primary bg-opacity-10 text-primary">${total}개의 질문</span>
									</div>
									
									<div class="col-md-6 col-lg-10 d-flex justify-content-end">
									 <div class="ms-auto" style="width: 120px;">
										<!-- 오른쪽 정렬 -->
										<form class="align-items-center" id="frm01">
											<select class="form-select js-choice sort" aria-label=".form-select-sm" name="sort" id="sort" >
												<option value="">Sort by</option>
												<option value="frstDt"
													<c:if test="${param.sort=='frstDt'}">selected</c:if>>최근순</option>
												<option value="brdLike"
													<c:if test="${param.sort=='brdLike'}">selected</c:if>>인기순</option>
												<option value="inqCnt"
													<c:if test="${param.sort=='inqCnt'}">selected</c:if>>조회순</option>
											</select>
										</form>
										</div>
									</div>
								</div>
							</div>



							<!-- Card header END -->

							<!-- Card body START -->
							<div class="card-body">
								<!-- Search and select END -->

								<!-- Hotel room list START -->
								<div class="table-responsive border-0">
									<table
										class="table align-middle p-3 mb-0 table-hover table-shrink">
										<!-- Table head -->
										<thead class="table-light">
											<tr>
												<th scope="col" class="border-0 rounded-start">#</th>
												<th colspan='3' scope="col" class="border-0">질문</th>
												<th></th>
												<th></th>
												<th scope="col" class="border-0">작성일</th>
												<th scope="col" class="border-0">답변상태</th>
												<th scope="col" class="border-0">작성자</th>
												<th scope="col" class="border-0 rounded-end">조회수</th>
											</tr>
										</thead>
										<!-- Table body START -->
										<tbody class="border-top-0">
											<c:forEach var="allQnaBoardList" items="${allQnaBoardList}"
												varStatus="stat">
												<!-- Table item -->
												<%-- <input type="hidden" name="brdId" value="${qnaBoardList.brdId}"/> --%>
												<tr>
													<td>
														<h6 class="mb-0">${allQnaBoardList.rnum}</h6>
													</td>
													<td colspan='3'>
														<h6 class="mb-0">
															<a
																href="/member/qnaBoard/qnaDetail?brdId=${allQnaBoardList.brdId}">${allQnaBoardList.brdTt}</a>
														</h6>
													</td>
													<td></td>
													<td></td>
													<fmt:formatDate var="frstDt"
														value="${allQnaBoardList.frstDt}" pattern="yyyy/MM/dd" />
													<td>${frstDt}</td>

													<td><c:choose>
															<c:when test="${allQnaBoardList.isOk eq '미답변'}">
																<div
																	class="badge bg-danger bg-opacity-10 text-bg-secondary-soft text-black">${allQnaBoardList.isOk}</div>
															</c:when>
															<c:otherwise>
																<div
																	class="badge bg-success bg-opacity-10 text-bg-secondary-soft text-black">${allQnaBoardList.isOk}</div>
															</c:otherwise>
														</c:choose></td>

													<td>
														<h6 class="mb-0 fw-light">${allQnaBoardList.frstWrtr}</h6>
													</td>
													<td>
														<h6 class="mb-0 fw-light">${allQnaBoardList.inqCnt}</h6>
													</td>
												</tr>

											</c:forEach>
										</tbody>
										<!-- Table body END -->
									</table>
								</div>
								<!-- Hotel room list END -->
							</div>
							<!-- Card body END -->
							<!-- 페이징처리 -->
							<div class="card-footer pt-0 mt-3">
								<!-- Pagination and content -->
								<div
									class="d-sm-flex justify-content-sm-between align-items-sm-center">
									<!-- Content -->
									<c:set var="endRow"
										value="${allPage.currentPage * allPage.size}" />
									<c:set var="startRow" value="${endRow - (allPage.size - 1)}" />
									<c:set var="total" value="${allPage.total}" />
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
												class="page-item <c:if test='${allPage.startPage < 6}'>disabled</c:if>"
												id="dataTable_previous"><a class="page-link"
												href="/member/qnaBoard/qnaList?currentPage=${qnaPage.startPage-5}&sort=${param.sort}&keyword=${param.keyword}"
												aria-controls="dataTable" data-dt-idx="0" tabindex="-1">Prev</a>
											</li>
											<c:forEach var="pNo" begin="${allPage.startPage}"
												end="${allPage.endPage}">
												<li
													class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
													<a
													href="/member/qnaBoard/qnaList?currentPage=${pNo}&sort=${param.sort}&keyword=${param.keyword}"
													aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0"
													class="page-link">${pNo}</a>
												</li>
											</c:forEach>
											<li
												class="page-item <c:if test='${allPage.endPage == allPage.totalPages}'>disabled</c:if>"
												id="dataTable_next"><a class="page-link"
												href="/member/qnaBoard/qnaList?currentPage=${qnaPage.startPage+5}&sort=${param.sort}&keyword=${param.keyword}"
												aria-controls="dataTable" data-dt-idx="7" tabindex="-1">Next</a>
											</li>
										</ul>
									</nav>
								</div>
							</div>
							<!-- 페이징 END -->
						</div>
					</div>
				</div>
				<!-- Booking table END -->
			</div>
		</section>
		<!-- =======================
Packages END -->





	</main>
	<!-- **************** MAIN CONTENT END **************** -->


	<!-- Back to top -->
	<div class="back-top"></div>

	<!-- Bootstrap JS -->
	<script
		src="/resources/booking/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Vendors -->
	<script
		src="/resources/booking/assets/vendor/tiny-slider/tiny-slider.js"></script>
	<script
		src="/resources/booking/assets/vendor/glightbox/js/glightbox.js"></script>
	<script
		src="/resources/booking/assets/vendor/choices/js/choices.min.js"></script>
	<script
		src="/resources/booking/assets/vendor/flatpickr/js/flatpickr.min.js"></script>

	<!-- ThemeFunctions -->
	<script src="/resources/booking/assets/js/functions.js"></script>

</body>
</html>

<script type="text/javascript">
	//정렬 조회
	$(function() {
		$("#sort").on("change", function() {
			$("#frm01").submit();
		});
	});
	//질문하기
	$(function() {
		$("#makeQ").on("click", function() {
			location.href = "/member/qnaBoard/qnaBoardWrite";
		})

		$("#noMakeQ").on("click", function() {
			alert("로그인한 회원만 가능합니다.");
			location.href = "/member/sign/signIn";
		})

	})
</script>
