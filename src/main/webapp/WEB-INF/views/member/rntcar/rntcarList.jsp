<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/cupertino/jquery-ui.css">

<head>
<title>Wonderway-렌트카</title>

<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/choices/css/choices.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/nouislider/nouislider.css">

<style>
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


<script type="text/javascript" defer="defer">
$(document).ready(function(){
	

	
	// 슬라이더와 가격 입력 창을 연동
	$("#minPr").on("input", function() {
	  var minPr = $(this).val();
	  var maxPr = $("#maxPr").val();
	  $("#price-slider").slider("values", [minPr, maxPr]);
	});
	
	$("#maxPr").on("input", function() {
	  var minPr = $("#minPr").val();
	  var maxPr = $(this).val();
	  $("#price-slider").slider("values", [minPr, maxPr]);
	});
	  
	
  
	// 슬라이더 초기화
	$("#price-slider").slider({
	  range: true,
	  min: 0,
	  max: ${maxCarPr},
	  values: [0,${maxPr}],
	  step: 100,
	  slide: function(event, ui) {
	    var minPr= ui.values[0];
	    var maxPr = ui.values[1];
	    $("#minPr").val(minPr);
	    $("#maxPr").val(maxPr);
	  }
	});
	

	
	//필터 검색 후 조건 유지
	$(".maxPp").find("input[type='checkbox']").each(function(){
		var maxPpList = '${maxPpList}';
		
		if (maxPpList && maxPpList.includes($(this).val())) {
		    $(this).prop("checked", true);
		}
	});
	
	$(".carCode").find("input[type='checkbox']").each(function(){
		var carCodeList = '${carCodeList}';
		
		if (carCodeList && carCodeList.includes($(this).val())) {
		    $(this).prop("checked", true);
		}
	});
	
	$(".fuelTy").find("input[type='checkbox']").each(function(){
		var fuelTyList = '${fuelTyList}';
		
		if (fuelTyList && fuelTyList.includes($(this).val())) {
		    $(this).prop("checked", true);
		}
	});
	
	
	//필터 검색
	$("#btnFilter").on("click",function(){
		event.preventDefault();
		
		var selectedVal=$("#order").val();
		$("input[name='order']",this.form).val(selectedVal)
		
		this.form.submit();
	
	})
	
	
	//필터 초기화
	$("#filterReset").on("click",function() {
		console.log("필터야")
		$("input[type='checkbox']").prop("checked",false);
		$("input[type='radio']").prop("checked",false);
		$("input[type='text']").val("");
	
	});
	
});
</script>


</head>
<body>

<!-- **************** MAIN CONTENT START **************** -->
<main>
<!-- =======================
Search START -->
<section class="bg-primary">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Booking from START -->
				<div class="form-control-bg-light bg-mode border p-4 rounded-3">
	
					<!-- Tab content START -->
					<div class="tab-content mt-0" id="pills-tabContent">
						<!-- One way tab START -->
						<div class="tab-pane fade show active" id="cab-one-way" role="tabpanel" aria-labelledby="cab-one-way-tab">
							<form class="row g-4 align-items-center">
								<div class="col-xl-10">
									<div class="row g-4">
										<!-- Pickup -->
										<div class="col-md-6 col-xl-4">
											<div class="form-size-lg">
												<label class="form-label">대여 장소</label>
												<select class="form-select js-choice" data-search-enabled="true" aria-label=".form-select-sm">
													<option value="">Select location</option>
													<option selected>제주</option>
													<option>North Dakota, Canada</option>
													<option>West Virginia, Paris</option>
												</select>
											</div>
										</div>
			
										<!-- Drop -->
										<div class="col-md-6 col-xl-4">
											<div class="form-size-lg">
												<div class="form-fs-lg form-control-transparent">
												<label class="form-label small">픽업 날짜</label>
												<input name="rsvSt" type="text" class="form-control flatpickr" value="${carRsvSt}" placeholder="픽업날짜를 선택해주세요">
											</div>
											</div>
										</div>
										<!-- Drop -->
										<div class="col-md-6 col-xl-4">
											<div class="form-size-lg">
												<div class="form-fs-lg form-control-transparent">
												<label class="form-label small">반납 날짜</label>
												<input name="rsvSt" type="text" class="form-control flatpickr" value="${carRsvEd}" placeholder="픽업날짜를 선택해주세요">
											</div>
											</div>
										</div>
			
									</div>	
								</div>		
			
								<div class="col-xl-2 d-grid mt-xl-auto">
									<a  class="btn btn-lg btn-primary mb-0" href="#">조회하기</a>
								</div>
							</form>
						</div>
						<!-- One way tab END -->
	
						<!-- Round way tab END -->
						<div class="tab-pane fade" id="cab-round-way" role="tabpanel" aria-labelledby="cab-round-way-tab">
							<form class="row g-4 align-items-center">
								<div class="col-xl-12">
									<div class="row g-4">
										<!-- Leaving From -->
										<div class="col-md-6 col-xl-6">
											<div class="form-size-lg">
												<label class="form-label">Pickup</label>
												<select class="form-select js-choice" data-search-enabled="true" aria-label=".form-select-sm">
													<option value="">Select location</option>
													<option>New York</option>
													<option>Canada</option>
													<option>Paris</option>
												</select>
											</div>
										</div>
			
										<!-- Going To -->
										<div class="col-md-6 col-xl-6">
											<div class="form-size-lg">
												<label class="form-label">Drop</label>
												<select class="form-select js-choice" data-search-enabled="true" aria-label=".form-select-sm">
													<option value="">Select location</option>
													<option>Canada</option>
													<option>New York</option>
													<option>Paris</option>
												</select>
											</div>
										</div>
			
										<!-- Date -->
										<div class="col-md-6 col-xl-3">
											<label class="form-label">Pickup Date</label>
											<input type="text" class="form-control form-control-lg flatpickr" placeholder="Select date">
										</div>
										
										<!-- Time -->
										<div class="col-md-6 col-xl-3">
											<label class="form-label">Pickup time</label>
											<input type="text" class="form-control form-control-lg flatpickr" data-enableTime="true" data-noCalendar="true" placeholder="Select time">
										</div>

										<!-- Date -->
										<div class="col-md-6 col-xl-3">
											<label class="form-label">Return Date</label>
											<input type="text" class="form-control form-control-lg flatpickr" placeholder="Select date">
										</div>
										
										<!-- Time -->
										<div class="col-md-6 col-xl-3">
											<label class="form-label">Return time</label>
											<input type="text" class="form-control form-control-lg flatpickr" data-enableTime="true" data-noCalendar="true" placeholder="Select time">
										</div>
									</div>	
								</div>		
			
								<div class="col-xl-2">
									<a  class="btn btn-lg btn-primary w-100 mb-0" href="#">Update</a>
								</div>
							</form>
						</div>
						<!-- Round way tab END -->
					</div>
					<!-- Tab content END -->
				</div>
				<!-- Booking from END -->
			</div>
		</div>
	</div>
</section>
<!-- =======================
Search START -->
	
<!-- =======================
Titles START -->
<section class="pt-6">
	<div class="container position-relative">

		<!-- Title and button START -->
		<div class="row">
			<div class="col-12">
				<div class="d-sm-flex justify-content-sm-between align-items-center">
					<!-- Title -->
					<div class="mb-2 mb-sm-0">
						<h1 class="fs-3 mb-2">${carVOList.size()}개의 차량이 검색되었습니다</h1>
					</div>

					<!-- Offcanvas Button -->
					<button class="btn btn-primary-soft btn-primary-check d-xl-none mb-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
						<i class="fa-solid fa-sliders-h me-1"></i> Show filters
					</button>
				</div>	
			</div>
		</div>
		<!-- Title and button END -->

	</div>
</section>
<!-- =======================
Titles END -->

<!-- =======================
Cab list START -->
<section class="pt-0">
	<div class="container" data-sticky-container>
		<div class="row">

			<!-- Left sidebar START -->
			<aside class="col-xl-4 col-xxl-3">
				<div data-sticky data-margin-top="80" data-sticky-for="1199">
					<!-- Responsive offcanvas body START -->
					<div class="offcanvas-xl offcanvas-end" tabindex="-1" id="offcanvasSidebar" aria-labelledby="offcanvasSidebarLabel">
						<div class="offcanvas-header">
							<h5 class="offcanvas-title" id="offcanvasSidebarLabel">Advance Filters</h5>
							<button  type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
						</div>
						<!-- Offcanvas body -->
						<div class="offcanvas-body flex-column p-3 p-xl-0">
							<form class="rounded-3 shadow" action="/member/rntcar/searchfilter" method="get">
								<!-- Passenger capacity START -->
								<div class="card card-body rounded-0 rounded-top p-4 maxPp">
									<!-- Title -->
									<h6 class="mb-2">승차 정원</h6>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="4인승" id="maxPpType1" name="maxPpList">
										<label class="form-check-label" for="maxPpType1">4인승</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="5인승" id="maxPpType2" name="maxPpList">
										<label class="form-check-label" for="maxPpType2">5인승</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="7인승" id="maxPpType3" name="maxPpList">
										<label class="form-check-label" for="maxPpType3">7인승</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="9인승" id="maxPpType4" name="maxPpList">
										<label class="form-check-label" for="maxPpType4">9인승</label>
									</div>									
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="11인승" id="maxPpType5" name="maxPpList">
										<label class="form-check-label" for="maxPpType5">11인승</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="12인승" id="maxPpType6" name="maxPpList">
										<label class="form-check-label" for="maxPpType6">12인승</label>
									</div>
								</div>
								<!-- Passenger capacity END -->

								<hr class="my-0"> <!-- Divider -->

								<!-- Price START -->
								<div class="card card-body rounded-0 p-4">
									<!-- Title -->
									<h6 class="mb-2">시간당 가격</h6>
									<!-- Price group -->
									<!-- 슬라이더 -->
					              <div id="price-slider"></div>
					              <div class="d-flex mt-3">
					            	<input type="text" id="minPr" class="form-control" name="minPr" placeholder="0" style="width: 45%;" >
									 &nbsp;-&nbsp;<input type="text" id="maxPr" class="form-control" name="maxPr" placeholder="${maxCarPr}" style="width: 45%;" value="${maxPr}">
					              </div>
								</div>
								<!-- Price END -->

								<hr class="my-0"> <!-- Divider -->

								<!-- Car model START -->
								<div class="card card-body rounded-0 rounded-bottom p-4 carCode">
									<!-- Title -->
									<h6 class="mb-2">차량 유형</h6>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="경차/소형차" id="lauoverType1" name="carCodeList">
										<label class="form-check-label" for="lauoverType1">경차/소형차</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="중형차" id="lauoverType2" name="carCodeList">
										<label class="form-check-label" for="lauoverType2">중형차</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="SUV" id="lauoverType3" name="carCodeList">
										<label class="form-check-label" for="lauoverType3">SUV</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="대형차" id="lauoverType4" name="carCodeList">
										<label class="form-check-label" for="lauoverType4">대형차</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="승합차" id="lauoverType7" name="carCodeList">
										<label class="form-check-label" for="lauoverType7">승합차</label>
									</div>
								</div>
								<!-- Car model END -->
								
								<hr class="my-0"> <!-- Divider -->
								
								<!-- Passenger capacity START -->
								<div class="card card-body rounded-0 rounded-top p-4 fuelTy">
									<!-- Title -->
									<h6 class="mb-2">연료</h6>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="전기차" id="popolarType1" name="fuelTyList">
										<label class="form-check-label" for="popolarType1">전기차</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="LPG" id="popolarType2" name="fuelTyList">
										<label class="form-check-label" for="popolarType2">LPG</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="휘발유" id="popolarType3" name="fuelTyList">
										<label class="form-check-label" for="popolarType3">휘발유</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="경유" id="popolarType4" name="fuelTyList">
										<label class="form-check-label" for="popolarType4">경유</label>
									</div>
								</div>
								<!-- Passenger capacity END -->
								
								<!-- Buttons -->
								<div class="d-flex justify-content-between p-2 p-xl-0 mt-xl-4">
									<button type="button" id="filterReset" class="btn btn-link p-0 mb-0 col-6">조건 초기화</button>
									<button type="submit" id="btnFilter" class="btn btn-primary mb-0 col-6">검색하기</button>
									
								</div>
								<input type="hidden" name="order" ></input>
							</form><!-- Form End -->
						</div>

					
					</div>
					<!-- Responsive offcanvas body END -->
				</div> 	
			</aside>
			<!-- Left sidebar END -->

			<!-- Main content START -->
			<div class="col-xl-8 col-xxl-9">
				<div class="vstack gap-4">
					<!-- Cab item START -->
					<c:forEach var="carMap" items="${carMap}" varStatus="stat">
					<div class="card border p-4">
						<!-- Card body START -->
						<div class="card-body p-0">
							<div class="row g-2 g-sm-4 mb-4">
								<!-- Card image -->
								<div class="col-md-4 col-xl-3">
									<div class="bg-light rounded-3  carImgDiv">
										<img class="carImg" src="${carMap.value[0].carImg}" alt="">
									</div>
								</div>

								<!-- Card title and rating -->
								<div class="col-sm-6 col-md-4 col-xl-6">
									<h4 class="card-title mb-2">${carMap.key}</h4>
									<!-- Nav divider -->
									<ul class="nav nav-divider h6 fw-normal mb-2">
										<li class="nav-item">${carMap.value[0].carCode}</li>
										<li class="nav-item">${carMap.value[0].maxPp}</li>
									</ul> 
									
									<!-- Rating Star -->
									<ul class="list-inline mb-0">
										<li class="list-inline-item h6 fw-normal me-1 mb-0">${carMap.value[0].avgSt}</li>
										<c:set var="avgStInt" value="${fn:split(carMap.value[0].avgSt, '.')[0]}" />
										<c:set var="avgStDeci" value="${carMap.value[0].avgSt-avgStInt}"/>
										
										<c:if test="${avgStInt>=1}">
											<c:forEach begin="1" end="${avgStInt}">
										   		<li class="list-inline-item me-0"><i class="fa-solid fa-star text-warning"></i></li>
											</c:forEach>
										</c:if>
										<c:if test="${avgStDeci >= 0.5 && avgStDeci<1}">
										    <li class="list-inline-item me-0"><i class="fa-solid fa-star-half-alt text-warning"></i></li>
										</c:if>
										<c:if test="${avgStDeci < 0.5  && avgStDeci>0}">
									   		<li class="list-inline-item me-0"><i class="fa-regular fa-star text-warning"></i></li>
										</c:if>
										<c:if test="${carMap.value[0].avgSt==0}">
									   		<li class="list-inline-item me-0"><i class="fa-regular fa-star text-warning"></i></li>
										</c:if>
									</ul>
								</div>

							</div> <!-- Row END -->
						</div>
						<!-- Card body END -->

						<!-- Card footer START -->
						<div class="card-footer border-top p-0 pt-3">
							<c:forEach var="car" items="${carMap.value}">
							
							<div class="row mb-2">
								<!-- List -->
								<div class="col-md-7">
									<ul class="list-group list-group-borderless mb-0">
										<li class="list-group-item d-flex pb-0 mb-0">
											<c:choose>
												<c:when test="${car.topAdStatus eq 'Y'}">
													<span class="h6 fw-normal mb-0"><i class="bi bi-check-circle me-2"></i>
														<span class="h6 text-success">[${car.busiNm}]</span> ${car.carYr}년식, ${car.fuelTy} <a class="ml-3 text-success"><i class="bi bi-patch-check-fill me-2"></i>원더웨이 추천!</a></span>
															
													
												</c:when>
												<c:otherwise>
													<span class="h6 fw-normal mb-0"><i class="bi bi-check-circle me-2"></i><span class="h6">[${car.busiNm}]</span> ${car.carYr}년식, ${car.fuelTy}</span>
												</c:otherwise>
											</c:choose>
										
										</li>
									</ul>
								</div>

								<!-- Button -->
								<div class="col-5 d-flex justify-content-end align-items-center">
									<!-- Price -->
									<fmt:formatNumber var="totalFee" value="${car.carFee*totalHours}" pattern="#,###,###" />
									<span class="h5 mb-0 mx-3">${totalFee }원</span>
									<a href="/member/rntcar/detail/${car.carNum}" class="btn btn-primary mb-0">예약하기</a>
								</div>

							</div>
							</c:forEach>
						</div>
						<!-- card footer END -->
					</div>
					 </c:forEach>
					<!-- Cab item END -->

				</div>
			</div>
			<!-- Main content END -->

		</div> <!-- Row END -->

	</div>
</section>
<!-- =======================
Cab list END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<script src="/resources/booking/assets/vendor/nouislider/nouislider.min.js"></script>


</body>
</html>