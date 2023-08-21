<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
	<title>Wonderway-로그인</title>
</head>
<body>
<main>
<section class="pt-3 pt-lg-5">
	<div class="container h-100 d-flex px-0 px-sm-4">
		<div class="row justify-content-center align-items-center m-auto">
			<div class="col-12">
				<div class="bg-mode shadow rounded-3 overflow-hidden">
					<div class="row g-0">
						<!-- Vector Image -->
						<div class="col-lg-6 d-flex align-items-center order-2 order-lg-1">
							<div class="p-3 p-lg-5">
								<img src="/resources/booking/assets/images/element/signin.svg" alt="">
							</div>
							<!-- Divider -->
							<div class="vr opacity-1 d-none d-lg-block"></div>
						</div>
		
						<!-- Information -->
						<div class="col-lg-6 order-1">
							<div class="p-4 p-sm-7">
								<!-- Logo -->
								<div class="d-flex">
									<a href="index.html">
										<img class="h-50px mb-4" src="/resources/booking/assets/images/logo-icon.png" alt="logo">
									</a>
									<!-- Title -->
									<h1 class="mb-2 h3">&nbsp;Welcome back</h1>
								</div>
								<p class="mb-0">처음이신가요?<a href="/member/sign/signUp">&nbsp;회원가입</a></p>
		
								<!-- Form START -->
								<form class="mt-4 text-start" action="/login" method="post">
									<!-- Email -->
									<div class="mb-3">
										<label class="form-label">아이디</label>
										<input type="id" name="username" class="form-control" />
									</div>
									<!-- Password -->
									<div class="mb-3 position-relative">
										<label class="form-label">비밀번호</label>
										<input class="form-control fakepassword" type="password" id="psw-input" name="password" />
										<span class="position-absolute top-50 end-0 translate-middle-y p-0 mt-3">
											<i class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
										</span>
									</div>
									<!-- Remember me -->
									<div class="mb-3 d-sm-flex justify-content-between">
										<div>
											<input type="checkbox" class="form-check-input" id="rememberCheck" name="remember-me">
											<label class="form-check-label" for="rememberCheck">자동로그인</label>
										</div>
										<a href="/member/sign/forgotId">아이디 찾기</a>
										<a href="/member/sign/forgotPw">비밀번호 재설정</a>
									</div>
									<!-- Button -->
									<div><button type="submit" class="btn btn-primary w-100 mb-0" >로그인</button></div>
		
									<!-- Divider -->
									<div class="position-relative my-4">
										<hr>
										<p class="small bg-mode position-absolute top-50 start-50 translate-middle px-2">간편로그인</p>
									</div>
		
									<!-- Google and facebook button -->
									<div class="vstack gap-3">
										<a href="https://kauth.kakao.com/oauth/authorize?client_id=f452e17a96f35fd7646268f22602e110&redirect_uri=http://localhost/member/sign/kakaoLogin&response_type=code" class="btn btn-light mb-0"><img src="/resources/booking/assets/images/kakao.png" width="20"> 카카오 로그인</a>
										<a href="https://nid.naver.com/nidlogin.login" class="btn btn-light mb-0"><img src="/resources/booking/assets/images/naver.png" width="20"> 네이버 로그인</a>
									</div>
									
									<!-- Copyright -->
									<div class="text-primary-hover mt-3 text-center"> Copyrights ©2023 Booking. Build by <a href="https://www.webestica.com/">Webestica</a>. </div>
									<sec:csrfInput/>
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
</main>
</body>

<script type="text/javascript">
$(function () {
	var nowLocation = window.location.href;
	console.log(nowLocation);
	if(nowLocation == "http://localhost/member/sign/signIn?error=Login+Error"){
		alert("잘못된 아이디 또는 비밀번호를 입력하셨습니다");
	}
});
</script>
