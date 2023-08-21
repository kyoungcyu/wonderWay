<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description" content="Booking - Multipurpose Online Booking Theme">


<script type="text/javascript">
	$(function() {

	
	
	});
	
	function adUpdate(btn) {
		let pInput = $(btn).parent().parent('div').find('input');
		let pSelect = $(btn).parent().parent('div').find('select');
		
		let adKind = $(btn).data("adId");
		let period = $(pSelect[0]).val();
		let pr = $(pInput).val();
		
		if(parseInt(pr) < 1) {
			alert("1 이상의 수를 입력해주세요");
			$(pInput).val("");
		}
		
		console.log("adKind val ", adKind);
		console.log("pSelect val ", $(pSelect[0]).val());
		
		$.ajax({
			url : "/admin/advertise/advertiseSettingPost",
			data : {
				"adKind" : adKind,
				"period" : period,
				"pr" : pr
			},
			type : "post",
			dataType : "json",
			beforeSend : function (xhr) {
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success : function(result) {
				if(result != null) {
					alert(result.adDc + " 상품의 금액이 수정되었습니다.")
					
					$(pInput).val("");
					$(pSelect).val("");
					$(pSelect).find('option:first').prop('selected', true);
					
					window.location = 'setting';
				}
			}
		});
	}
	
	function init(btn) {
		let pInput = $(btn).parent().parent('div').find('input');
		let pSelect = $(btn).parent().parent('div').find('select');
		let selectVal = $(pSelect[0]).val();
		console.log(pInput.length);
		console.log("select : ", selectVal);
		
		
		  
		$(pInput).val("");
		
		console.log("pSelect val ", $(pSelect[0]).val());
		console.log("pSelect ", pSelect[0]);
		console.log("option:first ", pSelect.find('option:first'));
		
		$(pSelect).val("");
		$(pSelect).find('option:first').prop('selected', true);
		
	}
</script>
</head>

<body>

	<!-- **************** MAIN CONTENT START **************** -->
	<main>

		<!-- Page main content START -->
		<div class="page-content-wrapper p-xxl-4">

			<!-- Filters START -->
			<div class="col-lg-5">
				<h1 class="h3 mb-3 mb-sm-0">광고 설정</h1>
			</div>
			
			<!-- 검색 -->
			<div class="d-flex align-items-center col-md-6 col-lg-2">
			</div>
			
			<!-- 기간 설정 -->
			<div class="d-flex align-items-center col-md-6 col-lg-3">
			</div>
			
			<!-- 정렬 -->
			<div class="col-md-6 col-lg-2">
			</div>
			<!-- Filters END -->

			<!-- Adv list START -->
			<div class="p-3" style="position: relative;">
			</div>
			
			<div class="row g-4">
				<div class="col-lg-3 div3" style="float: left; width: 33%;">
					<div class="card shadow">
						<div class="card-header border-bottom" style="text-align: center;">
							<h5 class="card-header-title">메인 배너</h5>
						</div>
						<div class="card-body" style="text-align: center;">
							<div class="mb-3">
								<label class="form-label">기간</label>
								<select class="form-select js-choice" aria-label=".form-select-sm">
									<option value="000" >선택해주세요</option>
									<option value="001">1개월</option>
									<option value="002">3개월</option>
									<option value="003">6개월</option>
									<option value="004">1년</option>
								</select>
							</div>
							<hr />
							<div class="mb-3" >
								<label class="form-label">금액 설정</label>
								<input type="text" class="form-control" value="" placeholder="금액을 입력해주세요">
							</div>
							<div class="d-flex justify-content-end mt-4">
								<button type="button" onclick="init(this)" class="btn btn-sm text-secondary border-0 me-2">초기화</button>
								<button type="button" onclick="adUpdate(this)" data-ad-id="V01" class="btn btn-sm btn-primary">저장</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 div3" style="float: left; width: 33%;">
					<div class="card shadow">
						<div class="card-header border-bottom" style="text-align: center;">
							<h5 class="card-header-title">사이드 배너</h5>
						</div>
						<div class="card-body" style="text-align: center;">
							<div class="mb-3">
								<label class="form-label">기간</label>
								<select class="form-select js-choice" aria-label=".form-select-sm" name="sort" id="sort">
									<option value="" >선택해주세요</option>
									<option value="001">1개월</option>
									<option value="002">3개월</option>
									<option value="003">6개월</option>
									<option value="004">1년</option>
								</select>
							</div>
							<hr />
							<div class="mb-3" >
								<label class="form-label">금액 설정</label>
								<input type="text" class="form-control" value="" placeholder="금액을 입력해주세요">
							</div>
							<div class="d-flex justify-content-end mt-4">
								<button type="button" onclick="init(this)" class="btn btn-sm text-secondary border-0 me-2">초기화</button>
								<button type="button" onclick="adUpdate(this)" data-ad-id="V02" class="btn btn-sm btn-primary">저장</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 div3" style="float: left; width: 33%;">
					<div class="card shadow">
						<div class="card-header border-bottom" style="text-align: center;">
							<h5 class="card-header-title">최상단 노출</h5>
						</div>
						<div class="card-body" style="text-align: center;">
							<div class="mb-3">
								<label class="form-label">기간</label>
								<select class="form-select js-choice" aria-label=".form-select-sm" name="sort" id="sort">
									<option value="" >선택해주세요</option>
									<option value="001">1개월</option>
									<option value="002">3개월</option>
									<option value="003">6개월</option>
									<option value="004">1년</option>
								</select>
							</div>
							<hr />
							<div class="mb-3" >
								<label class="form-label">금액 설정</label>
								<input type="text" class="form-control" value="" placeholder="금액을 입력해주세요">
							</div>
							<div class="d-flex justify-content-end mt-4">
								<button type="button" onclick="init(this)" class="btn btn-sm text-secondary border-0 me-2">초기화</button>
								<button type="button" onclick="adUpdate(this)" data-ad-id="V03" class="btn btn-sm btn-primary">저장</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Guest list END -->
			<div class="card shadow mt-5">
				<!-- Card body START -->
				<div class="card-body">
					<!-- Table head -->
					<div class="bg-light rounded p-3 d-none d-lg-block">
						<div class="row row-cols-7 g-4">
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">광고명</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">가격</h6>
							</div>
							<div class="col" style="text-align: center;">
								<h6 class="mb-0">기간</h6>
							</div>
						</div>
					</div>
					<c:forEach var="adAdVO" items="${data.content}" varStatus="stat">
					<!-- Table data -->
						<div class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<small class="d-block d-lg-none">광고명:</small>
								<h6 class="mb-0 fw-normal">${adAdVO.adDc}</h6>
							</div>
		
							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<small class="d-block d-lg-none">가격:</small>
								<h6 class="mb-0 fw-normal">&#8361;<fmt:formatNumber type="number" pattern="#,###" value="${adAdVO.adPr}" /></h6>
							</div>
		
							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<small class="d-block d-lg-none">기간:</small>
								<h6 class="mb-0 fw-normal">내달 1일부터 <fmt:formatNumber type="number" pattern="##" value="${adAdVO.adPeriod}" />개월</h6>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- Card body END -->
		
				<!-- Card footer START -->
				<div class="card-footer pt-0">
					<div class="d-sm-flex justify-content-sm-between align-items-sm-center" style="float: right;">
						<c:set var="endRow" value="${data.currentPage * data.size}" />
						<c:set var="startRow" value="${endRow - (data.size - 1)}" />
						<c:set var="total" value="${data.total}" />
						<c:if test="${endRow>total}">
							<c:set var="endRow" value="${total}" />
						</c:if>
						<nav class="mb-sm-0 d-flex justify-content-center" aria-label="navigation">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0 ">
								<li class="page-item <c:if test='${data.startPage < 6}'>disabled</c:if>" id="dataTable_previous">
									<a class="page-link" href="/admin/advertise/setting?currentPage=${data.startPage-5}" aria-controls="dataTable" data-dt-idx="0"  tabindex="-1">Prev</a>
								</li>
								<c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage}">
									<li class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
										<a href="/admin/advertise/setting?currentPage=${pNo}" aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0" class="page-link">${pNo}</a>
									</li>
								</c:forEach>
								<li class="page-item <c:if test='${data.endPage == data.totalPages}'>disabled</c:if>" id="dataTable_next">
									<a class="page-link" href="/admin/advertise/setting?currentPage=${data.startPage+5}" aria-controls="dataTable" data-dt-idx="7"  tabindex="-1">Next</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- Page main content END -->
	</main>
	<!-- **************** MAIN CONTENT END **************** -->
</body>
</html>