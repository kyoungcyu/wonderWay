<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kr.or.ddit.vo.MemVO"%>

<% MemVO memVO1 = (MemVO) session.getAttribute("memVO1");%>

<!--<tiles:insertAttribute name="aside" />-->
<div class="col-lg-4 col-xl-3">
	<!-- Responsive offcanvas body START -->
	<div class="offcanvas-lg offcanvas-end" tabindex="-1"
		id="offcanvasSidebar">
		<!-- Offcanvas header -->
		<div class="offcanvas-header justify-content-end pb-2">
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
		</div>

		<!-- Offcanvas body -->
		<div class="offcanvas-body p-3 p-lg-0">
			<div class="card bg-light w-100">

				<!-- Edit profile button -->
				<div class="position-absolute top-0 end-0 p-3">
					<a href="#" class="text-primary-hover" data-bs-toggle="tooltip"
						data-bs-title="Edit profile">
					</a>
				</div>

				<!-- Card body START -->
				<div class="card-body p-3">
					<!-- Avatar and content -->
					<sec:authorize access="hasRole('ROLE_MEMBER')"> 
						<sec:authentication property="principal.memVO" var="memVO" />
						<div class="text-center mb-3">
							<!-- Avatar -->
							
							<div class="avatar avatar-xl mb-2">
								<c:choose>							
								<c:when test="<%=memVO1.getMemImg() == null%>">
									<img
										class="avatar-img rounded-circle border border-2 border-white"
										src="/resources/upload/anonymous.jpg" alt="">
								</c:when>
								<c:otherwise>
									<img
										class="avatar-img rounded-circle border border-2 border-white"
										src="/resources/upload/mem<%=memVO1.getMemImg()%>" alt="">
								</c:otherwise>
								</c:choose>
							</div>
							<h6 class="mb-0"><%=memVO1.getMemNm()%></h6>
							<a href="#" class="text-reset text-primary-hover small"><%=memVO1.getMemEmail()%></a>
							<hr>
						</div>
					</sec:authorize>
					

					<!-- Sidebar menu item START -->
					<ul class="nav nav-pills-primary-soft flex-column">
						<li class="nav-item"><a class="nav-link"
							href="/member/mypage/myInfo"><i
								class="bi bi-person fa-fw me-2"></i>내 프로필</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/mypage/myBooking"><i
										class="bi bi-bookmark-check fa-fw me-2"></i>예약 내역</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/mypage/myCart"><i
								class="fa fa-basket-shopping fa-fw me-2"></i>구매 내역</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/mypage/msgbox?currentPage=&tab=1"><i
								class="bi fa-fw bi-stickies fa-fw me-2"></i>쪽지함</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/mypage/cartList"><i class="fa-solid fa-cart-shopping fa-fw me-2"></i>장바구니</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="/member/mypage/myLike"><i class="fa-regular fa-rectangle-list fa-fw me-2"></i>관심내역</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="/member/mypage/myCard"><i class="fa-regular fa-credit-card fa-fw me-2"></i>나의카드</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="/member/mypage/myCoupon"><i class="fa-solid fa-coins fa-fw me-2"></i>쿠폰
								및 마일리지</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/mypage/myWrite"><i class="fa fa-pencil fa-fw me-2"></i>나의
								작성글</a></li>
						<li class="nav-item"><a
							class="nav-link text-danger bg-danger-soft-hover" href="/member/mypage/deleteMem"><i
								class="fas fa-sign-out-alt fa-fw me-2"></i>탈퇴하기</a></li>
					</ul>
					<!-- Sidebar menu item END -->
				</div>
				<!-- Card body END -->
			</div>
		</div>
	</div>
	<!-- Responsive offcanvas body END -->
</div>