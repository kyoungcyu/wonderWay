<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="kr.or.ddit.vo.BrdVO"%>
<%@page import="kr.or.ddit.vo.CmtVO"%>
<%@page import="kr.or.ddit.vo.AttachDeVO"%>


<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<style>
hr.dotted {
	border-style: dotted;
}

.text-primary-hover {
	background: none;
	border: none;
	padding: 0;
	margin: 0;
	cursor: pointer;
}

.reply-text {
	color: blue;
}
</style>

<!-- Favicon -->
<link rel="shortcut icon"
	href="/resources/booking/assets/images/favicon.ico">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/bootstrap-icons/bootstrap-icons.css">

<!-- Theme CSS -->
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/css/style.css">
<!-- **************** MAIN CONTENT START **************** -->
<c:set var="now" value="<%=new Date()%>" />
<main>
	<!-- =======================Main banner START -->
	<section class="py-0">
		<div class="container">
			<!-- Title -->
			<div class="row g-4">
				<!-- Image -->
				<div class="col-12 d-flex justify-content-center align-items-center">
					<%-- <img src="/resources/upload/tripBoard"+${data.attachVOList.get(0).attachDeVOList.get(0).savePath}" class="rounded-3" alt=""> --%>
					<img src="
						<c:choose>
							<c:when test="${empty data.attachVOList.get(0).attachDeVOList.get(0).savePath}">/resources/booking/assets/images/blog/13.jpg</c:when>
							<c:otherwise>/resources/upload${data.attachVOList.get(0).attachDeVOList.get(0).savePath}</c:otherwise>
						</c:choose>
						" class="rounded-3" alt="">
				</div>
				<!-- Title and content -->
				<div
					class="col-11 col-lg-10 mx-auto position-relative mt-n5 mt-sm-n7 mt-md-n8">
					<div class="bg-mode shadow rounded-3 p-4">
						<!-- Badge -->
						<div class="badge text-bg-primary mb-2">${data.brdKnd}</div>
						<!-- Title -->
						<h1 class="fs-3">${data.brdTt}</h1>
						<!-- List -->
						<ul class="nav nav-divider align-items-center">
							<li class="nav-item">
								<div class="nav-link">
									<div class="d-flex align-items-center">
										<!-- Avatar -->
										<div class="avatar avatar-sm">
											<div class="avatar avatar-sm">
												<img class="avatar-img rounded-circle" src="/resources/booking/assets/images/avatar/09.jpg" alt="avatar">
											</div>
										</div>
										<!-- Info -->
										<div class="ms-2">
											<h6 class="mb-0">
												<a href="#">${data.lastWrtr}</a>
											</h6>
										</div>
									</div>
								</div>
							</li>
							<li class="nav-item"><i class="bi bi-calendar2-plus me-2"></i>
								등록일: <fmt:formatDate value="${data.frstDt}" pattern="yyyy/MM/dd" /> | 최종 수정일: <fmt:formatDate value="${data.lastDt}" pattern="yyyy/MM/dd" />
							</li>
							<li class="nav-item">
								<i class="fa-solid fa-eye" style="color: #cdced0;"></i> ${data.inqCnt+1}
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- =======================Main banner END -->

	<!-- =======================Blog content START -->
	<section>
		<div class="container">
			<div class="row">

				<div class="col-lg-10 mx-auto">
					<div>${data.brdCntn}</div>

					<!-- 로그인한 사용자일 경우 -->
					<form:form modelAttribute="likeBrdVO" id="frm01"
						action="/member/tripBoard/likeBrd?${_csrf.parameterName}=${_csrf.token}"
						method="post" enctype="multipart/form-data">
						<sec:authorize access="isAuthenticated()">
							<c:if test="${memVO.memId!=null}">
								<div class="bg-light rounded d-md-flex justify-content-center align-items-center text-center p-3 mt-4">
									<div class="d-flex justify-content-center align-items-center">
										<!-- 공감하기 button -->
										<button type="button" id="tripGood" class="btn btn-outline-secondary btn-sm mb-0">
											<i class="fa-regular fa-thumbs-up me-1" id="likeImg"></i>
											<span id="likeCount">${data.brdLike}</span>
										</button>
									</div>
								</div>
							</c:if>
						</sec:authorize>
						<sec:csrfInput />
					</form:form>

					<!-- 버튼을 눌렀을 때 전송할 데이터 -->
					<input type="hidden" name="brdId" id="brdId" value="${brdVO.brdId}">
					<input type="hidden" name="brdKnd" value="${brdVO.brdKnd}">
				</div>
				<div class="d-flex justify-content-end" style="padding-right: 100px;">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a class="btn btn-success-soft mb-0" href="/admin/tour/magazineUpdate?brdId=${data.brdId}" style="margin-right: 5px;">수정</a>
						<a class="btn btn-warning-soft mb-0" href="/admin/tour/magazineDeletePost?brdId=${data.brdId}" style="margin-right: 5px;">삭제</a>
						<a href="/admin/tour/magazineList" class="btn btn-info-soft " >목록</a>
						<sec:csrfInput/>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_MEMBER')">
						<a href="/member/tripBoard/magazineList" class="btn btn-info-soft" >목록</a>
						<sec:csrfInput/>
					</sec:authorize>
				</div>
			</div>
			<hr>
		</div>
	</section>

	<!-- ======================= Blog content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- Back to top -->
<div class="back-top"></div>

<!-- Bootstrap JS -->
<script src="/resources/booking/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- ThemeFunctions -->
<script src="/resources/booking/assets/js/functions.js"></script>

