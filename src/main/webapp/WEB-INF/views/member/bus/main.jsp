<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<head>
	<title>Wonderway-버스예약</title>

<style>


</style>




<script type="text/javascript">
$(function() {
	flatpickr(".flatpickr", {
		minDate: "today",
		dateFormat:"Y/m/d",
		local: "ko"
	})
});
</script>
</head>




<body>

<!-- **************** MAIN CONTENT START **************** -->
<main>
	
<!-- =======================
Main Banner START -->
<section class="pt-0 pb-20">
	<div class="container">
		<!-- Background image -->
		<div class="rounded-3 p-3 p-sm-5" style="background-image: url(/resources/booking/assets/images/bg/busRes.jpg); background-position: center center; background-repeat: no-repeat; background-size: cover;">
			<!-- Banner title -->
			<div class="row"> 
				<div class="col-md-10 mx-auto text-center"> 
					<h1 class="text-white display-3 pt-sm-5 my-5">승차권 예매</h1>
				</div>
			</div>

			<!-- Booking from START -->
			<form class="bg-mode position-relative px-3 px-sm-4 pt-4 mb-4 mb-sm-0" action="/member/trn/search" method="post">

				<!-- Svg decoration -->
				<figure class="position-absolute top-0 start-0 h-100 ms-n2 ms-sm-n1">
					<svg class="h-100" viewBox="0 0 12.9 324" style="enable-background:new 0 0 12.9 324;">
						<path class="fill-mode" d="M9.8,316.4c1.1-26.8,2-53.4,1.9-80.2c-0.1-18.2-0.8-36.4-1.2-54.6c-0.2-8.9-0.2-17.7,0.8-26.6 c0.5-4.5,1.1-9,1.4-13.6c0.1-1.9,0.1-3.7,0.1-5.6c-0.2-0.2-0.6-1.5-0.2-3.1c-0.3-1.8-0.4-3.7-0.4-5.5c-1.2-3-1.8-6.3-1.7-9.6 c0.9-19,0.5-38.1,0.8-57.2c0.3-17.1,0.6-34.2,0.2-51.3c-0.1-0.6-0.1-1.2-0.1-1.7c0-0.8,0-1.6,0-2.4c0-0.5,0-1.1,0-1.6 c0-1.2,0-2.3,0.2-3.5H0v11.8c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1V31c3.3,0,6.1,2.7,6.1,6.1S3.3,43.3,0,43.3v6.9 c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1 s-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9 c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1 c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.7,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9 c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.7,6.1,6.1 c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1V324h9.5C9.6,321.4,9.7,318.8,9.8,316.4z"/>
					</svg>
				</figure>

				<!-- Svg decoration -->
				<figure class="position-absolute top-0 end-0 h-100 rotate-180 me-n2 me-sm-n1">
					<svg class="h-100" viewBox="0 0 21 324" style="enable-background:new 0 0 21 324;">
						<path class="fill-mode" d="M9.8,316.4c1.1-26.8,2-53.4,1.9-80.2c-0.1-18.2-0.8-36.4-1.2-54.6c-0.2-8.9-0.2-17.7,0.8-26.6 c0.5-4.5,1.1-9,1.4-13.6c0.1-1.9,0.1-3.7,0.1-5.6c-0.2-0.2-0.6-1.5-0.2-3.1c-0.3-1.8-0.4-3.7-0.4-5.5c-1.2-3-1.8-6.3-1.7-9.6 c0.9-19,0.5-38.1,0.8-57.2c0.3-17.1,0.6-34.2,0.2-51.3c-0.1-0.6-0.1-1.2-0.1-1.7c0-0.8,0-1.6,0-2.4c0-0.5,0-1.1,0-1.6 c0-1.2,0-2.3,0.2-3.5H0v11.8c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1V31c3.3,0,6.1,2.7,6.1,6.1S3.3,43.3,0,43.3v6.9 c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1 s-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9 c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1 c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.7,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9 c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.7,6.1,6.1 c0,3.4-2.8,6.1-6.1,6.1v6.9c3.3,0,6.1,2.8,6.1,6.1c0,3.4-2.8,6.1-6.1,6.1V324h9.5C9.6,321.4,9.7,318.8,9.8,316.4z"/>
					</svg>
				</figure>

				<div class="row g-4 position-relative">

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


					<!-- Ticket Travelers -->
         			 <div class="col-lg-3 ms-auto">
						<div class="form-control-bg-light form-fs-md">
							<select class="form-select js-choice" name="numPp">
								<option value="">인원 선택</option>
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

          <!-- Tab content START -->
          <div class="tab-content mt-4" id="pills-tabContent">
            <!-- One way tab START -->
            <div class="tab-pane fade show active" id="pills-one-way" role="tabpanel" aria-labelledby="pills-one-way-tab">
              <div class="row g-4">
                <!-- Leaving From -->
                <div class="col-md-6 col-lg-4 position-relative">
                  <div class="form-border-transparent form-fs-lg bg-light rounded-3 h-100 p-3">
                    <!-- Input field -->
                    <label class="mb-1"><i class="bi bi-geo-alt me-2"></i>출발 터미널</label>
                    <select class="form-select js-choice" name="depPlace" data-search-enabled="true">
                      <option value="">출발 터미널을 선택해주세요</option>
                      <option>서울</option>
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
                    <label class="mb-1"><i class="bi bi-send me-2"></i>도착 터미널</label>
                    <select class="form-select js-choice" name="arrPlace" data-search-enabled="true">
                      <option value="">도착 터미널을 선택해주세요</option>
                      <option>서울</option>
                      <option>대전</option>
                      <option>West Virginia, Paris</option>
                    </select>
                  </div>
                </div>

                <!-- Departure -->
                <div class="col-lg-4">
                  <div class="form-border-transparent form-fs-lg bg-light rounded-3 h-100 p-3">
                    <label class="mb-1"><i class="bi bi-calendar me-2"></i>날짜</label>
                    <input type="text" name="depPlandTime" class="form-control flatpickr" data-date-format="Y/m/d" placeholder="날짜를 선택해주세요">
                  </div>
                </div>

                <div class="col-12 text-end pt-0">
                  <button type="submit"  class="btn btn-primary mb-n4">조회하기 <i class="bi bi-arrow-right ps-3"></i></a>
                </div>
              </div>
            </div>
            <!-- One way tab END -->

            <!-- Round way tab END -->
            <div class="tab-pane fade" id="pills-round-trip" role="tabpanel" aria-labelledby="pills-round-trip-tab">
              <div class="row g-4">

                <!-- Leaving From -->
                <div class="col-md-6 col-xl-3 position-relative">
                  <div class="form-border-transparent form-fs-lg bg-light rounded-3 h-100 p-3">
                    <!-- Input field -->
                    <label class="mb-1"><i class="bi bi-geo-alt me-2"></i>From</label>
                    <select class="form-select js-choice" data-search-enabled="true">
                      <option value="">Select location</option>
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
                <div class="col-md-6 col-xl-3">
                  <div class="form-border-transparent form-fs-lg bg-light rounded-3 h-100 p-3">
                    <!-- Input field -->
                    <label class="mb-1"><i class="bi bi-send me-2"></i>To</label>
                    <select class="form-select js-choice" data-search-enabled="true">
                      <option value="">Select location</option>
                      <option>San Jacinto, USA</option>
                      <option>North Dakota, Canada</option>
                      <option>West Virginia, Paris</option>
                    </select>
                  </div>
                </div>

                <!-- Departure -->
                <div class="col-md-6 col-xl-3">
                  <div class="form-border-transparent form-fs-lg bg-light rounded-3 h-100 p-3">
                    <label class="mb-1"><i class="bi bi-calendar me-2"></i>Departure</label>
                    <input type="text" class="form-control flatpickr" data-date-format="d M Y" placeholder="Select date">
                  </div>
                </div>

                <!-- Return -->
                <div class="col-md-6 col-xl-3">
                  <div class="form-border-transparent form-fs-lg bg-light rounded-3 h-100 p-3">
                    <label class="mb-1"><i class="bi bi-calendar me-2"></i>Return</label>
                    <input type="text" class="form-control flatpickr" data-date-format="d M Y" placeholder="Select date">
                  </div>
                </div>

                <div class="col-12 text-end pt-0">
                  <a  class="btn btn-primary mb-n4" href="#">Find ticket <i class="bi bi-arrow-right ps-3"></i></a>
                </div>
              </div>
            </div>
            <!-- Round way tab END -->
          </div>
          <!-- Tab content END -->
        </div>
        	<sec:csrfInput />
			</form>
			<!-- Booking from END -->
		</div>
	</div>
</section>
<!-- =======================
Main Banner END -->


</main>

</body>
</html>