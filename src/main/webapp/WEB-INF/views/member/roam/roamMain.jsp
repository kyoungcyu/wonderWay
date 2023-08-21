<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<head>
	<title>Booking - Multipurpose Online Booking Theme</title>

<script type="text/javascript">

$(function() {
	const today = new Date();
    const date3= new Date(today);
    date3.setDate(today.getDate() + 3);
	
	
	flatpickr(".period", {
		minDate: date3,
		local: "ko"
	})
	
	flatpickr(".birth", {
		maxDate: "today",
		local: "ko"
	})
});


</script>
<body>

<!-- **************** MAIN CONTENT START **************** -->
<main>

<!-- =======================
Main banner START -->
<section class="pt-0">
	<!-- Background and title -->
	<div class="container-fluid" style="background-image:url(/resources/booking/assets/images/bg/08.jpg); background-position: center left; background-size: cover;">
		<div class="row">
			<!-- Title -->
			<div class="col-md-6 mx-auto text-center pt-7 pb-9">
				<h1 class="text-white">해외로밍도<br/>Wonderway와 함께</h1>
			</div>
		</div> <!-- Row END -->
	</div>

	<!-- Search START -->
	<div class="container mt-n8">
		<div class="row">

			<!-- Tab content START -->
			<div class="col-12">
				<div class="tab-content" id="nav-tabContent">
					
					<!-- Tab content item START -->
					<div class="tab-pane fade show active" id="tab-1-1">
						<form class="card shadow p-0" action="/member/insurance/search" method="post">
						
							<!-- Card header -->
							<div class="card-header p-4">
								<h5 class="mb-0"><i class="fa-solid fa-mobile-screen-button fa-fw me-2"></i>해외로밍</h5>
							</div>

							<!-- Card body -->
							<div class="card-body p-4 pt-0">
								<div class="row g-4">
									<!-- Location -->
									<div class="col-lg-6">
										<div class="form-icon-input form-size-lg form-fs-lg">
											<select class="form-select js-choice" name="nation" data-search-enabled="true">
												<option value="">여행국가</option>
												<option>미국</option>
												<option>캐나다</option>
												<option>일본</option>
												<option>중국</option>
											</select>
											<span class="form-icon"><i class="bi bi-search fs-5"></i></span>
										</div>
									</div>
									
									<!-- Date -->
									<div class="col-lg-6">
										<div class="form-icon-input form-fs-lg">
											<input type="text" name="period" class="form-control form-control-lg flatpickr period" data-date-format="Y/m/d" data-mode="range" placeholder="여행기간" >
											<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
										</div>
									</div>
									

								</div> <!-- Row END -->

								<!-- Button -->
								<div class="text-center pt-0">
									<button type="submit" class="btn btn-lg btn-primary mb-n7">해외로밍 검색 <i class="bi bi-arrow-right ps-3"></i></button>
								</div>
							</div>
							<sec:csrfInput />
						</form>
					</div>
					<!-- Tab content item END -->

					<!-- Tab content item START -->
					<div class="tab-pane fade" id="tab-1-2">
						<form class="card shadow p-0">
							<!-- Card header -->
							<div class="card-header p-4">
								<div class="row g-4 align-items-center">
									<!-- Title -->
									<div class="col-lg-4 col-xl-6">
										<h5 class="mb-0"><i class="fa-solid fa-plane fa-fw me-2"></i>Flight Booking</h5>
									</div>
									<!-- Radio tab -->
									<div class="col-md-6 col-lg-4 col-xl-3 ms-auto">
										<div class="nav nav-pills" id="pills-tab" role="tablist">
											<div class="form-check form-check-inline active" id="flight-one-way-tab" data-bs-toggle="pill" data-bs-target="#flight-one-way" role="tab" aria-controls="flight-one-way" aria-selected="true">
												<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked>
												<label class="form-check-label" for="inlineRadio1">One Way</label>
											</div>
											<div class="form-check form-check-inline" id="flight-round-way-tab" data-bs-toggle="pill" data-bs-target="#flight-round-way" role="tab" aria-controls="flight-round-way" aria-selected="false">
												<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
												<label class="form-check-label" for="inlineRadio2">Round Trip</label>
											</div>
										</div>
									</div>
									<!-- Select -->
									<div class="col-md-6 col-lg-4 col-xl-3 ms-auto">
										<div class="form-control-bg-light border rounded form-fs-md">
											<select class="form-select js-choice" aria-label=".form-select-sm">
												<option value="">Select Class</option>
												<option>Economy</option>
												<option>Premium Economy</option>
												<option>Business</option>
												<option>First Class</option>
											</select>
										</div>
									</div>
								</div>
							</div>

							<!-- Card body -->
							<div class="card-body p-4 pt-0">
								<!-- Tab content START -->
								<div class="tab-content" id="pills-tabContent">
									<!-- One way tab START -->
									<div class="tab-pane fade show active" id="flight-one-way" role="tabpanel" aria-labelledby="flight-one-way-tab">
										<div class="row g-4">
											<!-- From -->
											<div class="col-md-6 position-relative">
												<div class="form-icon-input form-size-lg form-fs-lg">
													<select class="form-select js-choice" data-search-enabled="true">
														<option value="">Flying from...</option>
														<option>San Jacinto, USA</option>
														<option>North Dakota, Canada</option>
														<option>West Virginia, Paris</option>
													</select>
													<span class="form-icon"><i class="bi bi-geo-alt fs-5"></i></span>
												</div>

												<!-- Auto fill button -->
												<div class="btn-flip-icon z-index-9">
													<button class="btn btn-dark shadow btn-round mb-0"><i class="fa-solid fa-right-left"></i></button>
												</div>
											</div>

											<!-- To -->
											<div class="col-md-6">
												<div class="form-icon-input form-size-lg form-fs-lg">
													<select class="form-select js-choice" data-search-enabled="true">
														<option value="">Flying to...</option>
														<option>San Jacinto, USA</option>
														<option>North Dakota, Canada</option>
														<option>West Virginia, Paris</option>
													</select>
													<span class="form-icon"><i class="bi bi-send fs-5"></i></span>
												</div>
											</div>

											<!-- Date -->
											<div class="col-md-6">
												<div class="form-icon-input form-fs-lg">
													<input type="text" class="form-control form-control-lg flatpickr" data-date-format="d/M/Y"  placeholder="Select check-in date">
													<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
												</div>
											</div>

											<!-- Guest -->
											<div class="col-md-6">
												<div class="form-icon-input form-fs-lg">
													<input type="text" class="form-control form-control-lg" placeholder="Select occupant">
													<span class="form-icon"><i class="bi bi-people fs-5"></i></span>
												</div>
											</div>
										</div>

										<!-- Button -->
										<div class="text-center pt-0">
											<a class="btn btn-lg btn-primary mb-n7" href="#">Search Flight <i class="bi bi-arrow-right ps-3"></i></a>
										</div>
									</div>
									<!-- One way trip END -->

									<!-- Round way tab START -->
									<div class="tab-pane fade" id="flight-round-way" role="tabpanel" aria-labelledby="flight-round-way-tab">
										<!-- One way trip START -->
										<div class="row g-4">
											<!-- From -->
											<div class="col-md-6 position-relative">
												<div class="form-icon-input form-size-lg form-fs-lg">
													<select class="form-select js-choice" data-search-enabled="true">
														<option value="">Flying from...</option>
														<option>San Jacinto, USA</option>
														<option>North Dakota, Canada</option>
														<option>West Virginia, Paris</option>
													</select>
													<span class="form-icon"><i class="bi bi-geo-alt fs-5"></i></span>
												</div>

												<!-- Auto fill button -->
												<div class="btn-flip-icon z-index-9">
													<button class="btn btn-dark shadow btn-round mb-0"><i class="fa-solid fa-right-left"></i></button>
												</div>
											</div>

											<!-- To -->
											<div class="col-md-6">
												<div class="form-icon-input form-size-lg form-fs-lg">
													<select class="form-select js-choice" data-search-enabled="true">
														<option value="">Flying to...</option>
														<option>San Jacinto, USA</option>
														<option>North Dakota, Canada</option>
														<option>West Virginia, Paris</option>
													</select>
													<span class="form-icon"><i class="bi bi-send fs-5"></i></span>
												</div>
											</div>

											<!-- Date -->
											<div class="col-md-4">
												<div class="form-icon-input form-fs-lg">
													<input type="text" class="form-control form-control-lg flatpickr" data-date-format="d/M/Y" placeholder="Select check-in date">
													<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
												</div>
											</div>

											<!-- Date -->
											<div class="col-md-4">
												<div class="form-icon-input form-fs-lg">
													<input type="text" class="form-control form-control-lg flatpickr" data-date-format="d/M/Y" placeholder="Select check-out date">
													<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
												</div>
											</div>

											<!-- Guest -->
											<div class="col-md-4">
												<div class="form-icon-input form-fs-lg">
													<input type="text" class="form-control form-control-lg" placeholder="Select occupant">
													<span class="form-icon"><i class="bi bi-people fs-5"></i></span>
												</div>
											</div>
										</div>
										<!-- Button -->
										<div class="col-12 text-center pt-0">
											<a class="btn btn-lg btn-primary mb-n7" href="#">Search Flight <i class="bi bi-arrow-right ps-3"></i></a>
										</div>
										<!-- One way trip END -->
									</div>
									<!-- Round way tab END -->
								</div>
								<!-- Tab content END -->
							</div>	
						</form>
					</div>
					<!-- Tab content item END -->

					<!-- Tab content item START -->
					<div class="tab-pane fade" id="tab-1-3">
						<form class="card shadow p-0">
							<!-- Card header -->
							<div class="card-header p-4">
								<h5 class="mb-0"><i class="fa-solid fa-globe-americas fa-fw me-2"></i>Tour Booking</h5>
							</div>

							<!-- Card body -->
							<div class="card-body p-4 pt-0">
								<div class="row g-4">
									<!-- Location -->
									<div class="col-lg-4">
										<div class="form-icon-input form-size-lg form-fs-lg">
											<select class="form-select js-choice" data-search-enabled="true">
												<option value="">Select tour location</option>
												<option>San Jacinto, USA</option>
												<option>North Dakota, Canada</option>
												<option>West Virginia, Paris</option>
											</select>
											<span class="form-icon"><i class="bi bi-geo-alt fs-5"></i></span>
										</div>
									</div>

									<!-- Date -->
									<div class="col-lg-4">
										<div class="form-icon-input form-fs-lg">
											<input type="text" class="form-control form-control-lg flatpickr" data-date-format="d/M/Y" placeholder="Select date">
											<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
										</div>
									</div>

									<!-- Guest -->
									<div class="col-lg-4">
										<div class="form-icon-input form-size-lg form-fs-lg">
											<select class="form-select js-choice" data-search-enabled="true">
												<option value="">Select tour type</option>
												<option>Adventure</option>
												<option>Beach</option>
												<option>Desert</option>
												<option>History</option>
											</select>
											<span class="form-icon"><i class="fa-solid fa-person-skating fs-5"></i></span>
										</div>
									</div>
								</div> <!-- Row END -->

								<!-- Button -->
								<div class="text-center pt-0">
									<a class="btn btn-lg btn-primary mb-n7" href="#">Search Tour <i class="bi bi-arrow-right ps-3"></i></a>
								</div>
							</div>
						</form>
					</div>
					<!-- Tab content item END -->

					<!-- Tab content item START -->
					<div class="tab-pane fade" id="tab-1-4">
						<form class="card shadow p-0">
							<!-- Card header -->
							<div class="card-header d-sm-flex justify-content-between align-items-center p-4">
								<!-- Title -->
								<h5 class="mb-3 mb-sm-0"><i class="fa-solid fa-car fa-fw me-2"></i>Cab Booking</h5>

								<!-- Tabs -->
								<ul class="nav nav-pills nav-pills-dark" id="pills-tab-2" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link mb-0 rounded-start rounded-0 active" id="pills-one-way-2-tab" data-bs-toggle="pill" data-bs-target="#pills-one-way-2" type="button" role="tab" aria-selected="true">One Way</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link mb-0 rounded-end rounded-0" id="pills-round-way-2-tab" data-bs-toggle="pill" data-bs-target="#pills-round-way-2" type="button" role="tab" aria-selected="false">Road Trip</button>
									</li>
								</ul>
							</div>

							<!-- Card body -->
							<div class="card-body p-4 pt-0">
								<!-- Tab content START -->
								<div class="tab-content" id="pills-tabContent3">
									<!-- One way tab START -->
									<div class="tab-pane fade show active" id="pills-one-way-2" role="tabpanel" aria-labelledby="pills-one-way-2-tab">
										<div class="row g-4">
											<!-- Pickup -->
											<div class="col-md-6 position-relative">
												<div class="form-icon-input form-size-lg form-fs-lg">
													<select class="form-select js-choice" data-search-enabled="true">
														<option value="">Select pickup location</option>
														<option>San Jacinto, USA</option>
														<option>North Dakota, Canada</option>
														<option>West Virginia, Paris</option>
													</select>
													<span class="form-icon"><i class="bi bi-geo-alt fs-5"></i></span>
												</div>

												<!-- Auto fill button -->
												<div class="btn-flip-icon z-index-9">
													<button class="btn btn-white shadow btn-round mb-0"><i class="fa-solid fa-right-left"></i></button>
												</div>
											</div>

											<!-- Drop -->
											<div class="col-md-6">
												<div class="form-icon-input form-size-lg form-fs-lg">
													<select class="form-select js-choice" data-search-enabled="true">
														<option value="">Select drop location</option>
														<option>San Jacinto, USA</option>
														<option>North Dakota, Canada</option>
														<option>West Virginia, Paris</option>
													</select>
													<span class="form-icon"><i class="bi bi-geo-alt fs-5"></i></span>
												</div>
											</div>

											<!-- Pickup date -->
											<div class="col-md-6">
												<div class="form-icon-input form-fs-lg">
													<input type="text" class="form-control form-control-lg flatpickr" data-date-format="d/M/Y" placeholder="Select pickup date">
													<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
												</div>
											</div>

											<!-- Pickup time -->
											<div class="col-md-6">
												<div class="form-icon-input form-fs-lg">
													<input type="text" class="form-control form-control-lg flatpickr" placeholder="Select pickup time" data-noCalendar="true" data-enableTime="true">
													<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
												</div>
											</div>
										</div> <!-- Row END -->
										<!-- Button -->
										<div class="text-center pt-0">
											<a class="btn btn-lg btn-primary mb-n7" href="#">Search Cabs <i class="bi bi-arrow-right ps-3"></i></a>
										</div>
									</div>
									<!-- One way tab END -->

									<!-- Round way tab START -->
									<div class="tab-pane fade" id="pills-round-way-2" role="tabpanel" aria-labelledby="pills-round-way-2-tab">
										<div class="row g-4">
											<!-- Pickup -->
											<div class="col-md-6 position-relative">
												<div class="form-icon-input form-size-lg form-fs-lg">
													<select class="form-select js-choice" data-search-enabled="true">
														<option value="">Select pickup location</option>
														<option>San Jacinto, USA</option>
														<option>North Dakota, Canada</option>
														<option>West Virginia, Paris</option>
													</select>
													<span class="form-icon"><i class="bi bi-geo-alt fs-5"></i></span>
												</div>

												<!-- Auto fill button -->
												<div class="btn-flip-icon z-index-9">
													<button class="btn btn-white shadow btn-round mb-0"><i class="fa-solid fa-right-left"></i></button>
												</div>
											</div>

											<!-- Drop -->
											<div class="col-md-6">
												<div class="form-icon-input form-size-lg form-fs-lg">
													<select class="form-select js-choice" data-search-enabled="true">
														<option value="">Select drop location</option>
														<option>San Jacinto, USA</option>
														<option>North Dakota, Canada</option>
														<option>West Virginia, Paris</option>
													</select>
													<span class="form-icon"><i class="bi bi-geo-alt fs-5"></i></span>
												</div>
											</div>

											<!-- Pickup date -->
											<div class="col-md-6 col-lg-3">
												<div class="form-icon-input form-fs-lg">
													<input type="text" class="form-control form-control-lg flatpickr" data-date-format="d/M/Y" placeholder="Select pickup date">
													<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
												</div>
											</div>

											<!-- Pickup time -->
											<div class="col-md-6 col-lg-3">
												<div class="form-icon-input form-fs-lg">
													<input type="text" class="form-control form-control-lg flatpickr" placeholder="Select pickup time" data-noCalendar="true" data-enableTime="true">
													<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
												</div>
											</div>

											<!-- Drop date -->
											<div class="col-md-6 col-lg-3">
												<div class="form-icon-input form-fs-lg">
													<input type="text" class="form-control form-control-lg flatpickr" data-date-format="d/M/Y" placeholder="Select return date">
													<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
												</div>
											</div>

											<!-- Drop time -->
											<div class="col-md-6 col-lg-3">
												<div class="form-icon-input form-fs-lg">
													<input type="text" class="form-control form-control-lg flatpickr" placeholder="Select return time" data-noCalendar="true" data-enableTime="true">
													<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
												</div>
											</div>
										</div> <!-- Row END -->
										<!-- Button -->
										<div class="text-center pt-0">
											<a class="btn btn-lg btn-primary mb-n7" href="#">Search cabs <i class="bi bi-arrow-right ps-3"></i></a>
										</div>
									</div>
									<!-- Round way tab END -->
								</div>		
							</div>
						</form>
					</div>
					<!-- Tab content item END -->

				</div> 
			</div>
			<!-- Tab content END -->
		</div>
	</div>
	<!-- Search END -->
</section>
<!-- =======================
Main banner START -->


</main>
<!-- **************** MAIN CONTENT END **************** -->


</body>
</html>