<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<section class="pt-4 pt-lg-5">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 mx-auto text-center">
				<!-- Title -->
				<h1>자주 묻는 질문</h1>
				<!-- Info -->
				<p class="text-primary">wonderWay FAQ</p>
			</div>
		</div>
	</div>
</section>

<section class="pt-0">
	<div class="container">
		<div class="row">
			<div class="col-xl-10 mx-auto">
				<div class="tab-pane fade show active" id="tab-1">
					<div class="card border" >
						<ul class="nav nav-tabs nav-bottom-line nav-responsive nav-justified">
							<li class="nav-item"><a class="nav-link mb-0 active" data-bs-toggle="tab" href="#tab-2">국내/해외 숙소</a></li>
							<li class="nav-item"><a class="nav-link mb-0" data-bs-toggle="tab" href="#tab-3">렌터카</a></li>
							<li class="nav-item"><a class="nav-link mb-0" data-bs-toggle="tab" href="#tab-4">교통/항공</a></li>
							<li class="nav-item"><a class="nav-link mb-0" data-bs-toggle="tab" href="#tab-5">쿠폰/포인트</a></li>
							<li class="nav-item"><a class="nav-link mb-0" data-bs-toggle="tab" href="#tab-6">결제/영수증</a></li>
							<li class="nav-item"><a class="nav-link mb-0" data-bs-toggle="tab" href="#tab-7">회원</a></li>
						</ul>
						<div class="tab-content p-1 p-sm-2" id="nav-tabContent">
							<div class="tab-pane fade show active" id="tab-2">
								<div class="accordion accordion-icon accordion-bg-light" id="accordionExample2">
									<!-- Item -->
									<c:forEach var="faqVO" items="${f01List}" varStatus="stat"> 
										<div class="accordion-item mb-3">
											<h6 class="accordion-header font-base" id="heading-${stat.index + 1}">
												<button class="accordion-button fw-bold rounded d-inline-block collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${stat.index + 1}" aria-expanded="false" aria-controls="collapse-${stat.index + 1}">
													${faqVO.faqTt}
												</button>
											</h6>
											<!-- Body -->
											<div id="collapse-${stat.index + 1}" class="accordion-collapse collapse" aria-labelledby="heading-1" data-bs-parent="#accordionExample2" style="">
												<div class="accordion-body mt-3">
													${faqVO.faqAns}
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							
							<div class="tab-pane fade" id="tab-3">
								<div class="accordion accordion-icon accordion-bg-light" id="accordionExample2">
									<!-- Item -->
									<c:forEach var="faqVO" items="${f02List}" varStatus="stat"> 
										<div class="accordion-item mb-3">
											<h6 class="accordion-header font-base" id="heading-${stat.index + 1}">
												<button class="accordion-button fw-bold rounded d-inline-block collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${stat.index + 1}" aria-expanded="false" aria-controls="collapse-${stat.index + 1}">
													${faqVO.faqTt}
												</button>
											</h6>
											<!-- Body -->
											<div id="collapse-${stat.index + 1}" class="accordion-collapse collapse" aria-labelledby="heading-1" data-bs-parent="#accordionExample2" style="">
												<div class="accordion-body mt-3">
													${faqVO.faqAns}
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							
							<div class="tab-pane fade" id="tab-4">
								<div class="accordion accordion-icon accordion-bg-light" id="accordionExample2">
									<!-- Item -->
									<c:forEach var="faqVO" items="${f03List}" varStatus="stat"> 
										<div class="accordion-item mb-3">
											<h6 class="accordion-header font-base" id="heading-${stat.index + 1}">
												<button class="accordion-button fw-bold rounded d-inline-block collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${stat.index + 1}" aria-expanded="false" aria-controls="collapse-${stat.index + 1}">
													${faqVO.faqTt}
												</button>
											</h6>
											<!-- Body -->
											<div id="collapse-${stat.index + 1}" class="accordion-collapse collapse" aria-labelledby="heading-1" data-bs-parent="#accordionExample2" style="">
												<div class="accordion-body mt-3">
													${faqVO.faqAns}
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="tab-pane fade" id="tab-5">
								<div class="accordion accordion-icon accordion-bg-light" id="accordionExample2">
									<!-- Item -->
									<c:forEach var="faqVO" items="${f04List}" varStatus="stat"> 
										<div class="accordion-item mb-3">
											<h6 class="accordion-header font-base" id="heading-${stat.index + 1}">
												<button class="accordion-button fw-bold rounded d-inline-block collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${stat.index + 1}" aria-expanded="false" aria-controls="collapse-${stat.index + 1}">
													${faqVO.faqTt}
												</button>
											</h6>
											<!-- Body -->
											<div id="collapse-${stat.index + 1}" class="accordion-collapse collapse" aria-labelledby="heading-1" data-bs-parent="#accordionExample2" style="">
												<div class="accordion-body mt-3">
													${faqVO.faqAns}
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="tab-pane fade" id="tab-6">
								<div class="accordion accordion-icon accordion-bg-light" id="accordionExample2">
									<!-- Item -->
									<c:forEach var="faqVO" items="${f05List}" varStatus="stat"> 
										<div class="accordion-item mb-3">
											<h6 class="accordion-header font-base" id="heading-${stat.index + 1}">
												<button class="accordion-button fw-bold rounded d-inline-block collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${stat.index + 1}" aria-expanded="false" aria-controls="collapse-${stat.index + 1}">
													${faqVO.faqTt}
												</button>
											</h6>
											<!-- Body -->
											<div id="collapse-${stat.index + 1}" class="accordion-collapse collapse" aria-labelledby="heading-1" data-bs-parent="#accordionExample2" style="">
												<div class="accordion-body mt-3">
													${faqVO.faqAns}
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="tab-pane fade" id="tab-7">
								<div class="accordion accordion-icon accordion-bg-light" id="accordionExample2">
									<!-- Item -->
									<c:forEach var="faqVO" items="${f06List}" varStatus="stat"> 
										<div class="accordion-item mb-3">
											<h6 class="accordion-header font-base" id="heading-${stat.index + 1}">
												<button class="accordion-button fw-bold rounded d-inline-block collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${stat.index + 1}" aria-expanded="false" aria-controls="collapse-${stat.index + 1}">
													${faqVO.faqTt}
												</button>
											</h6>
											<!-- Body -->
											<div id="collapse-${stat.index + 1}" class="accordion-collapse collapse" aria-labelledby="heading-1" data-bs-parent="#accordionExample2" style="">
												<div class="accordion-body mt-3">
													${faqVO.faqAns}
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!-- Card body END -->
				</div>
			</div>
		</div>
	</div>
</section>

