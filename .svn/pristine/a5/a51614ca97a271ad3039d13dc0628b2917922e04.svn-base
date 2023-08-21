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

<style>
    .h-80 {
        height: 150px;
    }
</style>

<!-- Main content START -->
<div class="col-lg-8 col-xl-9">

	<!-- Offcanvas menu button -->
	<div class="d-grid mb-0 d-lg-none w-100">
		<button class="btn btn-primary mb-4" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar"
			aria-controls="offcanvasSidebar">
			<i class="fas fa-sliders-h"></i> Menu
		</button>
	</div>

	<!-- Wishlist START -->
	<div class="card border bg-transparent">
		<!-- Card header -->
		<div class="card-header bg-transparent border-bottom">
			<h4 class="card-header-title">쿠폰 및 마일리지</h4>
		</div>

		<!-- Card body START -->
		<div class="card-body vstack gap-4">

			<!-- 마일리지, 등급 현황-->
			<div class="row g-4">

				<!-- Earning item -->
				<div class="col-md-6 col-xl-6">
					<div class="card card-body border p-4 h-80">
						<h6>마일리지</h6>
						<fmt:formatNumber var="memMlg" type="number" value="${memVO.memMlg}" pattern="#,###"/>
						<h2 class="text-success item-center">${memMlg} P</h2>
<!-- 						Progress bar -->
<!-- 						<div class="progress progress-xs bg-primary bg-opacity-10 mb-2"> -->
<!-- 							<div class="progress-bar bg-primary" role="progressbar" -->
<!-- 								style="width: 60%" aria-valuenow="60" aria-valuemin="0" -->
<!-- 								aria-valuemax="100"></div> -->
<!-- 						</div> -->
					</div>
				</div>

				<!-- Booked Rooms item -->
				<div class="col-md-6 col-xl-6">
					<div class="card card-body border p-4 h-80">
						<h6>
							나의 등급 <a tabindex="0" class="h6 mb-0" role="button"
								data-bs-toggle="popover" data-bs-trigger="focus"
								data-bs-placement="top" data-bs-content="브론즈>실버>골드>플래티넘"
								data-bs-original-title="" title=""
								id="gradDetail" data-toggle="modal" data-target="#modal"> <i
								class="bi bi-info-circle-fill small"></i>
							</a>
						</h6>
						<h2 class="text-info">${gradVO.gradNm}</h2>
<%-- 						<c:if test="${gradVO.gradNm eq 'GOLD'}"> --%>
<%-- 							<span class="small text-primary">${memVO.memNm}님은 최고 등급입니다.</span> --%>
<%-- 						</c:if> --%>
					</div>
				</div>
			</div>
			<!-- Counter END -->


			<!-- 쿠폰함/쿠폰존 탭 -->
			<div class="row g-4 justify-content-between align-items-center">
				<div class="col-lg-3">
					<!-- Tabs -->
					<ul class="nav nav-pills nav-responsive">
						<li class="nav-item"><a class="nav-link mb-0 me-sm-2 active"
							id="couponBox-tab" data-bs-toggle="tab" href="#couponBox"
							role="tab" aria-controls="couponBox" aria-selected="true">쿠폰함</a>
						</li>
						<li class="nav-item"><a class="nav-link mb-0 me-sm-2"
							id="couponzone-tab" data-bs-toggle="tab" href="#couponZone"
							role="tab" aria-controls="couponZone" aria-selected="false">쿠폰존</a>
						</li>
					</ul>
				</div>
			</div>



			<div class="tab-content">

				<!-- 쿠폰함 시작 -->
				<div class="tab-pane active" id="couponBox" role="tabpanel" aria-labelledby="couponBox-tab">
					<!-- Content item START -->
					<div class="tab-pane fade show active" id="grid-tab-pane">
						<div class="row row-cols-3 row-cols-sm-3 row-cols-md-3 row-cols-xxl-3 g-3">
							<c:forEach var="myCoupon" items="${myCoupon}" varStatus="stat">
							
								  <c:if test="${myCoupon.hcupnVOList[0].usable eq 'Y'}">
									<!-- 각각의 쿠폰 -->
									<div class="col">
										<div class="card shadow h-100">
											<!-- Card body START -->
											<div class="card-body px-3">
												<!-- Title -->
												<h5 class="card-title mb-1 text-center">
													<a href="javascript:void(0);"> ${myCoupon.cupnDc}</a>
												</h5>
												<ul class="list-group list-group-borderless small mt-2 mb-0">
													<li class="list-group-item pb-0">
													<i class="fa-solid fa-chevron-down"></i> 쿠폰아이디 :${myCoupon.cupnId}</li>
													<li class="list-group-item pb-0"><fmt:formatDate
															var="cupnExp" value="${myCoupon.cupnExp}"
															pattern="yyyy-MM-dd" />
													<li class="list-group-item pb-0"><i
														class="fa-solid fa-chevron-down"></i> 유효기간 : ~ ${cupnExp}</li>
												</ul>
											</div>
											<!-- Card body END -->

											<!-- Card footer START-->
											<div class="card-footer pt-0">
												<!-- Price -->
												<div class="hstack gap-2 mb-2">
													<h6 class="fw-normal mb-0" style="font-weight: bold;">${myCoupon.cupnRt}</h6>
													<small>% 할인 쿠폰</small>
												</div>
											</div>

											<!-- 쿠폰함 끝 -->
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>



<!-- 쿠폰존  시작-->
				<div class="tab-pane" id="couponZone" role="tabpanel"
					aria-labelledby="couponzone-tab">

<!-- 					Content item START -->
					<div class="tab-pane fade show active" id="grid-tab-pane">

						<div class="row row-cols-3 row-cols-sm-3 row-cols-md-3 row-cols-xxl-3 g-3">
							<c:forEach var="couponZone" items="${couponZone}" varStatus="stat">
									<div class="col">
										<div class="card shadow h-100">
											<div class="card-body px-3">
												<h5 class="card-title mb-1 text-center">
													<a href="javascript:void(0);"> ${couponZone.cupnDc}</a>
												</h5>
												<ul class="list-group list-group-borderless small mt-2 mb-0">
													<li class="list-group-item pb-0"><i
														class="fa-solid fa-chevron-down"></i> 쿠폰아이디 :
														${couponZone.cupnId}</li>
													<li class="list-group-item pb-0"><fmt:formatDate
															var="cupnExp" value="${couponZone.cupnExp}" 
															pattern="yyyy-MM-dd" /> 
													<li class="list-group-item pb-0"><i
														class="fa-solid fa-chevron-down"></i> 유효기간 : ~ ${cupnExp}</li>
												</ul>
											</div>

											<div class="card-footer pt-0">
												<div class="hstack gap-2 mb-2">
													<h6 class="fw-normal mb-0" style="font-weight: bold;">${couponZone.cupnRt}</h6>
													<small>% 할인 쿠폰</small>
												</div>
													<button type="button" id="${couponZone.cupnId}" class="btn btn-sm btn-primary-soft mb-0 w-100 downloadOk" >다운로드</button>
											</div>

										</div>
									</div>


							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!-- 쿠폰존 끝 -->
			
			<!-- 다운로드 받으면 -->
			<div class="alert alert-success" role="alert" id="ok" style="display:none;">
				<h4 class="alert-heading">wonderway!</h4>
				<p>다운로드 되었습니다. 쿠폰함에서 확인해보세요.</p>
			</div>


			<!-- 등급혜택 모달창-->

			<!-- Modal -->
			<div class="modal fade" id="modal" data-backdrop="static"
				data-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">등급 정보 넣기</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Understood</button>
						</div>
					</div>
				</div>
			</div>
			
<script type="text/javascript">

$(function(){
	$(".downloadOk").on("click",function(){
		var cupnId = this.id;
		//console.log("cupnId : " + JSON.stringify(cupnId));
		
		
		
		let data ={
				"cupnId":cupnId
		}
		console.log("data : " + JSON.stringify(data));
		$.ajax({
			url : "/member/mypage/myCouponPost",
			data : JSON.stringify(data),
			contentType:"application/json;charset=utf-8",          
			type : "post",
			dataType: "JSON",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success:function(result){
				console.log("data : " + JSON.stringify(data));
				console.log(result)
				if(result == 1){
					alert("다운로드 되었습니다. 쿠폰함에서 확인해보세요.")
					button.desabled=true;
					location.reload();
				} else{
					alert("이미 다운로드 받은 쿠폰입니다.")
					
				}
			},
			error:function (request, status, error) {
				alert("이미 다운로드 받은 쿠폰입니다.");
				
				
				
			}
		})
		
	})
})
</script>