<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<head>
<title>Wonderway-회원가입</title>
<style>
.error-container {
	color: red;
	padding-top: 1px;
}
</style>
<script type="text/javascript">

$(function() {
	//회원가입 버튼 활성화 위환 변수
	var isIdCheck=false;
	var isEmailConfirm=false;;
	var isAgreeAll=false;
	var isAgree1=false;
	var isAgree2=false;
	
	
	//유효성검사 시작
	//아이디 유효성검사
	$("#id").on(
			"change",
			function() {
				let id = $(this).val()
				let idRegex = /^[a-z0-9_-]{4,20}$/
				if (id == "") {
					$("#idError").text("필수값입니다.")
				} else {
					if (!idRegex.test(id) || id.length<4 || id.length>20) {
						$("#idError").text(
								"4~20자의 영문 소문자,숫자와 특수기호(_),(-)만 사용 가능합니다").css("color","red")
						$('#id').focus()
						$('#register').prop("disabled",true);
					} else {
						$("#idError").text("")
						$("#btnMemIdCheck").removeAttr("disabled");
					}
				}
			});
			
	
	//아이디 중복검사
	$("#btnMemIdCheck").on("click",function() {
		let memId = $("#id").val();
		let data = {"memId" : memId};
		console.log("data : " + JSON.stringify(data));

		$.ajax({
			type : "post",
			url : "/member/sign/checkMemId",
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

				if (count > 0) {//중복됨
					$("#idError").text("이미 사용중인 아이디 입니다")
					$(this).focus();
				} else {//중복안됨
					$("#idError").text("사용 가능한 아이디 입니다").css("color","green")
					isIdCheck=true;
					enableBtnRegister()
				}
				
				$("#id").on("change",function() {
					isIdCheck=false;
				});
			}
		});
	});		

	
	//비밀번호 유효성검사
	$("#pw").on("change", function() {
		validatePw();

	});

	//비밀번호 재확인 유효성검사
	$("#checkPw").on("change", function() {
		validatePw();

	});

	//이름 유효성검사
	$("#nm").on("change", function() {
		let nm = $(this).val()
		let nmRegex = /^[가-힣]{2,}$/
		if (nm == "") {
			$("#nmError").text("필수값입니다.")
		} else {
			if (!nmRegex.test(nm) || nm.length < 2) {
				$("#nmError").text("한글 2글자 이상이어야 합니다.")
				$('#nm').focus()
			} else {
				$("#nmError").text("")
			}
		}
	});

	//영문 이름 유효성검사
	$("#enm").on("change", function() {
		let enm = $(this).val()
		let enmRegex = /^[A-Z]*$/
		if (enm == "") {
			$("#enmError").text("필수값입니다.")
		} else {
			if (!enmRegex.test(enm)) {
				$("#enmError").text("영문 대문자만 입력 가능합니다.")
				$('#enm').focus()
			} else {
				$("#enmError").text("")
			}
		}
	});

	
	//영문 성 유효성 검사
	$("#fmnm").on("change", function() {
		let fmnm = $(this).val()
		let fmnmRegex = /^[A-Z]*$/
		if (fmnm == "") {
			$("#fmnmError").text("필수값입니다.")
		} else {
			if (!fmnmRegex.test(fmnm)) {
				$("#fmnmError").text("영문 대문자만 입력 가능합니다.")
				$('#fmnm').focus()
			} else {
				$("#fmnmError").text("")
			}
		}
	});

	//전화번호 유효성 검사
	$("#tel").on("change", function() {
		let tel = $(this).val()
		let telRegex = /^\d{10,11}$/
		if (tel == "") {
			$("#telError").text("필수값입니다.")
		} else {
			if (!telRegex.test(tel)) {
				$("#telError").text("-없이 숫자 10-11자리로 입력해주세요")
				$('#tel').focus()
			} else {
				$("#telError").text("")
			}
		}
	});
	
	//이메일 유효성 검사 
	$("#email").on("change",function() {
		isEmailConfirm=false;
		console.log(isEmailConfirm)
		let email = $(this).val()
		let emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
		if (!emailRegex.test(email)) {
			$("#emailError").text("이메일 형식에 맞게 입력해주세요")
			$('#email').focus()
			$('#register').prop("disabled",true);
		} else {
			$("#emailError").text("")
			$("#btnEmailCheck").removeAttr("disabled");
		}
	});
	
	//이메일 중복검사+인증코드
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

					if (count > 0) {//중복됨
						$("#emailError").text("이미 사용중인 이메일입니다")
						$(this).focus();
					} else {//중복안됨
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
								$("#emailError").text("")
								$("#modalEmailCheck").modal("show");
								chkEmailConfirm(data, $emailConfirm);
							}
						})
					}
				}
			});
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
					return true
				} else {
					$("#checkPwError").text("비밀번호가 일치하지 않습니다.")
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

	//이메일 인증번호 일치여부 검사 함수
	function chkEmailConfirm(data, $emailConfirm) {
		$emailConfirm.on("keyup", function() {
			if (data != $emailConfirm.val()) { //
				$("#codeError").text("인증번호가 일치하지 않습니다").css("color", "red")
				//console.log("중복아이디");
			} else { // 아니면 중복아님
				$("#codeError").text("인증번호 확인 완료!").css("color", "green")
				isEmailConfirm=true;
			}
		})
	}
	
	
	
	//전체동의 버튼 클릭시 
	 $("input[name='agreeAll']").on("change", function() {
 		isAgreeAll=!isAgreeAll
		console.log("AgreeAll",isAgreeAll)
		$("input[name^='agree']").prop("checked", isAgreeAll);
		enableBtnRegister();
	});
	
	
	//개인정보활용동의 버튼 클릭시
	$(".agree").on("change",function(){
// 		isAgree2=!isAgree2;
// 		console.log("Agree2",isAgree2);
		let isAgree = $(this).is(":checked");
		$(this).prop("checked",isAgree);
		enableBtnRegister();
		countCheck();
	});
	
	
	//회원가입 버튼 활성화 함수
	function enableBtnRegister(){
	    isAgree1 = $("input[name='agree1']").is(":checked");
	    isAgree2 = $("input[name='agree2']").is(":checked");
	    console.log(isAgree1,isAgree2)
		if(isIdCheck && isEmailConfirm && isAgree1 && isAgree2) {
			$('#register').prop("disabled",false);
		}else{
			$('#register').prop("disabled",true);
		}
	}
	
	//동의 버튼 카운트 체크(전체동의 활성화,비활성화에 필요)
	function countCheck(){
		if($("input[name='agree1']").is(":checked")==true&&$("input[name='agree2']").is(":checked")==true&&$("input[name='agree3']").is(":checked")==true){
			$("input[name='agreeAll']").prop("checked", true);
			
		}else{
			$("input[name='agreeAll']").prop("checked", false);
		}
	}
	
	
});





</script>
</head>
<body>
	<section class="pt-0 pt-lg-5">
		<div class="container h-100 d-flex px-0 px-sm-4">
			<div class="row justify-content-center align-items-center m-auto">
				<div class="col-12">
					<div class="bg-mode shadow rounded-3 overflow-hidden">
						<!-- Form START -->
						<form:form modelAttribute="memVO"
										action="/member/sign/signUpPost" method="post"
										class="mt-4 text-start" id="regist">
					
						<div class="row g-0">
							<!-- 왼쪽 -->
							<div class="col-lg-6 order-1" >
								<div class="p-4 pt-1 p-sm-6">
									<div class="d-flex">
										<!-- Logo -->
										<img class="h-50px mb-4"
											src="/resources/booking/assets/images/logo-icon.png"
											alt="logo">
									
										<!-- Title -->
										<h1 class="mb-2 h3">&nbsp;회원가입</h1>
									</div>
									<p class="mb-3">
										이미 회원이신가요?<a href="/member/sign/signIn">&nbsp;로그인</a></p>
									
									
									<!-- 아이디 -->
										<div class="mb-3">
											<label class="form-label">아이디</label>
											<div class="d-flex">
												<form:input path="memId" style="width:340px;" class="form-control" id="id" placeholder="아이디를 입력 후 중복검사를 해주세요" />
												<button type="button"
													class="btn btn-sm btn-primary-soft ms-2 px-4 mb-0 flex-shrink-0"
													id="btnMemIdCheck" disabled="true">중복검사</button>
											</div>
											<div class="error-container" id="idError">
												<form:errors path="memId" />
											</div>
										</div>
										
										<!-- 비밀번호 -->
										<div class="mb-3 position-relative">
											<div class="position-relative">
											<label class="form-label">비밀번호</label>
											<form:password path="memPw" class="form-control fakepassword"
												id="pw" />
											<span
												class="position-absolute top-50 end-0 translate-middle-y p-0 mt-3">
												<i class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
											</span></div>
											<div class="error-container" id="pwError">
												<form:errors path="memPw" />
											</div>
										</div>
										<!-- 비밀번호재확인 -->
										<div class="mb-3">
											<label class="form-label">비밀번호 재확인</label> <input
												type="password" class="form-control" id="checkPw" />
											<div class="error-container" id="checkPwError"></div>
										</div>

										<!-- 이름 -->
										<div class="mb-3">
											<label class="form-label">이름</label>
											<form:input path="memNm" class="form-control" id="nm" />
											<div class="error-container" id="nmError">
												<form:errors path="memNm" />
											</div>
										</div>

										<!-- 영문 이름 -->
										<div class="mb-3">
											<label class="form-label">영문 이름</label>
											<form:input path="memEnm" class="form-control" id="enm" />
											<div class="error-container" id="enmError">
												<form:errors path="memEnm" />
											</div>
										</div>

										<!-- 영문 성 -->
										<div class="mb-3">
											<label class="form-label">영문 성</label>
											<form:input path="memFmnm" class="form-control" id="fmnm" />
											<div class="error-container" id="fmnmError">
												<form:errors path="memFmnm" />
											</div>
										</div>
										
										<!-- 생년월일 -->
										<div class="mb-3">
											<label class="form-label">생년월일</label>
											<form:input path="memBir" type="date" class="form-control" />
											<div class="error-container">
												<form:errors path="memBir" />
											</div>
										</div>
										
										<!-- 성별 -->
										<div class="mb-0">
											<label class="form-label">성별</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<form:radiobutton path="memGen" value="M" label="남성" />&nbsp;&nbsp;&nbsp;
											<form:radiobutton path="memGen" value="F" label="여성" />
											<div class="error-container" id="genError">
												<form:errors path="memGen" />
											</div>
										</div>
								</div>
								<!-- 구분선 -->
								<div class="vr opacity-1 d-none d-lg-block"></div>
							</div>

							<!-- 오른쪽 -->
							<div class="col-lg-6 order-2">
								<div class="p-4 p-sm-6">
										

										<!-- 전화번호 -->
										<div class="mb-3">
											<label class="form-label">전화번호</label>
											<form:input path="memTel" class="form-control" id="tel" />
											<div class="error-container" id="telError">
												<form:errors path="memTel" />
											</div>
										</div>
										
										<!-- Email -->
										<div class="mb-3">
											<label class="form-label">이메일</label>
											<div class="d-flex">
												<form:input path="memEmail" class="form-control" id="email" />
												<button type="button"
													class="btn btn-sm btn-primary-soft ms-2 px-4 mb-0 flex-shrink-0"
													id="btnEmailCheck" disabled="true">인증번호받기</button>
											</div>
											<div class="error-container" id=emailError></div>
										</div>
										<div class="mb-3">
											<input type="text" class="form-control" id="emailConfirm"
												placeholder="이메일로 받은 인증번호를 입력해주세요" />
											<div class="error-container" id=codeError></div>
										</div>
										
										<!--약관동의  -->
										<div class="mb-3 mt-4">
											<div class="card border">
												<div class="card-header border-bottom">
													<h5 class="card-header-title">약관동의</h5>
													<label class="form-label mb-0"><input type="checkbox" value="false" field="[object Object]" name="agreeAll" class="css-8um586">
													전체 동의</label>
												</div>
												<!-- Card body START -->
												<div class="card-body">
													<!-- 이용약관 -->
													<div class="mb-3">
														<label class="form-label"><input type="checkbox" value="false" field="[object Object]" name="agree1" class="css-8um586 agree">
														<span class="text-primary">(필수) </span>이용약관 </label>
														<a href="http://localhost/member/main/termsConditions"> ></a>
													</div>
													<!-- 개인정보 수집 활용 동의 -->
													<div class="mb-3">
														<label class="form-label"><input type="checkbox" value="false" field="[object Object]" name="agree2" class="css-8um586 agree">
														 <span class="text-primary">(필수) </span>개인정보 수집 및 활용 동의 </label>
														 <a href="http://localhost/member/main/privacyPolicy">  ></a>
													</div>
													<!-- 프로모션 정보 이메일 활용 동의 -->
													<div class="mb-3">
														<label class="form-label"><input type="checkbox" value="false" field="[object Object]" name="agree3" class="css-8um586 agree">
														 (선택) 개인정보 마케팅 활용 동의 </label><a href="#">  ></a>
													</div>
												</div>
											
											<!-- Card body END -->
											</div>
										</div>			

										<!-- Button -->
										<div>
											<form:button name="register"
												class="btn btn-primary w-100 mb-0" disabled="true">회원가입</form:button>
										</div>

										<!-- Divider -->
										<div class="position-relative my-4">
											<hr>
											<p
												class="small position-absolute top-50 start-50 translate-middle bg-mode px-1 px-sm-2">간편
												로그인</p>
										</div>

										<!-- Google and facebook button -->
										<div class="vstack gap-3">
											<a href="#" class="btn btn-light mb-0"><img
												src="/resources/booking/assets/images/kakao.png" width="20">
												카카오 로그인</a> <a href="#" class="btn btn-light mb-0"><img
												src="/resources/booking/assets/images/naver.png" width="20">
												네이버 로그인</a>
										</div>

										<!-- Copyright -->
										<div class="text-primary-hover mt-3 text-center">
											Copyrights ©2023 Booking. Build by <a
												href="https://www.webestica.com/">Webestica</a>.
										</div>
								</div>
							</div>
						</div>
									</form:form>
									<!-- Form END -->
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- 이메일 발송 완료 모달 START -->
	<div class="modal fade" id="modalEmailCheck" tabindex="-1"
		aria-labelledby="mapmodalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
				<!-- Title -->
				<div class="modal-header">
					<h5 class="modal-title" id="mapmodalLabel">인증번호 발송</h5>
				</div>

				<!--모달 바디-->
				<div class="modal-body p-3">
					<div class='tab-content mb-0'>이메일로 인증번호가 발송되었습니다.<br>메일함을 확인해주세요.</div>
				</div>

				<!--확인 버튼 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-primary mb-0"
						data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 이메일 발송 완료  END -->
</body>
