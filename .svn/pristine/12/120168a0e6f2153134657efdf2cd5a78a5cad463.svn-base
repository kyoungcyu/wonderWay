<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>


<style>
.btn.btn-danger-soft.mb-0.ms-4 {
	writing-mode: horizontal-tb;
}
</style>

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
		<!-- Update email START -->
		<div class="card border">
			<!-- Card header -->
			<div class="card-header border-bottom">
				<h4 class="card-header-title">이메일 변경</h4>
				<p class="mb-0">
					현재 이메일 주소는 <span class="text-primary">${data.memEmail}</span> 입니다.
				</p>
			</div>

			<!-- Card body START -->
			<div class="card-body">
				<form>
					<!-- Email -->
					<div class="mb-3">
						<label class="form-label">현재 이메일 주소<span
							class="text-danger">*</span></label> <input type="email"
							class="form-control" placeholder="${data.memEmail}"
							value="${data.memEmail}" id="currentEmail" readonly>
					</div>

					<div class="mb-3">
						<div>
							<label class="form-label">변경할 이메일 주소<span
								class="text-danger">*</span></label>
							<div class="d-flex align-items-center">
								<input type="email" class="form-control" id="newEmail"
									placeholder="name@example.com" aria-invalid="false"
									maxlength="254">
								<button type="button" class="btn btn-danger-soft mb-0 ms-2"
									style="width: 100px;" id="emailCodeButton">인증</button>
							</div>
							<div class="error-container" id="emailError"></div>
						</div>

					</div>
					<div class="mb-3">
						<label class="form-label">이메일로 받은 인증코드를 입력하세요.<span
							class="text-danger">*</span></label>
						<div class="d-flex align-items-center">
							<input type="text" id="emailCodeConfirm" class="form-control"
								placeholder="Enter your email id">
							<button type="button" class="btn btn-danger-soft mb-0 ms-2"
								style="width: 100px;" id="confirm">확인</button>
						</div>
						<div class="error-container" id=codeError></div>
					</div>

					<div class="text-end mt-3">
						<a href="#" class="btn btn-primary mb-0" id="btnEmailCheck">변경하기</a>
					</div>
				</form>
			</div>
			<!-- Card body END -->
		</div>
		<!-- Update email END -->
	</div>
	<!-- Main content END -->
</div>

<script type="text/javascript">
var $emailCodeConfirm = $("#emailCodeConfirm");
console.log("newEmail : " + newEmail)

$(function(){
	var $emailCodeConfirm = $("#emailCodeConfirm");
	$("#emailCodeButton").on("click",function(){
		var currentEmail = "${data.memEmail}";
		var newEmail = $("#newEmail").val();
		var data = {"newEmail":newEmail};
		console.log("newEmail : " + newEmail);
		console.log("currentEmail " +currentEmail)
		
		//인증코드 보내기.
		if(newEmail != ""){
			if(validEmail(newEmail)){
				if(newEmail != currentEmail){
					$.ajax({
						type : "post",
						url : "/member/mypage/mailCheck",
						data : data,
						//contentType : "application/json;charset=utf-8",
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}",
									"${_csrf.token}");
						},
						success : function(data) {
							console.log("여기까지 왔다.")
							console.log(data)
							 $("#emailError").text("해당 이메일로 인증번호 발송이 완료되었습니다.").css("color","green");
							 chkEmailConfirm(data, $emailCodeConfirm)
						}
					})
				} else{
					$("#emailError").text("현재 이메일과 동일합니다. 다른 이메일 주소를 입력해주세요.").css("color","red");
				}
			}else{
				$("#emailError").text("유효하지 않은 이메일 형식입니다. 다시 입력해주세요.").css("color","red");
			}
		}else{
			$("#emailError").text("정확한 이메일을 입력해주세요.").css("color","red");
		}
	})
})

// 이메일 인증번호 체크 함수
function chkEmailConfirm(data, $emailCodeConfirm) {
	$("#confirm").on("click",function(){
	console.log("data : " + data)
		if (data != $emailCodeConfirm.val()) { //
			emconfirmchk = false;
			$("#codeError").text("인증번호가 일치하지 않습니다").css("color","red")
		} else { 
			emconfirmchk = true;
			$("#codeError").text("인증번호 확인 완료").css("color","green")
		}
	});
}




//유효한 이메일인지 검사
function validEmail(email) {
    var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    return pattern.test(email);
}


$("#btnEmailCheck").on("click",function(){
	alert("누름");
	var color = $("#codeError").css("color");
	var newEmail =$("#newEmail").val();
	console.log(color);
	if(color=='rgb(0, 128, 0)'){
		alert("녹색");
	var data = {
			"memEmail":newEmail
	}
	console.log("data : " + JSON.stringify(data));
		
		$.ajax({
			url : "/member/mypage/emailPost",
			contentType:"application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "post",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success:function(result){
				console.log("여기까지 왔다");
				if(result=="success"){
					alert("이메일이 성공적으로 변경되었습니다.")
					location.href="/member/mypage/myInfo";
				}else{
					alert("오류가 발생했습니다. 다시 시도해주세요.")
				}
			}
				
		})
		
	}
	
	
});

	

</script>