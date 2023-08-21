<%@page import="java.util.Date"%>
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

<!-- Favicon -->
<link rel="shortcut icon" href="/resources/booking/assets/images/favicon.ico">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/choices/css/choices.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/stepper/css/bs-stepper.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/quill/css/quill.snow.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/dropzone/css/dropzone.css">
<script src="/resources/booking/assets/vendor/choices/js/choices.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<!-- Theme CSS -->
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/css/style.css">

<script src="https://cdn.jsdelivr.net/npm/choices.js@10.0.0"></script>
<script src="/resources/booking/assets/vendor/quill/js/quill.min.js"></script>

<script type="text/javascript">
	$(function() {
		
	});
</script>
</head>

<c:set var="now" value="<%=new Date()%>" />
<!-- **************** MAIN CONTENT START **************** -->
<main>

	<!-- =======================
Main banner START -->
	<section class="py-0">
		<div class="container">
			<!-- Title -->
			<div class="row g-4">
				<!-- Image -->
				<div class="col-12">
					<img src="/resources/booking/assets/images/blog/13.jpg" class="rounded-3" >
				</div>
				<!-- Title and content -->
				<div class="col-11 col-lg-10 mx-auto position-relative mt-n5 mt-sm-n7 mt-md-n8">
					<div class="bg-mode shadow rounded-3 p-4">
						<div class="card border">
							<!-- Title -->
							<div class="card-header border-bottom">
								<h4 class="card-header-title">여행 매거진 등록</h4>
							</div>
							
							<!-- Contact form START -->
							<div class="col-lg-12">
								<div class="card p-4">
									<!-- Card body START -->
									<div class="card-body p-0">
										<form:form modelAttribute="brdVO" id="frm01" action="/admin/tour/magazineUpdatePost" method="post" enctype="multipart/form-data" class="row g-4">
											<!-- 제목 -->
											<div class="col-md-7">
												<input type="hidden" id="brdKnd" name="brdKnd" value="D05" />
												<label class="form-label">제목</label> 
												<input type="text" class="form-control" name="brdTt" id="brdTt" value="${vo.brdTt}" /> 
												<input type="hidden" class="form-control" name="brdId" id="brdId" value="${vo.brdId}" /> 
												<input type="hidden" class="form-control" name="frstDt" value="${vo.frstDt}" />
												<input type="hidden" class="form-control" name="lastWrtr" id="lastWrtr" value="${vo.lastWrtr}"/>
												<input type="hidden" class="form-control" name="lastDt" id="lastDt" value="${vo.lastDt}" />
												<input type="hidden" class="form-control" name="attachId" id="attachId" value="${vo.brdId}" />
											</div>

											<!-- 분류 -->
											<div class="col-md-5">
												<label class="form-label">여행지 리스트</label>
												<select class="form-select js-choice" name="tourId" data-search-enabled="true" >
													<option value="">선택해주세요</option>
													<c:forEach var="tour" items="${data}" varStatus="status">
														<option value="${tour.tourId}" <c:if test="${vo.tourId==tour.tourNm}">selected</c:if>>${tour.tourNm}</option>
													</c:forEach>
												</select>
												<div class="choices__list choices__list--single">
												</div>
											</div> 
											
											<!-- 내용 -->
											<div class="col-12">
												<!-- Editor toolbar -->
												<div class="bg-light border border-bottom-0 rounded-top py-3 quilltoolbar">
													<span class="ql-formats">
														<select class="ql-font"></select>
														<select class="ql-size"></select>
													</span>
													<span class="ql-formats">
														<button class="ql-bold"></button>
														<button class="ql-italic"></button>
														<button class="ql-underline"></button>
														<button class="ql-strike"></button>
													</span>
													<span class="ql-formats">
														<select class="ql-color"></select>
														<select class="ql-background"></select>
													</span>
													<span class="ql-formats">
														<button class="ql-code-block"></button>
													</span>
													<span class="ql-formats">
														<button class="ql-list" value="ordered"></button>
														<button class="ql-list" value="bullet"></button>
														<button class="ql-indent" value="-1"></button>
														<button class="ql-indent" value="+1"></button>
													</span>
													<span class="ql-formats">
											          	<button class="ql-direction" value="rtl"></button>
											       		<select class="ql-align"></select>
											        </span>
													<span class="ql-formats">
														<button class="ql-link"></button>
														<button class="ql-image"></button>
													</span>
													<span class="ql-formats">
														<button class="ql-clean"></button>
													</span>
												</div>
				
												<!-- Main toolbar -->
												<div class="bg-body border rounded-bottom h-400px overflow-hidden quilleditor" id="brdCntn" data-cntn="${vo.brdCntn}">
												</div>
												
											</div>
	
											<!-- 대표사진 -->
											<!-- Thumbnail image -->
											<div class="col-12">
												<label class="form-label">대표사진을 입력해주세요 *</label>
												 <input class="form-control" name="attachVOList[0].attachDeVOList[0].picture" type="file" id="image" accept="image/gif, image/jpeg, image/png">
												<p class="small mb-0 mt-2">
													<b>주의 :</b> Only JPG, JPEG, and PNG. Our suggested dimensions are 600px * 450px.
												</p>
											</div>

											<!-- Button -->
											<div class="col-12 text-end" id="p2">
												<button type="button" class="btn btn-success mb-0" id="btnUpdate">수정</button>
												<button type="button" class="btn btn-secondary mb-0" onclick="javascript:history.back()">취소</button>
											</div>
											<textarea name="brdCntn" col="30" row="3" style="display:none;"></textarea>
											<sec:csrfInput />
										</form:form>
									</div>
									<!-- Card body END -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="container">
			<div class="row"></div>
		</div>
	</section>
</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- Back to top -->
<div class="back-top"></div>


<script type="text/javascript">
	var brdCntn = $("#brdCntn").val();
	$(function() {
		var cntn = $("#brdCntn").data("cntn");
		$(".ql-editor").html(cntn);
		
		
		$("#btnUpdate").on("click", function() {
			let brdCntn = $(".ql-editor").html();
			
			$("textarea").html(brdCntn);
			$("#frm01").submit();
		});
	});
</script>
