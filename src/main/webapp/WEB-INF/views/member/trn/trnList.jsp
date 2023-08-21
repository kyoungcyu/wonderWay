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
	
	//경과시간 구하기
	$(".ticketInfo").each(function() {
		
		var DepTime=$(this).find(".parsedDepTime").text();
		var ArrTime=$(this).find(".parsedArrTime").text();
		
		
		var DepDate = new Date("1970-01-01T" + DepTime + ":00");
		var ArrDate = new Date("1970-01-01T" + ArrTime + ":00");
		
		
		var diff = ArrDate - DepDate;
		// 시간 차이를 분으로 변환
		var diffInMinutes = Math.floor(diff / (1000 * 60));
		// 시간 차이를 시간과 분으로 변환
		var hours = Math.floor(diffInMinutes / 60);
		var minutes = diffInMinutes % 60;
		
		$(this).find(".totalTime").text("경과시간: "+hours+"시간 "+minutes+"분")
		$(this).find("input[name='totalTime']").val(hours+"시간 "+minutes+"분");
		console.log($(this).find("input[name='totalTime']").val())
		
	})
	
	
	$(document).on("change","input[type=radio]",function(){
		unSelectedRadio=$(this).parent().siblings().find("label")
		console.log(unSelectedRadio)
		unSelectedRadio.each(function(){
			$(this).css({"background-color": "var(--bs-light) !important",
					    "color": "var(--bs-light) !important",
			   			"border": "var(--bs-gray-900) !important"});
		})
	})
	
	//동적으로 만든 체크박스 클릭시 이미지 변경
	$(document).on("change","input[type=checkbox]",function(){
		
		//체크선택 개수 제한
		checkedCnt=$("input[type=checkbox]:checked").length
		console.log(checkedCnt)
		var numPp=${numPp}
		
		  if (checkedCnt <= numPp) {
				if($(this).is(":checked"))
					$(this).parent().find(".imgSeat").attr("src","/resources/booking/assets/images/category/trn/selectedseat.png")
				else
					$(this).parent().find(".imgSeat").attr("src","/resources/booking/assets/images/category/trn/seat.png")
				
		  }else{
			  $(this).prop("checked",false);
		  }
			
	});
	
// 	$("btnRsv").on("click",function(){
// 		$("input[name=rmNum]",this.form).val(rmNum)
// 		$("input[name=seatId]",this.form).val(seatIdArray)
		
		
	
// 	})
	
	//예약된 좌석 클릭 막기
	 $(document).on('click', '.unseat', function(event) {
		 console.log("되니...")
    	event.preventDefault();
    	event.stopPropagation();
  	});
	
	
	//좌석선택 모달시 아작스로 데이터 받아옴 
	$(".btnSeat").on("click",function(){
		
		var frmId=this.form.id;
		
		var data={"trnKnd":$(this).data("trnknd"),
				"trnNum":$(this).data("trnnum"),
				"stLoc":$("input[name=depplacename]",this.form).val(),
				"arLoc":$("input[name=arrplacename]",this.form).val(),
				"stTm":$(this).data("depplandtime"),
				"arTm":$(this).data("arrplandtime")
		}
		
		
		//객실 리스트 가져오는 아작스
		$.ajax({
			type : "post",
			url : "/member/trn/getRm",
			data : data,
			dataType : "json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(result) {
			    const parentElement = document.getElementById('rmBox');
				
			    while (parentElement.firstChild) {
			        parentElement.removeChild(parentElement.firstChild);
			     }
				
				result.forEach(function(item) {
					
					
// 					var html=`
// 						<li class="list-inline-item mb-0">
// 							<input type="radio" class="rmNum" id="3">
// 							<label class="btn btn-sm btn-light btn-primary-soft-check" for="3">3호</label>
// 						</li>`
					
				 
				    const li = document.createElement('li');
				    li.classList.add('list-inline-item', 'mb-0');
				    
				    const radioInput = document.createElement('input');
				    radioInput.type = 'radio';
				    radioInput.classList.add('btn-check','rmNum');
				    radioInput.name= "radioRmNum";
				    radioInput.id = item.rmNum;
				    
				    const label = document.createElement('label');
				    label.classList.add('btn', 'btn-sm', 'btn-light', 'btn-primary-soft-check');
				    label.setAttribute('for', item.rmNum);
				    label.textContent = item.rmNum+"호";
				    
				    li.appendChild(radioInput);
				    li.appendChild(label);
				    
				    parentElement.appendChild(li);
				    
				    
				    //객실마다 좌석 리스트 받아오는 아직스
				    $(radioInput).on("click",function(){
				    	data.rmNum=$(this).attr('id')
				    	
				    	$.ajax({
								type : "post",
								url : "/member/trn/getSeat",
								data : JSON.stringify(data),
								dataType : "json",
								contentType: "application/json",
								beforeSend : function(xhr) {
									xhr.setRequestHeader("${_csrf.headerName}",
											"${_csrf.token}");
								},
								success : function(result) {
									$('.seatId').empty()
									result.forEach(function(item) {
										var html=`<td>
													<input type="checkbox" id="\${item.seatId}" value="\${item.seatId}" class="\${item.seatStatus === 'N' ? 'unseat' : ''}">
													<label for="\${item.seatId}">
														<span class="spanSeat my-1">
															<img class="imgSeat \${item.seatStatus === 'N' ? 'unseat' : ''}" src="\${seatImg(item.seatStatus)}">
															<em class="txtSeat">\${item.seatId}</em>
														</span>
													</label>
												</td>`;
										
										if(item.seatId.slice(-1)=='A'){
											$("#A").append(html);
										}else if(item.seatId.slice(-1)=='B'){
											$("#B").append(html);
										}else if(item.seatId.slice(-1)=='C'){
											$("#C").append(html);
										}else{
											$("#D").append(html);
										}
										
									})
								}
				    	})
				    })
				});
			}
		})
		
		
		
		//좌석선택 모달창에서 예매하기 클릭시 폼 제출
		$("#btnRsvSeat").on("click",function(){
			var rmNum = $("input[type=radio]:checked").attr("id")
			
			var seatIdArray= [];
			$("input[type=checkbox]:checked").each(function() {
				seatIdArray.push($(this).val());
   			});
			
			
			$("input[name=rmNum]",this.form).val(rmNum)
			$("input[name=seatId]",this.form).val(seatIdArray)
			
			$("#" + frmId).submit();
		})
		
		
	})
})
function seatImg(seatStatus) {
  return seatStatus === 'Y'
    ? '/resources/booking/assets/images/category/trn/seat.png'
    : '/resources/booking/assets/images/category/trn/unseat.png';
}


</script>
</head>

<body>

<!-- Header END -->

<!-- **************** MAIN CONTENT START **************** -->
<main>

<x:parse var="xmlDoc" xml="${data}" />

<!-- =======================
Search START -->
<section class="pt-0">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Booking from START -->
				<form class="bg-mode border rounded position-relative px-4 pt-4 mb-4 mb-sm-0">
					<div class="row g-4">
						<!-- Nav tabs START -->
						<div class="col-lg-6">
							<ul class="nav nav-pills nav-pills-dark" id="pills-tab" role="tablist">
								<li class="nav-item" role="presentation">
									<button class="nav-link rounded-start rounded-0 mb-0 active" id="pills-one-way-tab" data-bs-toggle="pill" data-bs-target="#pills-one-way" type="button" role="tab" aria-selected="true">편도</button>
								</li>
								<li class="nav-item" role="presentation">
									<button class="nav-link rounded-end rounded-0 mb-0" id="pills-round-trip-tab" data-bs-toggle="pill" data-bs-target="#pills-round-trip" type="button" role="tab" aria-selected="false">왕복</button>
								</li>
							</ul>
						</div>
						<!-- Nav tabs END -->
	
	
						<!-- Ticket Passenger -->
						<div class="col-lg-3 ms-auto">
							<div class="form-control-bg-light form-fs-md">
								<select class="form-select js-choice">
									<option>인원수</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
								</select>
							</div>	
						</div>
					</div>
	
					<!-- Tab content START -->
					<div class="tab-content mt-4" id="pills-tabContent">
						<!-- One way tab START -->
						<div class="tab-pane fade show active" id="pills-one-way" role="tabpanel" aria-labelledby="pills-one-way-tab">
							<div class="row g-4">
								<!-- Leaving From -->
								<div class="col-md-6 col-lg-4 position-relative">
									<div class="form-border-transparent form-fs-lg bg-light rounded-3 h-100 p-3">
										<!-- Input field -->
										<label class="mb-1"><i class="bi bi-geo-alt me-2"></i>출발역</label>
										<select class="form-select js-choice" data-search-enabled="true">
											<option selected>${depPlace}</option>
											<option>San Jacinto, USA</option>
											<option>North Dakota, Canada</option>
											<option>West Virginia, Paris</option>
										</select>
									</div>
	
									<!-- Auto fill button -->
									<div class="btn-flip-icon mt-3 mt-md-0">
										<button class="btn btn-white shadow btn-round mb-0"><i class="fa-solid fa-right-left"></i></button>
								 </div>
								</div>
	
								<!-- Going To -->
								<div class="col-md-6 col-lg-4">
									<div class="form-border-transparent form-fs-lg bg-light rounded-3 h-100 p-3">
										<!-- Input field -->
										<label class="mb-1"><i class="bi bi-send me-2"></i>도착역</label>
										<select class="form-select js-choice" data-search-enabled="true">
											<option selected>${arrPlace}</option>
											<option>San Jacinto, USA</option>
											<option>North Dakota, Canada</option>
											<option>West Virginia, Paris</option>
										</select>
									</div>
								</div>
	
								<!-- Departure -->
								<div class="col-lg-4">
									<div class="form-border-transparent form-fs-lg bg-light rounded-3 h-100 p-3">
										<label class="mb-1"><i class="bi bi-calendar me-2"></i>날짜</label>
										<input type="text" class="form-control flatpickr" placeholder="날짜를 선택해주세요" data-date-format="Y/m/d" value="${depPlandTime}">
									</div>
								</div>
	
								<div class="col-12 text-end pt-0">
									<a  class="btn btn-primary mb-n4" href="#">승차권 조회 <i class="bi bi-arrow-right ps-3"></i></a>
								</div>
							</div>
						</div>
						<!-- One way tab END -->
	
					</div>
					<!-- Tab content END -->
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
					<x:forEach select="$xmlDoc/response/body/items/item" var="item" varStatus="stat">
					
					<form id="frm_${stat.index}" action="/member/trn/trnRsv" method="post">
					
					<div class="card border ticketInfo">
						<!-- card-body START -->
						<div class="card-body p-4 pb-0 ticketInfo">
							<div class="row g-4">
								<!-- Air line name -->
								<div class="col">
									<!-- Image -->
									<c:set var="traingradename"><x:out select="$item/traingradename"/></c:set>
									<c:if test="${traingradename eq 'KTX'}">
										<img src="/resources/booking/assets/images/category/trn/ktx.png" class="w-80px mb-3" alt="">
									</c:if>
									<c:if test="${traingradename eq 'KTX-산천(A-type)'||traingradename eq 'KTX-산천(B-type)'}">
										<img src="/resources/booking/assets/images/category/trn/ktx_sancheon.png" class="w-80px mb-3" alt="">
									</c:if>
									<c:if test="${traingradename eq 'ITX-새마을'}">
										<img src="/resources/booking/assets/images/category/trn/itx1.png" class="w-80px mb-3" alt="">
									</c:if>
									<c:if test="${traingradename eq '무궁화호'}">
										<img src="/resources/booking/assets/images/category/trn/mugunghwa.PNG" class="w-80px mb-3" alt="">
									</c:if>
									<!-- Title -->
									<h6 class="fw-normal mb-0">${traingradename}</h6>
									<c:set var="trainno"><x:out select="$item/trainno"/></c:set>
									<h6 class="fw-normal mb-0">${trainno}</h6>
								</div>

								<!-- Airport detail -->
								<div class="col">
									<!-- Title -->
									<c:set var="depplandtime"><x:out select="$item/depplandtime"/></c:set>
									<c:set var="depDate" value="${fn:substring(depplandtime, 0, 8)}" />
									<c:set var="depTime" value="${fn:substring(depplandtime, 8, 12)}" />
									<fmt:parseDate var="parsedDepDate" value="${depDate}" pattern="yyyyMMdd"/>
									<fmt:parseDate var="parsedDepTime" value="${depTime}" pattern="HHmm"/>
									<h4 class="parsedDepTime"><fmt:formatDate value="${parsedDepTime}" pattern="HH:mm"/></h4>
									<h6 class="mb-0"><fmt:formatDate value="${parsedDepDate}" pattern="yy/MM/dd"/></h6>
									<p class="mb-0"><x:out select="$item/depplacename"/></p>
								</div>	
								
								
								<!-- Time -->
								<div class="col text-center">
									<!-- Time -->
	
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
								<div class="col">
									<!-- Title -->
									<c:set var="arrplandtime"><x:out select="$item/arrplandtime"/></c:set>
									<c:set var="date" value="${fn:substring(arrplandtime, 0, 8)}" />
									<c:set var="time" value="${fn:substring(arrplandtime, 8, 12)}" />
									<fmt:parseDate var="parsedArrDate" value="${date}" pattern="yyyyMMdd"/>
									<fmt:parseDate var="parsedArrTime" value="${time}" pattern="HHmm"/>
									<h4 class="parsedArrTime"><fmt:formatDate value="${parsedArrTime}" pattern="HH:mm"/></h4>
									<h6 class="mb-0"><fmt:formatDate value="${parsedArrDate}" pattern="yy/MM/dd"/></h6>
									<p class="mb-0"><x:out select="$item/arrplacename"/></p>
									
								</div>

								<!-- Price -->
								<div class="col text-center">
									<!-- Price -->
									<c:set var="adultcharge"><x:out select="$item/adultcharge"/></c:set>
									<h4><fmt:formatNumber value="${adultcharge}"/>원</h4>
									<div class="d-flex justify-content-between px-3">
									<button type="submit" id="btnRsv" class="btn btn-sm btn-dark">바로예매</button>
									<button type="button" class="btn btn-sm btn-primary btnSeat" data-trnknd="${traingradename}" data-trnnum="${trainno}" 
									data-depplandtime="${depplandtime}" data-arrplandtime="${arrplandtime}" data-bs-toggle="modal" data-bs-target="#seat">좌석선택</button>
									</div>
								</div>

							</div>
						</div>	
						<!-- card-body END -->

						<!-- card footer -->
						<div class="card-footer p-4 ">
							<div class="bg-light p-2 rounded-2">
								<ul class="list-inline d-sm-flex justify-content-sm-between mb-0 mx-4">
									<li class="list-inline-item text-danger">예매가능</li>
									<li class="list-inline-item totalTime">경과시간 </li>
									<li class="list-inline-item text-success">환불가능</li>
								</ul>
							</div> 
						</div>	
						<input type="hidden" value="" name="totalTime">
					</div>
					
					<input type="hidden" value="<x:out select="$item/traingradename"/>" name="traingradename">
					<input type="hidden" value="<x:out select="$item/trainno"/>" name="trainno">
					<input type="hidden" value="<fmt:formatDate value="${parsedDepDate}" pattern="yy/MM/dd"/>" name="depDate">
					<input type="hidden" value="<fmt:formatDate value="${parsedDepTime}" pattern="HH:mm"/>" name="depTime">
					<input type="hidden" value="<x:out select="$item/depplacename"/>" name="depplacename">
					<input type="hidden" value="<fmt:formatDate value="${parsedArrDate}" pattern="yy/MM/dd"/>" name="arrDate">
					<input type="hidden" value="<fmt:formatDate value="${parsedArrTime}" pattern="HH:mm"/>" name="arrTime">
					<input type="hidden" value="<x:out select="$item/arrplacename"/>" name="arrplacename">
					<input type="hidden" value="<fmt:formatNumber value="${adultcharge}"/>" name="adultcharge">
					<input type="hidden" value="" name="rmNum">
					<input type="hidden" value="" name="seatId">
					<sec:csrfInput />
					</form>
					</x:forEach>
					<!--기차 정보 END -->

					<!-- Pagination START -->
					<nav class="d-flex justify-content-center" aria-label="navigation">
						<ul class="pagination pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
							<li class="page-item mb-0"><a class="page-link" href="#" tabindex="-1"><i class="fa-solid fa-angle-left"></i></a></li>
							<li class="page-item mb-0 active"><a class="page-link" href="#">1</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">2</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">3</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">4</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">5</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">6</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">7</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">8</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">9</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">10</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#"><i class="fa-solid fa-angle-right"></i></a></li>
						</ul>
					</nav>
					<!-- Pagination END -->

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

<!-- 기차 detail modal START -->
<div class="modal fade" id="seat" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<!-- Title -->
			<div class="modal-header">
				<h5 class="modal-title">좌석 선택</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<!-- Body -->
			<div class="modal-body p-3">
				<div class="card card-body rounded-0 px-4 py-2">
					<!-- 호차 선택 -->
					<h6 class="mb-2">호차 선택</h6>
					<!-- Return Stops group -->
					<ul id="rmBox" class="list-inline mb-0 g-3">
						<!-- 호차 아이템 들어갈 자리 -->
					</ul>
			
			
				
					<!--좌석 선택  -->
					<h6 class="mb-2 mt-3">좌석 선택 </h6>  <a>선택 가능 좌석수:${numPp}</a>
					<table class="seatTable" width="100%">
						<tbody >
							<tr id="A" class="seatId">
							</tr>
							
							<tr id="B" class="seatId">
							</tr>
						
							<tr class="my-3">
								<td id="lineRoad" style="color:#00008B; text-align: left;">
									<strong>${depPlace}</strong>
								</td>
								
								<c:forEach var="i" begin="1" end="12">
									<td id="lineRoad" style="text-align:center; color:#00008B; font-size:14px;">
										<strong>&gt;</strong>
									</td>
								</c:forEach>
								
								</td>
								<td id="lineRoad" style="text-align:center; color:#00008B;">
									<strong>${arrPlace}</strong>
								</td>
							</tr>
							
							<tr id="C"  class="seatId">
							</tr>
							
							<tr id="D"  class="seatId">
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			
			
			<!-- Button -->
			<div class="modal-footer">
				<button id="btnRsvSeat" class="btn btn-sm btn-primary mb-0" href=""><i class="bi fa-fw bi-ticket-perforated me-2"></i>예매하기</button>
			</div>
		</div>
	</div>
</div>
<!-- 기차 detail modal END -->




</body>
</html>