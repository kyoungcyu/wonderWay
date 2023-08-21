<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
function abled(busiId, able) {
	console.log(busiId);
	console.log(able);
	if(able == '활성화'){
		var enabled = "1";
	}else {
		var enabled = "0";
	}
	if(confirm(able + "하시겠습니까?")){
		let object = {"busiId":busiId, "enabled":enabled};
	    console.log("object : " + JSON.stringify(object));
	    
	    $.ajax({
	    	url:"/admin/busi/abled",
	    	contentType:"application/json;charset=utf-8",
	    	data:JSON.stringify(object),
	    	type:"post",
	    	beforeSend : function (xhr) {
	    		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	    	},
	    	success:function(result){
				if (result === "success") {
					alert(able + "성공");
					window.location.reload();
				} else {
					alert("실패 메시지");
				}
			},
			error: function () {
				alert("요청을 처리하는 동안 오류가 발생했습니다");
			}
	    });
	}else{
	}
}
</script>

<div class="page-content-wrapper p-xxl-4">
	<!-- Counter START -->
	<div class="row g-4 mb-4">
		<!-- Counter item -->
		<div class="col-lg-4">
			<div class="card card-body border border-primary bg-primary bg-opacity-10 border-opacity-25 p-4 h-100">
				<div class="d-flex justify-content-between align-items-center">
					<!-- Digit -->
					<div>
						<h3 class="mb-0 fw-bold">${countRoom}</h3>
						<span class="mb-0 h6 fw-light">방의 개수</span>
					</div>
					<!-- Icon -->
					<div class="icon-lg rounded-circle flex-shrink-0 bg-primary text-white mb-0"><i class="fa-solid fa-hotel fa-fw"></i></div>
				</div>
			</div>
		</div>

		<!-- Counter item -->
		<div class="col-lg-4">
			<div class="card card-body border border-warning bg-warning bg-opacity-10 border-opacity-25 p-4 h-100">
				<div class="d-flex justify-content-between align-items-center">
					<!-- Digit -->
					<div>
						<h3 class="mb-0 fw-bold"><fmt:formatNumber value="${countRsv}" pattern="#,###" /></h3>
						<span class="mb-0 h6 fw-light">지난 30일 예약건수</span>
					</div>
					<!-- Icon -->
					<div class="icon-lg rounded-circle flex-shrink-0 bg-warning text-white mb-0"><i class="fa-regular fa-calendar-days fa-fw"></i></div>
				</div>
			</div>
		</div>

		<!-- Counter item -->
		<div class="col-lg-4">
			<div class="card card-body border border-success bg-success bg-opacity-10 border-opacity-25 p-4 h-100">
				<div class="d-flex justify-content-between align-items-center">
					<!-- Digit -->
					<div>
						<h3 class="mb-0 fw-bold">₩ <fmt:formatNumber value="${totalPay}" pattern="#,###" /></h3>
						<span class="mb-0 h6 fw-light">지난 30일 수익</span>
					</div>
					<!-- Icon -->
					<div class="icon-lg rounded-circle flex-shrink-0 bg-success text-white mb-0"><i class="fa-solid fa-money-bill-trend-up fa-fw"></i></div>
				</div>
			</div>
		</div>
	</div>
	<!-- Counter END -->

	<div class="row g-4 mb-5">
		<!-- Agent info START -->
		<div class="col-md-4 col-xxl-3">
			<div class="card bg-light">
				<!-- Dropdown button -->
				<div class="dropdown position-absolute top-0 end-0 m-3">
					<a href="#" class="btn btn-sm btn-white btn-round lh-lg mb-0" role="button" id="dropdownShare1" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="bi bi-three-dots fa-fw"></i>
					</a>
					<!-- dropdown button -->
					<ul class="dropdown-menu dropdown-w-sm dropdown-menu-end min-w-auto shadow rounded" aria-labelledby="dropdownShare1">
						<li><a class="dropdown-item" href="#" onclick="abled('${busiVO.busiId}', `${busiVO.enabled == '1' ? '비활성화' : '활성화'}`)"><i class="bi bi-exclamation-triangle fa-fw me-2"></i>${busiVO.enabled == '1' ? '비활성화' : '활성화'}</a></li>
					</ul>
				</div>
				<!-- Card body -->
				<div class="card-body text-center">
					<!-- Avatar Image -->
					<div class="avatar avatar-xl flex-shrink-0 mb-3">
						<c:if test="${not empty busiVO.busiImg}">
							<img class="avatar-img rounded-circle" src="/resources/upload/busi${busiVO.busiImg}" alt="avatar">
						</c:if>
						<c:if test="${empty busiVO.busiImg}">
							<img class="avatar-img rounded-circle" src="/resources/booking/assets/images/avatar/user.png" alt="avatar">
						</c:if>
					</div>
					<!-- Title -->
					<h5 class="mb-2">${busiVO.busiNm}</h5>
					<ul class="list-inline small mb-0">
						<li class="list-inline-item me-0"><i class="fa-solid fa-star text-warning"></i></li>
						<li class="list-inline-item me-0">${busiVO.busiScr}</li>
					</ul>
				</div>
				<!-- Card footer -->
				<div class="card-footer bg-light border-top">
					<h6 class="mb-3">Contact Details</h6>
					<!-- Email id -->
					<div class="d-flex align-items-center mb-3">
						<div class="icon-md bg-mode h6 mb-0 rounded-circle flex-shrink-0"><i class="bi bi-envelope-fill"></i></div>
						<div class="ms-2">
							<small>이메일</small>
							<h6 class="fw-normal small mb-0">${busiVO.busiEmail}</h6>
						</div>
					</div>

					<!-- Phone -->
					<div class="d-flex align-items-center mb-3">
						<div class="icon-md bg-mode h6 mb-0 rounded-circle flex-shrink-0"><i class="bi bi-telephone-fill"></i></div>
						<div class="ms-2">
							<small>연락처</small>
							<h6 class="fw-normal small mb-0">
								<c:if test="${not empty busiVO.busiTel and fn:length(busiVO.busiTel) eq 11}">
									<c:set var="text" value="${busiVO.busiTel}" />
									<c:set var="tel" value="${fn:substring(text, 0, 3)}-${fn:substring(text, 3, 7)}-${fn:substring(text, 7, 11)}" />
								</c:if>
								<c:if test="${not empty busiVO.busiTel and fn:length(busiVO.busiTel) eq 10}">
									<c:set var="text" value="${busiVO.busiTel}" />
									<c:set var="tel" value="${fn:substring(text, 0, 3)}-${fn:substring(text, 3, 6)}-${fn:substring(text, 6, 10)}" />
								</c:if>
								${tel}
							</h6>
						</div>
					</div>

					<!-- Phone -->
					<div class="d-flex align-items-center mb-3">
						<div class="icon-md bg-mode h6 mb-0 rounded-circle flex-shrink-0"><i class="bi bi-geo-alt-fill"></i></div>
						<div class="ms-2">
							<small>위치</small>
							<h6 class="fw-normal small mb-0">${busiVO.busiLoc}</h6>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- Agent info END -->

		<div class="col-md-8 col-xxl-9">
			<!-- Personal info START -->
			<div class="card shadow">
				<!-- Card header -->
				<div class="card-header border-bottom">
					<h5 class="mb-0">사업자 정보</h5>
				</div>
				<!-- Card body -->
				<div class="card-body">
					<div class="row">
						<!-- Information item -->
						<div class="col-md-6">
							<ul class="list-group list-group-borderless">
								<li class="list-group-item mb-3">
									<span>사업자명 : </span>
									<span class="h6 fw-normal ms-1 mb-0">${busiVO.rprsvNm}</span>
								</li>

								<li class="list-group-item mb-3">
									<span>업체명 : </span>
									<span class="h6 fw-normal ms-1 mb-0">${busiVO.busiNm}</span>
								</li>

								<li class="list-group-item mb-3">
									<span>로그인ID : </span>
									<span class="h6 fw-normal ms-1 mb-0">${busiVO.lginId}</span>
								</li>

								<li class="list-group-item mb-3">
									<span>연락처 : </span>
									<span class="h6 fw-normal ms-1 mb-0">
										<c:if test="${not empty busiVO.busiTel and fn:length(busiVO.busiTel) eq 11}">
											<c:set var="text" value="${busiVO.busiTel}" />
											<c:set var="tel" value="${fn:substring(text, 0, 3)}-${fn:substring(text, 3, 7)}-${fn:substring(text, 7, 11)}" />
										</c:if>
										<c:if test="${not empty busiVO.busiTel and fn:length(busiVO.busiTel) eq 10}">
											<c:set var="text" value="${busiVO.busiTel}" />
											<c:set var="tel" value="${fn:substring(text, 0, 3)}-${fn:substring(text, 3, 6)}-${fn:substring(text, 6, 10)}" />
										</c:if>
										${tel}
									</span>
								</li>

								<li class="list-group-item mb-3">
									<span>업체 분류 : </span>
									<span class="h6 fw-normal ms-1 mb-0">${busiVO.busiCode eq 'B01' ? '숙박업체' : '' }</span>
								</li>
								
								<li class="list-group-item mb-3">
									<span>가입 일자 : </span>
									<span class="h6 fw-normal ms-1 mb-0"><fmt:formatDate value="${busiVO.regDt}" pattern="yyyy/MM/dd" /></span>
								</li>
								
								<li class="list-group-item mb-3">
									<span>사업자번호 : </span>
									<span class="h6 fw-normal ms-1 mb-0">${busiVO.busiNo}</span>
								</li>
							</ul>
						</div>

						<!-- Information item -->
						<div class="col-md-6">
							<ul class="list-group list-group-borderless">
								<li class="list-group-item mb-3">
									<span>이메일 : </span>
									<span class="h6 fw-normal ms-1 mb-0">${busiVO.busiEmail}</span>
								</li>

								<li class="list-group-item mb-3">
									<span> 원더머니 : </span>
									<span class="h6 fw-normal ms-1 mb-0">₩ <fmt:formatNumber value="${busiVO.busiMny}" pattern="#,###" /></span>
								</li>

								<li class="list-group-item mb-3">
									<span>업체ID : </span>
									<span class="h6 fw-normal ms-1 mb-0">${busiVO.busiId}</span>
								</li>

								<li class="list-group-item mb-3">
									<span>위치 : </span>
									<span class="h6 fw-normal ms-1 mb-0">${busiVO.busiLoc}</span>
								</li>
								
								<li class="list-group-item mb-3">
									<span>업체 유형  : </span>
									<span class="h6 fw-normal ms-1 mb-0">
										${busiVO.acmdCode == 'A01' ? '호텔' :
										  busiVO.acmdCode == 'A02' ? '모텔' :
										  busiVO.acmdCode == 'A03' ? '리조트' :
										  busiVO.acmdCode == 'A04' ? '게스트하우스' :
										  busiVO.acmdCode == 'A05' ? '펜션' : ''
										}
									</span>
								</li>
								
								<li class="list-group-item mb-3">
									<span>탈퇴 일자 : </span>
									<span class="h6 fw-normal ms-1 mb-0"><fmt:formatDate value="${busiVO.whdwlDt}" pattern="yyyy/MM/dd" /></span>
								</li>
								
								<li class="list-group-item mb-3">
									<span>계좌번호 : </span>
									<span class="h6 fw-normal ms-1 mb-0">${busiVO.account}</span>
								</li>
							</ul>
						</div>

						<!-- Information item -->
						<div class="col-12">
							<ul class="list-group list-group-borderless">
								<li class="list-group-item">
									<span>업체 소개글 : </span>
									<p class="h6 fw-normal mb-0">${busiVO.busiInfo}</p>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- Personal info END -->
		</div>
	</div> <!-- Row END -->

	<!-- Hotel list START -->
	<div class="row g-4">
		<!-- Title -->
		<div class="col-12">
			<h4 class="mb-0">Room list</h4>
		</div>
		
		<c:forEach var="rmVO" items="${roomList}" varStatus="stat">
			<div class="col-lg-6">
				<div class="card shadow p-3">
					<div class="row g-4">
						<!-- Card img -->
						<div class="col-sm-3">
							<c:if test="${not empty rmVO.savePath}">
								<img src="/resources/upload/rm${rmVO.savePath}" class="rounded-2" alt="Card image">
							</c:if>
							<c:if test="${empty rmVO.savePath}">
								<img src="/resources/booking/assets/images/category/hotel/4by3/09.jpg" class="rounded-2" alt="Card image">
							</c:if>
						</div>
	
						<!-- Card body -->
						<div class="col-sm-9">
							<div class="card-body position-relative d-flex flex-column p-0 h-100">
								<!-- Title -->
								<h5 class="card-title mb-0 me-5"><a href="hotel-detail.html">${rmVO.rmNm}</a></h5>
								<div class="d-flex justify-content-between align-items-center mt-3 mt-md-auto">
									<div class="d-flex align-items-center">
								    	<small><i class="bi bi-geo-alt me-2"></i>${rmVO.rmId}</small>
								    </div>
								    <div class="d-flex align-items-center">
								    	<small>${rmVO.rmBed}</small>
								    </div>
								</div>
	
								<!-- Price and Button -->
								<div class="d-flex justify-content-between align-items-center mt-3 mt-md-auto">
									<!-- Price -->
									<div class="d-flex align-items-center">
										<h5 class="fw-bold mb-0 me-1">₩ <fmt:formatNumber value="${rmVO.rmPr}" pattern="#,###" /></h5>
										<span class="mb-0 me-2">/day</span>
									</div>
								</div>
								
								<div class="d-flex justify-content-between align-items-center mt-3 mt-md-auto">
									<div class="d-flex align-items-center">
										<h5 class="fw-bold mb-0 me-1">${rmVO.rmDc}</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	<!-- Hotel list END -->
	</div>
</div>