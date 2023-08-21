<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/cupertino/jquery-ui.css">
<%
  HttpServletRequest requestFM = (HttpServletRequest) pageContext.getRequest();
  Principal principal = requestFM.getUserPrincipal();
  String username = (principal != null) ? principal.getName() : "Guest";
%>
<c:set var="username" value="<%= username%>"/>
<head>
	<title>Wonderway-숙소 검색 결과</title>
<style>
.ui-slider-handle {
   border-radius: 50%;
   background-color:#5143d9 !important;
}
.ui-slider-range {
    background-color: #5143d9 !important; 
  }
  
/*링크 복사 토스트창  */
#toastCopyLink{
  position: fixed;
  top: 30%;
  left: 50%;
  transform: translateX(-50%);
  width:20rem;
  text-align:center;
  background-color:#F5F5F6;
  opacity: 0;
  transition: opacity 0.5s ease;
}
#toastCopyLink.show {
  opacity: 1;
}


/*리본설정  */
.ribbon {
  width: 130px;
  height: 130px;
  overflow: hidden;
  position: absolute;
}
.ribbon::before,
.ribbon::after {
  position: absolute;
  z-index: -1;
  content: '';
  display: block;
  border: 4px solid #0C7864;
}
.ribbon span {
  position: absolute;
  display: block;
  width: 225px;
  padding: 10px 0;
  background-color: #0cbc87;
  box-shadow: 0 5px 10px rgba(0,0,0,.1);
  color: #fff;
  text-shadow: 0 1px 1px rgba(0,0,0,.2);
  text-transform: uppercase;
  text-align: center;
}
/* top left*/
.ribbon-top-left {
  top: -5px;
  left: -5px;
}
.ribbon-top-left::before,
.ribbon-top-left::after {
/*   border-top-color: transparent; */
/*   border-left-color: transparent; */
}
.ribbon-top-left::before {
  top: 0;
  right: 0;
}
.ribbon-top-left::after {
  bottom: 0;
  left: 0;
}
.ribbon-top-left span {
  right: -25px;
  top: 30px;
  transform: rotate(-45deg);
}
</style>
<script type="text/javascript">


$(function() {
	//캘린더 설정
	flatpickr(".flatpickr", {
		minDate: "today",
		dateFormat:"y/m/d",
		defaultDate: ["${rsvSt}","${rsvEd}"],
		local: "ko"
	});
	
	
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
	  max: ${maxRmPr},
	  values: [0,${maxPr}],
	  step: 10000,
	  slide: function(event, ui) {
	    var minPr= ui.values[0];
	    var maxPr = ui.values[1];
	    $("#minPr").val(minPr);
	    $("#maxPr").val(maxPr);
	  }
	});

	  
	//정렬기능
	$("#order").on("change",function() {
		var selectedVal=$(this).val();
		
		if(selectedVal=="byStar"){
            $('input[name="order"]').val("byStar");
			$("form[name='frm01']").submit();

		}
		
		if(selectedVal=="byAll"){
            $('input[name="order"]').val("byAll");
			$("form[name='frm01']").submit();
		}
		
		if(selectedVal=="by6M"){
			$("form[name='frm01']").submit();
		}
	});		
	  
	
	//필터 검색 후 조건 유지
	$(".acmType").find("input[type='checkbox']").each(function(){
		var acmTypeList = '${acmTypeList}';
		
		if (acmTypeList && acmTypeList.includes($(this).val())) {
		    $(this).prop("checked", true);
		}
	});
	
	$("input[type='radio']").each(function(){
		var star = '${star}'
		
		if (star && $(this).val() == star) {
		    $(this).prop("checked", true);
		}
	});
	
	$(".cvfc").find("input[type='checkbox']").each(function(){
		var cvfcList = '${cvfcList}';
		
		if (cvfcList && cvfcList.includes($(this).val())) {
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
	
	
	//카카오톡 공유하기
	$(".kakaoShare").on("click",function() {
		Kakao.init('92113e51809f8d4ec0f9375fd165983d');
		Kakao.isInitialized();
		Kakao.Share.sendCustom({
			templateId: ${95735},
			templateArgs: {
			    title: '${busiVO.busiNm}',
			    description: '${busiVO.busiLoc}',
			    busiId:$(this).attr("data-value"),
		  	},
		});
	});
		
		
	//URL 복사
	$(".copyLink").on("click",function(){
		var url = "http://localhost/member/acm/detail/"+$(this).attr("data-value")
		var textarea = document.createElement("textarea");
		
		document.body.appendChild(textarea);
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		
		$('#toastCopyLink').toast('show');
		setTimeout(function() {
		    $('#toastCopyLink').toast('hide');
		}, 2000);
	});
	
});


function fnLike(element){
	if (element.getAttribute('data-example') == 'on'){
		console.log("빨간불일때 delete할꺼임" + element.getAttribute('data-example'));
		fnDeleteLike(element);
	}else{
		console.log("꺼진불일때 insert할꺼임" + element.getAttribute('data-example'));
		fnInsertLike(element);
	}
}





//찜하기

function fnInsertLike(element){
	var busiId = element.id;
	var memId = "<%=username%>";
	var param = { "busiId" : busiId,
				  "memId" : memId};
	
	console.log("param",param);
	$.ajax({
		url : '/member/acm/insertLikeAjax',
		method : 'POST',
		data : JSON.stringify(param),
		dataType : "json",
		contentType : "application/json; charset=utf-8",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}",
					"${_csrf.token}");
		},
		success : function(response) {
			// 요청이 성공한 경우 처리할 콜백 함수
			console.log(response);
			alert("찜목록에 들어갔습니다.")
			history.go(0);
			element.setAttribute('data-example', 'on');
		},
		
		error : function(xhr, status, error) {
			console.log('Error:', error);
			console.log('Status:', status);
			console.log('Response Text:', xhr.responseText);
			console.log('Status Text:', xhr.statusText);
		}
	});
}
//찜 안하기
function fnDeleteLike(element){
	
	var busiId = element.id;
	var memId = "<%=username%>";
	var param = { "busiId" : busiId,
				  "memId" : memId};
	$.ajax({
		url : '/member/acm/deleteLikeAjax',
		method : 'POST',
		data : JSON.stringify(param),
		dataType : "json",
		contentType : "application/json; charset=utf-8",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}",
					"${_csrf.token}");
		},
		success : function(response) {
			// 요청이 성공한 경우 처리할 콜백 함수
			console.log(response);
			alert("찜하기를 해제했습니다.")
			history.go(0);
			element.setAttribute('data-example', 'off');
		},
		error : function(xhr, status, error) {
			console.log('Error:', error);
			console.log('Status:', status);
			console.log('Response Text:', xhr.responseText);
			console.log('Status Text:', xhr.statusText);
		}
	});
}




</script>
</head>

<body>
<form name="frm01" action="/member/acm/search/result"  method="get">
	<input type="hidden" name="order" value="">
	<sec:csrfInput/>
</form>
<!-- **************** MAIN CONTENT START **************** -->
<main>
<!-- =======================
Main Banner START -->
<section class="pt-0 pt-lg-2 pb-4">
	<div class="container">
		<!-- Background image -->
		<div class="rounded-3 p-3 p-sm-5" style="background-image: url(/resources/booking/assets/images/bg/05.jpg); background-position: center center; background-repeat: no-repeat; background-size: cover;">
			<!-- Banner title -->
			<div class="row my-2 my-xl-5"> 
				<div class="col-md-12 mx-auto"> 
					<h2 class="text-center text-white">${busiLoc == '' ? '전국' : busiLoc}에 ${totalAcm}개의 숙소를 만나보세요</h2>
				</div>
			</div>

			
			<!-- Booking from START -->
			<form class="bg-mode shadow rounded-3 position-relative p-4 pe-md-5 pb-5 pb-md-4 mb-4">
				<div class="row g-4 align-items-center">
					<!-- Location -->
					<div class="col-lg-4">
						<div class="form-control-border form-control-transparent form-fs-md d-flex">
							<!-- Icon -->
							<i class="bi bi-geo-alt fs-3 me-2 mt-2"></i>
							<!-- Select input -->
							<div class="flex-grow-1">
								<label class="form-label">숙소 위치</label>
								<select class="form-select js-choice" data-search-enabled="true" >
									<option value="">숙소 위치</option>
									<option selected>${busiLoc}</option>
									<option>서울</option>
									<option>대전</option>
								</select>
							</div>
						</div>
					</div>

					<!-- Check in -->
					<div class="col-lg-4">
						<div class="d-flex">
							<!-- Icon -->
							<i class="bi bi-calendar fs-3 me-2 mt-2"></i>
							<!-- Date input -->
							<div class="form-control-border form-control-transparent form-fs-md">
								<label class="form-label">체크인-아웃 날짜</label>
								<input type="text" class="form-control flatpickr" data-mode="range" placeholder="얼마나 머무시나요?" >
							</div>
						</div>
					</div>

					<!-- Guest -->
					<div class="col-lg-4">
						<div class="form-control-border form-control-transparent form-fs-md d-flex">
							<!-- Icon -->
							<i class="bi bi-person fs-3 me-2 mt-2"></i>
							<!-- Dropdown input -->
							<div class="w-100">
								<label class="form-label">인원&방 개수</label>
								<div class="dropdown guest-selector me-2">
									<input type="text" class="form-guest-selector form-control selection-result" value="${guestRoomNum}" id="dropdownGuest" data-bs-auto-close="outside" data-bs-toggle="dropdown">
								
									<!-- dropdown items -->
									<ul class="dropdown-menu guest-selector-dropdown" aria-labelledby="dropdownGuest">
										<!-- Adult -->
										<li class="d-flex justify-content-between">
											<div>
												<h6 class="mb-0">Adults</h6>
												<small>Ages 13 or above</small>
											</div>

											<div class="hstack gap-1 align-items-center">
												<button type="button" class="btn btn-link adult-remove p-0 mb-0"><i class="bi bi-dash-circle fs-5 fa-fw"></i></button>
												<h6 class="guest-selector-count mb-0 adults">2</h6>
												<button type="button" class="btn btn-link adult-add p-0 mb-0"><i class="bi bi-plus-circle fs-5 fa-fw"></i></button>
											</div>
										</li>

										<!-- Divider -->
										<li class="dropdown-divider"></li>


										<!-- Rooms -->
										<li class="d-flex justify-content-between">
											<div>
												<h6 class="mb-0">Rooms</h6>
												<small>Max room 8</small>
											</div>

											<div class="hstack gap-1 align-items-center">
												<button type="button" class="btn btn-link room-remove p-0 mb-0" ><i class="bi bi-dash-circle fs-5 fa-fw"></i></button>
												<h6 class="guest-selector-count mb-0 rooms">1</h6>
												<button type="button" class="btn btn-link room-add p-0 mb-0" ><i class="bi bi-plus-circle fs-5 fa-fw"></i></button>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Button -->
				<div class="btn-position-md-middle">
					<a  class="icon-lg btn btn-round btn-primary mb-0" href="#"><i class="bi bi-search fa-fw"></i></a>
				</div>
			</form>
			<!-- Booking from END -->
			
			
		</div>
	</div>
</section>
<!-- =======================
Main Banner END -->
<!-- =======================
Hotel list START -->
<section class="pt-0 pb-0 mt-4">
	<div class="container position-relative">

		<!--상위 광고 리스트 -->
		<div class="row g-4 mb-4 rounded-3" style="background-color:#F5F5FF;">
			<h4 class="text-uppercase">💜  원더웨이 초이스</h4>
			<c:forEach var="adBusiVO" items="${TopAdBusiVOList}" varStatus="stat">
			<!-- Card item START -->
			<div class="col-md-6 col-xl-4 mb-3 mt-2">
				<div class="card shadow p-2 pb-0 h-100">
					<!-- Image -->
					<img src="/resources/upload/busi${adBusiVO.busiImg}" class="rounded-2" alt="Card image">

					<!-- Card body START -->
					<div class="card-body px-3 pb-0">
						<!-- Rating and cart -->
						<div class="d-flex justify-content-between mb-3">
							<a href="#" class="badge bg-dark text-white"><i class="bi fa-fw bi-star-fill me-2 text-warning"></i>${adBusiVO.avgSt}</a>
							<!-- <a href="#" class="h6 mb-0 z-index-2"><i class="bi fa-fw bi-bookmark-fill text-danger"></i></a> -->
						</div>

						<!-- Title -->
						<h5 class="card-title"><a href="hotel-detail.html">${adBusiVO.busiNm}</a></h5>
						<small><i class="bi bi-geo-alt me-2"></i>${adBusiVO.busiLoc}</small>

						<!-- List -->
						<ul class="nav nav-divider mb-2 mb-sm-3">
							<li class="nav-item">${adBusiVO.cvfcVOList[0].cvfcNm}</li>
							<li class="nav-item">${adBusiVO.cvfcVOList[1].cvfcNm}</li>
							<li class="nav-item">${adBusiVO.cvfcVOList[2].cvfcNm}</li>
							<li class="nav-item">${adBusiVO.cvfcVOList[3].cvfcNm}</li>
						</ul>
					</div>
<!-- 					Card body END
 -->
					<!-- Card footer START -->
					<div class="card-footer pt-0">
<!-- 						Price and Button
 -->						<div class="d-sm-flex justify-content-sm-between align-items-center">
							<%-- <!-- Price -->
							<div class="d-flex align-items-center">
								<fmt:formatNumber var="cheapRmPr" value="${adBusiVO.rmVOList[0].rmPr}" pattern="#,###,###"/>
								<h5 class="fw-normal text-success mb-0 me-1">${cheapRmPr}</h5>
								<span class="mb-0 me-2">/1 박</span>
							</div> --%>
							<!-- Button -->
							<div class="mt-2 mt-sm-0">
								<a href="/member/acm/detail/${adBusiVO.busiId}" class="btn btn-sm btn-primary-soft mb-0 w-100">상세보기<i class="bi bi-arrow-right ms-2"></i></a>    
							</div>                  
						</div>
					</div>
				</div>
			</div>
			<!-- 상위 광고 리스트-->
			</c:forEach>
		</div>
	</div>
</section>

<section class="pt-0">
	<div class="container">
	
	
	
		<!-- Tabs and alert START -->
		<div class="row mb-4">
			<div class="col-12">

				<!-- Buttons -->
				<div class="hstack gap-3 justify-content-between justify-content-md-end">
					<!-- Filter offcanvas button -->
					<button class="btn btn-primary-soft btn-primary-check mb-0 d-xl-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
						<i class="fa-solid fa-sliders-h me-1"></i> Show filters
					</button>
						<!--정렬 기능  -->
						<div class="col-sm-2">
							<form class="form-control-bg-light">
								<select id="order" class="form-select form-select-sm js-choice border-0">
									<option value="by6M" <c:if test="${order == 'by6M'}">selected="selected"</c:if>>최근 인기순</option>
									<option value="byAll" <c:if test="${order == 'byAll'}">selected="selected"</c:if>>역대 인기순</option>
									<option value="byStar" <c:if test="${order == 'byStar'}">selected="selected"</c:if>>별점순</option>
								</select>
							</form>
						</div>
				</div>
			</div>
		</div>
		<!-- Tabs and alert END -->
		
		

		<div class="row">
			<!-- 검색필터 START -->
			<aside class="col-xl-4 col-xxl-3">
				<!-- Responsive offcanvas body START -->
				<div class="offcanvas-xl offcanvas-end" tabindex="-1" id="offcanvasSidebar" aria-labelledby="offcanvasSidebarLabel">
					<div class="offcanvas-header">
						<h5 class="offcanvas-title" id="offcanvasSidebarLabel">Advance Filters</h5>
						<button  type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
					</div>
					<form id="filter" class="rounded-3 shadow" action="/member/acm/searchfilter" method="get">
					<div class="offcanvas-body flex-column p-3 p-xl-0" >
							<!-- 숙소 종류 START -->
							<div class="card card-body rounded-0 rounded-top p-4" >
								<!-- Title -->
								<h6 class="mb-2">숙소 타입</h6>
								<!-- Hotel Type group -->
								<div class="col-12 acmType">
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="A01" id="acmType1" name="acmTypeList">
										<label class="form-check-label" for="acmType1">호텔</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="A02" id="acmType2" name="acmTypeList">
										<label class="form-check-label" for="acmType2">모텔</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="A05" id="acmType3" name="acmTypeList">
										<label class="form-check-label" for="acmType3">펜션</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="A03" id="acmType4" name="acmTypeList">
										<label class="form-check-label" for="acmType4">리조트</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="A04" id="acmType5" name="acmTypeList">
										<label class="form-check-label" for="acmType5">게스트하우스</label>
									</div>
									
								</div>
							</div>
							<!--숙소 종류 END -->

							<hr class="my-0"> <!-- Divider -->

							<!-- 가격범위 START -->
							<div class="card card-body rounded-0 p-4">
								<!-- Title -->
								<h6 class="mb-2">1박 기준 방 가격</h6>
								<!-- Price range group -->
								<div>
					              <!-- 슬라이더 -->
					              <div id="price-slider"></div>
					              <div class="d-flex mt-3">
					            	<input type="text" id="minPr" class="form-control" name="minPr" placeholder="0" style="width: 45%;" >
									 &nbsp;-&nbsp;<input type="text" id="maxPr" class="form-control" value="${maxPr}" name="maxPr" placeholder="${maxRmPr}" style="width: 45%;">
					              </div>
					              
					            </div>
					            
					            
							</div>
							<!-- Price range END -->

							<hr class="my-0"> <!-- Divider -->


							<!-- 숙소 별점 START -->
							<div class="card card-body rounded-0 p-4">
								<!-- Title -->
								<h6 class="mb-2">후기 별점</h6>
								<!-- Customer Rating group -->
								<ul class="list-inline mb-0 g-3">
									<!-- Item -->
									<li class="list-inline-item mb-0">
										<input type="radio" class="btn-check" id="btn-check-c1" name="star" value="3">
										<label class="btn btn-sm btn-light btn-primary-soft-check" for="btn-check-c1"><i class="bi bi-star-fill">3+</i></label>
									</li>
									<!-- Item -->
									<li class="list-inline-item mb-0">
										<input type="radio" class="btn-check" id="btn-check-c2" name="star" value="3.5">
										<label class="btn btn-sm btn-light btn-primary-soft-check" for="btn-check-c2"><i class="bi bi-star-fill">3.5+</i></label>
									</li>
									<!-- Item -->
									<li class="list-inline-item mb-0">
										<input type="radio" class="btn-check" id="btn-check-c3" name="star" value="4">
										<label class="btn btn-sm btn-light btn-primary-soft-check" for="btn-check-c3"><i class="bi bi-star-fill">4+</i></label>
									</li>
									<!-- Item -->
									<li class="list-inline-item mb-0">
										<input type="radio" class="btn-check" id="btn-check-c4" name="star" value="4.5">
										<label class="btn btn-sm btn-light btn-primary-soft-check" for="btn-check-c4"><i class="bi bi-star-fill">4.5+</i></label>
									</li>
								</ul>
							</div>
							<!-- Customer Rating END -->

							<hr class="my-0"> <!-- Divider -->

							<!-- 편의시설 START -->
							<div class="card card-body rounded-0 rounded-bottom p-4">
								<!-- Title -->
								<h6 class="mb-2">편의시설 및 서비스</h6>
								<!-- Amenities group -->
								<div class="col-12 cvfc">
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="CVFC_A01" id="cvfc_a01" name="cvfcList">
										<label class="form-check-label" for="cvfc_a01">아동 동반가능</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="CVFC_A02" id="cvfc_a02" name="cvfcList">
										<label class="form-check-label" for="cvfc_a02">반려동물 동반가능</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="CVFC_A03" id="cvfc_a03" name="cvfcList">
										<label class="form-check-label" for="cvfc_a03">장애인 친화적</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="CVFC_C01" id="cvfc_c01" name="cvfcList">
										<label class="form-check-label" for="cvfc_c01">CCTV</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="CVFC_C02" id="cvfc_c02" name="cvfcList">
										<label class="form-check-label" for="cvfc_c0">24시간 경비</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="CVFC_C04" id="cvfc_c04" name="cvfcList">
										<label class="form-check-label" for="cvfc_c04">일일 청소</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="CVFC_F01" id="cvfc_f01" name="cvfcList">
										<label class="form-check-label" for="cvfc_f01">주차 가능</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="CVFC_F02" id="cvfc_f02" name="cvfcList">
										<label class="form-check-label" for="cvfc_f02">조식 운영</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="CVFC_F03" id="cvfc_f03" name="cvfcList">
										<label class="form-check-label" for="cvfc_f03">와이파이</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="CVFC_F04" id="cvfc_f04" name="cvfcList">
										<label class="form-check-label" for="cvfc_f04">수영장</label>
									</div>
									
									<!-- Collapse body -->
									<div class="multi-collapse collapse" id="cvfcCollapes">
										<!-- Checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="CVFC_F05" id="cvfc_f05" name="cvfcList">
											<label class="form-check-label" for="cvfc_f05">회의시설</label>
										</div>
										<!-- Checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="CVFC_F08" id="cvfc_f08" name="cvfcList">
											<label class="form-check-label" for="cvfc_f08">스파/사우나</label>
										</div>
										<!-- Checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="CVFC_F09" id="cvfc_f09" name="cvfcList">
											<label class="form-check-label" for="cvfc_f09">흡연시설</label>
										</div>
										<!-- Checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="CVFC_F11" id="cvfc_f11" name="cvfcList">
											<label class="form-check-label" for="cvfc_f11">커피숍</label>
										</div>
										<!-- Checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="CVFC_F12" id="cvfc_f12" name="cvfcList">
											<label class="form-check-label" for="cvfc_f12">레스토랑</label>
										</div>
										<!-- Checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="CVFC_F13" id="cvfc_f13" name="cvfcList">
											<label class="form-check-label" for="cvfc_f13">세탁 서비스</label>
										</div>
										<!-- Checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="CVFC_F14" id="cvfc_f14" name="cvfcList">
											<label class="form-check-label" for="cvfc_f14">수화물 보관</label>
										</div>
										<!-- Checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="CVFC_R04" id="cvfc_r04" name="cvfcList">
											<label class="form-check-label" for="cvfc_r04">화재감지기</label>
										</div>
									</div>
									<!-- Collapse button -->
									<a class="p-0 mb-0 mt-2 btn-more d-flex align-items-center collapsed" data-bs-toggle="collapse" href="#cvfcCollapes" role="button" aria-expanded="false" aria-controls="cvfcCollapes">
										<span class="see-more ms-1">더 보기</span><span class="see-less ms-1">축소하기</span><i class="fa-solid fa-angle-down ms-2"></i>
									</a>
								</div>
							</div>
							<!-- Amenities END -->
					</div>
					<!-- Buttons -->
					<div class="d-flex justify-content-between p-2 p-xl-0 mt-xl-4">
						<button type="button" id="filterReset" class="btn btn-link p-0 mb-0 col-6">조건 초기화</button>
						<button type="submit" id="btnFilter" class="btn btn-primary mb-0 col-6">검색하기</button>
						
					</div>
					<input type="hidden" name="order" ></input>
					</form><!-- Form End -->
				</div>
				<!-- Responsive offcanvas body END -->
			</aside>
			<!-- 검색 필터 END -->

			<!-- Main content START -->
			<div class="col-xl-8 col-xxl-9">
				<div class="vstack gap-4">

					<c:forEach var="busiVO" items="${busiVOList.content}" varStatus="stat">
					
					<!-- 객실 카드 START -->
					<div class="card shadow p-2">
						 
						<div class="row g-0">
							<!-- Card img -->
							<div class="col-md-5 position-relative">
								<c:if test="${busiVO.adStatus eq 'Y'}">
								<div class="ribbon ribbon-fold ribbon-top-left z-index-1">
								 	<span>&nbsp;&nbsp;&nbsp;원더웨이 추천</span>
								 </div>
								<!-- 광고 받은거는 뱃지 표출 -->
									<div class="position-absolute top-0 start-0 z-index-1 m-3">
										
<!-- 										<div class="badge text-bg-success">원더웨이 추천</div> -->
									</div>
								</c:if>
								
								
								<!-- Slider START -->
								<div class="tiny-slider arrow-round arrow-xs arrow-dark overflow-hidden rounded-2">
									<div class="tiny-slider-inner" data-autoplay="false" data-arrow="true" data-dots="false" data-items="1">
										<!-- Image item -->
										<div><img src="/resources/upload/busi${busiVO.busiImg}" alt="Card image"></div>

									</div>
								</div>
								<!-- Slider END -->
							</div>

							<!-- Card body -->
							<div class="col-md-7">
								<div class="card-body py-md-2 d-flex flex-column h-100 position-relative">

									<!-- Rating and buttons -->
									<div class="d-flex justify-content-between align-items-center">
										<ul class="list-inline mb-0">
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i>&nbsp;${busiVO.avgSt}</li>
										</ul>

										<ul class="list-inline mb-0 z-index-2">
											<!-- Heart icon -->
											<li class="list-inline-item">
												<c:forEach var="wishVO" items="${myLikeList}">
													<c:if test="${wishVO.busiId eq busiVO.busiId}">
												        <c:set var="redLike" value="btn-danger" />
												    </c:if>
												</c:forEach>
												<a id="${busiVO.busiId}" onclick="fnLike(this)" data-example="off" class="btn btn-sm btn-round
													<c:choose>
														<c:when test="${redLike eq 'btn-danger'}">
															btn-danger
															<c:set var="redLike" value="no" />
														</c:when>
														<c:otherwise>
															btn-light
														</c:otherwise>
													</c:choose>
												"><i class="fa-solid fa-fw fa-heart"></i></a>
											</li>
											<!-- Share icon -->
											<li class="list-inline-item dropdown">
												<!-- Share button -->
												<a href="#" class="btn btn-sm btn-round btn-light" role="button" id="dropdownShare" data-bs-toggle="dropdown" aria-expanded="false">
													<i class="fa-solid fa-fw fa-share-alt"></i>
												</a>
												<!-- dropdown button -->
												<ul class="dropdown-menu dropdown-menu-end min-w-auto shadow rounded" aria-labelledby="dropdownShare">
													<li><a class="dropdown-item kakaoShare" data-value="${busiVO.busiId}"><i class="fa fa-comment me-2"></i>카카오톡 공유하기</a></li>
													<li><a class="copyLink dropdown-item" data-value="${busiVO.busiId}"><i class="fa-solid fa-copy me-2"></i>링크 복사하기</a></li>
												</ul>
											</li>
										</ul>
									</div>

									<!-- 숙소명 -->
									<h5 class="card-title mb-1"><a href="/member/acm/detail/${busiVO.busiId}">${busiVO.busiNm}</a></h5>
									<small><i class="bi bi-geo-alt me-2"></i>${busiVO.busiLoc}</small>
									<!-- Amenities -->
									<ul class="nav nav-divider mt-3">
										<li class="nav-item">${busiVO.cvfcVOList[0].cvfcNm}</li>
										<li class="nav-item">${busiVO.cvfcVOList[1].cvfcNm}</li>
										<li class="nav-item">${busiVO.cvfcVOList[2].cvfcNm}</li>
										<li class="nav-item">${busiVO.cvfcVOList[3].cvfcNm}</li>
										<li class="nav-item">${busiVO.cvfcVOList[4].cvfcNm}</li>
										<li class="nav-item">${busiVO.cvfcVOList[5].cvfcNm}</li>
										<li class="nav-item"><a href="/member/acm/detail/${busiVO.busiId}#tab2" class="mb-0 text-primary">더보기+</a></li>
									</ul>

									<!--광고 받은 업체는 추천 표시 -->
									<c:if test="${busiVO.adStatus eq 'Y'}">
									<ul class="list-group list-group-borderless small mb-0 mt-2">
										<li class="list-group-item d-flex text-success p-0">
											<i class="bi bi-patch-check-fill me-2"></i>원더웨이 추천!
										</li>
									</ul>
									</c:if>
									
									
									<!-- 가격 예약버튼 -->
									<div class="d-sm-flex justify-content-sm-between align-items-center mt-3 mt-md-auto">
										<!-- Button -->
										<div class="d-flex align-items-center">
											<!--조회된 방 리스트 중 최저가로 노출  -->
											<fmt:formatNumber var="cheapRmPr" value="${busiVO.rmVOList[0].rmPr}" pattern="#,###,###"/>
											<h5 class="fw-bold mb-0 me-1">${cheapRmPr}원</h5>
											<span class="mb-0 me-2">/1박</span>
										</div>
										<!-- Price -->
										<div class="mt-3 mt-sm-0">
											<a href="/member/acm/detail/${busiVO.busiId}" class="btn btn-sm btn-primary mb-0 w-100">숙소 상세보기</a>    
										</div>                  
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->
					</c:forEach>

					<!-- 페이지 번호 -->
					<nav class="d-flex justify-content-center" aria-label="navigation">
						<ul class="pagination pagination-primary-soft d-inline-block d-md-flex rounded mb-0 ">
							
							<li class="page-item mb-0 <c:if test='${busiVOList.startPage < 10}'>disabled</c:if>"><a class="page-link" href="#" tabindex="-1"><i class="fa-solid fa-angle-left"></i></a></li>
							<c:forEach var="pNo" begin="${busiVOList.startPage}" end="${busiVOList.endPage}">
								<li class="page-item mb-0
									<c:if test='${busiVOList.currentPage eq pNo}'>active</c:if>
								">
									<a class="page-link" href="/member/acm/search/result?currentPage=${pNo}"
									aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0"
									class="page-link">${pNo}</a></li>
								</c:forEach>
							
							<li class="page-item mb-0 <c:if test='${busiVOList.endPage == busiVOList.totalPages}'>disabled</c:if>"><a class="page-link" href="#"><i class="fa-solid fa-angle-right"></i></a></li>
						</ul>
					</nav>

				</div>
			</div>
			<!-- Main content END -->
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Hotel list END -->

</main>

<!--링크 복사 토스트 START  -->
<div id="toastCopyLink" class="toast"  data-autohide="false">
    <div class="toast-body">
		URL이 복사 되었습니다.
    </div>
</div>
<!--링크 복사 토스트 END  -->
</body>
</html>