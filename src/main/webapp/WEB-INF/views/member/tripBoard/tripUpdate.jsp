<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/choices.js@10.0.0"></script>

<!-- Favicon -->
<link rel="shortcut icon"
	href="/resources/booking/assets/images/favicon.ico">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/flatpickr/css/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/stepper/css/bs-stepper.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/quill/css/quill.snow.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/dropzone/css/dropzone.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/choices/css/choices.min.css">
<!-- Theme CSS -->
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/css/style.css">

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
					<img src="/resources/booking/assets/images/blog/13.jpg"
						class="rounded-3" value="${memImg}">
				</div>
				<!-- Title and content -->
				<div
					class="col-11 col-lg-10 mx-auto position-relative mt-n5 mt-sm-n7 mt-md-n8">
					<div class="bg-mode shadow rounded-3 p-4">

						<div class="card border">
							<!-- Title -->
							<div class="card-header border-bottom">
								<h4 class="card-header-title">여행후기 글 수정하기</h4>
							</div>


							<!-- Contact form START -->
							<div class="col-lg-12">
								<div class="card p-4">

									<!-- Card body START -->
									<div class="card-body p-0">
										<form:form modelAttribute="brdVO" id="tripUpdate" action="/member/tripBoard/tripUpdatePost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" class="row g-4">
											<!-- 제목 -->
											<div class="col-md-12">
												<input type="hidden" id="brdKnd" name="brdKnd" value="D01" />
												<label class="form-label">제목</label> <input type="text" class="form-control" name="brdTt" id="brdTt" value="${data.brdTt}"/>
												<input type="hidden" class="form-control" name="lastDt" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />" /> 
												<input type="hidden" class="form-control" name="brdId" id="brdId" value="${data.brdId}"/> 
												<input type="hidden" class="form-control" name="lastWrtr" id="lastWrtr" value="<sec:authentication property="principal.username"/>" />

											</div>
											
											<!-- 여행지 -->
											<div class="col-md-12">
											<label class="form-label">여행지</label>
													<select class="form-select js-choice" data-search-enabled="true" name="tourId">
													<option value="tourId" data-custom-properties="[object Object]">여행지</option>
														<c:forEach var="tour" items="${data1}" varStatus="status">
															<option value="${tour.tourId}">${tour.tourNm}</option>
														</c:forEach>
													</select>
													<div class="choices__list choices__list--single">
													</div>
												</div> 



											<!--내용 -->
											<div class="col-12">
												<label class="form-label">내용을 자유롭게 입력해주세요.</label>
												<textarea class="form-label" name="brdCntn" id="content">${data.brdCntn}</textarea>
											</div>
											
											
											
											


											<!-- 대표사진 -->
											<!-- Thumbnail image -->
											<div class="col-12">
												<label class="form-label">대표사진을 입력해주세요 *</label>
												 <input class="form-control" name="attachVOList[0].attachDeVOList[0].picture" value="${data.attachVOList[0].attachDeVOList[0].picture}"type="file" id="image" accept="image/gif, image/jpeg, image/png">
												<p class="small mb-0 mt-2">
													<b>주의 :</b> Only JPG, JPEG, and PNG. Our suggested dimensions are 600px * 450px.
												</p>
											</div>
											<!-- Button -->
											<div class="col-12 text-end" id="p2">
												<button type="button" class="btn btn-primary mb-0" id="back"
													onclick="javascript:location.href='/member/tripBoard/tripMain'">취소</button>
												<button type="submit" class="btn btn-primary mb-0" id="updateOk">수정</button>
											</div>
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
	<!-- =======================
Main banner END -->

	<!-- =======================
Blog content START -->
	<section>
		<div class="container">
			<div class="row"></div>
		</div>
	</section>
	<!-- =======================
Blog content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- Back to top -->
<div class="back-top"></div>

<!-- Bootstrap JS -->
<script src="/resources/booking/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- ThemeFunctions -->
<script src="/resources/booking/assets/js/functions.js"></script>

<script type="text/javascript">

	CKEDITOR.replace('content', {
	});
	
	var brdKnd = $("#brdKnd").val();
	
	$(function() {
		$("#updateOk").on("click", function() {
			$("#tripUpdate").submit();
		});
	});
	
	$(function(){
		  //직접입력 인풋박스 기존에는 숨어있다가
		$("#selboxDirect").hide();
		$("#selbox").change(function() {
		        //직접입력을 누를 때 나타남
		      if($("#selbox").val() == "direct") {
		          $("#selboxDirect").show();
		      }  else {
		          $("#selboxDirect").hide();
		      }
		  }) 
	});
	
	$(document).ready(function () {
		  // input필드에 자동완성 기능을 걸어준다
		  $('#inputSearch').autocomplete({
		    source: list,
		    focus: function (event, ui) {
		      return false;
		    },
		    select: function (event, ui) {},
		    minLength: 1,
		    delay: 100,
		    autoFocus: true,
		  });
		  
		});
	

</script>
