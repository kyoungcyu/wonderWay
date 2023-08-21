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
		let faqTt = $("#faqTt").val();
		if(faqTt == ""){
			alert("제목을 입력해주세요");
			return;
		}
		let faqCode = $("#faqCode").val();
		if(faqCode == ""){
			alert("종류를 선택해주세요");
			return;
		}
		let faqAnsD = $(".ql-editor").html();
		let faqAns = $("textarea").html(faqAnsD);
		let object = { "faqTt": faqTt, "faqCode": faqCode, "faqAns": faqAnsD };
		$.ajax({
			url: "/admin/brd/faqRegistrationPost",
			contentType: "application/json;charset=utf-8",
			data: JSON.stringify(object),
			type: "post",
			beforeSend: function (xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function (result) {
				console.log("result : " + result);
				if (result == "success") {
					window.location.href = "/admin/brd/faq";
				} else {
					alert("실패 메시지");
				}
			},
			error: function () {
				alert("요청을 처리하는 동안 오류가 발생했습니다");
			}
		});
	});
});
</script>

<!-- Page main content START -->
<div class="page-content-wrapper p-xxl-4">
	<div class="col-lg-6">
			<h1 class="h3 mb-3 mb-sm-0">자주 묻는 질문 등록</h1>
		</div>
	<div class="card shadow mt-5">
		<div class="col-lg-12">
			<div class="card p-4">
		
				<!-- Card body START -->
				<div class="card-body p-0">
					<form:form id="frm01" action="/admin/brd/faqRegistrationPost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" class="row g-4">
						<!-- 제목 -->
						<div class="col-md-12">
							<label class="form-label">제목</label>
							<input type="text" class="form-control" name="faqTt" id="faqTt" required aria-required="true"/>
						</div>
						
						<div class="col-md-12">
							<label class="form-label">종류</label>
							<select class="form-select js-choice" aria-label=".form-select-sm" name="faqCode" id="faqCode">
								<option value="">선택</option>
								<option value="F01">국내/해외숙소</option>
								<option value="F02">렌터카</option>
								<option value="F03">교통/항공</option>
								<option value="F04">쿠폰/포인트</option>
								<option value="F05">결제/영수증</option>
								<option value="F06">회원</option>
							</select>
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
							<div class="bg-body border rounded-bottom h-400px overflow-hidden quilleditor" id="faqAns">
							</div>
						</div>
						
						<textarea name="faqAns" col="30" row="3" style="display:none;"></textarea>
						
						<!-- Button -->
						<div class="col-12 text-end" id="p2">
							<a class="btn btn-primary mb-0" href="javascript:history.back();">취소</a>
							<button type="button" class="btn btn-primary mb-0" id="register">등록</button>
						</div>
						<sec:csrfInput />
					</form:form>
				</div>
				<!-- Card body END -->
			</div>
		</div>
  	</div>
</div>


