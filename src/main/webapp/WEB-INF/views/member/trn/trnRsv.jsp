<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


<head>
	<title>Wonderway - 기차 결제</title>

<style>
#sideBar{
	position: sticky;
	top: 5rem;

}

</style>
</head>

<body>
<!-- Header END -->

<!-- **************** MAIN CONTENT START **************** -->
<main>

	<!-- =======================
Main Content START -->
<section class="pt-2 pt-lg-2">
	<div class="container">

		<div class="row g-4 g-xl-5">
		
		
		
			
		
		
			<!-- Left Content START -->
			<div class="col-xl-8">
				<h5 class="card-title fs-2 mb-3">예약 정보</h5>

				<!-- Flight detail START -->
				<div class="card border">
					<!-- Card header -->
					<div class="card-header border-bottom d-flex justify-content-between">
						<!-- Title -->
						<h5 class="mb-0">승차권 정보</h5>
					</div>

					<!-- Card body START -->
					<div class="card-body">

						<!-- Title -->
						<div class="p-3 bg-light rounded-2 d-sm-flex justify-content-sm-between align-items-center mb-4">
							<!-- Airline Name -->
							<h6 class="mb-0"><span class="text-body">날짜:</span> ${depDate}</h6>
							<h6 class="fw-normal mb-0"><span class="text-body">좌석:</span> ${rmNum}호 ${seatId}</h6>
						</div>

						<!-- Ticket item START -->
						<div class="row g-4">
							<!-- Air line name -->
							<div class="col-md-3">
								
								<!-- Image -->
								<c:if test="${traingradename eq 'KTX'}">
									<img src="/resources/booking/assets/images/category/trn/ktx.png" class="w-80px mb-3" alt="">
								</c:if>
								<c:if test="${traingradename eq 'KTX-산천(A-type)'}">
									<img src="/resources/booking/assets/images/category/trn/ktx_sancheon.PNG" class="w-80px mb-3" alt="">
								</c:if>
								<c:if test="${traingradename eq 'ITX-새마을'}">
									<img src="/resources/booking/assets/images/category/trn/itx1.png" class="w-80px mb-3" alt="">
								</c:if>
								<c:if test="${traingradename eq '무궁화호'}">
									<img src="/resources/booking/assets/images/category/trn/mugunghwa.PNG" class="w-80px mb-3" alt="">
								</c:if>
								<!-- Title -->
								<h6 class="fw-normal small mb-0">${traingradename} ${trainno}</h6>
							</div>

							<!-- Airport detail -->
							<div class="col-4 col-md-3">
								<!-- Title -->
								<h5>${depplacename}</h5>
								<h6 class="mb-0">${depTime}</h6>
							</div>

							<!-- Time -->
							<div class="col-4 col-md-3 text-center">
								<!-- Time -->
								<h6>${totalTime }</h6>

								<div class="position-relative my-4">
									<!-- Line -->
									<hr class="bg-primary opacity-5 position-relative">
									<!-- Icon -->
									<div class="icon-md bg-primary text-white rounded-circle position-absolute top-50 start-50 translate-middle">
										<i class="fa-solid fa-fw fa-train"></i>
									</div>
								</div>
							</div>

							<!-- Airport detail -->
							<div class="col-4 col-md-3 text-end">
								<!-- Title -->
								<h5>${arrplacename}</h5>
								<h6 class="mb-0">${arrTime}</h6>
							</div>

						</div>
						<!-- Ticket item END -->

					</div>
					<!-- Card body END -->
				</div>
				<!-- Flight detail END -->
				
			
				
				<div class="vstack gap-4 mt-4" >

					<!-- Traveler 1 form START -->
					<div class="card border">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h5 class="mb-0">예약자 정보</h5>
						</div>

						<!-- Card body START -->
						<div class="card-body">
							<div class="row g-4">
								<!-- Title -->
								<div class="col-md-2">
									<label class="form-label">성별</label>
									<div class="form-control-bg-light">
										<select class="form-select form-select-sm js-choice border-0">
											<option value="Mr">남성</option>
											<option value="Mrs">여성</option>
										</select>
									</div>
								</div>

								<!-- First Name -->
								<div class="col-md-5">
									<div class="form-control-bg-light">
										<label class="form-label">이름</label>
										<input id="name" type="text" value="${memVO.memNm}" class="form-control">
									</div>
								</div>

								<!-- Last name -->
								<div class="col-md-5">
									<div class="form-control-bg-light">
										<label class="form-label">전화번호</label>
										<c:set var="formattedTel" value="${memVO.memTel.substring(0, 3)}-${memVO.memTel.substring(3, 7)}-${memVO.memTel.substring(7)}" />
										<input id="tel" type="text" value="${formattedTel}" class="form-control">
									</div>
								</div>

								<!-- DOB -->
								<div class="col-md-6">
									<div class="form-control-bg-light">
										<label class="form-label">생년월일</label>
										<input type="text" value="${memVO.memBir}" class="form-control flatpickr" data-date-format="Y/m/d">
									</div>
								</div>

								<!-- Passport number -->
								<div class="col-md-6">
									<div class="form-control-bg-light">
										<label class="form-label">이메일</label>
										<input id="email" type="text" value="${memVO.memEmail}"class="form-control">
									</div>
								</div>
							</div>
						</div>
						<!-- Card body END -->
					</div>	
					<!-- Traveler 1 form END -->


				</div>	
				
			
				<div class="card bg-transparent p-0 mt-3">
					<!-- Card header START -->
					<div class="card-header bg-transparent p-0">
						<h5 class="card-title fs-2 mb-0">결제하기</h5>
					</div>
					<!-- Card header END -->

					<!-- Card body START -->
					<div class="card-body p-0 mt-3">

						<div class="bg-light rounded-3 p-4">
							<div class="mb-3">
								<i class="bi bi-credit-card text-primary me-2"></i>	<span class="me-5">이니시스 결제</span>
							</div>
						
							
							<!-- Card options -->
							<div class="d-sm-flex justify-content-sm-between align-items-center mb-3">
								<h6 class="mb-2 mb-sm-0">가능한 결제수단:</h6>
								<ul class="list-inline mb-0">
									<li class="list-inline-item"> <a href="#"><img src="/resources/booking/assets/images/element/kakaopay.png" class="h-30px" alt=""></a></li>
									<li class="list-inline-item"> <a href="#"><img src="/resources/booking/assets/images/element/naverpay.svg" class="h-30px" alt=""></a></li>
									<li class="list-inline-item"> <a href="#"><img src="/resources/booking/assets/images/element/payco.png" class="h-30px" alt=""></a></li>
									<li class="list-inline-item"> <a href="#"><img src="/resources/booking/assets/images/element/visa.svg" class="h-30px" alt=""></a></li>
									<li class="list-inline-item"> <a href="#"><img src="/resources/booking/assets/images/element/mastercard.svg" class="h-30px" alt=""></a></li>
									<li class="list-inline-item"> <a href="#"><img src="/resources/booking/assets/images/element/expresscard.svg" class="h-30px" alt=""></a></li>
								</ul>
							</div>
							
							<div class="row g-3 mt-3">
								<!-- Buttons -->
								<div class="col-12">
									<div class="d-sm-flex justify-content-sm-between align-items-center">
										<fmt:parseNumber var="adultchargeInt" value="${adultcharge}"/>
										<fmt:formatNumber var="totalFee" value="${adultchargeInt*numPp}" pattern="#,###,###"/>
										<h4> <span class="small fs-6">최종 가격 </span> <span class="totalFee">${totalFee}원</span></h4>
										<button id="pay" class="btn btn-primary mb-0"  data-toggle="tooltip" data-placement="bottom" title="인원수,이름,전화번호,이메일은 필수값 입니다">결제하기</button>
									</div>
								</div>
							</div>
							
							
							<div class="">
								<!-- Condition link -->
								<p class="mb-0">결제시  <a href="" class="text-primary">Wonderway 통합정책</a>에 동의한 것으로 간주합니다.</a></p>
							</div>

						</div>
					</div>
					<!-- Card body END -->
				</div>
			</div>
			<!-- Left Content END -->

			<!-- Right content START -->
			<aside id="sideBarContainer" class="col-xl-4 ">
				<div id="sideBar" class=" row g-4">
					<!-- Fare summary START -->
					<div class="col-md-6 col-xl-12">
						<div class="card bg-light rounded-2">
							<!-- card header -->
							<div class="card-header border-bottom bg-light">
								<h5 class="card-title mb-0">요금</h5>
							</div>

							<!-- Card body -->
							<div class="card-body">
								<ul class="list-group list-group-borderless">
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<span class="h6 fw-normal mb-0">기본요금
											<a tabindex="0" data-bs-toggle="popover" data-bs-trigger="focus" data-bs-placement="bottom" data-bs-content="COVID-19 test required Vaccinated travelers can visit">
												<i class="bi bi-info-circle"></i>
											</a>
										</span>
										<span class="fs-5">${adultcharge}</span>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<span class="h6 fw-normal mb-0">인원수</span>
										<span class="fs-5 text-success">${numPp}</span>
									</li>
								</ul>
							</div>

							<!-- Card footer -->
							<div class="card-footer border-top bg-light">
								<div class="d-flex justify-content-between align-items-center">
									<span class="h5 fw-normal mb-0">최종요금</span>
									<span class="h5 fw-normal mb-0">${totalFee}</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Fare summary END -->

					<!-- Booking START -->
					<div class="col-md-6 col-xl-12">
						<div class="card border">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<h5 class="mb-0 cardt-title">예약정보 요약</h5>
							</div>

							<!-- Card body -->
							<div class="card-body">
								<!-- Flight detail -->
								<small><i class="bi bi-ticket me-2"></i>승차권</small>
								<div class="d-flex mt-2">
									<img src="/resources/booking/assets/images/element/09.svg" class="w-40px me-2" alt="">
									<h6 class="fw-normal mb-0">${traingradename} ${trainno} ${depplacename}<i class="bi bi-arrow-right"></i>${arrplacename }</h6>
								</div>
								<ul class="nav nav-divider small text-body mt-1 mb-0">
									<li class="nav-item">${depDate}</li>
									<li class="nav-item">${totalTime}</li>
								</ul>

								<hr> <!-- Divider -->

								<!-- Traveler detail -->
								<small><i class="bi bi-person me-1"></i>예약자</small>
								<h6 class="mb-0 fw-normal mt-2">${memVO.memNm }</h6>
								<ul class="nav nav-divider small text-body mt-1 mb-0">
									<li class="nav-item">${memVO.memGen}</li>
									<li class="nav-item">${formattedTel}</li>
								</ul>
							</div>

						</div>
					</div>
					<!-- Booking END -->
				</div>	
			</aside>
			<!-- Right content END -->
		</div>
	</div>
</section>
<!-- =======================
Main Content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->
<script type="text/javascript">
//이니시스 결제 
$(function(){
	$('#pay').click(function(){
		
		var buyer_email=$("#email").val();
		var buyer_name=$("#name").val();
		var buyer_tel=$("#tel").val();
		var name='${traingradename}'+' 승차권';
		var amount=`${adultchargeInt*numPp}`

		
		console.log()
		var data={ 
			"payPr": amount,
			"memId":'${memVO.memId}',
			"trnKnd":'${traingradename}',
			"trnNum":'${trainno}',
			"stLoc":'${depplacename}',
			"stTm":'${depTime}',
			"arLoc":'${arrplacename}',
			"arTm":'${arrTime}',
			"rmNum":'${rmNum}',
			"seatId": '${seatId}',
			"rsvSt": '${depDate}',
			"rsvEd": '${depDate}',
			"buyerNm": buyer_name
			
		}
		
			var IMP = window.IMP;
			IMP.init('imp28743328'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
			IMP.request_pay({
				pg: "html5_inicis.INIpayTest",
			    pay_method: "card",
			    merchant_uid: "PAY"+new Date().getTime(),   // 주문번호
			    name: name,
			    amount: amount,     // 숫자 타입
			    buyer_email: buyer_email,
			    buyer_name:buyer_name,
			    buyer_tel: buyer_tel,
			}, function (rsp) { // callback
			     if (rsp.success) {
			   	  console.log(rsp);
			   	    if (rsp.success) {
			   	    	$.ajax({
			    				type : "post",
			    				url : "/member/trn/payComplete",
			    				data: JSON.stringify(data),
			    				contentType: "application/json;charset=utf-8",
			    				beforeSend : function(xhr) {
			    					xhr.setRequestHeader("${_csrf.headerName}",
			    							"${_csrf.token}");
			    				},
			    				success : function(result) {
			    					console.log("아작스 성공")
			  			   	      	location.href="/member/trn/rsvConfirm";

			    				}
			    			});
			   	    	
			   	    } else {
			   	      var msg = '결제에 실패하였습니다.';
			   	      msg += '에러내용 : ' + rsp.error_msg;
			   	      alert(msg);
			   	    }
			     }
			 })
	})
})

</script>

</body>
</html>