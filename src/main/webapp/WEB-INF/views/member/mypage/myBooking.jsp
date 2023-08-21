<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/splide-master/dist/css/splide.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/glightbox/css/glightbox.css">

<style>
.modal-dialog {
	max-width: 800px;
	max-height: 800px;
}
.card-img{
	width : 245px;
	height: 135.69px;
}
</style>

<%
  // 현재 날짜와 시간을 가져오기 위해 Date 객체를 생성합니다.
  Date today = new Date();
  // 날짜를 원하는 형식으로 포맷팅하기 위해 SimpleDateFormat을 사용합니다.
  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
  // 현재 날짜를 yyyy/mm/dd 형태로 변환하여 문자열로 저장합니다.
  String formattedDate = dateFormat.format(today);
%>

<c:set var="todayFormatted" value="<%= formattedDate%>"/>

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
			<h4 class="card-header-title">예약내역</h4>
		</div>
		<!-- Card body START -->
		<div class="card-body p-0">

			<!-- ======================= Tabs START -->

			<section class="py-2">
				<div class="container">
					<!-- Tabs START -->
					<div class="row">
						<div class="col-12">
							<!-- Outer tabs START -->
							<ul
								class="nav nav-tabs nav-bottom-line nav-responsive nav-justified"
								id="tour-pills-tab" role="tablist">
								<!-- Tab item -->
								<li class="nav-item" role="presentation">
									<button class="nav-link active mb-0" id="tour-pills-tab-1"
										data-bs-toggle="pill" data-bs-target="#tour-pills-tab1"
										type="button" role="tab" aria-controls="tour-pills-tab1"
										aria-selected="true">결제대기</button>
								</li>
								<!-- Tab item -->
								<li class="nav-item" role="presentation">
									<button class="nav-link mb-0" id="tour-pills-tab-2"
										data-bs-toggle="pill" data-bs-target="#tour-pills-tab2"
										type="button" role="tab" aria-controls="tour-pills-tab2"
										aria-selected="false">예약확정</button>
								</li>
								<!-- Tab item -->
								<li class="nav-item" role="presentation">
									<button class="nav-link mb-0" id="tour-pills-tab-3"
										data-bs-toggle="pill" data-bs-target="#tour-pills-tab3"
										type="button" role="tab" aria-controls="tour-pills-tab3"
										aria-selected="false">이용완료</button>
								</li>
								<!-- Tab item -->
								<li class="nav-item" role="presentation">
									<button class="nav-link mb-0" id="tour-pills-tab-4"
										data-bs-toggle="pill" data-bs-target="#tour-pills-tab4"
										type="button" role="tab" aria-controls="tour-pills-tab4"
										aria-selected="false">취소내역</button>
								</li>
							</ul>
							<!-- Outer tabs END -->
						</div>
					</div>
					<!-- Tabs END -->
				</div>

			</section>

			<!-- ======================= Tabs END -->
			


			<!-- ======================= Tabs-content START -->
			<section class="pt-4 pt-md-5">
				<div class="container">
					<div class="row g-4 g-md-5">
						<!-- Tabs Content START -->
						<div class="col-xl-12">
							<div class="tab-content mb-0" id="tour-pills-tabContent">
								<!-- Outer tabs contents START -->
								<!-- 결제대기 시작 -->
								<!-- 숙소 결제대기 -->
								<div class="tab-pane fade show active" id="tour-pills-tab1"
									role="tabpanel" aria-labelledby="tour-pills-tab-1">
									<c:forEach var="bookingListBefPay" items="${bookingListBefPay}" varStatus="stat">
									<c:if test="${bookingListBefPay.busiCode eq 'B01'}">
									<fmt:formatDate var="rsvDt" value="${bookingListBefPay.rsvDt}" pattern="yyyy년 MM월 dd일" />
									 	<p> 예약일 : ${rsvDt}</p>
										<div class="card border mb-4" style="margin-bottom: 20px;">
											<div class="card bg-transparent p-0">
												<div class="card-body p-2 mt-2">
													<div class="row g-2 g-sm-4">
														<div class="col-sm-4">
															<c:if test="${bookingListBefPay.savePath eq null}">
																<img src="/resources/booking/assets/images/category/hotel/4by3/04.jpg" class="card-img">
															</c:if>																
															<c:if test="${bookingListBefPay.savePath != null}">
																<img src="/resources/upload/busi${bookingListBefPay.busiImg}" class="card-img" >
															</c:if>	
														</div>
														
														<!-- Card title and rating -->
														<div class="col-sm-8" style="margin-top: 40px;">
															<!-- Title -->
															<h4 class="card-title mb-1">
																<a href="#">${bookingListBefPay.busiNm}</a> 
																<a href="#" class="btn btn-sm btn-danger-soft mb-0 float-end cancelBefPay"
																	style="margin-right: 10px;" onclick="cancelBefPay('${bookingListBefPay.rsvId}','${bookingListBefPay.busiCode}')">취소</a>
															</h4>
															<span>${bookingListBefPay.busiLoc}</span>
															<!-- List -->
															<ul
																class="list-group list-group-borderless mb-0 mt-2 small">
																<li class="list-group-item d-flex p-0"><i
																	class="far fa-calendar-alt me-2"></i> 
																	<fmt:formatDate var="checkIn" value="${bookingListBefPay.checkIn}" pattern="yyyy/MM/dd" />
																	<fmt:formatDate var="checkOut" value="${bookingListBefPay.checkOut}" pattern="yyyy/MM/dd" /> 
																	${checkIn} ${bookingListBefPay.checkInTime}- ${checkOut} ${bookingListBefPay.checkOutTime}</li>
															</ul>
															<h6 class="mb-0 fw-light small mt-2">
																${bookingListBefPay.rmNum}호 · ${bookingListBefPay.rmNm}름
															</h6>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:if>
									</c:forEach>
									<!-- 숙소 결제대기 -->
									<!-- 렌터카 -->
									<c:forEach var="bookingListBefPay" items="${bookingListBefPay}" varStatus="stat">
									<c:if test="${bookingListBefPay.busiCode eq 'B02'}">
										<div class="card border mb-4" style="margin-bottom: 20px;">
											<div class="card bg-transparent p-0">
												<div class="card-body p-2 mt-2">
													<div class="row g-2 g-sm-4">
														<div class="col-sm-4 text-center">
															<c:if test="${bookingListBefPay.savePath eq null}">
																<img src="/resources/booking/assets/images/category/cab/suv.svg" class="card-img">
															</c:if>																
															<c:if test="${bookingListBefPay.savePath != null}">
																<img src="${bookingListBefPay.carImg}" class="card-img" >
															</c:if>	
														</div>

														<!-- Card title and rating -->
														<div class="col-sm-8" style="margin-top: 40px;">
															<!-- Title -->
															<h4 class="card-title mb-1">
																<a href="hotel-detail.html">${bookingListBefPay.carKnd}</a>
																<c:if test="${bookingListBefPay.rntCheckIn.before(today)}">
																 <a href="#cancelModal"
																	class="btn btn-sm btn-danger-soft mb-0 float-end cancel"
																	style="margin-right: 10px;"
																	data-bs-toggle="modal" data-bs-target="#cancelModal" onclick="cancelBooking('${bookingListBefPay.rsvId}','${bookingListBefPay.carKnd}')">예약취소</a>
																</c:if>
																	
															</h4>
															<span>${bookingListBefPay.carCode}</span>

															<!-- List -->
															<ul class="list-group list-group-borderless mb-0 mt-2 small">
																<li class="list-group-item d-flex p-0"><i
																	class="far fa-calendar-alt me-2"></i>
																	<fmt:formatDate var="rsvSt" value="${bookingListBefPay.rntCheckIn}" pattern="yyyy/MM/dd" />
																	<fmt:formatDate var="rsvEd" value="${bookingListBefPay.rntCheckOut}" pattern="yyyy/MM/dd" /> 
																	${rsvSt}- ${rsvEd}</li>
															</ul>
															<h6 class="mb-0 fw-light small mt-2">
																${bookingListBefPay.carNum}
															</h6>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- Card body END -->

										<!-- Card footer START -->
										<div class="card-footer border-top p-0 pt-3">
											<div class="row">
											</div>
										</div>
										</c:if>
									</c:forEach>
									<!-- 렌터카 끝 -->
								</div>
								<!-- 결제대기 끝 -->



			
								<!--Tab2. 예약확정 시작 - 예약일 >= 입실일 아직 이용 x-->
								<div class="tab-pane fade" id="tour-pills-tab2" role="tabpanel" aria-labelledby="tour-pills-tab-2">
									<c:forEach var="bookingListBefOk" items="${bookingListBefOk}" varStatus="stat">
									<c:set var="formattedDate" value="<%=formattedDate%>" />
										<fmt:formatDate value="${bookingListBefOk.checkIn}" pattern="yyyy/MM/dd" var="checkIn"/>
									<c:if test="${checkIn gt formattedDate && bookingListBefOk.busiCode eq 'B01' &&bookingListBefOk.check1 eq 'N'}">
									<fmt:formatDate var="rsvDt" value="${bookingListBefOk.rsvDt}" pattern="yyyy년 MM월 dd일 " />
									 <p> 예약일 : ${rsvDt}</p>
										<div class="card border mb-4" style="margin-bottom: 20px;">
											<div class="card bg-transparent p-0">
												<div class="card-body p-2 mt-2">
													<div class="row g-2 g-sm-4">
														<div class="col-sm-4 text-center">
														<c:if test="${bookingListBefOk.savePath eq null}">
																<img src="/resources/booking/assets/images/category/hotel/4by3/04.jpg" class="card-img">
															</c:if>																
															<c:if test="${bookingListBefOk.savePath != null}">
																<img src="/resources/upload/busi${bookingListBefOk.busiImg}" class="card-img" >
															</c:if>	
														</div>

														<!-- Card title and rating -->
														<div class="col-sm-8" style="margin-top: 40px;">
															<!-- Title -->
															<h4 class="card-title mb-1">
																<a href="hotel-detail.html">${bookingListBefOk.busiNm}</a>
																 <a href="#cancelModal"
																	class="btn btn-sm btn-danger-soft mb-0 float-end cancel" 
																	style="margin-right: 10px;"
																	data-bs-toggle="modal" data-bs-target="#cancelModal" onclick="cancelBooking('${bookingListBefOk.rsvId}','${bookingListBefOk.busiNm}')">예약취소</a>
															</h4>
															<span>${bookingListBefOk.busiLoc}</span>

															<!-- List -->
															<ul
																class="list-group list-group-borderless mb-0 mt-2 small">
																<li class="list-group-item d-flex p-0"><i
																	class="far fa-calendar-alt me-2"></i>
																	<fmt:formatDate var="checkIn" value="${bookingListBefOk.checkIn}" pattern="yyyy/MM/dd" />
																	<fmt:formatDate var="checkOut" value="${bookingListBefOk.checkOut}" pattern="yyyy/MM/dd" /> 
																	${checkIn} ${bookingListBefOk.checkInTime}- ${checkOut} ${bookingListBefOk.checkOutTime}</li>
																<li class="list-group-item d-flex text-success p-0">
																</li>
															</ul>
															<h6 class="mb-0 fw-light small mt-2">
																${bookingListBefOk.rmNum}호 · ${bookingListBefOk.rmNm}룸
															</h6>
<!-- 															<a href="#" class="btn btn-sm btn-link p-0 mb-0 text-decoration-underline ms-2 float-end" style="margin-right: 10px;">예약상세</a> -->
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:if>
									
												
									
									<!-- 렌터카 -->
										<c:set var="formattedDate" value="<%=formattedDate%>" />
										<fmt:formatDate value="${bookingListBefOk.rntCheckIn}" pattern="yyyy/MM/dd" var="rntSt"/>
									<c:if test="${rntSt gt formattedDate && bookingListBefOk.busiCode eq 'B02'}">
<%-- 									<c:if test="${bookingListBefOk.rntCheckIn > bookingListBefOk.rsvDt && bookingListBefOk.busiCode eq 'B02'}"> --%>
									<fmt:formatDate var="rsvDt" value="${bookingListBefOk.rsvDt}" pattern="yyyy년 MM월 dd일 " />
									 <p> 예약일 : ${rsvDt}</p>
										<div class="card border mb-4" style="margin-bottom: 20px;">
											<div class="card bg-transparent p-0">
												<div class="card-body p-2 mt-2">
													<div class="row g-2 g-sm-4">
														<div class="col-sm-4 text-center">
															<c:if test="${bookingListBefOk.savePath eq null}">
																<img src="/resources/booking/assets/images/category/cab/suv.svg" class="card-img">
															</c:if>																
															<c:if test="${bookingListBefOk.savePath != null}">
																<img src="${bookingListBefOk.carImg}" class="card-img" >
															</c:if>																
														</div>

														<!-- Card title and rating -->
														<div class="col-sm-8" style="margin-top: 40px;">
															<!-- Title -->
															<h4 class="card-title mb-1">
<%-- 																<a href="hotel-detail.html">${bookingListBefOk.rsvId}</a> --%>
																<a href="hotel-detail.html">${bookingListBefOk.carKnd}</a>
																 <a href="#cancelModal"
																	class="btn btn-sm btn-danger-soft mb-0 float-end cancel"
																	style="margin-right: 10px;"
																	data-bs-toggle="modal" data-bs-target="#cancelModal" onclick="cancelBooking('${bookingListBefOk.rsvId}','${bookingListBefOk.carKnd}')">예약취소</a>
															</h4>
															<span>${bookingListBefOk.carCode}</span>

															<!-- List -->
															<ul
																class="list-group list-group-borderless mb-0 mt-2 small">
																<li class="list-group-item d-flex p-0"><i
																	class="far fa-calendar-alt me-2"></i>
																	<fmt:formatDate var="rntCheckIn" value="${bookingListBefOk.rntCheckIn}" pattern="yyyy/MM/dd" />
																	<fmt:formatDate var="rntCheckOut" value="${bookingListBefOk.rntCheckOut}" pattern="yyyy/MM/dd" /> 
																	${rntCheckIn}- ${rntCheckOut}</li>
															</ul>
															<h6 class="mb-0 fw-light small mt-2">
																${bookingListBefOk.carNum}
															</h6>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- Card body END -->

										<!-- Card footer START -->
										<div class="card-footer border-top p-0 pt-3">
											<div class="row">
											</div>
										</div>
										</c:if>
									</c:forEach>
									<!-- 렌터카 끝 -->
								</div>
								<!-- 결제완료 끝 -->
								

								
								<!-- 이용완료 시작  입실일이 오늘 포함 예약일보다 작을떄-->
								<div class="tab-pane fade" id="tour-pills-tab3" role="tabpanel" aria-labelledby="tour-pills-tab-3">
									<!-- 숙소 -->
									<c:forEach var="bookingListBefOk" items="${bookingListBefOk}" varStatus="stat">
									<c:set var="formattedDate" value="<%=formattedDate%>" />
										<fmt:formatDate value="${bookingListBefOk.checkIn}" pattern="yyyy/MM/dd" var="checkIn"/>
									<c:if test="${checkIn le formattedDate && bookingListBefOk.busiCode eq 'B01'}">
									<fmt:formatDate var="rsvDt" value="${bookingListBefOk.rsvDt}" pattern="yyyy년 MM월 dd일" />
									 <p> 예약일 : ${rsvDt}</p>
										<div class="card border mb-4" style="margin-bottom: 20px;">
											<div class="card bg-transparent p-0">
												<div class="card-body p-2 mt-2">
													<div class="row g-2 g-sm-4">
														<div class="col-sm-4">
															<c:if test="${bookingListBefOk.savePath eq null}">
																<img src="/resources/booking/assets/images/category/hotel/4by3/04.jpg" class="card-img">
															</c:if>																
															<c:if test="${bookingListBefOk.savePath != null}">
																<img src="/resources/upload/busi${bookingListBefOk.busiImg}" class="card-img" alt="">
															</c:if>	
														</div>

														<!-- Card title and rating -->
														<div class="col-sm-8" style="margin-top: 40px;">
															<!-- Title -->
															<h4 class="card-title mb-1">
																<a href="hotel-detail.html">${bookingListBefOk.busiNm}</a> 
																<c:if test="${bookingListBefOk.rvwCnt eq 0}">
																<a href="#reviewModal" class="btn btn-sm btn-primary-soft mb-0 float-end review"
																	data-bs-toggle="modal" data-bs-target="#reviewModal"
																	style="margin-right: 10px;" onclick="reviewWrite('${bookingListBefOk.rsvId}','${bookingListBefOk.busiNm}')">리뷰작성</a>
																</c:if>
																<c:if test="${bookingListBefOk.rvwCnt eq 1 && bookingListBefOk.rvwDel eq 'N'}">
																<a href="/member/mypage/myWrite" class="btn btn-sm btn-primary-soft mb-0 float-end reDetail">리뷰상세보기</a>	
																</c:if>
															</h4>
															<span>${bookingListBefOk.busiLoc}</span>

															<!-- List -->
															<ul
																class="list-group list-group-borderless mb-0 mt-2 small">
																<li class="list-group-item d-flex p-0"><i
																	class="far fa-calendar-alt me-2"></i>
																	<fmt:formatDate var="checkIn" value="${bookingListBefOk.checkIn}" pattern="yyyy/MM/dd" />
																	<fmt:formatDate var="checkOut" value="${bookingListBefOk.checkOut}" pattern="yyyy/MM/dd" /> 
																	${checkIn} ${bookingListBefOk.checkInTime}-
																	${checkOut} ${bookingListBefOk.checkOutTime}</li>
																<li class="list-group-item d-flex text-success p-0">
																</li>
															</ul>
															<h6 class="mb-0 fw-light small mt-2">
																${bookingListBefOk.rmNum}호  · ${bookingListBefOk.rmNm}룸
															</h6>
														</div>
													</div>
												</div>
											</div>
										</div>
										</c:if>


									<!-- 렌터카 -->
									<c:set var="formattedDate" value="<%=formattedDate%>" />
										<fmt:formatDate value="${bookingListBefOk.rntCheckIn}" pattern="yyyy/MM/dd" var="rntSt"/>
									<c:if test="${rntSt le formattedDate && bookingListBefOk.busiCode eq 'B02'}">
<%-- 									<c:if test="${bookingListBefOk.rsvDt >= bookingListBefOk.rntCheckIn && bookingListBefOk.busiCode eq 'B02'}"> --%>
<%-- 										<c:if test="${bookingListBefOk.rntCheckIn <= bookingListBefOk.rsvDt && bookingListBefOk.busiCode eq 'B02'}"> --%>
										<fmt:formatDate var="rsvDt" value="${bookingListBefOk.rsvDt}" pattern="yyyy년 MM월 dd일" />
									 	<p> 예약일 : ${rsvDt}</p>
										<div class="card border mb-4" style="margin-bottom: 20px;">
											<div class="card bg-transparent p-0">
												<div class="card-body p-2 mt-2">
													<div class="row g-2 g-sm-4">
														<div class="col-sm-4 text-center">
															<c:if test="${bookingListBefOk.savePath eq null}">
																<img src="/resources/booking/assets/images/category/cab/suv.svg" class="card-img" >
															</c:if>																
															<c:if test="${bookingListBefOk.savePath != null}">
																<img src="${bookingListBefOk.carImg}" class="card-img" >
															</c:if>	
														</div>

														<!-- Card title and rating -->
														<div class="col-sm-8" style="margin-top: 40px;">
															<!-- Title -->
															<h4 class="card-title mb-1">
<%-- 																<a href="hotel-detail.html">${bookingListBefOk.rsvId}</a> --%>
																<a href="hotel-detail.html">${bookingListBefOk.carKnd}</a>
																<c:if test="${bookingListBefOk.rvwCnt eq 0}">
																 <a href="#reviewModal" class="btn btn-sm btn-primary-soft mb-0 float-end review"
																	data-bs-toggle="modal" data-bs-target="#reviewModal"
																	style="margin-right: 10px;"onclick="reviewWrite('${bookingListBefOk.rsvId}','${bookingListBefOk.carKnd}')"> 리뷰작성 </a>
																</c:if>
																<c:if test="${bookingListBefOk.rvwCnt eq 1 && bookingListBefOk.rvwDel eq 'N'}">
																<a href="/member/mypage/myWrite" class="btn btn-sm btn-primary-soft mb-0 float-end reDetail">리뷰상세보기</a>	
																</c:if>
															</h4>
															<span>${bookingListBefOk.carCode}</span>
															<input type="hidden" name="rsvId" id ="rsvId" value="${bookingListBefOk.rsvId}">

															<!-- List -->
															<ul
																class="list-group list-group-borderless mb-0 mt-2 small">
																<li class="list-group-item d-flex p-0"><i
																	class="far fa-calendar-alt me-2"></i>
																	<fmt:formatDate var="rntSt" value="${bookingListBefOk.rntSt}" pattern="yyyy/MM/dd" />
																	<fmt:formatDate var="rntEd" value="${bookingListBefOk.rntEd}" pattern="yyyy/MM/dd" /> 
																	${rntSt}- ${rntEd}</li>
																<li class="list-group-item d-flex text-success p-0">
																</li>
															</ul>
															<h6 class="mb-0 fw-light small mt-2">
																${bookingListBefOk.carNum}
															</h6>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- Card body END -->
										</c:if>
									</c:forEach>
									<!-- 렌터카 끝 -->


								</div>
								<!--  이용완료 끝 -->
								
								<!--취소내역 시작 -->
								<!-- 예약 취소 환불 100% X -->
								<div class="tab-pane fade" id="tour-pills-tab4" role="tabpanel" aria-labelledby="tour-pills-tab-4">
								<c:forEach var="bookingListCancel" items="${bookingListCancel}" varStatus="stat">
								<c:if test="${bookingListCancel.busiCode eq 'B01'}">
								<fmt:formatDate var="rfdReqDt" value="${bookingListCancel.rfdReqDt}" pattern="yyyy년 MM월 dd일" />
									 	<p> 취소신청일 : ${rfdReqDt}</p>
										<div class="card border mb-4" style="margin-bottom: 20px;">
											<div class="card bg-transparent p-0">
												<div class="card-body p-2 mt-2">
													<div class="row g-2 g-sm-4">
														<div class="col-sm-4">
															<c:if test="${bookingListCancel.savePath eq null}">
																<img src="/resources/booking/assets/images/category/hotel/4by3/04.jpg" class="card-img">
															</c:if>																
															<c:if test="${bookingListCancel.savePath != null}">
																<img src="/resources/upload/busi${bookingListCancel.busiImg}" class="card-img" alt="">
															</c:if>	
														</div>

														<!-- Card title and rating -->
														<div class="col-sm-8" style="margin-top: 40px;">
															<!-- Title -->
															<h4 class="card-title mb-1">
<%-- 																<a href="hotel-detail.html">${bookingListCancel.rsvId}</a>  --%>
																<a href="hotel-detail.html">${bookingListCancel.busiNm}</a> 
																<a href="#" class="btn btn-sm btn-warning-soft mb-0 float-end cancel" style="margin-right: 10px;">취소신청</a>
															</h4>
															<span>${bookingListCancel.busiLoc}</span>
															<!-- List -->
															<ul
																class="list-group list-group-borderless mb-0 mt-2 small">
																<li class="list-group-item d-flex p-0"><i
																	class="far fa-calendar-alt me-2"></i>
																	<fmt:formatDate var="checkIn" value="${bookingListCancel.checkIn}" pattern="yyyy/MM/dd" />
																	<fmt:formatDate var="checkOut" value="${bookingListCancel.checkOut}" pattern="yyyy/MM/dd" /> 
																	${checkIn} ${bookingListCancel.checkInTime}-
																	${checkOut} ${bookingListCancel.checkOutTime}</li>
															</ul>
															<h6 class="mb-0 fw-light small mt-2">
																${bookingListCancel.rmNum}호 · ${bookingListCancel.rmNm}룸
															</h6>
														</div>
													</div>
												</div>
											</div>
										</div>
										</c:if>
									</c:forEach>
									<!-- 숙박 취소신청 끝 -->
									
									<!-- 렌터카 취소신청 시작-->
									<c:forEach var="bookingListCancel" items="${bookingListCancel}" varStatus="stat">
									<c:if test="${bookingListCancel.busiCode eq 'B02'}">
									<fmt:formatDate var="rfdReqDt" value="${bookingListCancel.rfdReqDt}" pattern="yyyy년 MM월 dd일" />
									<p> 취소신청일 : ${rfdReqDt}</p>
										<div class="card border mb-4" style="margin-bottom: 20px;">
											<div class="card bg-transparent p-0">
												<div class="card-body p-2 mt-2">
													<div class="row g-2 g-sm-4">
														<div class="col-sm-4 text-center">
															<c:if test="${bookingListCancel.savePath eq null}">
																<img src="/resources/booking/assets/images/category/cab/suv.svg" class="card-img">
															</c:if>																
															<c:if test="${bookingListCancel.savePath != null}">
																<img src="${bookingListCancel.carImg}" class="card-img" alt="">
															</c:if>	
														</div>

														<!-- Card title and rating -->
														<div class="col-sm-8" style="margin-top: 40px;">
															<!-- Title -->
															<h4 class="card-title mb-1">
<%-- 																<a href="hotel-detail.html">${bookingListCancel.rsvId}</a> --%>
																<a href="hotel-detail.html">${bookingListCancel.carKnd}</a>
																 <a href="#" class="btn btn-sm btn-warning-soft mb-0 float-end" style="margin-right: 10px;">취소신청 </a>
															</h4>
															<span>${bookingListCancel.carCode}</span>
															<input type="hidden" name="rsvId" id ="rsvId" value="${bookingListCancel.rsvId}">

															<!-- List -->
															<ul
																class="list-group list-group-borderless mb-0 mt-2 small">
																<li class="list-group-item d-flex p-0"><i
																	class="far fa-calendar-alt me-2"></i>
																<fmt:formatDate var="rntCheckIn" value="${bookingListCancel.rntCheckIn}" pattern="yyyy/MM/dd" /> 
																<fmt:formatDate var="rntCheckOut" value="${bookingListCancel.rntCheckOut}" pattern="yyyy/MM/dd" /> 
																	${rntCheckIn}- ${rntCheckOut}</li>
															</ul>
															<h6 class="mb-0 fw-light small mt-2">
																${bookingListCancel.carNum}
															</h6>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- Card body END -->
										</c:if>
									</c:forEach>
									<!-- 렌터카 숙박신청 끝-->
									
									
									
									<!-- 숙박 - 취소확정 시작 -->
									<c:forEach var="bookingListCancelOk" items="${bookingListCancelOk}" varStatus="stat">
									<c:if test="${bookingListCancelOk.busiCode eq 'B01'}">
										<fmt:formatDate var="rfdDt" value="${bookingListCancelOk.rfdDt}" pattern="yyyy년 MM월 dd일" />
									 	<p> 취소확정일 : ${rfdDt}</p>
										<div class="card border mb-4" style="margin-bottom: 20px;">
											<div class="card bg-transparent p-0">
												<div class="card-body p-2 mt-2">
													<div class="row g-2 g-sm-4">
														<div class="col-sm-4">
															<img src="/resources/booking/assets/images/category/hotel/4by3/04.jpg" class="card-img">
														</div>
														<!-- Card title and rating -->
														<div class="col-sm-8" style="margin-top: 40px;">
															<!-- Title -->
															<h4 class="card-title mb-1">
																<a href="hotel-detail.html">${bookingListCancelOk.rsvId}</a> 
																<a href="hotel-detail.html">${bookingListCancelOk.busiNm}</a> 
																<a href="#" class="btn btn-sm btn btn-secondary-soft mb-0 float-end" style="margin-right: 10px;">취소확정</a>
																	
															</h4>
															<span> ${bookingListCancelOk.busiLoc}</span>
															<!-- List -->
														<ul
																class="list-group list-group-borderless mb-0 mt-2 small">
																<li class="list-group-item d-flex p-0"><i
																	class="far fa-calendar-alt me-2"></i>
																	<fmt:formatDate var="checkIn" value="${bookingListCancelOk.checkIn}" pattern="yyyy/MM/dd" />
																	<fmt:formatDate var="checkOut" value="${bookingListCancelOk.checkOut}" pattern="yyyy/MM/dd" /> 
																	${checkIn} ${bookingListCancelOk.checkInTime}-
																	${checkOut} ${bookingListCancelOk.checkOutTime}</li>
															</ul>
															<h6 class="mb-0 fw-light small mt-2">
																${bookingListCancelOk.rmNum}호 · ${bookingListCancelOk.rmNm}룸
															</h6>
														</div>
													</div>
												</div>
											</div>
										</div>
										</c:if>
									</c:forEach>
									<!-- 숙박 취소확정 K04 -->
									
									


									<!-- 렌터카 취소확정-->
									<c:forEach var="bookingListCancelOk" items="${bookingListCancelOk}" varStatus="stat">
									<c:if test="${bookingListCancelOk.busiCode eq 'B02'}">
									<fmt:formatDate var="rfdDt" value="${bookingListCancelOk.rfdDt}" pattern="yyyy년 MM월 dd일" />
									 	<p> 취소확정일 : ${rfdDt}</p>
										<div class="card border mb-4" style="margin-bottom: 20px;">
											<div class="card bg-transparent p-0">
												<div class="card-body p-2 mt-2">
													<div class="row g-2 g-sm-4">
														<div class="col-sm-4 text-center">
															<c:if test="${bookingListCancelOk.savePath eq null}">
																<img src="/resources/booking/assets/images/category/cab/suv.svg" class="card-img" >
															</c:if>																
															<c:if test="${bookingListCancelOk.savePath != null}">
																<img src="${bookingListCancelOk.savePath}" class="card-img" >
															</c:if>	
														</div>

														<!-- Card title and rating -->
														<div class="col-sm-8" style="margin-top: 40px;">
															<!-- Title -->
															<h4 class="card-title mb-1">
																<a href="hotel-detail.html">${bookingListCancelOk.rsvId}</a>
																<a href="hotel-detail.html">${bookingListCancelOk.carKnd}</a>
																 <a href="#" class="btn btn-sm btn btn-secondary-soft mb-0 float-end" style="margin-right: 10px;">취소확정 </a>
															</h4>
															<span>${bookingListCancelOk.carCode}</span>
															<input type="hidden" name="rsvId" id ="rsvId" value="${bookingListCancelOk.rsvId}">
															<!-- List -->
															<ul class="list-group list-group-borderless mb-0 mt-2 small">
																<li class="list-group-item d-flex p-0">
																<i class="far fa-calendar-alt me-2"></i>
																<fmt:formatDate var="rntCheckIn" value="${bookingListCancelOk.rntCheckIn}" pattern="yyyy/MM/dd" /> 
																<fmt:formatDate var="rntCheckOut" value="${bookingListCancelOk.rntCheckOut}" pattern="yyyy/MM/dd" /> 
																	${rntCheckIn}- ${rntCheckOut}</li>
																	
															</ul>
															
															<ul
																class="list-group list-group-borderless mb-0 mt-2 small">
																<li class="list-group-item d-flex p-0"><i
																	class="far fa-calendar-alt me-2"></i>
																	<fmt:formatDate var="rntSt" value="${bookingListBefOk.rntSt}" pattern="yyyy/MM/dd" />
																	<fmt:formatDate var="rntEd" value="${bookingListBefOk.rntEd}" pattern="yyyy/MM/dd" /> 
																	${rntSt}- ${rntEd}</li>
																<li class="list-group-item d-flex text-success p-0">
																</li>
															</ul>
															
															
															<h6 class="mb-0 fw-light small mt-2">
																${bookingListCancelOk.carNum}
															</h6>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- Card body END -->
										</c:if>
									</c:forEach>
									<!-- 렌터카 끝 -->
								</div>
								<!-- 취소내역  -->
							</div>
						</div>
						<!-- Tabs Content END -->

					</div>
					<!-- Row END -->
				</div>
			</section>


<!-- 리뷰 작성모달 -->
			<div class="modal fade" id="reviewModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">리뷰 작성하기</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							
								<form:form modelAttribute="rvwVO" id="imageForm" action="/member/mypage/myReivew?${_csrf.parameterName}=${_csrf.token}"  method="post" enctype="multipart/form-data">			
								<div class="mb-3">
									<label for="message-text" class="col-form-label">상품명 </label>
									<input type="text" class="form-control" id="busiNm" name="busiNm" readOnly>
									<input type="hidden" class="form-control" id="rsvId" name="rsvId" readOnly>
								</div>
								
								<div class="mb-3">
									<label for="message-text" class="col-form-label">별점 </label>
										<select id="rvwStar" class="form-select js-choice border-0 z-index-9 bg-transparent">
											<option value="">선택하세요</option>
											<option id= "rvwStar" value="5">★★★★★</option>
											<option id= "rvwStar" value="4">★★★★☆</option>
											<option id= "rvwStar" value="3">★★★☆☆</option>
											<option id= "rvwStar" value="2">★★☆☆☆</option>
											<option id= "rvwStar" value="1">★☆☆☆☆</option>
										</select>
								</div>
								<div class="mb-3">
									<label for="message-text" class="col-form-label">리뷰내용  </label>
									<textarea class="form-control" id="message-text" name='rvwCntn'></textarea>
								</div>
												
								<div class="mb-3">
									<label for="message-text" class="col-form-label">첨부파일 : </label>
									 <input class="form-control" name="uploads" type="file" id="upload" accept="image/gif, image/jpeg, image/png" multiple>
												<p class="small mb-0 mt-2">
													<b>주의 :</b> Only JPG, JPEG, and PNG. Our suggested dimensions are 600px * 450px.
												</p>
												<sec:csrfInput/>
									<!-- 이미지 미리보기 -->
									<div id="preview"></div>
								</div>
								<sec:csrfInput />
							</form:form>
								
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary myReview">작성하기</button>
						</div>
					</div>
				</div>
			</div>
	<!-- 리뷰 작성모달 끝 -->
			
	<!-- 예약취소 -->
	<div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">예약 취소</h5>
					<button type="button" class="btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form id="cancelForm" action="/member/mypage/myCancel" method="post">
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">상품명 : </label>
							<input type="text" class="form-control" id="busiNm" name="busiNm" readOnly>
						</div>
							<input type="hidden" class="form-control" name="rsvId"/> 
							<input type="hidden" class="form-control" name="rfdReqDt"/>
							<input type="hidden" class="form-control" name="rsvSt"/>
							<!-- 
							{"rsvId":"R20221113120001","rsvCode":"K02","rsvDt":1668265200000
							,"memId":"heeee","busiId":null,"cupnId":null,"gstEmail":null}
							 -->
							 <input type="hidden" class="form-control" name="rsvDt"/>
						<label for="recipient-name" class="col-form-label">취소 사유를 선택해주세요.</label> </br>
					<label>
						<input type="checkbox" id="cs_biz_form1" name="rfdResn" value="단순변심">단순변심</p>
						<input type="checkbox" id="cs_biz_form2" name="rfdResn" value="옵션변경">옵션변경</p>
						<input type="checkbox" id="cs_biz_form3" name="rfdResn" value="결제수단">결제수단</p>
						<input type="checkbox" id="cs_biz_form4" name="rfdResn" value="천재지변">천재지변</p>
						<input type="checkbox" id="cs_biz_form5" name="rfdResn" value="기타">기타</p>
						<input type="text" class="form-control" id="chkEtc" style="display:none; width: 770px;" required /></p>
					</label>
					<sec:csrfInput/>
					</form:form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary close" data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="cancelOk">확인</button>
				</div>
			</div>
		</div>
	</div>


			<!-- =======================
Tabs-content END -->

<script type="text/javascript">

function reviewWrite(data, data2){
	//리뷰 모달창 띄우기
	$(".review").on("click", function() {
		$("#reviewModal").fadeIn(300);
		var rvwCntn = $('textarea[name=rvwCntn]').val("");
		var rvwStar = $("#rvwStar").val("");
		var rsvId = data;
		console.log("rsvId : " + data)
	});
	
	
	var busiNm= data2;
	var rsvId =data;
	
	$('input[name=busiNm]').attr('value',busiNm);
	$('input[name=rsvId]').attr('value',rsvId);
	

	$(".myReview").on("click", function() {
		$("#imageForm").submit();
	})
}
		
// 		  var rvwCntn = $('textarea[name=rvwCntn]').val();
// 		  var rvwStar = $("#rvwStar").val();
// 		  var rsvId = data;
// 		  var imageInput = document.getElementById("image"); // 이미지 파일 input 요소 가져오기

// 		  var formData = new FormData(); // FormData 객체 생성
// 		  formData.append('rsvId', rsvId);
// 		  formData.append('rvwCntn', rvwCntn);
// 		  formData.append('rvwStar', rvwStar);
// 		  for (var i = 0; i < imageInput.files.length; i++) {
// 		    formData.append('image', imageInput.files[i]); // 이미지 파일 추가
// 		  }

// 		  console.log("detail : " + JSON.stringify(formData));

// 		  // 이미지를 포함한 폼 데이터를 AJAX 요청으로 서버로 전송
// 		  $.ajax({
// 		    url: "/member/mypage/myReivew",
// 		    type: "POST",
// 		    data: formData,
// 		    contentType: false,
// 		    processData: false,
// 		    beforeSend: function(xhr) {
// 		      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
// 		    },
// 		    success: function(result) {
// 		      if (result > 0) {
// 		        alert("리뷰등록이 완료되었습니다. 작성한 글은 나의 작성글 내역에서 보실 수 있습니다.");
// 		        location.reload();
// 		      } else {
// 		        alert("리뷰 등록 도중 오류가 발생했습니다. 다시 시도해주세요");
// 		      }
// 		    },
// 		    error: function(error) {
// 		      console.error("에러 발생: " + error);
// 		    }
		    
// 		  });
// 		});




//결제대기 취소
function cancelBefPay(data,data2){
		var rsvId = data;
		var busiCode = data2;
		console.log("busiCode : " + busiCode);
		
		var dd = {
				"rsvId":rsvId
		}
		console.log(dd + JSON.stringify(dd))
		
		if(busiCode =='B01'){
			console.log(busiCode)
			$.ajax({
				url : "/member/mypage/myBooking/cancelBefPayRsv",
				contentType:"application/json;charset=utf-8",
				data : data,
				type : "post",
				dataType: "text",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success:function(result){
					alert("결제 대기 취소되었습니다.");
					location.reload();
				}
			})
		} else{
			$.ajax({
				url : "/member/mypage/myBooking/cancelBefPayRnt",
				contentType:"application/json;charset=utf-8",
				data : data,
				type : "post",
				dataType: "text",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success:function(result){
					alert("결제 대기 취소되었습니다.");
					location.reload();
				}
			})
		}
		

	}
	

//예약취소
//체크박스 하나만 선택 하게
$(document).ready(function() {
	//x 버튼 누르면
	$('.close').on("click",function(){
		$('input[type="checkbox"][name="rfdResn"]').prop('checked',false);
		$("#rfdResn").val("");
	})
	
	//체크박스 하나만 선택 하게
	 $('input[type="checkbox"][name="rfdResn"]').click(function(){
	  if($(this).prop('checked')){
	     $('input[type="checkbox"][name="rfdResn"]').prop('checked',false);
	     $("#rfdResn").val("");
	     $("#chkEtc").css("display","none");
	     $(this).prop('checked',true);
	    }
	   });
		
	 	//기타 선택
		$("#cs_biz_form5").on("click",function(){
			console.log("ischecked : " + $(this).is(":checked"));
			if($(this).is(":checked")){
				$("#chkEtc").css("display","block");
			}else{
				$("#chkEtc").val("");
				$("#chkEtc").css("display","none");
			}
		});
		
	 
		//예약취소 
		$("#cancelOk").on("click",function(){
			var rsvId =  $('input[name="rsvId"]').val();
			var rfdReqDt = $('input[name="rfdReqDt"]').val();
			var rsfResn = [];
			var rsvDt = $('input[name="rsvDt"]').val();
			
			//rfdResn 이유 checked
			$('input:checkbox[name=rfdResn]').each(function (index) {
			    if ($(this).is(":checked") == true) {
			        var value = $(this).val();
			        rsfResn.push(value);
			    }
			});
			if(rsfResn[0]=="기타"){
				rsfResn[0] = $("#chkEtc").val();
			}
			console.log("rsfResn[0] : " + rsfResn[0])
			
			//날짜 계산
			var rsvSt = $('input[name="rsvSt"]').val();
			var today = new Date(); // 현재 날짜와 시간을 가져옵니다.
			var selectedDate = new Date(rsvSt); // 입력된 날짜를 가져옵니다.
			// 두 날짜 사이의 차이를 계산합니다.
			var timeDiff = selectedDate.getTime()-today.getTime();
			// 일 단위로 변환합니다.
			var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
			console.log(diffDays); // 차이를 출력합니다.

			var data = {
					'rsvId':rsvId,
					'rfdResn':rsfResn[0]
			};
			console.log("data : " + JSON.stringify(data));
			
			if(diffDays>=30){
				//수수료 없음.
				$.ajax({
					url : "/member/mypage/myBooking/cancelFee0",
					contentType:"application/json;charset=utf-8",
					data : JSON.stringify(data),
					type : "post",
					dataType: "text",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						alert("예약이 취소되었습니다.")
						location.reload();
					}
					
				})
			}else{
				$.ajax({
					//수수료 있음.
					url : "/member/mypage/myBooking/cancelHasFee",
					contentType:"application/json;charset=utf-8",
					data : JSON.stringify(data),
					type : "post",
					dataType: "text",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						alert("취소신청되었습니다. 취소내역은 예약내역의 취소내역에서 보실 수 있습니다.");
						location.reload();
					}
					
					
				});	
			}
	});
});
	 
//예약취소 모달창에 상품명 넣기.
function cancelBooking(data,data2){
	console.log("data : " + data);
	console.log("data2 : " + data2);
	var rsvId = data;
	var  busiNm= data2;
	console.log("rsvId : " + rsvId);
	console.log("busiNm : " + busiNm);
	
	$('input[name=busiNm]').attr('value',busiNm);
	
	let dt = {"rsvId":data,"rsvCode":"K02"};
	console.log("dt : " + JSON.stringify(dt));
	
	$.ajax({
		url:"/member/mypage/myBooking/rsvDetail",
		contentType:"application/json;charset:utf-8",
		data:JSON.stringify(dt),
		type:"post",
		dataType:"json",
		beforeSend : function (xhr) {
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success:function(result){
			console.log("result : " + JSON.stringify(result));
			$("input[name='rsvDt']").val(result.rsvDtStr);
			$("input[name='rsvId']").val(result.rsvId);
			$("input[name='rsvSt']").val(result.rsvSt);
		}
	});
	
}





//이미지 업로드
$("#uploadfile-1").on("change", handleImg);

function handleImg(e) {
	console.log("개똥이");
	let files = e.target.files;
	let fileArr = Array.prototype.slice.call(files);

	fileArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("이미지만 가능합니다.");
			return;
		}

		let reader = new FileReader();
		reader.onload = function(e) {
			let img_html = "<img src='" + e.target.result
					+ "' style='width:20%;'/>";
			$("#div01").append(img_html);
		}
		reader.readAsDataURL(f);
	});
}

// 파일 선택 시 이미지 미리보기 함수
function previewImages() {
  var preview = document.getElementById("preview");
  var files = document.getElementById("upload").files;

  preview.innerHTML = ""; // 미리보기 영역 초기화

  function readAndPreview(file) {
    // 지원하는 이미지 형식인지 확인
    if (/\.(jpe?g|png|gif)$/i.test(file.name)) {
      var reader = new FileReader();

      reader.addEventListener("load", function () {
        var image = new Image();
        image.style.maxWidth = "200px"; // 이미지의 최대 너비 설정
        image.style.margin = "10px"; // 이미지 간격 설정
        image.src = this.result;
        preview.appendChild(image);
      });

      reader.readAsDataURL(file);
    }
  }

  if (files) {
    [].forEach.call(files, readAndPreview); // 선택한 모든 파일에 대해 미리보기 함수 호출
  }
}

// 파일 선택 시 미리보기 함수 호출
document.getElementById("upload").addEventListener("change", previewImages);

</script>