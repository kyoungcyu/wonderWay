<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
$(function () {
	$("#btn").on("click", function () {
		var email = $("#email").val();
		var rsvId = $("#rsvId").val();
		console.log("email : " + email + ", rsvId : " + rsvId);
		
		if(email == "") { 
			alert("이메일을 입력해주세요");
			return;
		};
		if(rsvId == "") { 
			alert("예약번호를 입력해주세요"); 
			return;
		};
		
	  let object = {"email" : email, "rsvId" : rsvId};
	  
	  $.ajax({
			url: "/member/main/nonMemberPost",
			contentType: "application/json;charset=utf-8",
			data: JSON.stringify(object),
			type: "post",
			beforeSend: function (xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function (result) {
				console.log("result : " + result);
				if (result == "success") {
					window.location.href = "/member/main/nonMemberRsv?email=" + email + "&rsvId=" + rsvId;
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

<section class="vh-xxl-100">
	<div class="container h-100 d-flex px-0 px-sm-4">
		<div class="row justify-content-center align-items-center m-auto">
			<div class="col-12">
				<div class="bg-mode shadow rounded-3 overflow-hidden">
					<div class="row g-0">
						<!-- Vector Image -->
						<div class="col-lg-6 d-md-flex align-items-center order-2 order-lg-1">
							<div class="p-3 p-lg-5">
								<img src="/resources/booking/assets/images/element/signin.svg" alt="">
							</div>
							<!-- Divider -->
							<div class="vr opacity-1 d-none d-lg-block"></div>
						</div>
		
						<!-- Information -->
						<div class="col-lg-6 order-1">
							<div class="p-4 p-sm-6">
								<!-- Logo -->
								<a href="index.html">
									<img class="h-50px mb-4" src="/resources/booking/assets/images/logo.png" alt="logo">
								</a>
								<!-- Title -->
								<h1 class="mb-2 h3">비회원 예약 조회</h1>
								<p class="mb-0">이미 회원이신가요?<a href="/member/sign/signin">로그인</a></p>
		
								<!-- Form START -->
								<form class="mt-4 text-start">
									<!-- Email -->
									<div class="mb-3">
										<label class="form-label">이메일 주소</label>
										<input type="email" class="form-control" name="email" id="email">
									</div>
									<!-- Password -->
									<div class="mb-3 position-relative">
										<label class="form-label">예약 번호</label>
										<input class="form-control" type="text"  name="rsvId" id="rsvId">
									</div>
									<!-- Button -->
									<div><button type="button" class="btn btn-primary w-100 mb-0" id="btn">조회하기</button></div>
		
									<hr/>
									
									<!-- Copyright -->
									<div class="text-primary-hover mt-3 text-center"> Copyrights ©2023 Booking. Build by <a href="https://www.webestica.com/">Webestica</a>. </div>
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

