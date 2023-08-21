<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<head>
	<title>Wonderway-기차 결과 리스트</title>

<style>

.td{
	width:33px;
	height:20px;
	margin:0;
	padding:1px;
	border:0;
	background-color:white;
}
.spanSeat{
 	position: relative;

}
.txtSeat{
 	position: absolute;
	text-align: center;
	top: 50%;
	left: 50%;
	transform: translate( -50%, -50% );
	
}

input[type="checkbox"]{
	display:none
}
input[type="checkbox"] + label span{
	display:inline-block;
	width:50px;
	height:50px;
	vertical-align:middle;
}


</style>


<script type="text/javascript">
$(function() {
	
		
})



</script>
</head>

<body>

<!-- Header END -->

<!-- **************** MAIN CONTENT START **************** -->
<main>

<!-- =======================
Search START -->
<section class="pt-0">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Booking from START -->
				<form class="card shadow p-0" action="/member/insurance/search" method="post">
						
							<!-- Card header -->
							<div class="card-header p-4">
								<h5 class="mb-0"><i class="fa-solid fa-hotel fa-fw me-2"></i>여행자 보험</h5>
							</div>

							<!-- Card body -->
							<div class="card-body p-4 pt-0">
								<div class="row g-4">
									<!-- Location -->
									<div class="col-lg-6">
										<div class="form-icon-input form-size-lg form-fs-lg">
											<select class="form-select js-choice" name="nation" data-search-enabled="true">
												<option value="">여행국가</option>
												<option>미국</option>
												<option>캐나다</option>
												<option>일본</option>
												<option>중국</option>
											</select>
											<span class="form-icon"><i class="bi bi-search fs-5"></i></span>
										</div>
									</div>
									
									<!-- Date -->
									<div class="col-lg-6">
										<div class="form-icon-input form-fs-lg">
											<input type="text" name="period" class="form-control form-control-lg flatpickr" data-date-format="Y/m/d" data-mode="range" placeholder="여행기간">
											<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
										</div>
									</div>
									
									<!-- 성별 -->
									<div class="col-lg-4">
										<div class="form-icon-input form-size-lg form-fs-lg">
											<select class="form-select js-choice" name="sex" data-search-enabled="true">
												<option value="">성별</option>
												<option>남성</option>
												<option>여성</option>
											</select>
											<span class="form-icon"><i class="bi bi-search fs-5"></i></span>
										</div>
									</div>

									

									<!-- Date -->
									<div class="col-lg-4">
										<div class="form-icon-input form-fs-lg">
											<input type="text" name="birth" class="form-control form-control-lg flatpickr" data-date-format="Y/m/d" placeholder="생년월일">
											<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
										</div>
									</div>
									
									
									<!--여행목적  -->
									<div class="col-lg-4">
										<div class="form-icon-input form-size-lg form-fs-lg">
											<select class="form-select js-choice" name="tripType" data-search-enabled="true">
												<option value="">여행목적</option>
												<option>일반관광</option>
												<option>비즈니스</option>
												<option>어학연수</option>
											</select>
											<span class="form-icon"><i class="bi bi-search fs-5"></i></span>
										</div>
									</div>

								</div> <!-- Row END -->

								<!-- Button -->
								<div class="text-center pt-0">
									<button type="submit" class="btn btn-lg btn-primary mb-n7">여행자보험 찾기 <i class="bi bi-arrow-right ps-3"></i></button>
								</div>
							</div>
							<sec:csrfInput />
						</form>
				<!-- Booking from END -->
			</div>
		</div>
	</div>
</section>
<!-- =======================
Search START -->

<!-- =======================
기차 list START -->
<section class="pt-0">
	<div class="container">
		<div class="row">

			<!-- Main content START -->
			<div class="col-xl-8 col-xxl-12">
				<div class="vstack gap-4">

					<!-- 기차 정보 -->
					<c:forEach var="insuVO" items="${insuVOList}" varStatus="stat">
					
					
						<form action="/member/trn/trnRsv" method="post">
						
						<div class="card border ticketInfo">
							<!-- card-body START -->
							<div class="card-body p-4 pb-0 ticketInfo">
								<div class="row g-4">
									<!-- Air line name -->
									<div class="col">
										<!-- Image -->
										<img src="${insuVO.insuImg}" class="w-180px mb-3" alt="">
									</div>
									
									<div class="col">
										<!-- Title -->
										<h6 class="fw-normal mb-0">${insuVO.company}</h6>
										<h6 class=" mb-0">${insuVO.insuNm}</h6>
									</div>
	
									<!-- Airport detail -->
									<div class="col">
										<!-- Title -->
										<p class="mb-0">가입가능연령</p>
										<h6 class="mb-0">${insuVO.insuAge}살</h6>
									</div>	
									
									<div class="col">
										<!-- Title -->
										<p class="mb-0">보험 유형</p>
										<h6 class="mb-0">${insuVO.insuType}</h6>
									</div>	
									
									
									
	
	
									<!-- Price -->
									<div class="col text-center">
										<!-- Price -->
										<fmt:formatNumber var="formattedFee" value="${insuVO.insuDetailVOList[0].insuFee*daysDiffer}" pattern="#,###,###"/>
										<h4 class="mt-2">${formattedFee}원부터</h4>
										
									</div> 
									<div class="col-1">
										<a href="/member/insurance/detail/${insuVO.insuId}" id="btnRsv" class="btn btn-sm btn-primary">상세<br/>보기</a>
									</div>
								</div>
							</div>	
							<!-- card-body END -->
	
							<!-- card footer -->
							<div class="card-footer p-4 ">
								<div class="bg-light p-2 rounded-2">
									<ul class="list-inline d-sm-flex justify-content-sm-between mb-0 mx-4">
										<li class="list-inline-item text-danger">청약 철회기간: ${insuVO.withdrawal}일 이내</li>
										<li class="list-inline-item text-success">예금자보호: 인당 최대 ${insuVO.deposit} 까지</li>
									</ul>
								</div> 
							</div>	
						</div>
						
						<sec:csrfInput />
						</form>
					</c:forEach>
					<!--기차 정보 END -->


				</div>
			</div>
			<!-- Main content END -->
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
기차 list END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- =======================
Footer START -->
<footer class="bg-dark pt-5">
	<div class="container">
		<!-- Row START -->
		<div class="row g-4">

			<!-- Widget 1 START -->
			<div class="col-lg-3">
				<!-- logo -->
				<a href="index.html">
					<img class="h-40px" src="/resources/booking/assets/images/logo-light.svg" alt="logo">
				</a>
				<p class="my-3 text-muted">Departure defective arranging rapturous did believe him all had supported.</p>
				<p class="mb-2"><a href="#" class="text-muted text-primary-hover"><i class="bi bi-telephone me-2"></i>+1234 568 963</a> </p>
				<p class="mb-0"><a href="#" class="text-muted text-primary-hover"><i class="bi bi-envelope me-2"></i>example@gmail.com</a></p>
			</div>
			<!-- Widget 1 END -->

			<!-- Widget 2 START -->
			<div class="col-lg-8 ms-auto">
				<div class="row g-4">
					<!-- Link block -->
					<div class="col-6 col-md-3">
						<h5 class="text-white mb-2 mb-md-4">Page</h5>
						<ul class="nav flex-column text-primary-hover">
							<li class="nav-item"><a class="nav-link text-muted" href="#">About us</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#">Contact us</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#">News and Blog</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#">Meet a Team</a></li>
						</ul>
					</div>

					<!-- Link block -->
					<div class="col-6 col-md-3">
						<h5 class="text-white mb-2 mb-md-4">Link</h5>
						<ul class="nav flex-column text-primary-hover">
							<li class="nav-item"><a class="nav-link text-muted" href="#">Sign up</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#">Sign in</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#">Privacy Policy</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#">Terms</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#">Cookie</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#">Support</a></li>
						</ul>
					</div>
									
					<!-- Link block -->
					<div class="col-6 col-md-3">
						<h5 class="text-white mb-2 mb-md-4">Global Site</h5>
						<ul class="nav flex-column text-primary-hover">
							<li class="nav-item"><a class="nav-link text-muted" href="#">India</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#">California</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#">Indonesia</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#">Canada</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#">Malaysia</a></li>
						</ul>
					</div>

					<!-- Link block -->
					<div class="col-6 col-md-3">
						<h5 class="text-white mb-2 mb-md-4">Booking</h5>
						<ul class="nav flex-column text-primary-hover">
							<li class="nav-item"><a class="nav-link text-muted" href="#"><i class="fa-solid fa-hotel me-2"></i>Hotel</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#"><i class="fa-solid fa-plane me-2"></i>기차</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#"><i class="fa-solid fa-globe-americas me-2"></i>Tour</a></li>
							<li class="nav-item"><a class="nav-link text-muted" href="#"><i class="fa-solid fa-car me-2"></i>Cabs</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- Widget 2 END -->

		</div><!-- Row END -->

		<!-- Tops Links -->
		<div class="row mt-5">
			<h5 class="mb-2 text-white">Top Links</h5>
			<ul class="list-inline text-primary-hover lh-lg">
				<li class="list-inline-item"><a href="#" class="text-muted">기차s</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Hotels</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Tours</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Cabs</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">About</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Contact us</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Blogs</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Services</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Detail page</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Services</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Policy</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Testimonials</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Newsletters</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Podcasts</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Protests</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">NewsCyber</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Education</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Sports</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Tech and Auto</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Opinion</a></li>
				<li class="list-inline-item"><a href="#" class="text-muted">Share Market</a></li>
			</ul>
		</div>

		<!-- Payment and card -->
		<div class="row g-4 justify-content-between mt-0 mt-md-2">

			<!-- Payment card -->
			<div class="col-sm-7 col-md-6 col-lg-4">
				<h5 class="text-white mb-2">Payment & Security</h5>
				<ul class="list-inline mb-0 mt-3">
					<li class="list-inline-item"> <a href="#"><img src="/resources/booking/assets/images/element/paypal.svg" class="h-30px" alt=""></a></li>
					<li class="list-inline-item"> <a href="#"><img src="/resources/booking/assets/images/element/visa.svg" class="h-30px" alt=""></a></li>
					<li class="list-inline-item"> <a href="#"><img src="/resources/booking/assets/images/element/mastercard.svg" class="h-30px" alt=""></a></li>
					<li class="list-inline-item"> <a href="#"><img src="/resources/booking/assets/images/element/expresscard.svg" class="h-30px" alt=""></a></li>
				</ul>
			</div>

			<!-- Social media icon -->
			<div class="col-sm-5 col-md-6 col-lg-3 text-sm-end">
				<h5 class="text-white mb-2">Follow us on</h5>
				<ul class="list-inline mb-0 mt-3">
					<li class="list-inline-item"> <a class="btn btn-sm px-2 bg-facebook mb-0" href="#"><i class="fab fa-fw fa-facebook-f"></i></a> </li>
					<li class="list-inline-item"> <a class="btn btn-sm shadow px-2 bg-instagram mb-0" href="#"><i class="fab fa-fw fa-instagram"></i></a> </li>
					<li class="list-inline-item"> <a class="btn btn-sm shadow px-2 bg-twitter mb-0" href="#"><i class="fab fa-fw fa-twitter"></i></a> </li>
					<li class="list-inline-item"> <a class="btn btn-sm shadow px-2 bg-linkedin mb-0" href="#"><i class="fab fa-fw fa-linkedin-in"></i></a> </li>
				</ul>	
			</div>
		</div>

		<!-- Divider -->
		<hr class="mt-4 mb-0">

		<!-- Bottom footer -->
		<div class="row">
			<div class="container">
				<div class="d-lg-flex justify-content-between align-items-center py-3 text-center text-lg-start">
					<!-- copyright text -->
					<div class="text-muted text-primary-hover"> Copyrights ©2023 Booking. Build by <a href="https://www.webestica.com/" class="text-muted">Webestica</a>. </div>
					<!-- copyright links-->
					<div class="nav mt-2 mt-lg-0">
						<ul class="list-inline text-primary-hover mx-auto mb-0">
							<li class="list-inline-item me-0"><a class="nav-link py-1 text-muted" href="#">Privacy policy</a></li>
							<li class="list-inline-item me-0"><a class="nav-link py-1 text-muted" href="#">Terms and conditions</a></li>
							<li class="list-inline-item me-0"><a class="nav-link py-1 text-muted pe-0" href="#">Refund policy</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- =======================
Footer END -->




</body>
</html>