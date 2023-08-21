<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
	<title>Wonderway-렌트카</title>

<script type="text/javascript">
$(function() {
flatpickr(".flatpickr", {
	minDate: "today",
	dateFormat:"Y/m/d H:i",
	enableTime:true,
	time_24hr:true,
	minuteIncrement: 30,
	local: "ko"
	});
	
});
</script>
</head>

<body>
<main>
<!-- =======================
Main Banner START -->
<section class="pt-0 pt-lg-5">
	<div class="container">
		<div class="row">

			<div class="col-lg-10 ms-auto position-relative">
				<img src="/resources/booking/assets/images/bg/rntcar.jpg" class="rounded-3" alt="" >

				<!-- Search START -->
				<div class="col-11 col-sm-10 col-lg-8 col-xl-6 position-lg-middle ms-lg-8 ms-xl-7">
					<div class="card shadow pb-0 mt-n7 mt-sm-n8 mt-lg-0">

						<!-- Card header -->
						<div class="card-header border-bottom p-3 p-sm-4">
							<h5 class="card-title mb-0">렌트카 대여</h5>
						</div>

						<!-- Card body START -->
						<form class="card-body form-control-border p-3 p-sm-4" action="/member/rntcar/search" method="post" >


								<!-- Round trip START -->
								<div class="tab-pane" id="cab2-round-way" >
									<div class="row g-2 g-md-4">
										<!-- Pickup -->
										<div class="col-md-12 position-relative">
											<label class="form-label small">대여 장소</label>
											<div class="form-fs-lg form-control-transparent">
												<select name="busiLoc" class="form-select js-choice" data-search-enabled="true" >
													<option value="">지역을 선택하세요</option>
													<%
													  	String[] locArray = {"서울", "부산","인천","대구","대전", "광주","울산","세종","제주","경기도 수원시",
													  						"경기도 고양시 ","경기도 용인시", "경상남도 창원시", "경기도 성남시","충척북도 청주시","충청남도 태안군","충청남도 천안시"};
													%>
													<% for (String loc:locArray) {%>
														<option><%=loc%></option>
													<%}%>
												</select>
											</div>	
										</div>


										<!-- Date -->
										<div class="col-sm-12">
											<div class="form-fs-lg form-control-transparent">
												<label class="form-label small">픽업 날짜</label>
												<input name="rsvSt" type="text" class="form-control flatpickr" placeholder="픽업날짜를 선택해주세요">
											</div>
										</div>
										
										<!-- Date -->
										<div class="col-sm-12">
											<div class="form-fs-lg form-control-transparent">
												<label class="form-label small">반납 날짜</label>
												<input name="rsvEd" type="text" class="form-control flatpickr" placeholder="반납날짜를 선택해주세요">
											</div>
										</div>


									</div> <!-- Row END -->
								</div>
								<!-- Round trip END -->

							<!-- Button -->
							<div class="d-grid mt-3">
								<button class="btn btn-dark">렌트카 검색</button>
							</div>
						<sec:csrfInput />
						</form>
						<!-- Card-body END -->
					</div>
				</div>
				<!-- Search END -->
			</div>
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Main Banner END -->

<!-- =======================
Best deal START -->
<section class="pb-2 pb-lg-5">
	<div class="container">
						<!--  표 위에 슬라이더 -->
				<div class="container">
					<!-- Slider START -->
					<div class="tiny-slider arrow-round arrow-blur arrow-hover">
						<div class="tiny-slider-inner" data-autoplay="true"
							data-arrow="true" data-edge="2" data-dots="false"
							data-items-xl="3" data-items-lg="2" data-items-md="1">
							
							<!-- Slider 1 item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<img alt="001" src="/resources/booking/assets/images/advertise/bottom/001.png">
									</div>
								</div>
							</div>
							
							<!-- Slider 2 item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<img alt="002" src="/resources/booking/assets/images/advertise/bottom/002.png">
									</div>
								</div>
							</div>
							
							<!-- Slider 3 item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<img alt="003" src="/resources/booking/assets/images/advertise/bottom/003.png">
									</div>
								</div>
							</div>
							
							<!-- Slider 4 item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<img alt="004" src="/resources/booking/assets/images/advertise/bottom/004.png">
									</div>
								</div>
							</div>
							
							<!-- Slider 5 item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<img alt="005" src="/resources/booking/assets/images/advertise/bottom/005.png">
									</div>
								</div>
							</div>
							
							<!-- Slider 6 item -->
							<div>
								<div class="card border rounded-3 overflow-hidden">
									<div class="row g-0 align-items-center">
										<img alt="006" src="/resources/booking/assets/images/advertise/bottom/006.png">
									</div>
								</div>
							</div>
							

						</div>
					</div>
					<!-- Slider END -->
				</div>
				<!--  표 위에 슬라이더 END -->
	</div>
</section>
<!-- =======================
Best deal END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

</body>
</html>