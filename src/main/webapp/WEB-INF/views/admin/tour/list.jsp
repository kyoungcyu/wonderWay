<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description"
	content="Booking - Multipurpose Online Booking Theme">


<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/choices/css/choices.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="/resources/booking/assets/vendor/choices/js/choices.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5fb237d518aee57b890f9ca058e96542"></script>

<script type="text/javascript">
	$(function() {
		//createMap("test", 33.4328331325, 126.9278590339)
		var lati = 0;
		var longi = 0;
		var tourNm = "";
		
		
		$(".tourDetail").on("click", function() {
			let tourId = $(this).data("tourId");
			//tourId : S0875
			console.log("tourId : " + tourId);
// 			$("#detailModal").html();
			$.ajax({
				url : "/admin/tour/tourDetailPost",
				data : {
					"tourId" : tourId
				},
				type : "post",
				dataType : "json",
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(success) {
					//success : {"tourId":"S0875","tourNm":"대덕인재개발원","tourDc":"대덕인재개발원","lati":"36.325033987773594","longi":"127.408932253974"
						//,"attachId":"S0875","tourCode":"휴양관광지","tourLoc":"대전,충청",
						//"imgPath":"/2023/07/12/32e10488-541b-4f99-aade-6b0af0dcafca_P1236.jpg","picture":null,"attachVOList":null}
					console.log("success : " + JSON.stringify(success));
					if(success != null) {
						$("#tourNm").text(success.tourNm);
						$("#tourLoc").text(success.tourLoc);
						$("#tourCode").text(success.tourCode);
						$("#tourDc").html(success.tourDc);
						$("#tourImg").attr("src", "/resources/upload/tourImage"+success.imgPath);
						$("#tourDel").data("tourId", success.tourId);
						
						tourNm = success.tourNm; // 인포 윈도우에 표시할 여행지 이름
						lati = success.lati;	 // 여행지 위도 
						longi = success.longi;	 // 여행지 경도
						
// 						createMap(tourNm, lati, longi);
// 						map.relayout();
// 						toggleFullScreen();
// 						alert("tt");
						$("#map").empty();
						
						setTimeout(() => {
							console.log("position : ", lati, longi);
							
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = { 
							        center: new kakao.maps.LatLng(lati, longi), // 지도의 중심좌표
							        level: 2 // 지도의 확대 레벨
							    };
							
							var map = new kakao.maps.Map(mapContainer, mapOption);
							
							// 마커가 표시될 위치입니다 
							var markerPosition  = new kakao.maps.LatLng(lati, longi); 
							
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
							    position: markerPosition
							});
							
							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
							
							var iwContent = '<div style="margin-left:17px; margin-top:2px; text-align:"center;"><h6 class="card-title mb-0">'+tourNm+'</h6><br></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
							    iwPosition = new kakao.maps.LatLng(lati, longi); //인포윈도우 표시 위치입니다
							
							// 인포윈도우를 생성합니다
							var infowindow = new kakao.maps.InfoWindow({
							    position : iwPosition, 
							    content : iwContent 
							});
							  
							// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
							infowindow.open(map, marker); 
							
							map.relayout();
						}, 200);
					}
				}
			});
		});
		
// 		$('#modalLg').on('shown.bs.modal', function (e) {
// 		    console.log("modal");
// 		    createMap(tourNm, lati, longi);
// 		});


		function toggleFullScreen() {
		  if (!document.fullscreenElement) {
		    document.documentElement.requestFullscreen()
		  } else {
		    if (document.exitFullscreen) {
		      document.exitFullscreen()
		    }
		  }
		}
		
		
		$("#sort").on("change",function(){
			
			$("#frm01").submit();
		});
		
		$("#init").on("click", function() {
			$("#calender").val("");
			$("input[name=keyword]").val("");
			$("#sort").val("");
			
			$("#frm01").submit();
		});
		
		$("#register").on("click", function() {
			window.location = "register";
		});
		
		$("#tourDel").on("click", function() {
			let tourId = $(this).data("tourId");			
			
			$.ajax({
				url : "/admin/tour/tourDel",
				data : {
					"tourId" : tourId,
				},
				type : "post",
				async : false,
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					if(result == "success") {
						alert("삭제가 완료되었습니다");
					}
				}
			});
		});
	
	
	});
	//"tourNm":"대덕인재개발원","lati":"36.325033987773594","longi":"127.408932253974"
	function createMap(tourNm, lati, longi) {
		$("#map").empty();
		
		console.log("position : ", lati, longi);
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(lati, longi), // 지도의 중심좌표
		        level: 2 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(lati, longi); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		var iwContent = '<div style="margin-left:17px; margin-top:2px; text-align:"center;"><h6 class="card-title mb-0">'+tourNm+'</h6><br></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(lati, longi); //인포윈도우 표시 위치입니다
		
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
		
		map.relayout();
		console.log("creMap", map)
		
		console.log("flag");
	}
</script>
</head>

<body>
	<!-- **************** MAIN CONTENT START **************** -->
	<main>
		<!-- Page main content START -->
		<div class="page-content-wrapper p-xxl-4">
			<form class="row g-4 align-items-center" id="frm01">
				<div class="col-lg-4">
					<h1 class="h3 mb-3 mb-sm-0">여행지 목록
						<a id="init" href="#s" class="h5 mb-0 text-body" >
							<i class="bi bi-arrow-clockwise"></i>
						</a>
					</h1>
				</div>
				
				<div class="d-flex align-items-center col-md-6 col-lg-4">
					<div class="btn-group" role="group" aria-label="Basic example" style="margin-left: 150px; margin-top: 5px">
						<a href="registerSingle" type="button" class="btn btn-primary" >등록(단일)</a>
						<a href="registerExcel" type="button" class="btn btn-success" >등록(엑셀)</a>
					</div>
				</div>
				
				<!-- 검색 -->
				<div class="d-flex align-items-center col-md-6 col-lg-2">
					<input class="form-control bg-transparent pe-5" type="search" placeholder="여행지명" aria-label="Search" name="keyword" value="${param.keyword}">
					<button class="bg-transparent p-2 position-absolute translate-middle-y border-0 text-primary-hover text-reset" type="submit" 
						style="margin-left: 140px; margin-top: 45px">
						<i class="fas fa-search fs-6"></i>
					</button>
				</div>
				
				<!-- 정렬 -->
				<div class="col-md-6 col-lg-2">
					<select class="form-select js-choice" aria-label=".form-select-sm" name="sort" id="sort">
						<option value="" >선택해주세요</option>
						<option value="tourNmAsc" <c:if test="${param.sort=='tourNmAsc'}">selected</c:if>>여행지명 ↑</option>
						<option value="tourNmDesc" <c:if test="${param.sort=='tourNmDesc'}">selected</c:if>>여행지명 ↓</option>
						<option value="tourCodeAsc" <c:if test="${param.sort=='tourCodeAsc'}">selected</c:if>>여행지 분류 ↑</option>
						<option value="tourCodeDesc" <c:if test="${param.sort=='tourCodeDesc'}">selected</c:if>>여행지 분류 ↓</option>
					</select>
				</div>
			</form>
			<!-- Filters END -->

			<!-- Guest list START -->
			<div class="card shadow mt-5">
				<!-- Card body START -->
				<div class="card-body">
					<!-- Table head -->
					<div class="bg-light rounded p-3 d-none d-lg-block">
						<div class="row row-cols-7 g-4">
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">여행지명</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">지역</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">분류</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">상세</h6>
							</div>
						</div>
					</div>

					<!-- Table data -->
					<c:forEach var="tourVO" items="${data.content}" varStatus="stat">
						<div class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4"
						     >
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">여행지명:</small>
								<div class="d-flex align-items-center" style="margin-left: 10px">
									<!-- Avatar -->
									<div class="avatar align-middle avatar-xl">
									  <img class="avatar-img rounded" src='
									  <c:choose>
									  	<c:when test="${empty tourVO.imgPath}">/resources/booking/assets/images/avatar/09.jpg</c:when>
									  	<c:otherwise>/resources/upload/tourImage${tourVO.imgPath}</c:otherwise>
									  </c:choose>' alt="avatar">
									</div>
									<!-- Info -->
									<div class="ms-3">
										<h6 class="mb-0 fw-light" >${tourVO.tourNm}</h6>
									</div>
								</div>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center; margin-left: 6px">
								<small class="d-block d-lg-none">지역:</small>
								<h6 class="mb-0 fw-normal">${tourVO.tourLoc}</h6>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<small class="d-block d-lg-none">분류:</small>
								<h6 class="mb-0 fw-normal">${tourVO.tourCode}</h6>
							</div>

							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<a href="#" class="btn btn-sm btn-info-soft tourDetail"
									data-toggle="modal" data-tour-id="${tourVO.tourId}"
									data-target=".bd-tourDetail-modal-lg">상세</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- Card body END -->

				<!-- Card footer START -->
				<div class="card-footer pt-0">
					<!-- Pagination and content -->
					<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
						<!-- Content -->
						<c:set var="endRow" value="${data.currentPage * data.size}" />
						<c:set var="startRow" value="${endRow - (data.size - 1)}" />
						<c:set var="total" value="${data.total}" />
						<c:if test="${endRow>total}">
							<c:set var="endRow" value="${total}" />
						</c:if>
						<p class="mb-sm-0 text-center text-sm-start">Showing ${startRow} to ${endRow} of ${total} entries</p>
						<!-- Pagination -->
						<nav class="mb-sm-0 d-flex justify-content-center" aria-label="navigation">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0 ">
								<li class="page-item <c:if test='${data.startPage < 6}'>disabled</c:if>" id="dataTable_previous">
									<a class="page-link" href="/admin/tour/list?currentPage=${data.startPage-5}&keyword=${param.keyword}&sort=${param.sort}" aria-controls="dataTable" data-dt-idx="0"  tabindex="-1">Prev</a>
								</li>
								<c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage}">
									<li class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
										<a href="/admin/tour/list?currentPage=${pNo}&keyword=${param.keyword}&sort=${param.sort}" aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0" class="page-link">${pNo}</a>
									</li>
								</c:forEach>
								<li class="page-item <c:if test='${data.endPage == data.totalPages}'>disabled</c:if>" id="dataTable_next">
									<a class="page-link" href="/admin/tour/list?currentPage=${data.startPage+5}&keyword=${param.keyword}&sort=${param.sort}" aria-controls="dataTable" data-dt-idx="7"  tabindex="-1">Next</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
				<!-- Card footer END -->
			</div>
			<!-- Guest list END -->
		</div>
		<!-- Page main content END -->
		
		<!-- 상세 Modal -->
		<div id="modalLg" class="modal modal-lg fade bd-tourDetail-modal-lg" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">여행지 상세 정보</h5>
						<button type="button" class="btn" data-dismiss="modal"
							style="font-size: 1.5rem; font-weight: 700; line-height: 1; color: #000; text-shadow: 0 1px 0 #fff;"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row g-4">
							<div class="col-lg-6">
								<div class="card shadow">
									<div class="card-header border-bottom">
										<h5 class="card-header-title">여행지 정보</h5>
									</div>
									<div class="card-body">
										<div class="mb-3">
											<h6 class="mb-0">여행지명</h6>
											<p id="tourNm" class="mb-1 mb-md-0"></p>
										</div>
										<div class="mb-3">
											<h6 class="mb-0">지역</h6>
											<p id="tourLoc" class="mb-1 mb-md-0"></p>
										</div>
										<div class="mb-3">
											<h6 class="mb-0">분류</h6>
											<p id="tourCode" class="mb-1 mb-md-0"></p>
										</div>
										<!-- Mobile number -->
										<div class="mb-3">
											<h6 class="mb-0">설명</h6> 
											<textarea id="tourDc" class="form-control" rows="6" cols="5" readonly="readonly"></textarea>
										</div>
									</div>
								</div>
							</div>
			
							<div class="col-lg-6">
								<!-- Email setting -->
								<div class="card shadow mb-4">
									<!-- Card header -->
									<div class="card-header border-bottom">
										<h5 class="card-title mb-0">여행지 이미지 등록</h5>
									</div>
			
									<!-- Card body -->
									<div class="card-body vstack gap-4">
										<img id="tourImg" src="..." class="img-thumbnail" alt="tourImg">
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="card shadow">
									<div class="card-header border-bottom">
										<h5 class="card-title mb-0">여행지 위치</h5>
										<br />
										<div class="card-body vstack gap-4" style="position: relative; overflow: hidden;">
											<div id="map" style="width:100%;height:500px;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button id="tourDel" type="button" class="btn btn-sm btn-danger-soft" data-tour-id=""
							data-dismiss="modal">삭제</button>
						<button type="button" class="btn btn-sm btn-dark-soft"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- **************** MAIN CONTENT END **************** -->
</body>
