<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<section>
	<div class="container h-100 d-flex px-0 px-sm-4">
		<div class="row justify-content-center align-items-center m-auto">
			<div class="col-12">
				<div class="bg-mode shadow rounded-3 overflow-hidden">
					<div class="row g-0">
						<!-- Vector Image -->
						<div class="col-lg-6 d-md-flex align-items-center order-2 order-lg-1">
							<div class="p-3 p-lg-5">
								<img src="/resources/booking/assets/images/element/join-us.svg" alt="">
							</div>
							<!-- Divider -->
							<div class="vr opacity-1 d-none d-lg-block"></div>
						</div>
		
						<!-- Information -->
						<div class="col-lg-6 order-1">
							<div class="p-4 p-sm-6">
								<!-- Logo -->
								<a href="index.html">
									<img class="h-50px mb-4" src="/resources/booking/assets/images/logo.png" alt="logo">
								</a>
								<!-- Title -->
								<h1 class="mb-2 h3">비회원 예약 내역</h1>
		
								<!-- Form START -->
								<form class="mt-4 text-start">
									<div class="mb-3">
										<label class="form-label">이메일 주소</label>
										<input type="email" class="form-control"  value="${nonMemberVO.gstEmail}" readonly>
									</div>
									<div class="mb-3 position-relative">
										<label class="form-label">예약 번호</label>
										<input class="form-control" type="text" value="${nonMemberVO.rsvId}" readonly>
									</div>
									<div class="mb-3 position-relative">
										<label class="form-label">예약 날짜</label>
										<input class="form-control" type="text" value="<fmt:formatDate value='${nonMemberVO.rsvDt}' pattern='yyyy/MM/dd HH:mm:ss' />" readonly>
									</div>
									<div class="mb-3 position-relative">
										<label class="form-label">결제 금액</label>
										<input class="form-control" type="text" value="${nonMemberVO.payPr}" readonly>
									</div>
									<div class="mb-3 position-relative">
										<label class="form-label">결제 수단</label>
										<input class="form-control" type="text" value="${nonMemberVO.payMth}" readonly>
									</div>
									<div class="mb-3 position-relative">
										<label class="form-label">업체명</label>
										<input class="form-control" type="text" value="${nonMemberVO.busiNm}" readonly>
									</div>
									<c:if test="${nonMemberVO.busiCode == 'B01'}">
										<div class="mb-3 position-relative">
											<label class="form-label">방 번호</label>
											<input class="form-control" type="text"  value="${nonMemberVO.rmNum}" readonly>
										</div>
										<div class="mb-3 position-relative">
											<label class="form-label">체크인</label>
											<input class="form-control" type="text" value="<fmt:formatDate value='${nonMemberVO.rsvSt}' pattern='yyyy/MM/dd HH:mm:ss' />" readonly>
										</div>
										<div class="mb-3 position-relative">
											<label class="form-label">체크아웃</label>
											<input class="form-control" type="text" value="<fmt:formatDate value='${nonMemberVO.rsvEd}' pattern='yyyy/MM/dd HH:mm:ss' />" readonly>
										</div>
									</c:if>
									<c:if test="${nonMemberVO.busiCode == 'B02'}">
										<div class="mb-3 position-relative">
											<label class="form-label">차량번호</label>
											<input class="form-control" type="text"  value="${nonMemberVO.carNum}" readonly>
										</div>
										<div class="mb-3 position-relative">
											<label class="form-label">렌트시작</label>
											<input class="form-control" type="text" value="<fmt:formatDate value='${nonMemberVO.carSt}' pattern='yyyy/MM/dd HH:mm:ss' />" readonly>
										</div>
										<div class="mb-3 position-relative">
											<label class="form-label">렌트종료</label>
											<input class="form-control" type="text" value="<fmt:formatDate value='${nonMemberVO.carEd}' pattern='yyyy/MM/dd HH:mm:ss' />" readonly>
										</div>
									</c:if>
									<!-- Button -->
									<div><a href="javascript:history.back()" class="btn btn-primary w-100 mb-0" id="btn">뒤로가기</a></div>
									<hr/>
									
									<!-- Copyright -->
									<div class="text-primary-hover mt-3 text-center"> Copyrights ©2023 Booking. Build by <a href="https://www.webestica.com/">Webestica</a>. </div>
								</form>
								<!-- Form END -->
							</div>		
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>