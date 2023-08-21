<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
$(function(){
  var memId = "${memVO.memId}";
  $("#btn01").on("click",function(){
    let wrnSt = $("#sort").val();
    let intrResn = $("#message-text").val();
    
    if(wrnSt == ""){
    	alert("제재를 선택해주세요");
    	return;
    }
    
    let object = {"wrnSt":wrnSt,"intrResn":intrResn,"memId":memId};
    console.log("object : " + JSON.stringify(object));
    
    $.ajax({
    	url:"/admin/mem/wrnStUpdate",
    	contentType:"application/json;charset=utf-8",
    	data:JSON.stringify(object),
    	type:"post",
    	beforeSend : function (xhr) {
    		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    	},
    	success:function(result){
    		//result : success
    		console.log("result : " + result);
    		window.location.href = "/admin/mem/detail?memId=" + result;
    	}
    });
  });
});
</script>

<!-- Page main content START -->
<div class="page-content-wrapper p-xxl-4">
	<div class="container">
        <div class="row">
        	<!-- Sidebar START -->
            <div class="col-lg-4 col-xl-3">
                <!-- Responsive offcanvas body START -->
                <div class="offcanvas-lg offcanvas-end" tabindex="-1" id="offcanvasSidebar">
                    <!-- Offcanvas header -->
                    <div class="offcanvas-header justify-content-end pb-2">
                        <button type="button" class="btn-close" memVO-bs-dismiss="offcanvas"
                            data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
                    </div>

                    <!-- Offcanvas body -->
                    <div class="offcanvas-body p-3 p-lg-0">
                        <div class="card bg-light w-100">
                            <!-- Card body START -->
                            <div class="card-body p-3">
                                <!-- Avatar and content -->
                                <div class="text-center mb-3">
                                    <!-- Avatar -->
                                    <div class="avatar avatar-xl mb-2">
                                    	<c:if test="${not empty memVO.memImg}">
											<img class="avatar-img rounded-circle border border-2 border-white" src="/resources/upload/mem${memVO.memImg}" alt="avatar">
										</c:if>
										<c:if test="${empty memVO.memImg}">
											<img class="avatar-img rounded-circle border border-2 border-white" src="/resources/booking/assets/images/avatar/user.png" alt="avatar">
										</c:if>
                                    </div>
                                    <h6 class="mb-0">${memVO.memId}</h6>
                                    <a href="#" class="text-reset text-primary-hover small">${memVO.memEmail}</a>
                                    <hr>
                                </div>

                                <!-- Sidebar menu item START -->
                                <ul class="nav nav-pills-primary-soft flex-column">
                                    <li class="nav-item"><a class="nav-link mb-0 active" data-bs-toggle="tab" href="#tab-1">
                                        <i class="bi bi-person fa-fw me-2"></i>회원 정보</a></li>
                                    <li class="nav-item"><a class="nav-link mb-0" data-bs-toggle="tab" href="#tab-2">
                                        <i class="bi bi-ticket-perforated fa-fw me-2"></i>이용 내역</a></li>
                                    <li class="nav-item"><a class="nav-link mb-0" data-bs-toggle="tab" href="#tab-3">
                                        <i class="bi bi-ticket-perforated fa-fw me-2"></i>작성 게시글</a></li>
                                </ul>
                                <!-- Sidebar menu item END -->
                            </div>
                            <!-- Card body END -->
                        </div>
                    </div>
                </div>
                <!-- Responsive offcanvas body END -->
            </div>
            <!-- Sidebar END -->

            <!-- Main content START -->
            <div class="col-lg-8 col-xl-9">
                <div class="vstack gap-4">
                    <div class="tab-content" id="nav-tabContent">

                        <!-- 회원 정보 탭 시작 -->
                        <div class="tab-pane fade show active" id="tab-1">
                            <div class="card border">
                                <!-- Card header -->
                                <div class="card-header border-bottom d-flex align-items-center">
								    <h4 class="card-header-title">${memVO.memId} 회원 정보</h4>
								    <div class="badge ${memVO.enabled == 1 ? 'bg-success text-success' : 'bg-danger text-danger'} bg-opacity-10 ms-auto">
								        ${memVO.enabled == 1 ? 'ENABLED' : 'DISABLED'}
								    </div>
								</div>

                                <!-- Card body START -->
                                <div class="card-body">
                                    <!-- Form START -->
                                    <form class="row g-3">
                                        <!-- Profile photo -->
                                        <div class="col-12">
                                            <div class="d-flex align-items-center">
                                                <label class="position-relative me-4" for="uploadfile-1" title="Replace this pic">
                                                	<!-- Avatar place holder -->
                                                    <span class="avatar avatar-xl">
                                                    	<c:if test="${not empty memVO.memImg}">
															<img class="avatar-img rounded-circle border border-white border-3 shadow" src="/resources/upload/mem${memVO.memImg}" alt="avatar">
														</c:if>
														<c:if test="${empty memVO.memImg}">
															<img class="avatar-img rounded-circle border border-white border-3 shadow" src="/resources/booking/assets/images/avatar/user.png" alt="avatar">
														</c:if>
                                                	</span>
                                                </label>
                                            </div>
                                        </div>

                                        <!-- 이름 -->
                                        <div class="col-md-6">
                                            <label class="form-label">이름</label>
                                            <input type="text" class="form-control" value="${memVO.memNm}" readonly>
                                        </div>

                                        <!-- 성별 -->
                                        <div class="col-md-6">
                                            <label class="form-label">성별</label>
                                            <input type="text" class="form-control" value="${memVO.memGen}" readonly>
                                        </div>

                                        <!-- 이메일 -->
                                        <div class="col-md-6">
                                            <label class="form-label">이메일</label>
                                            <input type="email" class="form-control" value="${memVO.memEmail}" readonly>
                                        </div>

                                        <!-- 이메일 -->
                                        <div class="col-md-6">
                                            <label class="form-label">이메일 수신</label>
                                            <input type="email" class="form-control" value="${memVO.mailAgr}" readonly>
                                        </div>

                                        <!-- 핸드폰 번호 -->
                                        <div class="col-md-6">
                                            <label class="form-label">핸드폰 번호</label>
                                            <c:if test="${not empty memVO.memTel}">
												<c:set var="text" value="${memVO.memTel}" />
												<c:set var="tel" value="${fn:substring(text, 0, 3)}-${fn:substring(text, 3, 7)}-${fn:substring(text, 7, 11)}" />
											</c:if>
                                            <input type="text" class="form-control" value="${tel}" readonly>
                                        </div>

										<!-- 생년월일 -->
                                        <div class="col-md-6">
                                            <label class="form-label">생년월일</label>
											<input type="text" class="form-control" value="<fmt:formatDate value='${memVO.memBir}' pattern='yyyy/MM/dd' />" readonly>
                                        </div>

                                        <!-- 영문 이름 -->
                                        <div class="col-md-6">
                                            <label class="form-label">영문 이름</label>
                                            <input type="text" class="form-control" value="${memVO.memEnm}" readonly>
                                        </div>

                                        <!-- 영문 성 -->
                                        <div class="col-md-6">
                                            <label class="form-label">영문 성</label>
                                            <input type="text" class="form-control" value="${memVO.memFmnm}" readonly>
                                        </div>

                                        <!-- 주소 -->
                                        <div class="col-md-6">
                                            <label class="form-label">주소</label>
                                            <input type="text" class="form-control" value="${memVO.memAddr1}" readonly>
                                        </div>

                                        <!-- 상세 주소 -->
                                        <div class="col-md-6">
                                            <label class="form-label">상세 주소</label>
                                            <input type="text" class="form-control" value="${memVO.memAddr2}" readonly>
                                        </div>

										<!-- 마일리지 -->
                                        <div class="col-md-6">
                                            <label class="form-label">마일리지</label>
											<input type="text" class="form-control" value="<fmt:formatNumber value="${memVO.memMlg}" pattern="#,###" />" readonly>
                                        </div>

										<!-- MBTI -->
                                        <div class="col-md-6">
                                            <label class="form-label">MBTI</label>
											<input type="text" class="form-control" value="${memVO.memMbti}" readonly>
                                        </div>

										<!-- 경고 개수 -->
                                        <div class="col-md-6">
                                            <label class="form-label">경고 개수</label>
											<input type="text" class="form-control" value="${memVO.wrnCnt}" readonly>
                                        </div>

										<!-- 경고 상태 -->
                                        <div class="col-md-6">
                                            <label class="form-label">경고 상태</label>
											<input type="text" class="form-control" 
												value="${memVO.wrnSt == 0 ? '일반' : memVO.wrnSt == 1 ? '경고' : memVO.wrnSt == 2 ? '정지' : ''}" readonly>
                                        </div>
                                        
										<!-- 가입 일자 -->
                                        <div class="col-md-6">
                                            <label class="form-label">가입 일자</label>
											<input type="text" class="form-control" value="<fmt:formatDate value='${memVO.joinDt}' pattern='yyyy/MM/dd' />" readonly>
                                        </div>

										<!-- 탈퇴 일자 -->
                                        <div class="col-md-6">
                                            <label class="form-label">탈퇴 일자</label>
											<input type="text" class="form-control" value="<fmt:formatDate value='${memVO.whdwlDt}' pattern='yyyy/MM/dd' />" readonly>
                                        </div>

                                        <!-- Button -->
                                        <div class="col-12 text-end">
                                        	<button type="button" class="btn btn-primary mb-0" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">회원 상태 변경</button>
                                        </div>
                                    </form>
                                    <!-- Form END -->
                                </div>
                                <!-- Card body END -->
                            </div>
                        </div>
	                    <!-- 회원 정보 탭 끝 -->

                        <!-- 회원 이용 내역 탭 시작 -->
                        <div class="tab-pane fade" id="tab-2">
                            <div class="card border">
                                <!-- Card header -->
								<div class="card-header border-bottom">
									<div class="d-flex justify-content-between align-items-center">
										<h4 class="card-header-title">${memVO.memId} 회원 이용 내역</h4>

										<!-- Search -->
									</div>
								</div>

								<ul class="nav nav-tabs nav-bottom-line nav-responsive nav-justified">
									<li class="nav-item"><a class="nav-link mb-0 active" data-bs-toggle="tab" href="#tab-4">
										<i class="bi bi-credit-card fa-fw me-1"></i>입금 대기</a></li>
									<li class="nav-item"><a class="nav-link mb-0" data-bs-toggle="tab" href="#tab-5">
										<i class="bi bi-check-circle fa-fw me-1"></i>예약 확정</a></li>
									<li class="nav-item"><a class="nav-link mb-0" data-bs-toggle="tab" href="#tab-6">
										<i class="bi bi-exclamation-square fa-fw me-1"></i>환불 요청</a></li>
									<li class="nav-item"><a class="nav-link mb-0" data-bs-toggle="tab" href="#tab-7">
										<i class="bi bi-trash fa-fw me-1"></i>환불 완료</a></li>
								</ul>
								<div class="tab-content p-1 p-sm-2" id="nav-tabContent">
									<div class="tab-pane fade show active" id="tab-4">
										<c:forEach var="rsvVO" items="${rsvK01}" varStatus="stat">
											<c:if test="${rsvVO.busiCode eq 'B01' }">
												<div class="card border" style="margin-bottom: 5px;">
													<!-- Card header -->
													<div
														class="card-header border-bottom d-md-flex justify-content-md-between align-items-center">
														<!-- Icon and Title -->
														<div class="d-flex align-items-center">
															<div class="icon-lg bg-light rounded-circle flex-shrink-0">
																<i class="fa-solid fa-hotel"></i>
															</div>
															<!-- Title -->
															<div class="ms-2">
																<h6 class="card-title mb-0">${rsvVO.busiNm}</h6>
																<ul class="nav nav-divider small">
																	<li class="nav-item">예약 ID : ${rsvVO.rsvId}</li>
																	<li class="nav-item">예약 일자 : <fmt:formatDate value="${rsvVO.rsvDt}" pattern="yyyy/MM/dd" /></li>
																</ul>
															</div>
														</div>
													</div>
		
													<!-- Card body -->
													<div class="card-body">
														<div class="row g-3">
															<div class="col-sm-6 col-md-4">
																<span>Check-In</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvSt}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-sm-6 col-md-4">
																<span>Check-Out</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvEd}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-md-4">
																<span>방번호</span>
																<h6 class="mb-0">${rsvVO.rmNum}</h6>
															</div>
														</div>
													</div>
												</div>
											</c:if>
											<c:if test="${rsvVO.busiCode eq 'B02' }">
												<div class="card border" style="margin-bottom: 5px;">
													<!-- Card header -->
													<div
														class="card-header border-bottom d-md-flex justify-content-md-between align-items-center">
														<!-- Icon and Title -->
														<div class="d-flex align-items-center">
															<div class="icon-lg bg-light rounded-circle flex-shrink-0">
																<i class="fa-solid fa-car"></i>
															</div>
															<!-- Title -->
															<div class="ms-2">
																<h6 class="card-title mb-0">${rsvVO.busiNm}</h6>
																<ul class="nav nav-divider small">
																	<li class="nav-item">예약 ID : ${rsvVO.rsvId}</li>
																	<li class="nav-item">예약 일자 : <fmt:formatDate value="${rsvVO.rsvDt}" pattern="yyyy/MM/dd" /></li>
																</ul>
															</div>
														</div>
													</div>
		
													<!-- Card body -->
													<div class="card-body">
														<div class="row g-3">
															<div class="col-sm-6 col-md-4">
																<span>대여일</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvSt}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-sm-6 col-md-4">
																<span>반납일</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvEd}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-md-4">
																<span>차번호</span>
																<h6 class="mb-0">${rsvVO.rmNum}</h6>
															</div>
														</div>
													</div>
												</div>
											</c:if>
											<!-- Tab content item START -->
											<!-- Card item START -->
										</c:forEach>
											<!-- Card item END -->
										<!-- Tabs content item END -->
									</div>
									
									<div class="tab-pane fade" id="tab-5">
										<c:forEach var="rsvVO" items="${rsvK02}" varStatus="stat">
											<c:if test="${rsvVO.busiCode eq 'B01' }">
												<div class="card border" style="margin-bottom: 5px;">
													<!-- Card header -->
													<div
														class="card-header border-bottom d-md-flex justify-content-md-between align-items-center">
														<!-- Icon and Title -->
														<div class="d-flex align-items-center">
															<div class="icon-lg bg-light rounded-circle flex-shrink-0">
																<i class="fa-solid fa-hotel"></i>
															</div>
															<!-- Title -->
															<div class="ms-2">
																<h6 class="card-title mb-0">${rsvVO.busiNm}</h6>
																<ul class="nav nav-divider small">
																	<li class="nav-item">예약 ID : ${rsvVO.rsvId}</li>
																	<li class="nav-item">예약 일자 : <fmt:formatDate value="${rsvVO.rsvDt}" pattern="yyyy/MM/dd" /></li>
																</ul>
															</div>
														</div>
													</div>
		
													<!-- Card body -->
													<div class="card-body">
														<div class="row g-3">
															<div class="col-sm-6 col-md-4">
																<span>Check-In</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvSt}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-sm-6 col-md-4">
																<span>Check-Out</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvEd}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-md-4">
																<span>방번호</span>
																<h6 class="mb-0">${rsvVO.rmNum}</h6>
															</div>
														</div>
													</div>
												</div>
											</c:if>
											<c:if test="${rsvVO.busiCode eq 'B02' }">
												<div class="card border" style="margin-bottom: 5px;">
													<!-- Card header -->
													<div
														class="card-header border-bottom d-md-flex justify-content-md-between align-items-center">
														<!-- Icon and Title -->
														<div class="d-flex align-items-center">
															<div class="icon-lg bg-light rounded-circle flex-shrink-0">
																<i class="fa-solid fa-car"></i>
															</div>
															<!-- Title -->
															<div class="ms-2">
																<h6 class="card-title mb-0">${rsvVO.busiNm}</h6>
																<ul class="nav nav-divider small">
																	<li class="nav-item">예약 ID : ${rsvVO.rsvId}</li>
																	<li class="nav-item">예약 일자 : <fmt:formatDate value="${rsvVO.rsvDt}" pattern="yyyy/MM/dd" /></li>
																</ul>
															</div>
														</div>
													</div>
		
													<!-- Card body -->
													<div class="card-body">
														<div class="row g-3">
															<div class="col-sm-6 col-md-4">
																<span>대여일</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvSt}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-sm-6 col-md-4">
																<span>반납일</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvEd}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-md-4">
																<span>차번호</span>
																<h6 class="mb-0">${rsvVO.rmNum}</h6>
															</div>
														</div>
													</div>
												</div>
											</c:if>
											<!-- Tab content item START -->
											<!-- Card item START -->
										</c:forEach>
											<!-- Card item END -->
										<!-- Tabs content item END -->
									</div>
									
									<div class="tab-pane fade" id="tab-6">
										<c:forEach var="rsvVO" items="${rsvK03}" varStatus="stat">
											<c:if test="${rsvVO.busiCode eq 'B01' }">
												<div class="card border" style="margin-bottom: 5px;">
													<!-- Card header -->
													<div
														class="card-header border-bottom d-md-flex justify-content-md-between align-items-center">
														<!-- Icon and Title -->
														<div class="d-flex align-items-center">
															<div class="icon-lg bg-light rounded-circle flex-shrink-0">
																<i class="fa-solid fa-hotel"></i>
															</div>
															<!-- Title -->
															<div class="ms-2">
																<h6 class="card-title mb-0">${rsvVO.busiNm}</h6>
																<ul class="nav nav-divider small">
																	<li class="nav-item">예약 ID : ${rsvVO.rsvId}</li>
																	<li class="nav-item">예약 일자 : <fmt:formatDate value="${rsvVO.rsvDt}" pattern="yyyy/MM/dd" /></li>
																</ul>
															</div>
														</div>
													</div>
		
													<!-- Card body -->
													<div class="card-body">
														<div class="row g-3">
															<div class="col-sm-6 col-md-4">
																<span>Check-In</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvSt}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-sm-6 col-md-4">
																<span>Check-Out</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvEd}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-md-4">
																<span>방번호</span>
																<h6 class="mb-0">${rsvVO.rmNum}</h6>
															</div>
														</div>
													</div>
												</div>
											</c:if>
											<c:if test="${rsvVO.busiCode eq 'B02' }">
												<div class="card border" style="margin-bottom: 5px;">
													<!-- Card header -->
													<div
														class="card-header border-bottom d-md-flex justify-content-md-between align-items-center">
														<!-- Icon and Title -->
														<div class="d-flex align-items-center">
															<div class="icon-lg bg-light rounded-circle flex-shrink-0">
																<i class="fa-solid fa-car"></i>
															</div>
															<!-- Title -->
															<div class="ms-2">
																<h6 class="card-title mb-0">${rsvVO.busiNm}</h6>
																<ul class="nav nav-divider small">
																	<li class="nav-item">예약 ID : ${rsvVO.rsvId}</li>
																	<li class="nav-item">예약 일자 : <fmt:formatDate value="${rsvVO.rsvDt}" pattern="yyyy/MM/dd" /></li>
																</ul>
															</div>
														</div>
													</div>
		
													<!-- Card body -->
													<div class="card-body">
														<div class="row g-3">
															<div class="col-sm-6 col-md-4">
																<span>대여일</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvSt}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-sm-6 col-md-4">
																<span>반납일</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvEd}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-md-4">
																<span>차번호</span>
																<h6 class="mb-0">${rsvVO.rmNum}</h6>
															</div>
														</div>
													</div>
												</div>
											</c:if>
											<!-- Tab content item START -->
											<!-- Card item START -->
										</c:forEach>
											<!-- Card item END -->
										<!-- Tabs content item END -->
									</div>
									
									<div class="tab-pane fade" id="tab-7">
										<c:forEach var="rsvVO" items="${rsvK04}" varStatus="stat">
											<c:if test="${rsvVO.busiCode eq 'B01' }">
												<div class="card border" style="margin-bottom: 5px;">
													<!-- Card header -->
													<div
														class="card-header border-bottom d-md-flex justify-content-md-between align-items-center">
														<!-- Icon and Title -->
														<div class="d-flex align-items-center">
															<div class="icon-lg bg-light rounded-circle flex-shrink-0">
																<i class="fa-solid fa-hotel"></i>
															</div>
															<!-- Title -->
															<div class="ms-2">
																<h6 class="card-title mb-0">${rsvVO.busiNm}</h6>
																<ul class="nav nav-divider small">
																	<li class="nav-item">예약 ID : ${rsvVO.rsvId}</li>
																	<li class="nav-item">예약 일자 : <fmt:formatDate value="${rsvVO.rsvDt}" pattern="yyyy/MM/dd" /></li>
																</ul>
															</div>
														</div>
													</div>
		
													<!-- Card body -->
													<div class="card-body">
														<div class="row g-3">
															<div class="col-sm-6 col-md-4">
																<span>Check-In</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvSt}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-sm-6 col-md-4">
																<span>Check-Out</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvEd}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-md-4">
																<span>방번호</span>
																<h6 class="mb-0">${rsvVO.rmNum}</h6>
															</div>
														</div>
													</div>
												</div>
											</c:if>
											<c:if test="${rsvVO.busiCode eq 'B02' }">
												<div class="card border" style="margin-bottom: 5px;">
													<!-- Card header -->
													<div
														class="card-header border-bottom d-md-flex justify-content-md-between align-items-center">
														<!-- Icon and Title -->
														<div class="d-flex align-items-center">
															<div class="icon-lg bg-light rounded-circle flex-shrink-0">
																<i class="fa-solid fa-car"></i>
															</div>
															<!-- Title -->
															<div class="ms-2">
																<h6 class="card-title mb-0">${rsvVO.busiNm}</h6>
																<ul class="nav nav-divider small">
																	<li class="nav-item">예약 ID : ${rsvVO.rsvId}</li>
																	<li class="nav-item">예약 일자 : <fmt:formatDate value="${rsvVO.rsvDt}" pattern="yyyy/MM/dd" /></li>
																</ul>
															</div>
														</div>
													</div>
		
													<!-- Card body -->
													<div class="card-body">
														<div class="row g-3">
															<div class="col-sm-6 col-md-4">
																<span>대여일</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvSt}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-sm-6 col-md-4">
																<span>반납일</span>
																<h6 class="mb-0"><fmt:formatDate value="${rsvVO.rsvEd}" pattern="yyyy/MM/dd" /></h6>
															</div>
		
															<div class="col-md-4">
																<span>차번호</span>
																<h6 class="mb-0">${rsvVO.rmNum}</h6>
															</div>
														</div>
													</div>
												</div>
											</c:if>
											<!-- Tab content item START -->
											<!-- Card item START -->
										</c:forEach>
											<!-- Card item END -->
										<!-- Tabs content item END -->
									</div>
									
								</div>
                        	</div>
                            <!-- Card body END -->
                    	</div>
                    	<!-- 회원 이용 내역 탭 끝 -->

                    	 <!-- 직상게시글 탭 시작 -->
                        <div class="tab-pane fade" id="tab-3">
                            <div class="card border">
                                <!-- Card header -->
                                <div class="card-header border-bottom">
                                    <h4 class="card-header-title">${memVO.memId} 회원 작성 게시글</h4>
                                </div>

                                <!-- Card body START -->
                                <div class="card-body">
									<!-- 작성 게시글 시작 -->
									<div class="table-responsive border-0">
										<table class="table align-middle p-4 mb-0 table-hover table-shrink">
											<!-- Table head -->
											<thead class="table-light">
												<tr>
													<th scope="col" class="border-0 rounded-start">게시글ID</th>
													<th scope="col" class="border-0">제목</th>
													<th scope="col" class="border-0">게시판</th>
													<th scope="col" class="border-0">날짜</th>
													<th scope="col" class="border-0">신고수</th>
													<th scope="col" class="border-0 rounded-end">차단여부</th>
												</tr>
											</thead>

											<!-- Table body START -->
											<tbody class="border-top-0">
												<c:forEach var="brdVO" items="${brdList}" varStatus="stat">
													<!-- Table item -->
													<tr>
														<c:if test="${brdVO.brdKnd == 'D01'}">
															<td> <h6 class="mb-0"><a href="/member/tripBoard/tripDetail?brdId=${brdVO.brdId}">${brdVO.brdId}</a></h6> </td>
															<td> <h6 class="mb-0"><a href="/member/tripBoard/tripDetail?brdId=${brdVO.brdId}">${brdVO.brdTt}</a></h6> </td>
														</c:if>
														<c:if test="${brdVO.brdKnd == 'D02'}">
															<td> <h6 class="mb-0"><a href="/member/qnaBoard/qnaDetail?brdId=${brdVO.brdId}">${brdVO.brdId}</a></h6> </td>
															<td> <h6 class="mb-0"><a href="/member/qnaBoard/qnaDetail?brdId=${brdVO.brdId}">${brdVO.brdTt}</a></h6> </td>
														</c:if>
														<c:if test="${brdVO.brdKnd == 'D04'}">
															<td> <h6 class="mb-0"><a href="/member/csc/inquiryDetail?${brdVO.brdId}">${brdVO.brdId}</a></h6> </td>
															<td> <h6 class="mb-0"><a href="/member/csc/inquiryDetail?brdId=${brdVO.brdId}">${brdVO.brdTt}</a></h6> </td>
														</c:if>
														<td>
														  ${brdVO.brdKnd.trim() == 'D01' ? '여행후기' :
														    brdVO.brdKnd.trim() == 'D02' ? '질문답변' :
														    brdVO.brdKnd.trim() == 'D04' ? '고객문의' : ''}
														</td>
														<td> <fmt:formatDate value="${brdVO.frstDt}" pattern="yyyy/MM/dd" /> </td>
														<td> ${brdVO.reprt} </td>
														<td> ${brdVO.reprtCk} </td>
													</tr>
												</c:forEach>
											</tbody>
											<!-- 작성 게시글 끝 -->
										</table>
									</div>
									<!-- Hotel room list END -->
								</div>
                                <!-- Card body END -->

                                <!-- Card footer START -->
								<div class="card-footer pt-0">
								</div>
								<!-- Card footer END -->
                            </div>
                        </div>
	                    <!-- 직상게시글 탭 끝 -->
                	</div>
            	</div>
        	</div>
        </div>
    </div>
</div>
<!-- Page main content END -->

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-centered" >
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원 상태 변경</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form name="frm01" id="frm01" action="/admin/mem/wrnStUpdate" method="POST">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">제재:</label>
            <select class="form-select js-choice" aria-label=".form-select-sm" name="sort" id="sort">
				<option value="">Sort by</option>
				<option value="0">일반</option>
				<option value="1">경고</option>
				<option value="2">1개월 정지</option>
			</select>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btn01">전송</button>
      </div>
    </div>
  </div>
</div>
