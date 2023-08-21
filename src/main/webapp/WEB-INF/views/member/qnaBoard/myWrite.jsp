<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<!-- Main content START -->
<div class="col-lg-8 col-xl-9 ps-xl-5">

	<!-- Offcanvas menu button -->
	<div class="d-grid mb-0 d-lg-none w-100">
		<button class="btn btn-primary mb-4" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar"
			aria-controls="offcanvasSidebar">
			<i class="fas fa-sliders-h"></i> Menu
		</button>
	</div>

	<div class="card border bg-transparent">
		<!-- Card header -->
		<div class="card-header bg-transparent border-bottom">
			<h4 class="card-header-title">나의 작성글</h4>
		</div>

		<!-- Card body START -->
		<div class="card-body p-0">

			<!-- Tabs -->
			<ul class="nav nav-tabs nav-bottom-line nav-responsive nav-justified">
				<li class="nav-item"><a class="nav-link mb-0 active"
					data-bs-toggle="tab" href="#tab-1"><i
						class="bi bi-briefcase-fill fa-fw me-1"></i>상품리뷰</a></li>
				<li class="nav-item"><a class="nav-link mb-0"
					data-bs-toggle="tab" href="#tab-2"><i
						class="bi bi-x-octagon fa-fw me-1"></i>여행후기</a></li>
				<li class="nav-item"><a class="nav-link mb-0"
					data-bs-toggle="tab" href="#tab-3"><i
						class="bi bi-patch-check fa-fw me-1"></i>질문답변</a></li>
				<li class="nav-item"><a class="nav-link mb-0"
					data-bs-toggle="tab" href="#tab-4"><i
						class="bi bi-patch-check fa-fw me-1"></i>댓글</a></li>
			</ul>

			<!-- 탭 4개 내용 div -->
			<div class="tab-content p-3 p-sm-4" id="nav-tabContent">

				<!-- 탭1 -->
				<div class="tab-pane fade show active" id="tab-1">
					<!-- 나의 작성글 리뷰  -->
					<!-- Reviews1  START -->




					<c:forEach var="review" items="${myReviewList}" varStatus="stat">
					<c:forEach var="completeBooking" items="${completeBooking}" varStatus="stat">
						<div class="row g-3 g-lg-4 mb-2 mt-2">
							<div class="col-md-1 col-xxl-3">
								<!-- Avatar and info -->
								<div class="d-flex align-items-center">
									<!-- Avatar -->
									<div class="avatar avatar-xl me-2 flex-shrink-0">
										<img class="avatar-img rounded-circle"
											src="/resources/booking/assets/images/avatar/02.jpg"
											alt="avatar">
									</div>
								</div>
								<!-- Info -->
								<div class="ms-2">
									<h5 class="mb-0">${review.frstWrtr}</h5>
									<fmt:formatDate var="frstDt" value="${review.frstDt}"
										pattern="yyyy/MM/dd" />
									<p class="mb-1">${frstDt}</p>
								</div>

							</div>





							<div class="col-md-8 col-xxl-9">
								<!-- Rating and Actions -->
								<div
									class="d-flex justify-content-between align-items-center mb-2">
									<!-- Rating -->
									<ul class="list-inline mb-0">
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="far fa-star-half-stroke text-warning"></i></li>
									</ul>

									<!-- Actions -->
									<div class="dropdown">
										<a class="text-black" href="#" id="creditcardDropdown2"
											role="button" data-bs-toggle="dropdown"
											data-bs-auto-close="outside" aria-expanded="false"> <!-- Dropdown Icon -->
											<svg width="24" height="24" fill="none">
                    <circle fill="currentColor" cx="12.5" cy="3.5" r="2.5"></circle>
                    <circle fill="currentColor" opacity="0.5" cx="12.5" cy="11.5" r="2.5"></circle>
                    <circle fill="currentColor" opacity="0.3" cx="12.5" cy="19.5" r="2.5"></circle>
                </svg>
										</a>
										<ul class="dropdown-menu dropdown-menu-end"
											aria-labelledby="creditcardDropdown2">
											<li><a class="dropdown-item" href="#"><i
													class="bi bi-credit-card-2-front-fill fw-icon me-2"></i>수정하기</a></li>
											<li><a class="dropdown-item" href="#"><i
													class="bi bi-calculator fw-icon me-2"></i>삭제하기</a></li>
										</ul>
									</div>
								</div>

								<!-- Review Content -->
								<h6>
									<span class="text-body fw-light">상품명</span> ${completeBooking.busiNm} ${completeBooking.rmNm} 
								</h6>
								<p>${review.brdTt}</p>
							</div>

						</div>
						<hr class="m-0">
						</c:forEach>
					</c:forEach>


					<!-- Divider -->
				</div>
				<!-- Tabs content item END -->
				<!-- 나의 작성글 리뷰 끝 -->


				<!-- 탭2 나의 작성글 내역 - 여행후기 글 -->
				
				
				<div class="tab-pane fade" id="tab-2">
					<div class="container vstack gap-4"></div>
					<!-- Card item END -->
				</div>
				<!-- Tabs2 content item END -->

				<!-- Tab3 content item START -->
				<div class="tab-pane fade" id="tab-3">
					<div class="bg-mode shadow p-4 rounded overflow-hidden">
						<div class="row g-4 align-items-center">
							<!-- Content -->
							<div class="col-md-9">
								<h6>Looks like you have never booked with BOOKING</h6>
								<h4 class="mb-2">When you book your trip will be shown
									here.</h4>
								<a href="hotel-list.html" class="btn btn-primary-soft mb-0">Start
									booking now</a>
							</div>
							<!-- Image -->
							<div class="col-md-3 text-end">
								<img src="/resources/booking/assets/images/element/17.svg"
									class="mb-n5" alt="">
							</div>
						</div>
					</div>

				</div>
				<!-- Tabs3 content item END -->



				<!-- 탭4 나의 작성글 내역 - 여행후기 글 -->
				<div class="tab-pane fade" id="tab-4">
					<div class="container vstack gap-4">
						<!-- 여기서부터 -->
						<!-- Activities START -->
						<div class="row">
							<!-- Activity item START -->
							<div class="d-sm-flex justify-content-between align-items-center">
								<div class="d-flex align-items-sm-center me-4 ms-sm-0">
									<!-- Avatar -->
									<div class="avatar flex-shrink-0">
										<div class="avatar-img rounded-circle text-bg-success">
											<span
												class="position-absolute top-50 start-50 translate-middle fw-bold"><i
												class="bi bi-check-lg fs-5"></i></span>
										</div>
									</div>
									<!-- Title -->
									<div class="ms-3">
										<h6 class="fw-light m-0">안녕하세요. 만나서 반갑습니당.</h6>
										<small>2023.06.14 13:01</small>
									</div>
								</div>
								<!-- Buttons -->
								<div class="d-flex gap-2 mt-2 mt-sm-0">
									<a href="#" class="btn btn-sm btn-primary-soft">댓글보기</a> <a
										href="#" class="btn btn-sm btn-danger-soft"><i
										class="bi bi-trash"></i></a>
								</div>
							</div>

							<!-- Activity item END -->
						</div>
						<hr>
						<!-- Divider -->

						<div class="row">
							<!-- Activity item START -->
							<div class="d-sm-flex justify-content-between align-items-center">
								<div class="d-flex align-items-sm-center me-4 ms-sm-0">
									<!-- Avatar -->
									<div class="avatar flex-shrink-0">
										<div class="avatar-img rounded-circle text-bg-success">
											<span
												class="position-absolute top-50 start-50 translate-middle fw-bold"><i
												class="bi bi-check-lg fs-5"></i></span>
										</div>
									</div>
									<!-- Title -->
									<div class="ms-3">
										<h6 class="fw-light m-0">안녕하세요. 만나서 반갑습니당.</h6>
										<small>2023.06.14 13:01</small>
									</div>
								</div>
								<!-- Buttons -->
								<div class="d-flex gap-2 mt-2 mt-sm-0">
									<a href="#" class="btn btn-sm btn-primary-soft">댓글보기</a> <a
										href="#" class="btn btn-sm btn-danger-soft"><i
										class="bi bi-trash"></i></a>
								</div>
							</div>

							<!-- Activity item END -->
						</div>
						<hr>
						<!-- Divider -->



					</div>
					<!-- Activities END -->
					<!-- 여기까지이이이이ㅣ -->

				</div>
				<!-- 탭 4 끝 -->

				<!-- Card body END -->
			</div>
		</div>
	</div>
	<!-- Main content END -->