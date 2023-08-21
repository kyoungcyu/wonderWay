<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<!-- Main content START -->
<div class="col-lg-8 col-xl-9">


	<!-- Offcanvas menu button -->
	<div class="d-grid mb-0 d-lg-none w-100">
		<button class="btn btn-primary mb-4" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar"
			aria-controls="offcanvasSidebar">
			<i class="fas fa-sliders-h"></i> Menu
		</button>
	</div>

	<div class="vstack gap-4">
		<!-- Update Password START -->
		<div class="card border">
			<!-- Card header -->
			<div class="card-header border-bottom">
				<h4 class="card-header-title">비밀번호 변경</h4>
				<p class="mb-0">
					<span class="text-primary"></span>
				</p>
			</div>

			<!-- Card body START -->
			<form class="card-body">
				<!-- Current password -->
				<div class="mb-3">
					<label class="form-label" >현재 비밀번호를 입력하세요 *</label> 
					<input class="form-control" type="password" id="currentPw">
					<div class="error-container" id="currentPwError"></div>
				</div>
				<!-- New password -->
				<div class="mb-3">
					<label class="form-label">새로운 비밀번호를 입력하세요.*</label>
					<div class="input-group">
						<input class="form-control fakepassword" placeholder="Enter new password" type="password" id="pw">
						<span class="input-group-text p-0 bg-transparent"> 
						<i class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
						</span>
					</div>
					<div class="error-container" id="pwError"></div>
				</div>
				<!-- Confirm -->
				<div class="mb-3">
					<label class="form-label">새로운 비밀번호를 한번 더 입력하세요. *</label> 
					<div class="d-flex align-items-center">
					<input class="form-control" type="password" id="checkPw" placeholder="Confirm new password">
					</div>
					<div class="error-container" id="checkPwError"></div>
				</div>

				<div class="text-end">
					<a href="#" class="btn btn-primary mb-0" id="passModify">비밀번호 변경하기</a>
				</div>
			</form>
			<!-- Card body END -->
		</div>
		<!-- Update Password END -->
	</div>
</div>
<!-- Main content END -->
<script type="text/javascript">

var $pwError = $("#pwError");

	
	//비밀번호 재설정 
	$("#passModify").on("click",function() {
		var color = $("#checkPwError").css("color");	
		console.log(color)
		var memPw = $("#pw").val();
		var data = {
				"memPw" :memPw
		}
		console.log("data : " + JSON.stringify(data));
		
		if(color=='rgb(0, 128, 0)'){
			$.ajax({
				type :"post",
				url : "/member/mypage/passModifyPost",
				data : JSON.stringify(data),
				contentType : "application/json;charset=utf-8",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
				success : function(result) {
					console.log("result :" + result)
					if (result == 1) {
						alert("비밀번호가 변경되었습니다.");
						location.href="/member/mypage/myInfo";
					} else {
						$("#resetPwError").text("비밀번호 재설정 실패!").css(
								"color", "red");
					}
				}
					})
			
		}else{
			alert("다시 입력해주세요.")
		}

			});
	
	
	//비밀번호 유효성 검사 함수
	function validatePw() {
		let memPw = "${data.memPw}";
		console.log("memPw : " + memPw)
		let pw = $("#pw").val()
		let checkPw = $('#checkPw').val()
		let currentPw = $('#currentPw').val()
		let pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/
		
			if (currentPw != memPw) {
				$("#currentPwError").text("비밀번호가 일치하지 않습니다.").css("color", "red");
				return false;
			} else {
				$("#currentPwError").text("비밀번호가 일치합니다.").css("color", "green");
				if(currentPw){
					if (!pwRegex.test(pw) || pw.length < 8) {
						$("#pwError").text("영대소문자, 숫자, 특수문자를 포함한 8글자 이상이어야 합니다.").css("color", "red");
						$('#pw').focus();
						return false;
					} else {
						
						if(currentPw == pw){
							$("#pwError").text("현재 비밀번호와 같습니다. 다른 비밀번호를 입력해주세요.").css("color", "red");
						} else{
							
							$("#pwError").text("비밀번호로 적합합니다.").css("color", "green");
							
							if (checkPw) {
								if (pw == checkPw) {
									$("#checkPwError").text("비밀번호가 일치합니다.").css("color", "green");
									return true;
								} else {
									$("#checkPwError").text("비밀번호가 일치하지 않습니다.").css("color", "red");
									$('#checkPw').focus();
									return false;
								}
							} else {
								$("#checkPwError").text("비밀번호 재확인을 입력하시오.").css("color", "red");
								$('#checkPw').focus();
								return false;
							}
							
						}
						
						

					}
					
				}
				
				
				

			}
	}

	$("#pw").on("change", function() {//비밀번호,재확인 유효성검사
		validatePw();

	});

	$("#checkPw").on("change", function() {//비밀번호,재확인 유효성검사
		validatePw();

	});
	$("#currentPw").on("change", function() {//비밀번호,재확인 유효성검사
		validatePw();

	});
</script>