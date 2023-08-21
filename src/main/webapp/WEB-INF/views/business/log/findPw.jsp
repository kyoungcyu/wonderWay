<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<head>
<title>Wonderway-비밀번호찾기</title>
<style>
.error-container {
	color: red;
	padding-top: 1px;
}

</style>
<script type="text/javascript">
$(function() {
	var $emailConfirm = $("#emailConfirm");
	$("#btnEmailCheck").click(function() {
			let busiEmail = $("#email").val();
			let data = {"busiEmail" : busiEmail };
			console.log("data : " + JSON.stringify(data));

			$.ajax({
				type : "post",
				url : "/business/log/checkEmail",
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
							url : "/busi/email/mailCheck",
							data : {
								"email" : $(email).val()
							},
							beforeSend : function(xhr) {
								xhr.setRequestHeader("${_csrf.headerName}",
										"${_csrf.token}");
							},
							success : function(data) {
								console.log("인증코드:" +data)
								$("#emailError").text("해당 이메일로 인증번호 발송이 완료되었습니다.").css("color","green");
								chkEmailConfirm(data, $emailConfirm);
							}
						})
					} else {//회원 DB에 이메일 xxx 
						$("#emailError").text("해당 이메일로 조회된 회원정보가 없습니다.").css("color","red");
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
				$("#codeError").text("인증번호가 일치하지 않습니다").css("color","red")
				//console.log("중복아이디");
			} else { // 아니면 중복아님
				emconfirmchk = true;
				$("#codeError").text("인증번호 확인 완료").css("color","green")
				$("#btnResetPw").removeAttr("disabled");

			}
		})
	}

		//이메일 인증성공시 비밀번호 재설정 모달창 open
		$("#btnResetPw").on("click", function() {
			let data = {
				"busiEmail" : $("#email").val()
			};
			console.log("data : " + JSON.stringify(data));
			$("#modalResetPw").modal("show");
		});

		//비밀번호 재설정 
		$("#btnResetPwConfirm").on("click", function() {
			let data = {
				"busiEmail" : $("#email").val(),
				"busiPw" : $("#pw").val()
			};
			console.log("data : " + JSON.stringify(data));

			$.ajax({
				type : "POST",
				url : "/busi/email/resetPwByEmail",
				data : JSON.stringify(data),
				contentType : "application/json;charset=utf-8",
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(data) {
					console.log(data)
					$("#resetPwError").text("비밀번호 재설정 완료!").css("color","green");

				}
			})
		});

		//비밀번호 유효성 검사 함수
		function validatePw() {
			let pw = $("#pw").val()
			let checkPw = $('#checkPw').val()
			let pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/
			if (!pwRegex.test(pw) || pw.length < 8) {
				$("#pwError").text("영대소문자,숫자,특수문자를 포함한 8글자 이상이어야 합니다.")
				$('#pw').focus()
			} else {
				$("#pwError").text("")

				if (checkPw) {
					if (pw == checkPw) {
						$("#checkPwError").text("비밀번호가 일치합니다.").css("color","green");
						$("#btnResetPwConfirm").removeAttr("disabled");
						return true
					} else {
						$("#checkPwError").text("비밀번호가 일치하지 않습니다.").css("color","red")
						$('#checkPw').focus()
						return false
					}
				} else {
					$("#checkPwError").text("비밀번호 재확인을 입력하시오.")
					$('#checkPw').focus()
					return false
				}
			}
		}

		$("#pw").on("change", function() {//비밀번호,재확인 유효성검사
			validatePw();

		});

		$("#checkPw").on("change", function() {//비밀번호,재확인 유효성검사
			validatePw();

		});

	});
</script>
</head>

<body>
	<main>
		<section class="vh-xxl-100">
			<div class="container h-100 d-flex px-0 px-sm-4">
				<div class="row justify-content-center align-items-center m-auto">
					<div class="col-12">
						<div class="bg-mode shadow rounded-3 overflow-hidden">
							<div class="row g-0">
								<!-- Vector Image -->
								<div
									class="col-lg-6 d-flex align-items-center order-2 order-lg-1">
									<div class="p-3 p-lg-5">
										<img
											src="/resources/booking/assets/images/forgotPW.png"
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
											<h1 class="mb-2 h3">&nbsp;비밀번호 찾기</h1>
										</div>
										<p class="mb-sm-0">이메일 인증을 통해 비밀번호를 재설정 할 수 있습니다</p>

										<!-- Form START -->
										<form class="mt-sm-4 text-start">
											<!-- Email -->
											<div class="mb-3">
												<label class="form-label">이메일 주소</label>
												<div class="d-flex">
													<input type="email" class="form-control" id="email" />
													<button type="button"
														class="btn btn-sm btn-primary ms-2 px-4 mb-0 flex-shrink-0"
														id="btnEmailCheck" 
													style="background-color: #9400D3;">인증번호받기</button>
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
													<a href="/business/log/bsSignIn">로그인 <span style="color:#85878A">하러가기</span></a>
												</p>
											</div>

											<!-- Button -->
											<div class="d-grid">
												<button type="button" id="btnResetPw"
													class="btn btn-primary" 
													style="background-color: #9400D3;">비밀번호 변경</button>
											</div>

											<!-- Divider -->
											<div class="position-relative my-4">
												<hr>
												<p class="small position-absolute top-50 start-50 translate-middle bg-mode px-2"></p>
											</div>

											<!-- Copyright -->
											<div class="text-primary-hover mt-3 text-center">
												Copyrights ©2023 Booking. Build by <a
													href="https://www.webestica.com/">Webestica</a>.
											</div>
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
		<div class="modal fade" id="modalResetPw" tabindex="-1"
			aria-labelledby="mapmodalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-md">
				<div class="modal-content">
					<!-- Title -->
					<div class="modal-header">
						<h5 class="modal-title" id="mapmodalLabel">비밀번호 재설정</h5>
					</div>

					<!--모달 바디-->
					<div class="modal-body p-3">
						<!-- 비밀번호 -->
						<div class="mb-3 position-relative">
							<div class="position-relative">
							<label class="form-label">비밀번호</label> <input type="password"
								id="pw" class="form-control fakepassword" /> <span
								class="position-absolute top-50 end-0 translate-middle-y p-0 mt-3">
								<i class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
							</span>
							</div>
							<div class="error-container" id="pwError">
								<form:errors path="busiPw" />
							</div>
						</div>
						<!-- 비밀번호재확인 -->
						<div class="mb-3">
							<label class="form-label">비밀번호 재확인</label>
							<input type="password" class="form-control" id="checkPw" />
							<div class="error-container" id="checkPwError"></div>
						</div>
						
						<div>
							<button type="button" id="btnResetPwConfirm"
								class="btn btn-primary w-100 mb-0" disabled="true">비밀번호 변경</button>
							<div class="error-container" id="resetPwError"></div>
						</div>

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