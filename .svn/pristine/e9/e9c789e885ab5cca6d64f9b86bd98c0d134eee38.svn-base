<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/choices.js@10.0.0"></script>
<script src="/resources/booking/assets/vendor/quill/js/quill.min.js"></script>

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/flatpickr/css/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/stepper/css/bs-stepper.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/quill/css/quill.snow.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/dropzone/css/dropzone.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/choices/css/choices.min.css">

<script type="text/javascript">
var brdCntn = $("#brdCntn").val();
$(function() {
	$("#register").on("click", function() {
		let brdCntn = $(".ql-editor").html();
		$("textarea").html(brdCntn);
		$("#frm01").submit();
	});
});
</script>

<section class="pt-0">
	<div class="container">
		<!-- Hero banner START -->
		<div class="row">
			<div class="col-12">
				<!-- Card START -->
				<div class="card card-body bg-primary justify-content-center text-center px-4 px-sm-5 pt-6 pt-md-8 pb-8" style="background-image: url(assets/images/element/bg-pattern.png); background-position: center center; background-repeat: no-repeat; background-size: cover;">
					<!-- Title -->
					<h1 class="fs-2 text-white mb-4">고객센터 문의하기</h1>
				</div>
			</div>
		</div>
		<!-- Hero banner END -->

		<!-- Article single START -->
		<div class="row mt-n8">
			<div class="col-11 mx-auto">
			
				<div class="card shadow mt-5">
					<div class="col-lg-12">
						<div class="card p-4">
					
							<!-- Card body START -->
							<div class="card-body p-0">
								<form:form id="frm01" action="/member/csc/inquiryRegistrationPost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" class="row g-4">
									<!-- 제목 -->
									<div class="col-md-12">
										<input type="hidden" id="brdKnd" name="brdKnd" value="D04"/>
										<label class="form-label">제목</label>
										<input type="text" class="form-control" name="brdTt" id="brdTt" required aria-required="true"/>
										<input type="hidden" class="form-control" name="frstWrtr" id="frstWrtr" value="<sec:authentication property="principal.username"/>"/>
									</div>
									
									<!--내용 -->
									<div class="col-md-12">
										<label class="form-label">내용</label>
										<!-- Editor toolbar -->
										<div class="bg-light border border-bottom-0 rounded-top py-3 quilltoolbar">
											<span class="ql-formats">
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
												<button class="ql-link"></button>
												<button class="ql-image"></button>
											</span>
											<span class="ql-formats">
												<button class="ql-clean"></button>
											</span>
										</div>
			
										<!-- Main toolbar -->
										<div class="bg-body border rounded-bottom h-400px overflow-hidden quilleditor" id="brdCntn">
										</div>
									</div>
									
									<textarea name="brdCntn" col="30" row="3" style="display:none;"></textarea>
									
									<!-- Button -->
									<div class="col-12 text-end" id="p2">
										<a class="btn btn-primary mb-0" href="javascript:history.back();">취소</a>
										<button type="submit" class="btn btn-primary mb-0" id="register">등록</button>
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
		<!-- Article single END -->
	</div>
</section>


