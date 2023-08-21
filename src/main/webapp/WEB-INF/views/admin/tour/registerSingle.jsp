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
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5fb237d518aee57b890f9ca058e96542&libraries=services"></script>

<script type="text/javascript">
	$(function() {
		$("#btnTourRegist").on("click", function() {
			$("#frm01").submit();
		});
		
		$("#inputGroupFile04").on("change", handleImg);
		//e : change 이벤트 객체
		function handleImg(e){
			//let file = $("#file");
			//file[0].files;
			let files = e.target.files;
			let fileArr = Array.prototype.slice.call(files);
			
			//f : 각각의 이미지 파일
			fileArr.forEach(function(f){
				//이미지가 아니면 멈춤
				if(!f.type.match("image.*")){
					alert("이미지만 가능합니다.");
					return;
				}
				
				let reader = new FileReader();
				//e : 리더가 이미지를 읽을 때 그 이벤트
				reader.onload = function(e){
					//e.target.result : 이미지를 읽은 결과물
					let img_html = "<img src='" + e.target.result + "' style='width:50%;' />";
					$("#thumbNailImage").empty();
					$("#thumbNailImage").append(img_html);
				}
				//다음 이미지 파일(f)을 읽기 위해 리더를 초기화
				reader.readAsDataURL(f);
			});
		}
		
	});
</script>
</head>

<body>
	<!-- **************** MAIN CONTENT START **************** -->
	<main>
		<!-- Page main content START -->
		<div class="page-content-wrapper p-xxl-4">
			<div class="row g-4 align-items-center">
				<div class="col-lg-5">
					<h1 class="h3 mb-3 mb-sm-0">여행지 등록</h1>
				</div>
			</div>
			<!-- Filters END -->
			<form:form modelAttribute="tourVO" id="frm01" name="frm01" action="/admin/tour/registerPost" method="post" enctype="multipart/form-data">
				<!-- Guest list START -->
				<div class="card shadow mt-5">
					<!-- Card body START -->
					<div class="card-body">
						<!-- Table head --> 
						<div class="row g-4">
							<!-- Profile setting -->
							<div class="col-lg-6">
								<div class="card shadow">
									<div class="card-header border-bottom">
										<h5 class="card-header-title">여행지 정보</h5>
									</div>
									<div class="card-body">
										<div class="mb-3">
											<form:label path="tourNm" class="form-label">여행지명
												<code><form:errors path="tourNm" /></code>
											</form:label>
											<form:input path="tourNm" type="text" name="tourNm" class="form-control" placeholder="여행지명을 입력해주세요" />
											<form:input path="lati" type="hidden" name="lati" />
											<form:input path="longi" type="hidden" name="longi" />
										</div>
										<div class="mb-3">
											<div class="row">
												<div class="col-md-6" style="text-align: center;">
													<form:label path="tourLoc" class="form-label">지역</form:label>
													<form:select id="selectLoc" path="tourLoc" class="form-select js-choice" aria-label=".form-select-sm" >
														<option value="">선택해주세요</option>
														<option value="서울">서울</option>
														<option value="강원">강원</option>
														<option value="대전,충청">대전,충청</option>
														<option value="대구,경상">대구,경상</option>
														<option value="광주,전라">광주,전라</option>
														<option value="부산">부산</option>
														<option value="제주">제주</option>
													</form:select>
												</div>
						
												<div class="col-md-6" style="text-align: center;">
													<form:label path="tourCode" class="form-label">분류</form:label>
													<form:select id="selectCode" path="tourCode" class="form-select js-choice" aria-label=".form-select-sm" >
														<option value="">선택해주세요</option>
														<option value="SL">레포츠</option>
														<option value="SS">공연</option>
														<option value="SV">휴양관광지</option>
														<option value="SC">문화시설</option>
														<option value="SF">축제,행사</option>
														<option value="SN">자연관광지</option>
														<option value="SH">역사관광지</option>
													</form:select>
												</div>
											</div>
										</div>
										<!-- Mobile number -->
										<div class="mb-3">
											<form:label path="tourDc" class="form-label">설명</form:label> 
											<form:textarea class="form-control" rows="6" cols="5" path="tourDc" ></form:textarea>
										</div>
									</div>
								</div>
							</div>
			
							<!-- Notification Setting -->
							<div class="col-lg-6">
								<!-- Email setting -->
								<div class="card shadow mb-4">
									<!-- Card header -->
									<div class="card-header border-bottom">
										<h5 class="card-title mb-0">여행지 이미지 등록</h5>
									</div>
			
									<!-- Card body -->
									<div class="card-body vstack gap-4">
										<!-- Item -->
										<div id="thumbNailImage" style="text-align: center;">
											<div class="d-md-flex justify-content-between align-items-center">
												<div>
												</div>
	
												<div class="form-check form-switch form-check-md mb-0">
												</div>
											</div>

											<div class="d-md-flex justify-content-between align-items-center">
												<div>
												</div>
	
												<div class="form-check form-switch form-check-md mb-0">
												</div>
											</div>

											<div class="d-md-flex justify-content-between align-items-center">
												<div>
												</div>
	
												<div class="form-check form-switch form-check-md mb-0">
												</div>
											</div>
			
										<div class="d-md-flex justify-content-between align-items-center">
												<div>
												</div>
	
												<div class="form-check form-switch form-check-md mb-0">
												</div>
											</div><div class="d-md-flex justify-content-between align-items-center">
												<div>
												</div>
	
												<div class="form-check form-switch form-check-md mb-0">
												</div>
											</div><div class="d-md-flex justify-content-between align-items-center">
												<div>
												</div>
	
												<div class="form-check form-switch form-check-md mb-0">
												</div>
											</div><div class="d-md-flex justify-content-between align-items-center">
												<div>
												</div>
	
												<div class="form-check form-switch form-check-md mb-0">
												</div>
											</div><div class="d-md-flex justify-content-between align-items-center">
												<div>
												</div>
	
												<div class="form-check form-switch form-check-md mb-0">
												</div>
											</div><div class="d-md-flex justify-content-between align-items-center">
												<div>
												</div>
	
												<div class="form-check form-switch form-check-md mb-0">
												</div>
											</div>
										</div>
										<!-- Item -->
										<div class="d-md-flex justify-content-between align-items-center">
											<!-- Content -->
											<div class="input-group">
											  <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" 
											  		 name="attachVOList[0].attachDeVOList[0].picture" accept="image/gif, image/jpeg, image/png" aria-label="Upload">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="card shadow">
									<div class="card-header border-bottom">
										<h5 class="card-title mb-0">여행지 위치</h5>
										<br />
										<input type="text" id="tourAddress" class="form-control" style="width: 50%;" value="" placeholder="주소를 입력해주세요" />
										
										<div class="card-body vstack gap-4">
											<div id="map" style="width:100%;height:500px;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Card body END -->
	
					<!-- Card footer START -->
					<div class="card-footer pt-0">
						<!-- Pagination and content -->
						<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
							<p class="mb-sm-0 text-center text-sm-start"></p>
							<!-- Pagination -->
							<nav class="mb-sm-0 d-flex justify-content-center" aria-label="navigation">
								<ul class="pagination pagination-sm pagination-primary-soft mb-0 ">
									<li class="page-item">
										<button id="btnTourRegist" type="button" class="btn btn-primary" >등록</button>
									</li>
									<li class="page-item">
										<a href="list" type="button" class="btn btn-secondary" >취소</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
					<!-- Card footer END -->
				</div>
				<sec:csrfInput />
			</form:form>
		</div>
	</main>
	
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		$("#tourAddress").on("keyup", function(key) {
			if(key.keyCode == 13) {
				let address = $(this).val();
				let tourNm = $("input[name=tourNm]").val();
				console.log("address", address, tourNm);
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(address, function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				        
// 				        console.log("marker : ", marker.getPosition().getLat(), marker.getPosition().getLng());
				        let lati = $("input[name=lati]").val(marker.getPosition().getLat());
				        let longi = $("input[name=longi]").val(marker.getPosition().getLng());
				        console.log("marker : ", lati, longi);
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ tourNm + '</div>'
				        });
				        infowindow.open(map, marker);
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } else {
				    	console.log("error");
				    } 
				});    
			}
		});
	</script>
	<!-- **************** MAIN CONTENT END **************** -->
</body>
