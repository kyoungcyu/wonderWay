<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
$(function(){
	$("#del").on("click",function(){
		alert("방이 삭제 되었습니다.");
	});
	
	
	
});

</script>
<style>
  .tiny-slider-inner {
    text-align: center; /* 사진을 가로 방향으로 중앙에 위치시킵니다. */
  }
   .tiny-slider-inner img {
    width: 100%; /* 가로 방향으로 부모 요소에 맞게 확대합니다. */
    height: 80%; /* 세로 방향으로 부모 요소에 맞게 확대합니다. */
    object-fit: cover; /* 이미지를 비율을 유지하면서 부모 요소에 꽉 채우도록 설정합니다. */
  }
</style>
<body>
<main>

<!-- =======================
Hotel list START -->
<section class="pt-0">
	<div class="container">
		<!-- Background image -->
		<div class="rounded-3 p-3 p-sm-5" style="background-image: url(/resources/booking/assets/images/category/hotel/01.jpg); 
					background-position: center center; background-repeat: no-repeat; background-size: cover; ">
			<!-- Banner title -->
			<div class="row my-2 my-xl-5"> 
				<div class="col-md-8 mx-auto"> 
					<h1 class="text-center text-white">방 관리 </h1>
				</div>
				
			</div>
			<div class="mt-4">
				<form class="bg-mode shadow rounded-3 position-relative p-4 pe-md-5 pb-5 pb-md-4" id="frm">
					<!-- Button -->
					<div class="form-control-border form-control-transparent form-fs-md d-flex justify-content-center">
						<input class="form-control bg-transparent pe-5" type="search" placeholder="검색" aria-label="Search" name="keyword" value="${param.keyword}">
						<button class="btn border-0 px-3 py-0 position-absolute top-50 end-0 translate-middle-y" type="submit"><i class="fas fa-search fs-6"></i></button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

	<section class="pt-0">
		<div class="container">
			<div class="row">
				<!-- Main content START -->
				<div class="col-xl-12 col-xxl-12">
					<div class="vstack gap-4">
						<!-- Card item START -->
						<c:forEach var="bsRmVO"  items="${data.content}" varStatus="stat">
						<div class="card shadow p-2">

							<div class="row g-0">
								<!-- Card img -->
							<div class="col-md-5 position-relative">


								<!-- Slider START -->
								<div class="tiny-slider arrow-round arrow-xs arrow-dark overflow-hidden rounded-2" style="margin-top: 50px; margin-bottom: 10px;">
									<div class="tiny-slider-inner" data-autoplay="false" data-arrow="true" data-dots="false" data-items="1">
										<!-- Image item -->
										 <c:forEach var="attachDeVO" items="${bsRmVO.attachDeVOList}" varStatus="status">
										<div ><img src="/resources/upload/rm${attachDeVO.savePath}" alt="Card image" ></div>
										 </c:forEach>

									</div>
								</div>
								<!-- Slider END -->
								</div>
	
								<!-- Card body -->
								<div class="col-md-7">
									<div class="card-body py-md-2 d-flex flex-column h-100 position-relative" >
	
										<!-- Rating and buttons -->
										<div class="d-flex justify-content-between align-items-center">
												
										</div>
										<br/>
										<!-- Title -->
										<div class="card-title mb-1 border-bottom">
											<h4 class="card-title mb-1"> &nbsp; ${bsRmVO.rmNm} </h4>
										</div>
										<br>
										<h7 class="card-title mb-1">
										    <span style="color: green;">check In/out :</span> ${bsRmVO.chckIn} ~ ${bsRmVO.chckOut}
										</h7>
										<h7 class="card-title mb-1">
										    <span style="color: green;">기본 /최대 인원 :</span> ${bsRmVO.stdPp}/${bsRmVO.maxPp} 인
										</h7>
										
										<!-- Amenities -->
										<ul class="nav nav-divider mt-3" style="margin-top: 1em;">
										  <c:forEach var="cvfcVO" items="${bsRmVO.cvfcVOList}" varStatus="status">
										    <c:if test="${status.index % 5 == 0}">
										      </ul>
										      <ul class="nav nav-divider mt-3" style="margin-top: 1em;">
										    </c:if>
										    <li class="nav-item">${cvfcVO.cvfcNm}</li>
										  </c:forEach>
										</ul>
										<!-- List -->
										<ul class="list-group list-group-borderless small mb-0 mt-2">
											<li class="list-group-item d-flex text-success p-0">
												<i class="bi bi-patch-check-fill me-2"></i>원더웨이 광고를 이용해보세요
											</li>
										</ul>
										
										
										<!-- Price and Button -->
												<div
													class="d-sm-flex justify-content-sm-between align-items-center mt-3 mt-md-auto">
													<!-- Button -->
													<!-- Price -->
													<div class="d-flex align-items-center">
														<h5 class="fw-bold mb-0 me-1">
															&nbsp;
															<fmt:formatNumber value="${bsRmVO.rmPr}"
																pattern="#,###,###" />
														</h5>
														<span class="mb-0 me-2">원/ Day</span>
													</div>
														<div class="row mt-3 mt-sm-0">
															<div class="col">
																<form action="/business/room/detailRm" method="get" class="d-flex">
																	<input type="hidden" name="rmId" value="${bsRmVO.rmId}">
																	<button type="submit" class="btn btn-dark-soft mb-0 flex-grow-1 me-1 btnRmUpdate">수정하기</button>
																	<button type="button" class="btn btn-danger-soft mb-0 flex-grow-1 ms-1"
																		 data-toggle="modal" data-target="#exampleModal">삭제하기</button>
																</form>
															</div>
														</div>

												</div>
										</div>
								</div>
							</div>
						</div>
					</c:forEach>
						<!-- Card item END -->
						<nav class="mb-sm-0 d-flex justify-content-center" aria-label="navigation">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0 ">
								<li class="page-item <c:if test='${data.startPage < 6}'>disabled</c:if>" id="dataTable_previous">
									<a class="page-link" href="/business/room/rmList?currentPage=${data.startPage-5}&keyword=${param.keyword}&sort=${param.sort}&period=${param.period}" aria-controls="dataTable" data-dt-idx="0"  tabindex="-1">Prev</a>
								</li>
								<c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage}">
									<li class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
										<a href="/business/room/rmList?currentPage=${pNo}&keyword=${param.keyword}&sort=${param.sort}&period=${param.period}" aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0" class="page-link">${pNo}</a>
									</li>
								</c:forEach>
								<li class="page-item <c:if test='${data.endPage == data.totalPages}'>disabled</c:if>" id="dataTable_next">
									<a class="page-link" href="/business/room/rmList?currentPage=${data.startPage-5}&keyword=${param.keyword}&sort=${param.sort}&period=${param.period}" aria-controls="dataTable" data-dt-idx="7"  tabindex="-1">Next</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
				<!-- Main content END -->
			</div> <!-- Row END -->
		</div>
	</section>
<!-- =======================
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">방 삭제하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h6>해당 숙소를 <span style="color: red;">삭제</span> 하시겠습니까?</h6>
      </div>
      <div class="modal-footer">
        <div class="d-flex justify-content-between w-100">
          <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal" id="del">삭제</button>
        </div>
      </div>
    </div>
  </div>
</div>

</main>
</body>
</html>