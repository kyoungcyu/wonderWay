<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<head>
<title>Wonderway-아이디찾기</title>
<style>
.error-container {
	/* display: inline-block; */
	color: red;
	padding-top: 1px;
}
</style>
<script type="text/javascript">
$(function() {
	var $emailConfirm = $("#emailConfirm");
	$("#btnEmailCheck").click(function() {
			let memEmail = $("#email").val();
			let data = {"memEmail" : memEmail};
			console.log("data : " + JSON.stringify(data));

			$.ajax({
				type : "post",
				url : "/member/sign/checkMemEmail",
				data : JSON.stringify(data),
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
				success : function(result) {
					console.log("result : " + JSON.stringify(result));
					console.log("result : " + result.result);
					let count = result.result;

					if (count > 0) {//회원 DB에 이메일 있음- 이메일 인증번호 발송
						$.ajax({
							type : "POST",
							url : "/member/email/mailCheck",
							data : {
								"email" : $(email).val()
							},
							beforeSend : function(xhr) {
								xhr.setRequestHeader("${_csrf.headerName}",
										"${_csrf.token}");
							},
							success : function(data) {
								$("#emailError").text("해당 이메일로 인증번호 발송이 완료되었습니다.").css("color","green");
								chkEmailConfirm(data, $emailConfirm);
							}
						})
					} else {//회원 DB에 이메일 xxx 
						$("#emailError").text("해당 이메일로 조회된 회원정보가 없습니다.")
						$(this).focus();
						
					}
				}
			})
		})
	// 이메일 인증번호 체크 함수
	function chkEmailConfirm(data, $emailConfirm) {
		$emailConfirm.on("keyup", function() {
			if (data != $emailConfirm.val()) { //
				emconfirmchk = false;
				$("#codeError").text("인증번호가 일치하지 않습니다")
				//console.log("중복아이디");
			} else { // 아니면 중복아님
				emconfirmchk = true;
				$("#codeError").text("인증번호 확인 완료").css("color","green")
				$("#btnFindId").removeAttr("disabled");

			}
		})
	}

	//이메일을 통해 아이디 확인한 후  모달창 열기
	$("#btnFindId").on("click",function() {
				let data = {
					"memEmail" : $(email).val()
				};
				console.log("data : " + JSON.stringify(data));

				$.ajax({
					type : "POST",
					url : "/member/email/findIdByEmail",
					data : JSON.stringify(data),
					contentType : "application/json;charset=utf-8",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}",
								"${_csrf.token}");
					},
					success : function(data) {
						$(".modal-body:first").html(
								"조회된 아이디는 <span style='color: blue;'>"
										+ data + "</span>입니다");
						$("#modalFindId").modal("show");
					}
				})
			})
});
</script>
</head>

<body>
	<main>
		<section class="pt-0 pt-lg-5">
			<div class="container h-100 d-flex px-0 px-sm-4">
				<div class="row justify-content-center align-items-center m-auto">
					<div class="col-12">
						<div class="bg-mode shadow rounded-3 overflow-hidden">
							<div class="row g-0">
								<!-- Vector Image -->
								<div
									class="col-lg-6 d-md-flex align-items-center order-2 order-lg-1">
									<div class="p-3 p-lg-5">
										<img
											src="/resources/booking/assets/images/element/forgot-pass.svg"
											alt="">
									</div>
									<!-- Divider -->
									<div class="vr opacity-1 d-none d-lg-block"></div>
								</div>

								<!-- Information -->
								<div class="col-lg-6 order-1">
									<div class="p-4 p-sm-7">
										<div class="d-flex">
											<!-- Logo -->
											<a href="index.html"> <img class="mb-4 h-50px"
												src="/resources/booking/assets/images/logo-icon.png"
												alt="logo">
											</a>
											<!-- Title -->
											<h1 class="mb-2 h3">&nbsp;아이디 찾기</h1>
										</div>
										<p class="mb-sm-0">회원정보에 등록된 이메일주소로 아이디를 찾을 수 있습니다</p>

										<!-- Form START -->
										<form class="mt-sm-4 text-start">
											<!-- Email -->
											<div class="mb-3">
												<label class="form-label">이메일 주소</label>
												<div class="d-flex">
													<input type="email" class="form-control" id="email" />
													<button type="button"
														class="btn btn-sm btn-primary-soft ms-2 px-4 mb-0 flex-shrink-0"
														id="btnEmailCheck">인증번호받기</button>
												</div>
											<div class="error-container" id="emailError"></div>
												
											</div>
											<div class="mb-3">
												<input type="text" class="form-control" id="emailConfirm"
													placeholder="이메일로 받은 인증번호를 입력해주세요" />
												<div class="error-container" id=codeError></div>
											</div>


											<div class="mb-3 text-center">
												<p>
													<a href="/member/sign/signIn">로그인 화면<span style="color:#85878A">으로 돌아가기</span></a>
												</p>
											</div>


											<!-- Button -->
											<div class="d-grid">
												<button type="button" id="btnFindId" class="btn btn-primary"
													disabled="true">아이디 찾기</button>
											</div>

											<!-- Divider -->
											<div class="position-relative my-4">
												<hr>
												<p class="small position-absolute top-50 start-50 translate-middle bg-mode px-2">간편 로그인</p>
											</div>

											<!-- Google and facebook button -->
											<div class="vstack gap-3">
												<a href="#" class="btn btn-light mb-0"><img src="/resources/booking/assets/images/kakao.png" width="20"> 카카오 로그인</a>
												<a href="#" class="btn btn-light mb-0"><img src="/resources/booking/assets/images/naver.png" width="20"> 네이버 로그인</a>
											</div>

											<!-- Copyright -->
											<div class="text-primary-hover mt-3 text-center">
												Copyrights ©2023 Booking. Build by <a
													href="https://www.webestica.com/">Webestica</a>.
											</div>
											<sec:csrfInput />
										</form>
										<!-- Form END -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- 아이디 확인 모달창  START-->
		<div class="modal fade" id="modalFindId" tabindex="-1"
			aria-labelledby="mapmodalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-sm">
				<div class="modal-content">
					<!-- Title -->
					<div class="modal-header">
						<h5 class="modal-title" id="mapmodalLabel">아이디 찾기</h5>
					</div>

					<!--모달 바디-->
					<div class="modal-body p-3">
						<div class='tab-content mb-0'></div>
					</div>

					<!--확인 버튼 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-primary mb-0"
							data-bs-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 아이디 확인 모달창  END-->

	</main>
</body>
</html>