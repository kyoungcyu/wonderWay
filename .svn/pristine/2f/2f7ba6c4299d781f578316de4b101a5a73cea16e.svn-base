<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/booking/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-touchspin/4.7.3/jquery.bootstrap-touchspin.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-touchspin/4.7.3/jquery.bootstrap-touchspin.min.css">

<head>
	<title>Booking - Multipurpose Online Booking Theme</title>
<style>
.touchspin {
  text-align: center;
}

.modal-body {
  overflow-y: auto;
}

.cupnNm{
  text-align: right;

}

#sideBar{
	position: sticky;
	top: 5rem;

}
.error-container {
	color: red;
	padding-top: 1px;
}

#userSex{
	height: 3.1rem;
	border-radius: 13px;
}
</style>

<!--로그인시 자바스크립트  -->
<sec:authorize access="hasRole('ROLE_MEMBER')"> 
<script>
/* 
$(function() {
	
	
	
	//이니시스 결제 
	$('#pay').click(function(){
		
		var mlg=$(".mlg").text().slice(1,-1);
		var buyer_email=$("#email").val();
		var buyer_name=$("#name").val();
		var buyer_tel=$("#tel").val();
		var rStyPp=parseInt($(".touchspin").val());
		var name='${busiVO.busiNm}'+' '+ '${busiVO.rmVOList[0].rmNm}'+' '+'${busiVO.rmVOList[0].rmDeVOList[0].rmNum}호'
		var amount=parseInt($(".totalFee").text().slice(0,-1));
		
		var data={ 
			"payId": 'P'+new Date().getTime(),
			"payPr": amount,
			"rsvId": 'R'+new Date().getTime(),
			"busiId": '${busiVO.busiId}',
			"memId":'${memVO.memId}',
			"cupnId":cupnId,
			"usedMilage": mlg,
			"rStyPp": rStyPp,
			"rsvSt": '${rsvSt}',
			"rsvEd": '${rsvEd}',
			"rmId": '${busiVO.rmVOList[0].rmId}',
			"rmNum":' ${busiVO.rmVOList[0].rmDeVOList[0].rmNum}',
			"rsvNm":name,
			"buyerNm":buyer_name
			
		}
		
		
		
		if(amount==0){
			$.ajax({
				type : "post",
				url : "/member/acm/payComplete",
				data: JSON.stringify(data),
				contentType: "application/json;charset=utf-8",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
				success : function(result) {
					console.log("아작스 성공")
				    window.location.href = "/member/acm/rsvConfirm";

				}
			});
			
		}else{
		
			var IMP = window.IMP;
			IMP.init('imp28743328'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
			IMP.request_pay({
				pg: "html5_inicis.INIpayTest",
			    pay_method: "card",
			    merchant_uid: "PAY"+new Date().getTime(),   // 주문번호
			    name: name,
			    amount: amount,     // 숫자 타입
			    buyer_email: buyer_email,
			    buyer_name: buyer_name,
			    buyer_tel: buyer_tel,
			}, function (rsp) { // callback
			     if (rsp.success) {
			   	  console.log(rsp);
			   	    if (rsp.success) {
			   	    	$.ajax({
			    				type : "post",
			    				url : "/member/acm/payComplete",
			    				data: JSON.stringify(data),
			    				contentType: "application/json;charset=utf-8",
			    				beforeSend : function(xhr) {
			    					xhr.setRequestHeader("${_csrf.headerName}",
			    							"${_csrf.token}");
			    				},
			    				success : function(result) {
			    					console.log("아작스 성공")
			    				}
			    			});
			   	    	
			   	      location.href="/member/acm/rsvConfirm";
			   	    } else {
			   	      var msg = '결제에 실패하였습니다.';
			   	      msg += '에러내용 : ' + rsp.error_msg;
			   	      alert(msg);
			   	    }
			     }
			 })
		}
	})
	
	

}) */



</script>
</sec:authorize>


<script type="text/javascript">
//사이드바 스크롤시 따라오게 구현

/* 

$(function() {
	//환불정책 모달
	$("#rfd").on("click",function(){
		$("#modalRfd").modal("show");

	});
	
	
	//인원수 스피너
	var maxPp=${busiVO.rmVOList[0].maxPp}
	$('.touchspin').TouchSpin({
	    min: 1,
	    max: maxPp,
	    step: 1
  });
	
	
	//이름 유효성검사
	$("#name").on("change", function() {
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
	
	
	//이용자 정보 카피 
	$("#autoCopy").on("change",function(){
		if($(this).is(":checked")){
			var sex= $("#sex").val()
			$("#userSex").val(sex)


			var name=$("#name").val()
			$("#userName").val(name)
			
			var tel=$("#tel").val()
			$("#userTel").val(tel)
			
		}else{
			
			$("#userName").val("");
			$("#userTel").val("");
		}
	})
	
	
	
	//인원 추가요금 계산
	$(".touchspin").on('change',function(){
		var stdPp=${busiVO.rmVOList[0].stdPp}
		var ppNum =parseInt($(this).val());
		stdPp= parseInt(stdPp)
		var totalExFee
		if(ppNum>stdPp){
			totalExFee= (ppNum-stdPp)*${busiVO.rmVOList[0].ppExFee}
			$(".exFee").text(totalExFee+"원");
			totalFee();
			
		}else{
			totalExFee=0;
			$(".exFee").text(totalExFee+"원");
			totalFee();
		}
		
		tooltipPay()
	});
	
	//툴팁 활성화 
	$('[data-toggle="tooltip"]').tooltip()
	
	
	
	//이니시스 결제 
	$('#pay').click(function(){
		
		var buyer_email=$("#email").val();
		var buyer_name=$("#name").val();
		var buyer_tel=$("#tel").val();
		var rStyPp=parseInt($(".touchspin").val());
		var name='${busiVO.busiNm}'+' '+ '${busiVO.rmVOList[0].rmNm}'+' '+'${busiVO.rmVOList[0].rmDeVOList[0].rmNum}호'
		var amount=parseInt($(".totalFee").text().slice(0,-1));
		
		var data={ 
			"gstEmail":buyer_email,
			"gstTel":buyer_tel,	
			"payId": 'P'+new Date().getTime(),
			"payPr": amount,
			"rsvId": 'R'+new Date().getTime(),
			"busiId": '${busiVO.busiId}',
			"memId":'${memVO.memId}',
			"rStyPp": rStyPp,
			"rsvSt": '${rsvSt}',
			"rsvEd": '${rsvEd}',
			"rmId": '${busiVO.rmVOList[0].rmId}',
			"rmNum":' ${busiVO.rmVOList[0].rmDeVOList[0].rmNum}',
			"rsvNm":name,
			"buyerNm":buyer_name
			
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
			    buyer_name: buyer_name,
			    buyer_tel: buyer_tel,
			}, function (rsp) { // callback
			     if (rsp.success) {
			   	  console.log(rsp);
			   	    if (rsp.success) {
			   	    	$.ajax({
			    				type : "post",
			    				url : "/member/acm/payComplete",
			    				data: JSON.stringify(data),
			    				contentType: "application/json;charset=utf-8",
			    				beforeSend : function(xhr) {
			    					xhr.setRequestHeader("${_csrf.headerName}",
			    							"${_csrf.token}");
			    				},
			    				success : function(result) {
			    					console.log("아작스 성공")
			    				}
			    			});
			   	    	
			   	      location.href="/member/acm/rsvConfirm";
			   	    } else {
			   	      var msg = '결제에 실패하였습니다.';
			   	      msg += '에러내용 : ' + rsp.error_msg;
			   	      alert(msg);
			   	    }
			     }
			 })
	})
});
 */








</script>

</head>

<body>

<main>
<!-- =======================
Page content START -->
<section>
	<div class="container">
		<div class="row g-4 g-lg-5">	

			<!-- Left side content START -->
			<div class="col-xl-8 mt-2">
				<div class="vstack gap-5">
					<!-- Hotel information START -->
					<div class="card shadow">
						<!-- Card header -->
						<div class="card-header p-4 border-bottom">
							<!-- Title -->
							<h4 class="mb-0"><i class="fa-solid fa-hotel me-2"></i>보험 정보</h3>
						</div>
						<!-- Card body START -->
						<div class="card-body p-4">
							<!-- Card list START -->
							<div class="card mb-4">
								<div class="row align-items-center">
									<!-- Image -->
									<div class="col-sm-6 col-md-3">
										<img src="${insuDeVO.insuImg}" class="card-img" alt="">
									</div>

									<!-- Card Body -->
									<div class="col-sm-6 col-md-9">
										<div class="card-body pt-3 pt-sm-0 p-0">
											<!-- Title -->
											<h5 class="card-title"><a href="#">${insuDeVO.company} ${insuDeVO.insuNm}</a></h5>

										</div>
										
										<div class="row">
										<div class="col-md-3">
											<small>여행국가 </small>
											<p class="h6 fw-light mb-md-0">${nation}</p>
										</div>
										
										<div class="col-md-3">
											<small>여행유형</small>
											<p class="h6 fw-light mb-0">${tripType}</p>
										</div>


										<div class="col-md-6">
											<small>여행기간</small>
											<p class="h6 fw-light mb-0">${period }</p>
										</div>
										
										
									</div>
									</div>
									
								</div>
							</div>
							<!-- Card list END -->
							

							<!-- Card START -->
							<div class="card border mt-4">
								<!-- Card header -->
								<div class="card-header border-bottom d-md-flex justify-content-md-between">
									<h5 class="card-title mb-0"><a style="color:#747579;">${insuDeVO.insuKnd}</a> </h5>
									
									<a class="btn btn-link text-danger p-0 mb-0" id="rfd">${insuDeVO.withdrawal}일 이내 청약철회 가능</a>
								</div>

								<!-- Card body -->
								<div class="card-body">
									<!-- List -->
									<ul class="list-group list-group-borderless mb-0">
										<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i>예금자 보호: 인당 최대 ${insuDeVO.deposit }
										<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i>보험유형: ${insuDeVO.insuType} 
										<c:set var="cnt" value="0" />
										</li>
									</ul>
								</div>
							</div>
							<!-- Card END -->
						</div>
						<!-- Card body END -->
					</div>
					<!-- Hotel information END -->

					<!-- Guest detail START -->
					<div class="card shadow">
						<!-- Card header -->
						<div class="card-header border-bottom p-4">
							<h4 class="card-title mb-0"><i class="bi bi-people-fill me-2"></i>피보험자 정보</h4>
						</div>
							
						<!-- Card body START -->
						<div class="card-body p-4">
							<!-- Form START -->
							<form class="row g-4">
								<!-- Title -->
								<div class="col-12">
									<div class="bg-light rounded-2 px-4 py-3">
										<h6 class="mb-0">피보험자</h6>
									</div>
								</div>
								
								<sec:authorize access="isAnonymous()">
									<!-- Select -->
									<div class="col-md-2">
										<div class="form-size-lg">
											<label class="form-label">성별</label>
											<select id="sex" class="form-select js-choice">
												<option value="male">남성</option>
												<option value="female">여성</option>
											</select>
										</div>	
									</div>
	
									<!-- Input -->
									<div class="col-md-5">
										<label class="form-label">이름</label>
										<input id="name" type="text" class="form-control form-control-lg">
										<div class="error-container" id="nmError"></div>
										
									</div>
	
									<!-- Input -->
									<div class="col-md-5">
										<label class="form-label">전화번호</label>
										<input id="tel" type="text" class="form-control form-control-lg">
										<div class="error-container" id="telError"></div>
									</div>
	
									<!-- Input -->
									<div class="col-md-6">
										<label class="form-label">이메일</label>
										<input id="email" type="email" class="form-control form-control-lg">
										<div class="error-container" id="emailError"></div>
										<div id="emailHelp" class="form-text">결제 완료 후 예약정보가 이메일로 발송됩니다</div>
									</div>
	
									<!-- Input -->
									<div class="col-md-6">
										<label class="form-label">인증번호 확인</label>
										<input type="text" class="form-control form-control-lg" placeholder="메일로 받은 인증번호를 입력해주세요">
									</div>
								</sec:authorize>
								
								<sec:authorize access="isAuthenticated()">
									<!-- Select -->
									<div class="col-md-2">
										<div class="form-size-lg">
											<label class="form-label">성별</label>
											<select id="sex" class="form-select js-choice" disabled>
												<option value="male" <c:if test="${sex == '남성'}">selected="selected"</c:if>>남성</option>
												<option value="female" <c:if test="${sex == '여성'}">selected="selected"</c:if>>여성</option>
											</select>
										</div>	
									</div>
									<!-- Input -->
									<div class="col-md-5">
										<label class="form-label">이름</label>
										<input id="name" type="text" class="form-control form-control-lg" value="${memVO.memNm}" readonly>
										<div class="error-container" id="nmError"></div>
										
									</div>
	
									<!-- Input -->
									<div class="col-md-5">
										<label class="form-label">전화번호</label>
										<c:set var="formattedTel" value="${memVO.memTel.substring(0, 3)}-${memVO.memTel.substring(3, 7)}-${memVO.memTel.substring(7)}" />
										<input id="tel" type="text" class="form-control form-control-lg" value="${formattedTel}" readonly>
										<div class="error-container" id="telError"></div>
									</div>
	
									<!-- Input -->
									<div class="col-md-6">
										<label class="form-label">이메일</label>
										<input id="email" type="email" class="form-control form-control-lg" value="${memVO.memEmail}" readonly>
										<div class="error-container" id="emailError"></div>
										<div id="emailHelp" class="form-text mb-3">결제 완료 후 예약정보가 이메일로 발송됩니다</div>
									</div>
	
									<!-- Input -->
									<div class="col-md-6">
										<label class="form-label">생년월일</label>
										<input type="text" class="form-control form-control-lg" value="${birth}" readonly>
									</div>
								</sec:authorize>
								
								
								
								
							</form>
							<!-- Form END -->

							<sec:authorize access="isAnonymous()">
							<!-- 로그인 권고 창 START -->
							<div class="alert alert-info my-4" role="alert">
								<a href="sign-up.html" class="alert-heading h6"></a>자동기입으로 빠르게 예약하고 할인혜택을 받아보시려면 로그인 하세요
							</div>
							<!-- 로그인 권고 창 END -->
							</sec:authorize>
							
							



						</div>
						<!-- Card body END -->
					</div>
					<!-- Guest detail END -->

					<!-- Payment Options START -->
					<div class="card shadow">
						<!-- Card header -->
						<div class="card-header border-bottom p-4">
							<!-- Title -->
							<h4 class="card-title mb-0"><i class="bi bi-wallet-fill me-2"></i>결제</h4>
						</div>
						
						<!-- Card body START -->
						<div class="card-body p-4 pb-0">
							<sec:authorize access="isAnonymous()">
							<!-- 로그인 권고창 START -->
							<div class="bg-primary bg-opacity-10 rounded-3 mb-4 p-3">
								<div class="d-md-flex justify-content-md-between align-items-center">
									<!-- Image and title -->
									<div class="d-sm-flex align-items-center mb-2 mb-md-0">
										<!-- Image -->
										<img src="/resources/booking/assets/images/element/16.svg" class="h-50px" alt="">
										<!-- Title -->
										<div class="ms-sm-3 mt-2 mt-sm-0">
											<h5 class="card-title mb-0"></h5>
											<p class="mb-0">로그인해서 마일리지 적립과 쿠폰 혜택을 받아보세요</p>
										</div>
									</div>

									<!-- Button -->
									<a href="/member/sign/signIn" class="btn btn-primary mb-0">로그인</a>
								</div>
							</div>
							<!-- 로그인 권고창 END -->
							</sec:authorize>

							<!-- Accordion START -->
							<div class="accordion accordion-icon accordion-bg-light" id="accordioncircle">
								<!-- Credit or debit card START -->
								<div class="accordion-item mb-3">
									<h6 class="accordion-header" id="heading-1">
										<button class="accordion-button rounded collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-1" aria-expanded="true" aria-controls="collapse-1">
											<i class="bi bi-credit-card text-primary me-2"></i>	<span class="me-5">이니시스 결제</span>
										</button>
									</h6>
									<div id="collapse-1" class="accordion-collapse collapse show" aria-labelledby="heading-1" data-bs-parent="#accordioncircle">
										<!-- Accordion body -->
										<div class="accordion-body">

											<!-- Card list -->     
											<div class="d-sm-flex justify-content-sm-between my-3">
												<h6 class="mb-2 mb-sm-0">가능한 결제 수단</h6>
												<ul class="list-inline my-0">
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
														<h4> <span class="small fs-6">최종 가격 </span> <span class="totalFee">${insuDeVO.insuFee*daysDiffer}원</span></h4>
														<button id="pay" class="btn btn-primary mb-0"  data-toggle="tooltip" data-placement="bottom" title="인원수,이름,전화번호,이메일을 입력해야만 결제가 가능합니다">결제하기</button>
													</div>
												</div>
											</div>
											<!-- Form END -->
										</div>
									</div>
								</div>
								<!-- Credit or debit card END -->


							
							</div>
							<!-- Accordion END -->
						</div>	
						<!-- Card body END -->

						<div class="card-footer p-4 pt-0">
							<!-- Condition link -->
							<p class="mb-0">결제시  <a href="" class="text-primary">Wonderway 통합정책</a>에 동의한 것으로 간주합니다.</a></p>
						</div>
					</div>
					<!-- Payment Options END -->
				</div>	
			</div>
			<!-- Left side content END -->

			<!-- Right side content START -->
			<aside id="sideBarContainer" class="col-xl-4 mt-2">
			
				<div id="sideBar" class="row g-4">

					<!-- Price summary START -->
					<div class="col-md-6 col-xl-12">
						<div class="card shadow rounded-2">
							<!-- card header -->
							<div class="card-header border-bottom">
								<h5 class="card-title mb-0">가격 정보</h5>
							</div>
	
							<!-- Card body -->
							<div class="card-body py-1">
								<ul class="list-group list-group-borderless">
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<span class="h6 fw-light mb-0">기본 가격</span>
										<span class="fs-5 baseFee fee">${insuDeVO.insuFee}원</span>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<span class="h6 fw-light mb-0">여행 기간</span>
										<span class="fs-5 exFee fee">${daysDiffer}일</span>
									</li>
								</ul>
							</div>
	
							<!-- Card footer -->
							<div class="card-footer border-top">
								<div class="d-flex justify-content-between align-items-center">
									<span class="h5 mb-0">최종 가격</span>
									<span class="h5 mb-0 totalFee">${insuDeVO.insuFee*daysDiffer}원</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Price summary END -->

				</div>
			</aside>
			<!-- Right side content END -->
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Page content START -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

</body>
