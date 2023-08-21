<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<head>
	<title>Wonderway-렌트카</title>

<style>
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



.carImgDiv{
   overflow:hidden;
   margin:0 auto
}
.carImg{
    width: 100%;
    height: 100%;
    overflow: hidden;
    object-fit: cover;
}



</style>




</head>

<body>

<!-- **************** MAIN CONTENT START **************** -->
<main>
<!-- =======================
Main Content START -->
<section>
	<div class="container">
		<div class="row g-4 g-lg-5">	

			<!-- Left side content START -->
			<div class="col-xl-8 mt-2">
				<div class="vstack gap-5">
					<!-- Booking summary START -->
					<div class="card shadow">
						<!-- Card header -->
						<div class="card-header border-bottom p-4">
							<h1 class="mb-0 fs-3">예약정보 요약</h1>
						</div>

						<!-- Card body START -->
						<div class="card-body p-4">
							<div class="row g-md-4">
								<!-- Image -->
								<div class="col-md-3">
									<div class="bg-light rounded-3 carImgDiv mb-3 mb-md-0">
										<img class="carImg" src="${carVO.carImg }" alt="">
									</div>
								</div>

								<!-- Card and address detail -->
								<div class="col-md-9">
									<!-- Title -->
									<h5 class="card-title mb-2">${carVO.carKnd}</h5>
									<ul class="nav nav-divider h6 fw-normal mb-2">
										<li class="nav-item">${carVO.carCode}</li>
										<li class="nav-item">${carVO.maxPp}</li>
									</ul>

									<!-- Pick up and drop address -->
									<div class="row">
										<ul class="list-group list-group-borderless mt-2 mb-0">
											<li class="list-group-item d-flex pb-0 mb-0">
												<span class="h6 fw-normal mb-0"><i class="bi bi-check-circle me-2"></i>${carVO.carYr}년식</span>
											</li>
											<li class="list-group-item d-flex pb-0 mb-0">
												<span class="h6 fw-normal mb-0"><i class="bi bi-check-circle me-2"></i>${carVO.fuelTy}</span>
											</li>
										</ul>
									</div>
								</div>

								<div class="col-md-6">
									<ul class="list-group list-group-borderless">
										<li class="list-group-item">픽업날짜:<span class="h6 fw-normal mb-0 ms-1">${carRsvSt}</span></li>
									</ul>
								</div>
		
								<div class="col-md-6">
									<ul class="list-group list-group-borderless">
										<li class="list-group-item">반납날짜:<span class="h6 fw-normal mb-0 ms-1">${carRsvEd}</span></li>
									</ul>
								</div>
							</div>

							<!-- Title -->
							<h6 class="mb-0 mt-3">지점 정보</h6>

							<div class="row">
								<!-- List -->
								<div class="col-sm-8">
									<ul class="list-group list-group-borderless mb-0">
										<li class="list-group-item">지점명:<span class="h6 mb-0 fw-normal ms-1">${carVO.busiNm }</span></li>
										<c:set var="formattedTel" value="${carVO.busiTel.substring(0, 3)}-${carVO.busiTel.substring(3, 7)}-${carVO.busiTel.substring(7)}" />
										<li class="list-group-item">지점 전화번호:<span class="h6 mb-0 fw-normal ms-1">${formattedTel}</span></li>
										<li class="list-group-item">픽업 및 반납 장소:<span class="h6 mb-0 fw-normal ms-1">${carVO.busiLoc}</span></li>
									</ul>
								</div>
								
								<!--  -->
								<div class="col-sm-4 text-sm-end mt-3 mt-sm-auto">
									<h6 class="mb-1 fw-normal">최종 요금</h6>
									<fmt:formatNumber var="totalFee" value="${carVO.carFee*totalHours}" pattern="#,###,###"/>
									<h3 class="mb-0 text-success">${totalFee}원</h3>
								</div>

							</div>
						</div>	
						<!-- Card body END -->
					</div>
					<!-- Booking summary END -->
					
					
					
					<!-- Guest detail START -->
					<div class="card shadow">
						<!-- Card header -->
						<div class="card-header border-bottom bg-transparent">
							<h4 class="mb-0">예약자 정보</h4>
						</div>
						
						
							<sec:authorize access="isAnonymous()">
							<!-- 로그인 권고 창 START -->
							<div class="alert alert-info my-4" role="alert">
								<a href="sign-up.html" class="alert-heading h6"></a>자동기입으로 빠르게 예약하고 할인혜택을 받아보시려면 로그인 하세요
							</div>
							<!-- 로그인 권고 창 END -->
							</sec:authorize>
							

						<!-- Card body START -->
						<div class="card-body">
							<!-- Form START -->
							<form class="row g-4">
	
								<sec:authorize access="isAuthenticated()">
								<!-- Radio button -->
								<div class="col-md-4">
									<label class="form-label">성별</label>
									<div>
										<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
											<input type="radio" class="btn-check" name="btnradio" id="btnradio1" checked="">
											<label class="btn btn-lg btn-light btn-dark-bg-check mb-0" for="btnradio1">남성</label>
										
											<input type="radio" class="btn-check" name="btnradio" id="btnradio2">
											<label class="btn btn-lg btn-light btn-dark-bg-check mb-0" for="btnradio2">여성</label>
										</div>
									</div>	
								</div>

								<!-- Input -->
								<div class="col-md-8">
									<div class="form-control-bg-light">
										<label class="form-label">이름</label>
										<input type="text" class="form-control form-control-lg" placeholder="이름을 입력해주세요" value="${memVO.memNm}">
									</div>
								</div>

								<!-- Input -->
								<div class="col-md-6">
									<div class="form-control-bg-light">
										<label class="form-label">이메일 주소</label>
										<input id="email" type="email" class="form-control form-control-lg" placeholder="Enter your email" value="${memVO.memEmail}"> 
									</div>
								</div>

								<!-- Input -->
								<div class="col-md-6">
									<div class="form-control-bg-light">
										<label class="form-label">전화번호</label>
										<c:set var="formattedTel" value="${memVO.memTel.substring(0, 3)}-${memVO.memTel.substring(3, 7)}-${memVO.memTel.substring(7)}" />
										<input type="text" class="form-control form-control-lg" placeholder="Enter your mobile number" value="${formattedTel}">
									</div>
								</div>
								</sec:authorize>
								
							</form>
							<!-- Form END -->
							
							
							<!-- Special request START -->
							<div class="card border mt-4">
								<!-- Card header -->
								<div class="card-header border-bottom">
									<h5 class="card-title mb-0">자동차보험 <span class="text-danger h6">-필수가입</span></h5>
								</div>

								<!-- Card body START -->
								<div class="card-body">
									<form class=" gap-3">
										<!-- Checkbox -->
										<c:forEach var="hInsrVO" items="${hInsrVOList}" varStatus="stat">
										<div class="form-check d-flex justify-content-between">
										 	 <span class="label-left">
										 	 	<input class="form-check-input" type="radio" id="${hInsrVO.hinsrId}" value="${hInsrVO.hinsrId}"  name="insurance" data-pr="${hInsrVO.insrPr}" data-nm="${hInsrVO.insrNm}">
										 	 	<label class="form-check-label" for="${hInsrVO.hinsrId}">${hInsrVO.insrNm}</label>
										 	 </span>
										 	 
											<fmt:formatNumber var="formattedInsuPr" value="${hInsrVO.insrPr}" pattern="#,###,###"/>
											<span class="text-success">보험료:${formattedInsuPr}원</span>
										</div>
										</c:forEach>
									
									</form>	
								</div>
								<!-- Card body END -->
							</div>
							<!-- Special request END -->
							
						</div>
						<!-- Card body END -->
					</div>
					

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
														<h4> <span class="small fs-6">최종 가격 </span> <span class="totalFee">${totalFee}원</span></h4>
														<button id="pay" class="btn btn-primary mb-0"  data-toggle="tooltip" data-placement="bottom" title="인원수,이름,전화번호,이메일은 필수값 입니다">결제하기</button>
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
							<p class="mb-0">결제시  <a href="http://localhost/member/main/privacyPolicy" class="text-primary">Wonderway 통합정책</a>에 동의한 것으로 간주합니다.</a></p>
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
										<span class="h6 fw-light mb-0">기본 요금</span>
										<span class="fs-5 baseFee fee">${totalFee}원</span>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<span class="h6 fw-light mb-0">보험료</span>
										<span class="fs-5 exFee fee">원</span>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<sec:authorize access="isAnonymous()">
											<span class="h6 fw-light mb-0">마일리지 사용<span class="badge text-bg-danger smaller mb-0 ms-2">회원 전용</span></span>
											<span class="fs-5 text-success mlg">-0원</span>	
										</sec:authorize>		
										
										<sec:authorize access="hasRole('ROLE_MEMBER')"> 
											<span class="h6 fw-light mb-0">마일리지 사용</span>
											<span class="fs-5 text-success mlg fee">-0원</span>	
										</sec:authorize>
									</li>
									
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<sec:authorize access="isAnonymous()">
											<span class="h6 fw-light mb-0">쿠폰 할인<span class="badge text-bg-danger smaller mb-0 ms-2">회원 전용</span></span>
											<span class="fs-5 text-success cupn">-0원</span>	
										</sec:authorize>
										
										<sec:authorize access="hasRole('ROLE_MEMBER')"> 
											<span class="h6 fw-light mb-0 cupnBadge">쿠폰 할인</span>
											<span class="fs-5 text-success cupn fee">-0원</span>	
										</sec:authorize>
									</li>
								</ul>
							</div>
	
							<!-- Card footer -->
							<div class="card-footer border-top">
								<div class="d-flex justify-content-between align-items-center">
									<span class="h5 mb-0">최종 가격</span>
									<span class="h5 mb-0 totalFee">원</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Price summary END -->

					<sec:authorize access="hasRole('ROLE_MEMBER')">
					<!-- Offer and discount START -->
					<div class="col-md-6 col-xl-12">
						<div class="card shadow">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<div class="cardt-title">
									<h5 class="mb-0">쿠폰 &amp; 마일리지</h5>
								</div>
							</div>
							<!-- Card body -->
							<div class="card-body">

								<!-- Input group -->
								<div class="input-group">
									<input class="cupnInput form-control" placeholder="쿠폰을 선택해주세요" >
									<button id="cupn" type="button" class="btn btn-primary">쿠폰 선택</button>
								</div>
								
								<!-- Input group -->
								<div class="input-group mt-3">
									<fmt:formatNumber var="formattedMlg" value="${memVO.memMlg}" pattern="#,###,###"/>
									<input id="mlgInput" class="form-control form-control" type="number" max="${memVO.memMlg}" placeholder="보유 마일리지: ${formattedMlg}">
									
									<button id="btnMlg" type="button" class="btn btn-primary">적용</button>
								</div>
							</div>	
						</div>
					</div>
					<!-- Offer and discount END -->
 					</sec:authorize>

					<!--비회원   -->
					<sec:authorize access="isAnonymous()">
					<!-- Information START -->
					<div class="col-md-6 col-xl-12">
						<div class="card shadow">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<h5 class="card-title mb-0">회원으로 예약시 더 큰 혜택</h5>
							</div>

							<!-- Card body -->
							<div class="card-body">
								<!-- List -->
								<ul class="list-group list-group-borderless">
									<li class="list-group-item d-flex mb-0"><i class="fa-solid fa-check text-success me-2"></i>
										<span class="h6 fw-normal">등급별 월별 쿠폰과 특별 쿠폰</span>
									</li>

									<li class="list-group-item d-flex mb-0"><i class="fa-solid fa-check text-success me-2"></i>
										<span class="h6 fw-normal">구매율에 따른 마일리지 적립</span>
									</li>

									<li class="list-group-item d-flex mb-0"><i class="fa-solid fa-check text-success me-2"></i>
										<span class="h6 fw-normal">베스트 리뷰시 혜택</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- Information END -->
					</sec:authorize>

				</div>
			</aside>
			<!-- Right side content END -->
		</div> <!-- Row END -->
	</div>
</section>


<!-- =======================
Main Content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->


<!--쿠폰 모달  -->
<div class="modal fade" id="modalCupn" tabindex="-1"
	aria-labelledby="cupnmodalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-md">
		<div class="modal-content">
			<!-- Title -->
			<div class="modal-header">
				<h5 class="modal-title" id="rfdModalLabel">쿠폰함</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				
			</div>

			<!--모달 바디-->
			<div class="modal-body p-3">
				<c:forEach var="cupnVO" items="${memVO.cupnVOList}" varStatus="stat"> 
				<div class="tns-item">
					<div class="cupnCard card card-body bg-transparent border p-4 mb-1" data-id="${cupnVO.cupnId}" data-rt="${cupnVO.cupnRt}" data-dc="${cupnVO.cupnDc}">
						<!-- Pre title -->
						<fmt:formatDate var="formattedCupnExp" value="${cupnVO.cupnExp}" pattern="yyyy/MM/dd"  />
						<h6 class="text-primary fw-normal mb-2">${formattedCupnExp}까지</h6>
						<!-- Title -->
						<h5 class="cupnNm card-title mb-md-2">
							<a class="stretched-link">${cupnVO.cupnDc} <br/></a>
						</h5> 
						<div class="d-flex justify-content-end flex-wrap">
							${cupnVO.cupnRt}% 할인
						</div>
							
					</div>
				</div>
				</c:forEach>
			</div>

			<!--확인 버튼 -->
			<div class="modal-footer">
				<button id="btnApplyCupn" type="button" class="btn btn-sm btn-primary mb-0"
					data-bs-dismiss="modal">쿠폰 적용</button>
			</div>
		</div>
	</div>
</div>
<!--로그인시 자바스크립트  -->
<sec:authorize access="hasRole('ROLE_MEMBER')"> 
<script>

$(function() {
	
	//보혐료 적용
	$("input[name='insurance']").on("click",function(){
		console.log($(this).data('pr'))
		insrFee=numberWithCommas($(this).data('pr'))
		$(".exFee").text(insrFee+"원")
		totalFee()
	})
	
	//마일리지 적용
	$("#btnMlg").on("click",function(){
		$(".mlg").text(numberWithCommas(-$("#mlgInput").val())+"원")
		totalFee();

	})

	//마일리지 입력값 제한
	$("#mlgInput").on("input",function(){
	    var enteredValue = parseInt($(this).val());
		    var maxLimit = ${memVO.memMlg}; 
		    if (enteredValue > maxLimit) {
		    	$(this).val(""); 
			}
	})


	//쿠폰 모달
	$("#cupn").on("click",function(){
		$("#modalCupn").modal("show");
		
	});
	
	
	var cupnId
	//쿠폰 선택 
	$(".cupnCard").on("click",function(){
		
		$(".cupnCard").each(function(){
			$(this).addClass("border")
			
		 });
		
		$(this).removeClass("border").css({ 
			"border":"2px solid blue"
		});
		
		var rt =$(this).data('rt')
		cupnId =$(this).data('id')
		var cupnDc=$(this).data('dc')
		
		//쿠폰적용 
		$("#btnApplyCupn").on("click",function(){
			var newHtml ='<span class="badge text-bg-danger smaller mb-0 ms-2">'+rt+'%'+'</span>';
			$(".cupnBadge").html("쿠폰 할인" + newHtml);
			var fee=parseInt($(".baseFee").text().replace(/,/g,'').slice(0,-1))
			var cupnDiscount=fee*parseInt(rt)*0.01
			$(".cupnInput").val(cupnDc)
			$(".cupn").text(numberWithCommas(-cupnDiscount)+"원")
			totalFee()
		})
		
	})
	
	
	
	//이니시스 결제 
	$('#pay').click(function(){
		
		var mlg=$(".mlg").text().replace(/,/g,'').slice(1,-1);
		var buyer_email='${memVO.memEmail}';
		var buyer_name='${memVO.memNm}';
		var buyer_tel='${memVO.memTel}';
		var name='${carVO.carKnd}'+' '+'${carVO.carNum}'
		var insrNm=$("input[name='insurance']").data('nm');
		var insrId=$("input[name='insurance']").val();
		var amount=$(".totalFee").eq(0).text().replace(/,/g,'').slice(0,-1)
		console.log(amount)
		
		
		var data={ 
			"payPr": amount,
			"busiId": '${carVO.busiId}',
			"memId":'${memVO.memId}',
			"cupnId":cupnId,
			"usedMilage": mlg,
			"rsvSt": '${carRsvSt}',
			"rsvEd": '${carRsvEd}',
			"rsvNm":name,
			"buyerNm":buyer_name,
			"carNum":'${carVO.carNum}',
			"hinsrNm":insrNm,
			"hinsrId":insrId,
			"busiNm":'${carVO.busiNm }',
			"carImg":'${carVO.carImg}'
			
		}
		
		console.log(data)
		
		if(amount==0){
			$.ajax({
				type : "post",
				url : "/member/rntcar/payComplete",
				data: JSON.stringify(data),
				contentType: "application/json;charset=utf-8",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
				success : function(result) {
					console.log("아작스 성공")
				    window.location.href = "/member/rntcar/rsvConfirm";

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
			    				url : "/member/rntcar/payComplete",
			    				data: JSON.stringify(data),
			    				contentType: "application/json;charset=utf-8",
			    				beforeSend : function(xhr) {
			    					xhr.setRequestHeader("${_csrf.headerName}",
			    							"${_csrf.token}");
			    				},
			    				success : function(result) {
			    					console.log("결제",result)
			    				}
			    			});
			   	    	
			   	      location.href="/member/rntcar/rsvConfirm";
			   	    } else {
			   	      var msg = '결제에 실패하였습니다.';
			   	      msg += '에러내용 : ' + rsp.error_msg;
			   	      alert(msg);
			   	    }
			     }
			 })
		}
	})
	
	

})

//최종 요금 계산 
function totalFee(){
	var sum=0
	$(".fee").each(function(){
		console.log($(this).text());
		var fee =parseInt($(this).text().replace(/,/g,'').slice(0,-1))
		sum+=fee
	})
	if(sum<0)
		sum=0
	$(".totalFee").text(numberWithCommas(sum)+"원")
	
}

function numberWithCommas(x) {
	  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

</script>
</sec:authorize>

</body>
</html>