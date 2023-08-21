<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
.parent {
  display: flex;
  justify-content: center;
  align-items: center;
}
 .reply-text {
    color: blue; 
  }
      .mainImage {
         width: 1170px; 
         height: 658px; 
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
			<c:choose>
			<c:when test="${data.savePath != null}">
				<img src="/resources/upload/tripBoard${data.savePath}" class="rounded-3 mainImage" alt="">
			</c:when>
			<c:otherwise>
				<img src="/resources/booking/assets/images/blog/13.jpg" class="rounded-3" alt="">
			
			</c:otherwise>
			</c:choose>
			</div>
			<!-- Title and content -->
			<div class="col-11 col-lg-10 mx-auto position-relative mt-n5 mt-sm-n7 mt-md-n8">
				<div class="bg-mode shadow rounded-3 p-4">
					<!-- Badge -->
					<div class="badge text-bg-success mb-2">${data.tourId}</div>
					<!-- Title -->
					<h1 class="fs-3">${data.brdTt}</h1>
					<!-- List -->
					<ul class="nav nav-divider align-items-center">
						<li class="nav-item">
							<div class="nav-link">
								<div class="d-flex align-items-center">
								
								<c:choose>
								<c:when test="${data.memImg != null}">
									<div class="avatar avatar-sm">
										<img class="avatar-img rounded-circle" src="/resources/upload/mem${data.memImg}" alt="avatar">
									</div>
								</c:when>
								<c:otherwise>	
									<div class="avatar avatar-sm">
										<img class="avatar-img rounded-circle" src="/resources/upload/anonymous.jpg" alt="avatar">
										</div>
								</c:otherwise>
			</c:choose>	
										
									<!-- Info -->
									<div class="ms-2">
										<h6 class="mb-0">
											<a href="#">${data.frstWrtr}</a>
										</h6>
									</div>
								</div>
							</div>
						</li>
						<li class="nav-item">
							<i class="bi bi-calendar2-plus me-2"></i>
							<fmt:formatDate var="frstDt" value="${data.frstDt}" pattern="yyyy/MM/dd HH:mm:ss"/> ${frstDt}
						</li>
						<li class="nav-item">
							<i class="fa-solid fa-eye" style="color: #cdced0;"></i> ${data.inqCnt+1}
						</li>
					</ul>
					<div class="d-flex justify-content-end">
						<%--개똥이${memVO.memId}${data.frstWrtr}SS --%>
						<!-- 현재 사용자와 글 작성자가 일치하는 경우에만 버튼 표시 -->
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.memVO" var="memVO" />
							<c:if test="${memVO.memId==data.lastWrtr}">
								<a href="/member/tripBoard/tripUpdate?brdId=${data.brdId}" class="btn btn-primary-soft btn-sm mx-2" id="btnUpdate">수정</a>
								<button type="button" class="btn btn-primary-soft btn-sm mx-2" id="btnDelete">삭제</button>
							</c:if>
						</sec:authorize>
						<a href="/member/tripBoard/tripBoardList" class="btn btn-info-soft btn-sm" id="btnList">목록</a>
					</div>
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
								<div
									class="bg-light rounded d-md-flex justify-content-center align-items-center text-center p-3 mt-4">
									<div class="d-flex justify-content-center align-items-center">
										<!-- 공감하기 button -->
										<button type="button" id="tripGood"
											class="btn btn-outline-secondary btn-sm mb-0">
											<i class="fa-regular fa-thumbs-up me-1" id="likeImg"></i><span
												id="likeCount">${data.brdLike}</span>
										</button>
									</div>
								</div>
							</c:if>
						</sec:authorize>
						<sec:csrfInput />
					</form:form>

					<!-- 비로그인 좋아요 기능 x -->
					<sec:authorize access="isAnonymous()">
						<div
							class="bg-light rounded d-md-flex justify-content-center align-items-center text-center p-3 mt-4">
							<div class="d-flex justify-content-center align-items-center">
								<!-- 공감하기 button -->
								<button type="button" id="noGood"
									class="btn btn-outline-secondary btn-sm mb-0">
									<i class="fa-regular fa-thumbs-up me-1" id="image"></i>${data.brdLike}</button>
							</div>
						</div>
					</sec:authorize>
					<sec:csrfInput />

					<!-- 수정모드 -->

					<!-- 버튼을 눌렀을 때 전송할 데이터 -->
					<input type="hidden" name="brdId" id="brdId" value="${brdVO.brdId}">
					<input type="hidden" name="brdKnd" value="${brdVO.brdKnd}">
					
				</div>
			</div>

			<!-- 댓글, 신고하기 버튼 -->
			<div class="col-lg-10 mx-auto">
			  <div class="d-flex justify-content-between align-items-center mt-3">
			    <div>
			      <a class="text-primary-hover">댓글 <span style="color: red;" ${cmtCount}>[${cmtCount}]</span></a>
			    </div>
			    <div>
			      <a href="#modal-lg" class="text-primary-hover" data-bs-toggle="modal" data-bs-target="#reportModal">
			        <i class="bi bi-info-circle me-1"></i>신고하기
			      </a>
			    </div>
			  </div>
			</div>

			<!-- 신고하기 버튼 끝 -->

			<!--댓글 작성 -->
			<form:form modelAttribute="cmtVO" id="cmtWrite"
				action="/member/tripBoard/cmtWrite">
				<div class="col-lg-10 mx-auto">
					<div class="collapse show" id="collapseComment">
						<div class="d-flex mt-3">
							<textarea class="form-control mb-0" id="comment"
								placeholder="댓글을 작성해주세요" rows="2" spellcheck="false"
								name="cmtCntn"></textarea>
							<input type="hidden" class="form-control" name="cmtWrUpdate" id="cmtWr"
								value="<sec:authentication property="principal.username"/>" />
							<input type="hidden" class="form-control" name="brdIdUpdate"
								value="${brdVO.brdId}" id="brdId" /> <input type="hidden"
								class="form-control" name="cmtIdUpdate" id="cmtId"
								value="${cmtVO.cmtId}" /> <input type="hidden"
								class="form-control" name="cmtDtUpdate" id="cmtDt" /> <input
								type="hidden" class="form-control" name="repCmtId" id="repCmtId" />
							<button type="button" 
								class="btn btn-sm btn-primary ms-2 px-4 mb-0 flex-shrink-0"
								id="commentButton">
								<i class="fas fa-paper-plane fs-5"></i>
							</button>
						</div>
					</div>
				</div>
				<sec:csrfInput />
			</form:form>

			<!-- Review poll END -->
<hr>
		</div>

		<!-- 댓글창 -->
		<div class="container">
			<div class="row">
			<!-- 댓글 조회 시작 -->
				<c:forEach var="cmtVO" items="${cmtList}" varStatus="stat">
					<div class="col-lg-10 mx-auto">
						<!-- Avatar and info -->
						<div class="d-flex align-items-center">
							<!-- Avatar -->
							<div class="parent">
							  <div class="avatar avatar-xl me-2 flex-shrink-0">
									<c:choose>
										<c:when test="${cmtVO.savePath eq null || cmtVO.savePath eq ''}">
											 <img class="avatar-img rounded-circle cmt1" src="/resources/upload/anonymous.jpg" alt="" style="width: 70px; height: 70px;">
										</c:when>
										<c:otherwise>
											 <img class="avatar-img rounded-circle cmt1" src="/resources/upload/mem${cmtVO.savePath}" alt="" style="width: 70px; height: 70px;">
										</c:otherwise>
									</c:choose>
									<input type="hidden" name="cmtId" value="${cmtVO.cmtId}" />
							  </div>
							</div>
							<!-- Info -->
							<div class="ms-4"></div>
							<div class="col-md-8 col-xxl-9">
							  <h6>  ${cmtVO.cmtWr}  </h6>
								<h6>${cmtVO.cmtCntn}</h6>
								<fmt:formatDate var="cmtDt" value="${cmtVO.cmtDt}" pattern="yyyy/MM/dd HH:mm:ss" />
								<p>${cmtDt}</p>
							</div>


							<!-- 댓글작성자와 현재 사용자가 일치하는 경우에만 버튼 표시  -->
							<!-- Button -->
							<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal.memVO" var="memVO" />
								<c:if test="${memVO.memId==cmtVO.cmtWr}">
								
									<div class="d-flex justify-content-between align-items-center"
										style="margin-left: auto;">
								<!-- 수정 -->
										<a href="#update-lg" id="cmtUpdate" class="text-primary-hover open-modal" onclick="cmtUpdate('${cmtVO.cmtId}')"
											data-bs-toggle="modal" data-bs-target="#cmtUpdateModal">
											<i class="fa-regular fa-pen-to-square"
											style="color: #969696;"></i>&nbsp;
										</a>

										<!-- 삭제 -->
										<button type="button" onclick="cmtDelete('${cmtVO.cmtId}')" class="text-primary-hover cmtDelete" >
											<i class="bi bi-trash3 me-1"></i>
										</button>
									</div>
								</c:if>
							</sec:authorize>
						</div>
						
						<div style="float: right;" id="repCmt"
							class="u_cbox_btn_reply u_cbox_btn_reply_on reply-text">
							<strong class="u_cbox_reply_txt">답 글</strong>
						</div>
					</div>
					
						<!-- 대댓글 기능 시작 -->
					<div class="repToggle">
					<div id="repToggle" class="repToggle" style="margin-left: 85px; width: calc(100% - 100px);">
						

							<!-- 대댓글 조회 -->
							<c:forEach var="repCmtList" items="${repCmtList}" varStatus="stat">
								<c:if test="${cmtVO.cmtId==repCmtList.repCmtId}">
									<div class="row Toggle">
										<div class="col-lg-10 mx-auto">
											<!-- 대댓글 내용 시작 -->
											<div class="d-flex align-items-center">
												<!-- 대댓글 작성자 프로필 사진, 아이디 -->
												<div class="avatar avatar-xl me-2 flex-shrink-0">
									<c:choose>
										<c:when test="${repCmtList.savePath eq null || repCmtList.savePath eq ''}">
											 <img class="avatar-img rounded-circle cmt1" src="/resources/upload/anonymous.jpg" alt="" style="width: 60px; height: 60px;">
										</c:when>
										<c:otherwise>
											 <img class="avatar-img rounded-circle cmt1" src="/resources/upload/mem${repCmtList.savePath}" alt="" style="width: 60px; height: 60px;">
										</c:otherwise>
									</c:choose>
													<br> <input type="hidden" name="cmtId"
														value="${repCmtList.cmtId}" />
												</div>
												<!-- Info -->
												<div class="ms-1">
													<div class="col-md-40">
														<h6>${repCmtList.cmtWr}</h6>
														<h6>${repCmtList.cmtCntn}</h6>
														<fmt:formatDate var="cmtDt" value="${repCmtList.cmtDt}"
															pattern="yyyy/MM/dd HH:mm:ss" />
														<p class="mb-1">${cmtDt}</p>
													</div>
												</div>
												
												<!-- 대댓글 수정, 삭제 -->
												<!-- Button -->
												<div class="ms-auto" style="margin-left: -400px; margin-right: -7px; display: flex;">
													<sec:authorize access="isAuthenticated()">
														<sec:authentication property="principal.memVO" var="memVO" />
														<c:if test="${memVO.memId==repCmtList.cmtWr}">
															<div class="text-primary-hover ms-2 d-flex align-items-center">
																<!-- 수정 -->
																<a href="#update-lg" id="cmtUpdate" class="text-primary-hover open-modal"
																	onclick="cmtUpdate('${repCmtList.cmtId}')"
																	data-bs-toggle="modal" data-bs-target="#cmtUpdateModal">
																	<i class="fa-regular fa-pen-to-square"
																	style="color: #969696;"></i>&nbsp;
																</a>
																<!-- 삭제 -->
																<button type="button" onclick="cmtDelete('${repCmtList.cmtId}')"
																	class="text-primary-hover cmtDelete">
																	<i class="bi bi-trash3 me-1"></i>
																</button>
															</div>
														</c:if>
													</sec:authorize>
												</div>
												<!-- 대댓글 수정, 삭제 끝 -->
											</div>
												<!-- 대댓글 내용 끝-->
										</div>
									</div>
								</c:if>
							</c:forEach>
							<!-- 대댓글 조회 끝 -->
							
							
							<!-- 대댓글 작성 시작 -->
							<div class="d-flex mt-3" style="margin-left: 90px; width: calc(100% - 170px);">

								<textarea class="form-control mb-0" id="repComment"
									placeholder="댓글을 작성해주세요" rows="2" spellcheck="false"
									name="cmtCntn"></textarea>
								<input type="hidden" class="form-control" name="cmtWrUpdate"
									id="cmtWr" value="<sec:authentication property="principal.username"/>" />
								<input type="hidden" class="form-control" name="brdIdRep"
									value="${brdVO.brdId}" id="brdId" /> <input type="hidden"
									class="form-control" name="cmtIdRep" id="cmtId"
									value="${cmtVO.cmtId}" /> <input type="hidden"
									class="form-control" name="cmtDtRep" id="cmtDt" /> <input
									type="hidden" class="form-control" name="repCmtId"
									id="repCmtId" value="${repCmtId}" />
								<button type="button"
									class="btn btn-sm btn-primary ms-2 px-4 mb-0 flex-shrink-0 repCommentButton"
									>
									<i class="fas fa-paper-plane fs-5"></i>
								</button>
							</div>
							<!-- 대댓글 작성 끝-->
							<hr class="dotted">
						
						
					</div>
					</div>
					<!-- 대댓글 기능 끝 -->
				</c:forEach>
				<hr class="dotted">
			<!-- 댓글 조회 끝 -->
			</div>
		</div>
		<!-- 댓글 창 끝 -->
	</section>

	<!-- 신고 : 모달창 -->
	<div class="modal fade" id="reportModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="reprt" modelAttribute="brdVO" action="/member/tripBoard/tripReprt${_csrf.parameterName}=${_csrf.token}"
						method="post" enctype="multipart/form-data">
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label" style="font-size: 20px; font-weight: bold;"><label>신고유형</label> </br>
								</br><input type="checkbox" name="option1" value="value1"><label>&nbsp;광고</label> </br>
								<input type="checkbox" name="option2" value="value2"><label>&nbsp;성적인 게시물</label> </br>
								<input type="checkbox" name="option3" value="value3"><label>&nbsp;거짓 또는 사기</label> </br>
								<input type="checkbox" name="option4" value="value4"><label>&nbsp;혐오발언</label> </br>
								<input type="checkbox" name="option5" value="value5"><label>&nbsp;비방 또는 명예훼손</label> </br>
								<input type="checkbox" name="option6" value="value6"><label>&nbsp;기타사유</label> </br>
<!-- 								</br><textarea class="form-control" id="message-text" name="option7"></textarea> -->
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
	
	
<!-- 수정: 댓글 수정하기 -->
<div class="modal fade cmtUpdateModal" id="cmtUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">댓글 수정하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="reprt" modelAttribute="cmtVO" action="/member/tripBoard/tripDetail?${_csrf.parameterName}=${_csrf.token}" method="post">
          <div class="row">
            <div class="col-md-12">
              <div class="md-9">
                <label for="recipient-name" class="col-form-label">내용</label></br> 
                <label>
                  <textarea class="form-control" id="message-text1" name="cmtCntn" style="height: 200px;"></textarea>
                </label>
              </div>
            </div>
          </div>
          <sec:csrfInput />
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="update">수정하기</button>
      </div>
    </div>
  </div>
</div>




	<!-- ======================= Blog content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- Back to top -->
<div class="back-top"></div>

<!-- Bootstrap JS -->
<script
	src="/resources/booking/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- ThemeFunctions -->
<script src="/resources/booking/assets/js/functions.js"></script>

<script>
	//신고하기
	$(function() {
		$("#send").on("click",function() {
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
				$.ajax({
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
							location.href = "/member/tripBoard/tripDetail?brdId="
									+ brdId;
						} else {
							alert("문제가 발생했습니다.");
						}
					}
				});
			}
		});
	});

	//글 삭제하기
	$(function() {
		$("#btnDelete") .on( "click", function() {
			//console.log("test");
			alert("눌렀음");
			var brdId = $("input[name='brdId']").val();
			//D0120230629004
			console.log("brdId", brdId)
			var data = {
				"brdId" : brdId
			};
			console.log("data : " + JSON.stringify(data));
			$.ajax({
				url : "/member/tripBoard/tripDelete",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				type : "post",
				dataType : "text",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(
							"${_csrf.headerName}",
							"${_csrf.token}");
				},
				success : function(result) {
					if (result == "success") {
						alert("삭제되었습니다.");
						location.href = "/member/tripBoard/tripBoardList";
					} else {
						alert("삭제 도중 문제가 발생했습니다.");
					}
				}
			});
		});
	});
	//좋아요 버튼 클릭 시 실행되는 함수
	$(function() { 
		$('#tripGood') .on( 'click', function() {
			var memId = "${memVO.memId}"
			//console.log("memId : " + memId); o

			// 로그인되지 않은 경우 알림창 표시
			if (!memId) {
				alert("로그인 한 회원만 가능합니다.");
				location.href = "/member/sign/signIn";
			} else {
				var brdId = $("input[name='brdId']").val();
				//console.log("brdId : " + brdId); o
				// AJAX 요청으로 신고 수 증가 처리
				var param = {
					"brdId" : brdId,
					"memId" : memId
				};
				
				var findLike = "${findLike}"
				console.log("findLike : " + findLike);
				var updateLike = "${updatedLikeCount}";
				var updateDisLike = "${updatedDislikeCount}";

				if (findLike == null || findLike == ""
						|| findLike == 0) {
					$.ajax({
						url : "/member/tripBoard/likeBrd",
						contentType : "application/json",
						data : JSON.stringify(param),
						type : "post",
						dataType : "text",
						beforeSend : function(xhr) {xhr.setRequestHeader(
							"${_csrf.headerName}",
							"${_csrf.token}");
						},
						success : function(result) {
							if (result == "success") {
								alert("공감되었습니다.");
								location.reload();
								$("#image").removeClass("fa-regular fa-thumbs-up me-1").addClass("fa-sharp fa-solid fa-thumbs-up-clicked");
								//좋아요수 증가
							} else {
								alert("문제가 발생했습니다.");
								$("#image") .removeClass( "fa-sharp fa-solid fa-thumbs-up-clicked").addClass( "fa-regular fa-thumbs-up me-1");
							}
						}
							});

				} else {
					$.ajax({
						url : "/member/tripBoard/dislikeBrd",
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
		});
	});

	//비로그인 대상 좋아요 기능 제한
	$(function() {
		$('#noGood').on('click', function() {
			alert("로그인한 회원만 가능합니다.");
			location.href = "/member/sign/signIn";
		});
	});

	//페이지 로드 시 게시글 번호 에 맞는 댓글 불러오기.
	$(function() {
		var cmtId = $('input[name=cmtId]').val();
	});

	//ajax 댓글 작성하기
	$(function() {
		$('#commentButton').on(
				'click',
				function() {
					var brdId = $("input[name='brdId']").val();
					var memId = "${memVO.memId}";
					var comment = $("#comment").val();
					console.log("comment : " + comment);
					var data = {
						"brdId" : brdId,
						"memId" : memId,
						"cmtCntn" : comment,
						
					};

					console.log("data : " + JSON.stringify(data));
					
					//로그인한 회원만 가능하도록
					if (!memId) {
						alert("로그인 한 회원만 가능합니다.");
						location.href = "/member/sign/signIn";
					} else {
						if (comment.length !== 0) {
							$.ajax({
								url : "/member/tripBoard/cmtWrite",
								contentType:"application/json;charset=utf-8",
								data : JSON.stringify(data),
								type : "post",
								dataType: "text",
								beforeSend : function(xhr) {
									xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
								},
								success : function(result) {
									if (result == "success") {
										alert("작성되었습니다.")
										location.reload();
										$("#comment").val("");

									}else {
										alert("등록에 실패하였습니다.");
									}
								}
							})
						} else{
							alert("내용을 입력해주세요.");
						}
					}
					//로그인 INSERT
				});

	});

	
//대댓글 작성하기
//답글 토글 기능
$(document).ready(function() {
  $(".u_cbox_btn_reply").click(function() {
    var toggleElement = $(this).closest(".col-lg-10").next(".repToggle");
    toggleElement.slideToggle('slow');
  });
});


//대댓글 작성하기
$(function() {
		$('.repCommentButton').on( 'click', function() {
//   		var brdId = $("input[name='brdIdRep']").val();
			var brdId = $(this).prev().prev().prev().prev().val();
//		    var repCmtId = $("input[name='cmtId']").val();
			var repCmtId = $(this).prev().prev().prev().val();
			var memId = "${memVO.memId}";
			var repComment = $(this).parent().children("textarea").val();
			console.log("repComment : " + repComment);
			console.log("repCmtId : " + repCmtId);
			var data = {
				"brdId" : brdId,
				"memId" : memId,
				"cmtCntn" : repComment,
				"repCmtId":repCmtId
			};

			console.log("data : " + JSON.stringify(data));
			
			//로그인한 회원만 가능하도록
			if (!memId) {
				alert("로그인 한 회원만 가능합니다.");
				location.href = "/member/sign/signIn";
			} else {
				if (comment.length !== 0) {
					$.ajax({
						url : "/member/tripBoard/replyWrite",
						contentType:"application/json;charset=utf-8",
						data : JSON.stringify(data),
						type : "post",
						dataType: "text",
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success : function(result) {
							if (result == "success") {
								alert("작성되었습니다.")
								location.reload();
								$("#repComment").val("");

							}else {
								alert("등록에 실패하였습니다.");
							}
						}
					})
				} else{
					alert("내용을 입력해주세요.");
				}
			}
			//로그인 INSERT
		});

	});
	
//대댓글 수정하기 - 모달창 열기
document.addEventListener('DOMContentLoaded', function() {
  var openModalButtons = document.querySelectorAll('.open-modal');

  openModalButtons.forEach(function(button) {
    button.addEventListener('click', function() {
      var modal = document.querySelector('.modal.fade.cmtUpdateModal');
      modal.classList.add('show');
      document.body.classList.add('modal-open');
    });
  });
});


// 댓글, 대댓글 수정하기
function cmtUpdate(cmtId){
	console.log("cmtId : " + cmtId)
	
	$('#update').on( 'click', function() {
		var brdId = $("input[name='brdIdUpdate']").val();
		var cmtCntn = document.getElementById("message-text1").value;
		var cmtDt =$("input[name='cmtIdUpdate']").val();
		console.log("cmtCntn: " + cmtCntn)
		console.log("cmtId : " + cmtId);
		var data = {
			"brdId" : brdId,
			"cmtId" : cmtId,
			"cmtCntn" : cmtCntn
		} 
		console.log(data)
			$.ajax({
			url : "/member/tripBoard/cmtUpdate",
			contentType : "application/json",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "text",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(result) {
				if (result == "success") {
					alert("수정성공");
					location.href = "/member/tripBoard/tripDetail?brdId=" + brdId;
					// 작성해 놓은 댓글 삭제
					$("#comment").val("");
				}

			}

		}); 
	});
}

//댓글, 대댓글 삭제하기
function cmtDelete(cmtId){
	$('.cmtDelete').on( 'click', function() { 
		var brdId = $("input[name='brdId']").val();
		console.log(brdId)
		console.log(cmtId);
		var data = {
			"brdId" : brdId,
			"cmtId" : cmtId
		}
		console.log(data)
		$.ajax({
			url : "/member/tripBoard/cmtDelete",
			contentType : "application/json",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "text",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(result) {
				if (result == "success") {
					alert("삭제 성공했습니다.")
					location.reload();
				}

			}

		});
	});	
	
}



//댓글  관련 토글
$(document).ready(function() {
  // 대댓글 버튼에 클릭 이벤트를 바인딩합니다.
  $(document).on("click", ".repToggle .u_cbox_btn_reply", function() {
    // 대댓글을 감싸는 부모 요소의 클래스
    var toggleClass = ".repToggle";

    // 대댓글의 인덱스 찾기
    var index = $(this).closest(toggleClass).index();

    // 대댓글의 토글 상태 배열
    var toggleStates = [];

    // 모든 대댓글의 토글 상태를 false로 설정
    $(toggleClass).each(function() {
      toggleStates.push(false);
    });

    // 대댓글의 토글 상태 토글하기
    toggleStates[index] = !toggleStates[index];

    // 토글 상태에 따라 대댓글 표시/숨김 처리
    $(toggleClass).each(function(i) {
      if (toggleStates[i]) {
        $(this).find('.repContent').show();
        $(this).find('.repForm').show();
      } else {
        $(this).find('.repContent').hide();
        $(this).find('.repForm').hide();
      }
    });
  });
});





</script>

	