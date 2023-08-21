<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description"
	content="Booking - Multipurpose Online Booking Theme">


<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/choices/css/choices.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="/resources/booking/assets/vendor/choices/js/choices.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


<script type="text/javascript">
	$(function() {
		$(".gradDetail").on("click", function() {
			let gradId = $(this).data("gradId");
			console.log("gradId : " + gradId);
			$("#detailModal").html();
			$.ajax({
				url : "/admin/grad/gradDetailPost",
				data : {
					"gradId" : gradId
				},
				type : "post",
				dataType : "json",
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					console.log(result.gradId + " : " + result.gradNm + " : " + result.mlgRt + " : " + result.accAmnt);
					
					let str = "";
					str = `<ul class='list-group list-group-borderless'>`;
					str += `<li class='list-group-item mb-3'> <span>등급명 :</span>&ensp;&ensp;`;
					if(result.gradId == "G01") {
						str += `<div class="badge bg-danger bg-opacity-10 text-danger">\${result.gradNm}</div>`;
					} else if(result.gradId == "G02") {
						str += `<div class="badge bg-secondary bg-opacity-10 text-secondary">\${result.gradNm}</div>`;
					} else if(result.gradId == "G03") {
						str += `<div class="badge bg-warning bg-opacity-10 text-warning">\${result.gradNm}</div>`;
					} else if(result.gradId == "G04") {
						str += `<div class="badge bg-info bg-opacity-10 text-info">\${result.gradNm}</div>`;
					}
					str += `</li>`;
					str += `<li class='list-group-item mb-3'> <span>마일리지 적립률:</span> <span class='h6 fw-normal ms-1 mb-0'>\${result.mlgRt}%</span> </li>`;
					str += `<li class='list-group-item mb-3'> <span>총 누적 금액 기준:</span> &#8361;<span id='accAmnt' class='h6 fw-normal ms-1 mb-0'>\${result.accAmnt}&ensp;~&ensp;</span> </li>`;
					str += `</ul>`;
		
					$("#detailModal").html(str);
					
					changeRsvDt();
				}
			});
		});

		$(".gradUpdate").on("click", function() {
			let gradId = $(this).data("gradId");
			console.log("gradId : " + gradId);
			$("#detailModal").html();
			$.ajax({
				url : "/admin/grad/gradUpdateModal",
				data : {
					"gradId" : gradId
				},
				type : "post",
				dataType : "json",
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					console.log(result.gradId + " : " + result.gradNm + " : " + result.mlgRt + " : " + result.accAmnt);
					
					let str = "";
					str += `<span>등급명:&ensp;&ensp;</span>`;
					if(result.gradId == "G01") {
						str += `<div class="badge bg-danger bg-opacity-10 text-danger">\${result.gradNm}</div>`;
					} else if(result.gradId == "G02") {
						str += `<div class="badge bg-secondary bg-opacity-10 text-secondary">\${result.gradNm}</div>`;
					} else if(result.gradId == "G03") {
						str += `<div class="badge bg-warning bg-opacity-10 text-warning">\${result.gradNm}</div>`;
					} else if(result.gradId == "G04") {
						str += `<div class="badge bg-info bg-opacity-10 text-info">\${result.gradNm}</div>`;
					}
					
					$("#modalHead").html(str);
					
					$("#gradUpdatePost").data("gradId", result.gradId);
				}
			});
		});
		
		$("#gradUpdatePost").on("click", function() {
			let gradId = $(this).data("gradId");
			let mlgRt = $("input[name=milageRate]").val();
			let accAmnt = $("input[name=accAmount]").val();
			
			console.log("data : ", gradId, mlgRt, accAmnt);
			
			$.ajax({
				url : "/admin/grad/gradUpdatePost",
				data : {
					"gradId" : gradId,
					"mlgRt" : mlgRt,
					"accAmnt" : accAmnt
				},
				type : "post",
				async : false,
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					if(result == "success") {
						alert("등급 정보가 갱신되었습니다.");
						window.location = "manage";
					} else {
						console.log("갱신 실패");
					}

				}
			});
		});
		
		
	});
	
	function changeRsvDt() {
		// 금액 천단위 처리
		let obj = document.getElementById("accAmnt");
		let str = obj.innerHTML.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

		console.log("accAmnt : " + str);

		document.getElementById("accAmnt").innerHTML = str;
	}
</script>
</head>

<body>
	<!-- **************** MAIN CONTENT START **************** -->
	<main>
		<!-- Page main content START -->
		<div class="page-content-wrapper p-xxl-4">
	
			<!-- Title -->
			<div class="row">
				<div class="col-12 mb-4 mb-sm-5">
					<h1 class="h3 mb-0">등급 관리</h1>
				</div>
			</div>

			<div class="row g-4">
				<!-- Object 1 -->
				<div class="col-lg-6">
					<!-- Email setting -->
					<div class="card shadow mb-4">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h5 class="card-title mb-0">브론즈</h5>
						</div>
						<div class="dropdown position-absolute top-0 end-0 m-3">
							<a href="#" class="btn btn-sm btn-light btn-round small mb-0" role="button" id="dropdownShare1" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="bi bi-three-dots fa-fw"></i>
							</a>
							<!-- dropdown button -->
							<ul class="dropdown-menu dropdown-w-sm dropdown-menu-end min-w-auto shadow rounded" aria-labelledby="dropdownShare1" style="">
								<li><a class="dropdown-item gradUpdate" href="#"
									   data-toggle="modal" data-grad-id="${BRONZE.gradId}"
									   data-target=".bd-gradUpdate-modal-lg">
									   <i class="bi bi-pencil-square fa-fw me-2"></i>수정
									</a>
								</li>
							</ul>
						</div>
						<!-- Card body -->
						<div class="card-body vstack gap-4">
							<!-- Item -->
							<div class="d-md-flex justify-content-between align-items-center" >
								<!-- Content -->
								<div class="avatar align-middle avatar-xl">
								  <img class="avatar-img rounded-3" src="/resources/booking/assets/images/grad/b.JPG" alt="avatar">
								</div>
								<div class="col-7">
									<h6 class="mb-0">등급 기준(총 결제 금액)</h6>
									<small>
										&#8361;<fmt:formatNumber type="number" pattern="#,###" value="${BRONZE.accAmnt}" />&ensp;~&ensp;
										&#8361;<fmt:formatNumber type="number" pattern="#,###" value="${SILVER.accAmnt}" />
									</small>
								</div>
								<!-- Switch -->
								<div class="form-check form-switch form-check-md mb-0">
									<button type="button" class="btn btn-info gradDetail"
											data-toggle="modal" data-grad-id="${BRONZE.gradId}" data-target=".bd-gradDetail-modal-lg">정보</button>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- Object 1 END -->
				
				<!-- Object 2 -->
				<div class="col-lg-6">
					<!-- Email setting -->
					<div class="card shadow mb-4">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h5 class="card-title mb-0">실버</h5>
						</div>
						<div class="dropdown position-absolute top-0 end-0 m-3">
							<a href="#" class="btn btn-sm btn-light btn-round small mb-0" role="button" id="dropdownShare1" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="bi bi-three-dots fa-fw"></i>
							</a>
							<!-- dropdown button -->
							<ul class="dropdown-menu dropdown-w-sm dropdown-menu-end min-w-auto shadow rounded" aria-labelledby="dropdownShare1" style="">
								<li><a class="dropdown-item gradUpdate" href="#"
									   data-toggle="modal" data-grad-id="${SILVER.gradId}"
									   data-target=".bd-gradUpdate-modal-lg">
									   <i class="bi bi-pencil-square fa-fw me-2"></i>수정
									</a>
								</li>
							</ul>
						</div>
						<!-- Card body -->
						<div class="card-body vstack gap-4">
							<!-- Item -->
							<div class="d-md-flex justify-content-between align-items-center">
								<!-- Content -->
								<div class="avatar align-middle avatar-xl">
								  <img class="avatar-img rounded-3" src="/resources/booking/assets/images/grad/s.JPG" alt="avatar">
								</div>
								<div class="col-7">
									<h6 class="mb-0">등급 기준(총 결제 금액)</h6>
									<small>
										&#8361;<fmt:formatNumber type="number" pattern="#,###" value="${SILVER.accAmnt}" />&ensp;~&ensp;
										&#8361;<fmt:formatNumber type="number" pattern="#,###" value="${GOLD.accAmnt}" />
									</small>
								</div>
								<!-- Switch -->
								<div class="form-check form-switch form-check-md mb-0">
									<button type="button" class="btn btn-info gradDetail"
											data-toggle="modal" data-grad-id="${SILVER.gradId}" data-target=".bd-gradDetail-modal-lg">정보</button>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- Object 2 END -->
				
				<!-- Object 3 -->
				<div class="col-lg-6">
					<!-- Email setting -->
					<div class="card shadow mb-4">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h5 class="card-title mb-0">골드</h5>
						</div>
						<div class="dropdown position-absolute top-0 end-0 m-3">
							<a href="#" class="btn btn-sm btn-light btn-round small mb-0" role="button" id="dropdownShare1" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="bi bi-three-dots fa-fw"></i>
							</a>
							<!-- dropdown button -->
							<ul class="dropdown-menu dropdown-w-sm dropdown-menu-end min-w-auto shadow rounded" aria-labelledby="dropdownShare1" style="">
								<li><a class="dropdown-item gradUpdate" href="#"
									   data-toggle="modal" data-grad-id="${GOLD.gradId}"
									   data-target=".bd-gradUpdate-modal-lg">
									   <i class="bi bi-pencil-square fa-fw me-2"></i>수정
									</a>
								</li>
							</ul>
						</div>
						<!-- Card body -->
						<div class="card-body vstack gap-4">
							<!-- Item -->
							<div class="d-md-flex justify-content-between align-items-center">
								<!-- Content -->
								<div class="avatar align-middle avatar-xl">
								  <img class="avatar-img rounded-3" src="/resources/booking/assets/images/grad/g.JPG" alt="avatar">
								</div>
								<div class="col-7">
									<h6 class="mb-0">등급 기준(총 결제 금액)</h6>
									<small>
										&#8361;<fmt:formatNumber type="number" pattern="#,###" value="${GOLD.accAmnt}" />&ensp;~&ensp;
										&#8361;<fmt:formatNumber type="number" pattern="#,###" value="${DIAMOND.accAmnt}" />
									</small>
								</div>
								<!-- Switch -->
								<div class="form-check form-switch form-check-md mb-0">
									<button type="button" class="btn btn-info gradDetail"
											data-toggle="modal" data-grad-id="${GOLD.gradId}" data-target=".bd-gradDetail-modal-lg">정보</button>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- Object 3 END -->
				
				<!-- Object 4 -->
				<div class="col-lg-6">
					<!-- Email setting -->
					<div class="card shadow mb-4">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h5 class="card-title mb-0">다이아몬드</h5>
						</div>
						<div class="dropdown position-absolute top-0 end-0 m-3">
							<a href="#" class="btn btn-sm btn-light btn-round small mb-0" role="button" id="dropdownShare1" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="bi bi-three-dots fa-fw"></i>
							</a>
							<!-- dropdown button -->
							<ul class="dropdown-menu dropdown-w-sm dropdown-menu-end min-w-auto shadow rounded" aria-labelledby="dropdownShare1" style="">
								<li><a class="dropdown-item gradUpdate" href="#"
									   data-toggle="modal" data-grad-id="${DIAMOND.gradId}"
									   data-target=".bd-gradUpdate-modal-lg">
									   <i class="bi bi-pencil-square fa-fw me-2"></i>수정
									</a>
								</li>
							</ul>
						</div>
						<!-- Card body -->
						<div class="card-body vstack gap-4">
							<!-- Item -->
							<div class="d-md-flex justify-content-between align-items-center">
								<!-- Content -->
								<div class="avatar align-middle avatar-xl">
								  <img class="avatar-img rounded-3" src="/resources/booking/assets/images/grad/d.JPG" alt="avatar">
								</div>
								<div class="col-7">
									<h6 class="mb-0">등급 기준(총 결제 금액)</h6>
									<small>
										&#8361;<fmt:formatNumber type="number" pattern="#,###" value="${DIAMOND.accAmnt}" />&ensp;~
									</small>
								</div>
								<!-- Switch -->
								<div class="form-check form-switch form-check-md mb-0">
									<button type="button" class="btn btn-info gradDetail"
											data-toggle="modal" data-grad-id="${DIAMOND.gradId}" data-target=".bd-gradDetail-modal-lg">정보</button>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- Object 4 END -->
			</div> 
		</div>
		
		<!-- 상세 Modal -->
		<div class="modal fade bd-gradDetail-modal-lg" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">등급 상세 정보</h5>
						<button type="button" class="btn" data-dismiss="modal"
							style="font-size: 1.5rem; font-weight: 700; line-height: 1; color: #000; text-shadow: 0 1px 0 #fff;"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div id="detailModal"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-dark-soft"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 수정 Modal -->
		<div class="modal fade bd-gradUpdate-modal-lg" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">환불 설정</h5>
						<button type="button" class="btn" data-dismiss="modal"
							style="font-size: 1.5rem; font-weight: 700; line-height: 1; color: #000; text-shadow: 0 1px 0 #fff;"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div id="modalHead" class="col-md-8 col-lg-7" style="text-align: center; margin-left: 100px">
						</div>
						<hr />
						<h5 class="fw-bold" style="text-align: center;">마일리지 적립률</h5>
						<div class="col-md-8 col-lg-7" style="margin-left: 100px">
							<input name="milageRate" type="text" class="form-control form-control-lg" placeholder="적립률 입력해주세요" value="" required>
							<h8 class="mb-0" style="font-size: small">단위 : 퍼센트(%)</h8>
						</div>
						<hr />
						<h5 class="fw-bold" style="text-align: center;">등급 기준 하한선</h5>
						<div class="col-md-8 col-lg-7" style="margin-left: 100px">
							<input name="accAmount" type="text" class="form-control form-control-lg" placeholder="금액을 입력해주세요" value="" required>
							<h8 class="mb-0" style="font-size: small">단위 : 원(&#8361;)</h8>
						</div>
					</div>
					<div class="modal-footer">
						<button id="gradUpdatePost" type="button" class="btn btn-sm btn-success-soft" data-grad-id=""
							data-dismiss="modal">수정</button>
						<button type="button" class="btn btn-sm btn-dark-soft"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- **************** MAIN CONTENT END **************** -->
</body>
