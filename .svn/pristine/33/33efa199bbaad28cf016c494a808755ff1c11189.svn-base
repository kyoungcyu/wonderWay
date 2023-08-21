<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/choices.js@10.0.0"></script>
<%@page import="kr.or.ddit.vo.MemVO"%>

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

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/tiny-slider/tiny-slider.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/glightbox/css/glightbox.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/quill/css/quill.snow.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/choices/css/choices.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/flatpickr/css/flatpickr.min.css">

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
					style="background-image: url(/resources/booking/assets/images/bg/02.jpg); background-position: center center; background-repeat: no-repeat; background-size: cover;">
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
				<!-- =======================
Title and tabs START -->
				<section>
					<div class="container">
						<!-- 질문 -->
						<div class="row">
							<div class="col-12">
								<div class="card bg-light p-0 pb-0">
									<!-- Card body -->
									<div class="card-body d-flex justify-content-between flex-wrap">
										<!-- Title and badge -->
										<div>
											<!--  -->
											<div class="badge text-bg-dark">
												<i class="fa-solid fa-spa fa-fw text-warning"></i>질문
											</div>
											<!-- Title -->
											<h1 class="h3 mt-2 mb-1">${brdVO[0].brdTt}</h1>
											<span class="mb-2 mb-sm-0">
											 <i class="fa-solid fa-user" style="color: #d6d6d6;"></i> &nbsp
												${brdVO[0].frstWrtr} &nbsp 
												<fmt:formatDate var="frstDt" value="${brdVO[0].frstDt}" pattern="yyyy/MM/dd HH:mm:ss"/>
												<span class="mb-2 mb-sm-0"> <i
													class="fa-regular fa-calendar" style="color: #d6d6d6;"></i>
													&nbsp ${frstDt} &nbsp <i class="fa-solid fa-eye"
													style="color: #cdced0;"></i> ${brdVO[0].inqCnt+1} &nbsp <i
													class="fa-regular fa-thumbs-up me-1" id="likeImg"></i>
													${brdVO[0].brdLike}
											</span> <!-- 수정, 삭제, 목록 버튼 --> <%--개똥이${memVO.memId}${data.frstWrtr}SS --%>
												<!-- 현재 사용자와 글 작성자가 일치하는 경우에만 버튼 표시 --> <sec:authorize
													access="isAuthenticated()">
													<sec:authentication property="principal.memVO" var="memVO" />
													<c:if test="${memVO.memId==brdVO[0].frstWrtr}">
														<a href="/member/qnaBoard/qnaBoardUpdate?brdId=${brdVO[0].brdId}" class="btn btn-primary-soft btn-sm mx-2 qUpdate"
															id="qUpdate">수정</a>
														<button type="button" class="btn btn-primary-soft btn-sm mx-2 qDelete"
															id="qDelete" onclick="qDelete('${brdVO[0].brdId}')">삭제</button>
													</c:if>
												</sec:authorize> <a href="/member/qnaBoard/qnaList"
												class="btn btn-info-soft btn-sm" id="btnList">목록</a>
										</div>
										<!-- Buttons -->
										<ul class="list-inline mb-0">
											<!-- 좋아요 버튼 -->
											<li class="list-inline-item"><a href="#"
												class="btn btn-sm btn-white px-2" id="brdLike"> <i
													class="fa-solid fa-fw fa-heart"></i>
											</a></li>
											<!-- Share -->
											<li class="list-inline-item dropdown">
												<!-- Share button --> <a href="#"
												class="btn btn-sm btn-white px-2" role="button"
												id="dropdownShare" data-bs-toggle="dropdown"
												ria-expanded="false"> <i
													class="fa-solid fa-fw fa-share-alt"> </i>
											</a> <!-- dropdown button -->
												<ul class="dropdown-menu min-w-auto shadow rounded"
													aria-labelledby="dropdownShare">
													<li><a class="dropdown-item" href="#"><i
															class="fab fa-facebook-square me-2"></i>Facebook</a></li>
													<li><a class="dropdown-item" href="#"><i
															class="fa-solid fa-copy me-2"></i>Copy link</a></li>
												</ul>
											</li>
											<!-- Report -->
											<li class="list-inline-item"><a href="#"
												class="btn btn-sm btn-white px-2 report"
												data-bs-toggle="modal" data-bs-target="#reportModal"><i
													class="bi bi-exclamation-triangle-fill fa-fw"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- =======================
Title and tabs END -->

				<!-- =======================
Content START -->
				<section class="pt-0">
					<div class="container">
						<!-- Tabs contents START -->
						<div class="tab-content mb-0" id="tour-pills-tabContent">

							<!-- Content item START -->
							<div class="tab-pane fade show active" id="tab-1" role="tabpanel"
								aria-labelledby="tab-1">
								<div class="row g-4 g-lg-5">
									<!-- Left side START -->
									<div class="col-lg-11 col-xl-12">
										<!-- Card START -->
										<div class="card bg-transparent mb-4">
											<!-- Card body -->
											<div class="card-body px-3 py-0 mx-2">
												<p class="mb-3">${brdVO[0].brdCntn}</p>
											</div>
<!-- 											사진 첨부 -->
<%-- 											<c:if test="${brdVO[0].savePath != null}"> --%>
<!-- 											<div class="card-body px-0 pb-0" id="div01"> -->
<!-- 												<div class="row g-4"> -->
<!-- 													<div class="col-md-4" id="div01Img"> -->
<%-- 														<img src="/resources/upload/qna${brdVO[0].savePath}"> --%>
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 												사진첨부 END -->
<!-- 											</div> -->
<%-- 											</c:if> --%>
										</div>
									</div>
								</div>
								<!-- Content item END -->
								<div class="d-flex justify-content-end"></div>
							</div>
						</div>
					</div>

				</section>
				<!-- 로그인한 회원 -->
				<div class="d-flex start">
					<div>
						<button type="button" class="btn btn-primary-soft btn-sm mx-2 ansWrite" onclick="javascript:void(0)">답변[${fn:length(ansVO)}]</button>
					</div>
					<div class="d-flex justify-content-end">
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.memVO" var="memVO" />
							<c:if test="${memVO.memId!=null}">
								<button type="button"
									class="btn btn-primary-soft btn-sm mx-2 ansWrite"
									id="writeOkLogin">답변 등록하기</button>
								<input type="hidden" value="${brdVO[0].brdId}">
							</c:if>
						</sec:authorize>
						<!-- 비로그인  -->
						<sec:authorize access="isAnonymous()">
							<button type="button"
								class="btn btn-primary-soft btn-sm mx-2 ansWrite"
								id="writeNoLogin">답변 등록하기</button>
						</sec:authorize>
					</div>
				</div>
				<hr>

				<div class="alert alert-primary text-center" role="alert">
					회원님의 생각과 경험을 나누어 주세요.</div>

				<!-- 답변 작성 폼 -->
				<div class="card-body p-0" style="display: none;" id="answerSection">
					<form:form modelAttribute="ansVO" id="frm01"
						action="/member/qnaBoard/qnaAnsWrite?${_csrf.parameterName}=${_csrf.token}"
						method="post" enctype="multipart/form-data" class="row g-4">
						<!-- 제목 -->
						<div class="col-md-12">
							<label class="form-label">답변 제목 *</label> <input type="text"
								class="form-control" name="ansTt" /> <input type="hidden"
								class="form-control" name="ansId" /> <input type="hidden"
								class="form-control" name="ansWr" /> <input type="hidden"
								class="form-control" name="brdId" value="${brdVO[0].brdId}" />
						</div>
						<!--내용 -->
						<div class="col-12">
							<label class="form-label">답변 내용 *</label>
						</div>
						<div class="col-md-12">
							<textarea class="form-control" name="ansCntn" id="content"></textarea>
						</div>

						<!-- Button -->
						<div class="col-12 text-end" id="p2">
							<button type="button"
								class="btn btn-primary-soft btn-sm mx-2 ansWrite" id="back"
								onclick="backBack()">취소</button>
							<button type="button"
								class="btn btn-primary-soft btn-sm mx-2 ansWrite"
								id="registerOk">등록</button>
						</div>
						<%-- <sec:csrfInput /> --%>
					</form:form>
				</div>

				<!-- 답변 작성 끝 -->
				<!-- 답변은 여기에 -->
				<!-- ======================= Title and tabs START -->
				<section>
					<!-- 답변 -->
					<c:forEach var="ansVO" items="${ansVO}" varStatus="stat">
						<div class="container">
							<!-- 질문 -->
							<div class="row">
								<div class="col-12">
									<div class="card bg-light p-0 pb-0">
										<!-- Card body -->
										<div
											class="card-body d-flex justify-content-between flex-wrap">
											<!-- Title and badge -->
											<div>
												<!--  -->
												<div class="badge text-bg-dark">답변</div>
												</dr>
												<!-- Title -->
												<h6 class="h3 mt-2 mb-1">${ansVO.ansTt}</h6>
												<span class="mb-2 mb-sm-0"> <i
													class="fa-solid fa-user" style="color: #d6d6d6;"></i> ${ansVO.ansWr}
												</span> <input type="hidden" name="ansId" value="${ansVO.ansId}">
												<!-- 수정, 삭제, 목록 버튼 -->
												<%--개똥이${memVO.memId}${data.frstWrtr}SS --%>
												<!-- 현재 사용자와 글 작성자가 일치하는 경우에만 버튼 표시 -->
												<sec:authorize access="isAuthenticated()">
													<sec:authentication property="principal.memVO" var="memVO" />
													<c:if test="${memVO.memId==ansVO.ansWr}">
														<a href="#" class="btn btn-primary-soft btn-sm mx-2"
															onclick="ansUpdate('${ansVO.ansId}')" id="ansUpdate">수정</a>
														<button type="button"
															class="btn btn-primary-soft btn-sm mx-2" id="ansDelete"
															onclick="ansDelete('${ansVO.ansId}')">삭제</button>
													</c:if>
												</sec:authorize>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="container">
							<!-- Tabs contents START -->
							<div class="tab-content mb-0" id="tour-pills-tabContent">
								<!-- Content item START -->
								<div class="tab-pane fade show active" id="tab-1"
									role="tabpanel" aria-labelledby="tab-1">
									<div class="row g-4 g-lg-5">
										<!-- Left side START -->
										<div class="col-12">
											<!-- Card START -->
											<div class="card bg-transparent mb-4">
												<!-- Card body -->
												<div class="card-body px-3 py-0 mx-2">
													<p class="mb-3" style="font-size: 40px;">${ansVO.ansCntn}</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Content item END -->
								<div class="d-flex justify-content-end">
									<button type="button"
										class="btn btn-primary-soft btn-sm mx-2 cmtWrte" id="cmtWrte"
										onclick="cmtList(this, '${ansVO.ansId}')">댓글</button>
								</div>

								<!-- 댓글 작성 폼 -->
								<div class="card-body p-0 cmtWriteSection" style="display: none;"
									id="cmtWriteSection" >
									<form:form modelAttribute="ansVO" id="frm01"
										action="/member/qnaBoard/qnaAnsWrite?${_csrf.parameterName}=${_csrf.token}"
										method="post" enctype="multipart/form-data" class="row g-4">

										<!-- 제목 -->
										<div class="col-md-12">
											<label class="form-label">댓글 *</label> <input type="hidden"
												class="form-control" name="ansId" value="${ansVO.ansId}" />
											<input type="hidden" class="form-control" name="cmtId" /> <input
												type="hidden" class="form-control" name="cmtWr"
												value="<sec:authentication property="principal.username"/>" />
											<input type="hidden" class="form-control" name="brdId" value="${brdVO[0].brdId}" />
											<textarea class="form-control mb-0" id="comment" placeholder="댓글을 작성해주세요" rows="2" spellcheck="false"
												name="cmtCntn"></textarea>
										</div>

										<!-- Button -->
										<div class="col-12 text-end" id="p2">
											<button type="button"
												class="btn btn-primary-soft btn-sm mx-2 ansWrite" id="back"
												onclick="javascript:location.href='/member/qnaBoard/qnaDetail?brdId=${brdVO[0].brdId}'">취소</button>
											<button type="button"
												class="btn btn-primary-soft btn-sm mx-2 cmtWrite"
												id="cmtWriteOk" onclick="cmtWrite(this.form, '${ansVO.ansId}')">등록</button>
										</div>
										<sec:csrfInput />
									</form:form>
									<!-- 댓글창 -->
									<div class="container">
										<div class="row">
											<!-- 댓글 조회 시작 -->
											<c:forEach var="cmtVO" items="${ansVO.cmtList}" varStatus="stat">
												<div class="col-lg-12">
													<!-- Avatar and info -->
													<div class="d-flex align-items-center">
														<!-- Avatar -->
														<div class="avatar avatar-xl me-2 flex-shrink-0">

															<c:choose>
																<c:when
																	test="${cmtVO.savePath eq null || cmtVO.savePath eq ''}">
																	<img class="avatar-img rounded-circle cmt1"
																		src="/resources/upload/anonymous.jpg" alt=""
																		style="width: 65px; height: 65px;">
																</c:when>
																<c:otherwise>
																	<img class="avatar-img rounded-circle cmt1"
																		src="/resources/upload/mem${cmtVO.savePath}" alt=""
																		style="width: 65px; height: 65px;">
																</c:otherwise>
															</c:choose>



															</br> <input type="hidden" name="cmtId" value="${cmtVO.cmtId}" />
														</div>
														<!-- Info -->
														<div class="ms-4"></div>
														<div class="col-md-8 col-xxl-9">
															<h6>${cmtVO.cmtWr}</h6>
															<h6>${cmtVO.cmtCntn}</h6>
															<fmt:formatDate var="cmtDt" value="${cmtVO.cmtDt}" pattern="yyyy/MM/dd HH:mm:ss" />
															<p class="mb-1">${cmtDt}</p>
														</div>


														<!-- 댓글작성자와 현재 사용자가 일치하는 경우에만 버튼 표시  -->
														<!-- Button -->
														<sec:authorize access="isAuthenticated()">
															<sec:authentication property="principal.memVO"
																var="memVO" />
															<c:if test="${memVO.memId==cmtVO.cmtWr}">
																<div
																	class="d-flex justify-content-between align-items-center"
																	style="margin-left: auto;">
																	<!-- 수정 -->
																	<a href="#update-lg" id="cmtUpdate"
																		class="text-primary-hover open-modal"
																		onclick="cmtModalupdate('${cmtVO.cmtId}')"
																		data-bs-toggle="modal"
																		data-bs-target="#cmtUpdateModal"> <i
																		class="fa-regular fa-pen-to-square"
																		style="color: #969696;"></i>&nbsp;
																	</a>

																	<!-- 삭제 -->
																	<a href="javascript:void(0)" onclick="cmtDelete('${cmtVO.cmtId}')"
																		class="text-primary-hover cmtDelete"> <i
																		class="bi bi-trash3 me-1"></i>
																	</a>
																</div>
															</c:if>
														</sec:authorize>

													</div>
												</div>
												<hr>
											</c:forEach>

											<!-- 댓글 조회 끝 -->
										</div>
									</div>
									<!-- 댓글 창 끝 -->
								</div>
								<!-- 댓글 작성 끝 -->
							</div>
						</div>



					</c:forEach>

					<!-- 답변 수정 폼 -->
					<div class="modal fade" id="modal" data-backdrop="static"
						data-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog modal-xl">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">답변 수정하기</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										style="display: hidden" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form:form action="" post="post">
										<div class="mb-3">
											<label for="recipient-name" class="col-form-label">질문
											</label> <input type="text" class="form-control" name="brdTtUpdate"
												id="recipient-name" value="${brdVO[0].brdTt}" readonly>

										</div>
										<div class="mb-3">
											<label for="message-text" class="col-form-label">답변
												제목 : </label> <input type="text" class="form-control"
												name="ansTtUpdate" id="ansTtUpdate">
										</div>
										<div class="mb-3">
											<label for="message-text" class="col-form-label">답변내용
												: </label>
											<textarea class="form-control" id="content2"
												name="ansCntnUpdate"></textarea>
										</div>
										<input type="hidden" name="ansId" />

										<div class="mb-3">
											<label for="message-text" class="col-form-label">첨부파일
												: </label> <input class="form-control"
												name="attachVOList[0].attachDeVOList[0].picture" type="file"
												id="image" accept="image/gif, image/jpeg, image/png">
											<p class="small mb-0 mt-2">
										</div>
									</form:form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary cancelModal"
										data-dismiss="modal" id="cancelModal">취소</button>
									<button type="button" class="btn btn-primary ansModalUpdate"
										id="ansModalUpdate">수정하기</button>
								</div>
							</div>
						</div>
					</div>
					<!--답변 수정 폼 끝 -->





				</section>
	</main>

	<!-- 수정: 글 수정하기 -->
	<div class="modal fade cmtUpdateModal" id="cmtUpdateModal"
		tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">댓글 수정하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="md-9">
								<label for="recipient-name" class="col-form-label">내용</label></br> <label>
									<input type="hidden" name="cmtId" value=this> <textarea
										class="form-control" id="message-text1" name="cmtCntn"
										style="height: 200px;"></textarea>
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary Modalupdate"
						id="Modalupdate">수정하기</button>
				</div>
			</div>
		</div>
	</div>



	<!-- 신고 : 모달창 -->
	<div class="modal fade" id="reportModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="reprt" modelAttribute="brdVO"
						action="/member/tripBoard/tripReprt${_csrf.parameterName}=${_csrf.token}"
						method="post" enctype="multipart/form-data">
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">신고유형</label></br> <label>
								<input type="checkbox" name="option1" value="value1"> 광고
								</br> <input type="checkbox" name="option2" value="value2">
								성적인 게시물</br> <input type="checkbox" name="option3" value="value3">
								거짓 또는 사기 </br> <input type="checkbox" name="option4" value="value4">
								혐오발언</br> <input type="checkbox" name="option5" value="value5">
								비방 또는 명예훼손</br> <input type="checkbox" name="option6" value="value6">
								기타사유</br> <textarea class="form-control" id="message-text"
									name="option7"></textarea>
							</label>
						</div>
						<sec:csrfInput />
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="send">신고하기</button>
				</div>
			</div>
		</div>
	</div>




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
	//글 등록하기 회원만 가능하게
	$("#writeNoLogin").click(function() {
		alert("로그인한 회원만 가능합니다.");
		location.href = "/member/sign/signIn"
	});
	//ck에디터
	$(function() {
		CKEDITOR.replace('content', {});
		CKEDITOR.replace('content2', {});
	})

	//답변 등록 폼 보이기
	$('#writeOkLogin').on('click', function() {
		$('#answerSection').css('display', 'block');

	});

	//답변 등록하기
	$(function() {
		$("#registerOk").on('click', function() {
				alert("정상적으로 등록되었습니다.");
				$("#frm01").submit();
		})
	})

	//질문 삭제하기
	function qDelete(data) {
		var brdId = data;
		console.log("brdId : " + brdId);
		console.log("data : " + JSON.stringify(data));
		$.ajax({
			url : "/member/qnaBoard/queDelete",
			contentType : "application/json",
			data : brdId,
			type : "post",
			dataType : "text",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				if (result > 0) {
					if (confirm("정말 삭제하시겠습니까?")) {
						alert("정상적으로 삭제되었습니다.");
						location.href = "/member/qnaBoard/qnaMain"
					}
				} else {
					alert("삭제 중 오류가 발생했습니다. 다시 시도해주세요.")
				}
			}
		})

	}
	//답변 수정하기
	function ansUpdate(data) {
		var ansId = data;
		console.log("ansId : " + ansId);
		$('#modal').modal('show');

		$(".ansModalUpdate").on("click",function() {
			var brdId = $("input[name='brdId']").val();
			var ansTt = $("input[name='ansTtUpdate']").val();
			var ansCntn = CKEDITOR.instances.content2.getData();
			console.log("brdId : " + brdId);
			console.log("ansId : " + ansId);
			console.log("ansTt : " + ansTt);
			console.log("ansCntn : " + ansCntn);

			var data = {
				'ansId' : ansId,
				'ansTt' : ansTt,
				'ansCntn' : ansCntn
			}

					$.ajax({
						url : "/member/qnaBoard/ansUpdate",
						contentType : "application/json",
						data : JSON.stringify(data),
						type : "post",
						dataType : "text",
						beforeSend : function(xhr) {
							xhr.setRequestHeader(
									"${_csrf.headerName}",
									"${_csrf.token}");
						},
						success : function(result) {
							if (result > 0) {
									alert("정상적으로 수정되었습니다.");
									location.href = "/member/qnaBoard/qnaDetail?brdId="
											+ brdId;
							} 

						}
					})

						})
	}

	//답변 삭제하기
	function ansDelete(data) {
		var brdId = "${brdVO[0].brdId}"
		console.log("brdId ; " + brdId)
		var ansId = data;
		console.log("ansId : " + ansId);

		$.ajax({
			url : "/member/qnaBoard/ansDelete",
			data : {"ansId" : ansId} ,
			type : "post",
			dataType : "text",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				if (result > 0) {
						alert("정상적으로 삭제되었습니다.");
						location.href = "/member/qnaBoard/qnaDetail?brdId="
								+ brdId;
				} else {
					alert("삭제 중 오류가 발생했습니다. 다시 시도해주세요.")
				}
			}
		})
	}

	//댓글 등록 폼 보이기
	function cmtList(curr, data) {
		var ansId = data;
		console.log("ansId : " + ansId);
// 		console.log("hidden", $(curr).get(0))

		let showHide = $(curr).parent().next().css("display");
		console.log("showHide", showHide)
		
		$(".cmtWriteSection").each(function(i,v){
			$(this).css('display', 'none');
		})
		
		if(showHide=="none"){
			$(curr).parent().next().css('display', 'block');
		}else{
		}
	}
	//댓글 작성
	function cmtWrite(reForm, data) {
		var brdId = $("input[name='brdId']").val();
		var ansId = data;
		var memId = "${memVO.memId}";
		var cmtWr = $("input[name='cmtWr']").val();
		var cmtCntn = $("textarea[name='cmtCntn']", $(reForm)).val();
		console.log("cmtCntn : " + cmtCntn);
		console.log("brdId : " + brdId);
		console.log("ansId : " + ansId);
		console.log("cmtWr : " + cmtWr);
		var data = {
			"brdId" : brdId,
			"ansId" : ansId,
			"cmtWr" : cmtWr,
			"cmtCntn" : cmtCntn
		};

		//로그인한 회원만 가능하도록
		if (!memId) {
			alert("로그인 한 회원만 가능합니다.");
			location.href = "/member/sign/signIn";
		} else {
			if (cmtCntn.length !== 0) {
				$.ajax({
					url : "/member/qnaBoard/cmtWrite",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(data),
					type : "post",
					dataType : "text",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}",
								"${_csrf.token}");
					},
					success : function(result) {
						if (result == "success") {
								alert("정상적으로 등록되었습니다.");
								location.reload();
								$("#comment").val("");
						}
					}
				})
			}
		}
	}

	//댓글 수정 모달창에 댓글 아이디 넣기
	function cmtModalupdate(data) {
		console.log("data : " + data);
		var cmtId = data;
		console.log("cmtId : " + cmtId);
		$('input[name=cmtId]').attr('value', cmtId);
	}

	$(".Modalupdate").on("click",function() {
		var cmtId = $("input[name='cmtId']").val();
		var cmtCntn = document.getElementById("message-text1").value;
		console.log("cmtCntn: " + cmtCntn)
		console.log("cmtId : " + cmtId);
		var data = {
			"cmtId" : cmtId,
			"cmtCntn" : cmtCntn
		}
		console.log(data)
		$.ajax({
					url : "/member/qnaBoard/cmtUpdate",
					contentType : "application/json",
					data : JSON.stringify(data),
					type : "POST",
					dataType : "text",
					beforeSend : function(xhr) {
						xhr.setRequestHeader(
								"${_csrf.headerName}",
								"${_csrf.token}");
					},
					success : function(result) {
						if (result == "success") {
								alert("정상적으로 수정되었습니다.");
								location.href = "/member/qnaBoard/qnaDetail?brdId=${brdVO[0].brdId}";
								// 작성해 놓은 댓글 삭제
								$("#comment").val("");
						}

					}
				});
					});
	//댓글 삭제하기
	function cmtDelete(data) {
			var cmtId = data;
			console.log(cmtId);
			var data = {
				"cmtId" : cmtId
			}
			console.log(data);
			$.ajax({
				url : "/member/qnaBoard/cmtDelete",
				contentType : "application/json",
				data : JSON.stringify(data),
				type : "POST",
				dataType : "text",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(
							"${_csrf.headerName}",
							"${_csrf.token}");
				},
				success : function(result) {
					alert("정상적으로 삭제되었습니다.");
					location.href = "/member/qnaBoard/qnaDetail?brdId=${brdVO[0].brdId}";

				}

			});

	}

	//신고하기
	$(function() {
		$("#send").on("click",
		function() {
			// 로그인 여부 확인
			var memId = "${memVO.memId}"
			console.log("memId :" + memId);
			// 로그인되지 않은 경우 알림창 표시
			if (!memId) {
				alert("로그인 후에 신고할 수 있습니다. 로그인 페이지로 이동합니다.");
				location.href = "/member/sign/signIn";
			} else {
				var brdId = $("input[name='brdId']").val();
				console.log("brdId : " + brdId);
				// AJAX 요청으로 신고 수 증가 처리

				var param = {
					"brdId" : brdId
				};
				$ .ajax({
					url : "/member/tripBoard/tripReprt",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(param),
					type : "post",
					dataType : "text",
					beforeSend : function(xhr) {
						xhr.setRequestHeader(
								"${_csrf.headerName}",
								"${_csrf.token}");
					},
					success : function(result) {
						console.log("result : "
								+ result);
						if (result == "success") {
							alert("신고되었습니다.");
							location.href = "/member/qnaBoard/qnaDetail?brdId=${brdVO[0].brdId}";
						} else {
							alert("문제가 발생했습니다.");
						}
					}
				});
			}
		});
	});
	//좋아요 기능
$(function() {
	$("#brdLike").on("click",function() {
		var memId = "${memVO.memId}"
		console.log("memId :" + memId);

		//좋아요 눌렀는지 확인
		var findLike = "${findLike}"
		console.log("findLike : " + findLike);
		//누른 적 없으면 +1 insert
		var updateLike = "${updatedLikeCount}";
		console.log("updateLike : " + updateLike)
		//누른 적 있으면 -1 update
		var updateDisLike = "${updatedDislikeCount}";

		var brdId = ""
		if (!memId) {
			alert("회원만 이용가능합니다. 로그인 페이지로 이동합니다.");
			location.href = "/member/sign/signIn";
		} else {
			var brdId = $("input[name='brdId']").val();
			//console.log("brdId : " + brdId); 0

			var param = {
				"brdId" : brdId,
				"memId" : memId
			};

			if (findLike == null || findLike == ""
					|| findLike == 0) {
				$.ajax({
					url : "/member/qnaBoard/likeBrd",
					contentType : "application/json",
					data : JSON.stringify(param),
					type : "post",
					dataType : "text",
					beforeSend : function(xhr) {
						xhr.setRequestHeader(
								"${_csrf.headerName}",
								"${_csrf.token}");
					},
					success : function(result) {
						if (result == "success") {
							alert("공감되었습니다.");
							location.reload();
							//좋아요수 증가
						} else {
							alert("문제가 발생했습니다.");
						}
					}
				});

			} else {
					$.ajax({
						url : "/member/qnaBoard/dislikeBrd",
						contentType : "application/json",
						data : JSON.stringify(param),
						type : "post",
						dataType : "text",
						beforeSend : function(xhr) {
							xhr.setRequestHeader(
									"${_csrf.headerName}",
									"${_csrf.token}");
						},
						success : function(result) {
							if (result == "success") {
								alert("공감취소되었습니다.");
								location.reload();
							} else {
								alert("문제가 발생했습니다.");
							}
						}
					});
				}
			}
		})
	})
	
	
</script>