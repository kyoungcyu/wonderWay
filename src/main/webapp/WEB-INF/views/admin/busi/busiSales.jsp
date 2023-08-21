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
<script src="/resources/booking/assets/vendor/choices/js/choices.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#busiSearch").on("change",function(){
			$("#frm01").submit();
		});

		$("#sort").on("change",function(){
			$("#frm01").submit();
		});
		
		
		$("#init").on("click", function() {
			$("#calender").val("");
			$("input[name=keyword]").val("");
			$("#sort").val("");
			
			$("#frm01").submit();
		});
		
		$("#downloadExcel").on("click", function() {
			$.ajax({
				url : "/admin/busi/downloadExcelPost",
				data : {
					"food " : ""
				},
				type : "get",
				xhrFields:{
			        responseType: 'blob'
			    },
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					console.log(result);	
					var blob = result;
				    var downloadUrl = URL.createObjectURL(blob);
				    var a = document.createElement("a");
				    a.href = downloadUrl;
				    if($("#sort").val() == "") {
					    return;
				    } else {
					    a.download = "매출내역_" + $("#calender").val() + ".xlsx";
				    }
				    document.body.appendChild(a);
				    a.click();
				}
			});
		});
	});
	
	
</script>


</head>


<!-- **************** MAIN CONTENT START **************** -->
<main>
	<form id="frm01">
		<div class="page-content-wrapper p-xxl-4">
			<!-- Earning block START -->
			<div class="row g-4">
				<!-- Block item -->
				<div class="col-sm-6 col-xxl-3">
					<div class="card card-body bg-light p-4 h-100">
						<h6 class="mb-0">연 매출</h6>
						<br />
						<h4 class="mb-2 mt-2">
							&#8361;<fmt:formatNumber type="number" pattern="#,###" value="${year}" />
						</h4>
					</div>
				</div>

				<!-- Block item -->
				<div class="col-sm-6 col-xxl-3">
					<div class="card card-body bg-light p-4 h-100">
						<h6 class="mb-0">월 매출</h6>
						<br />
						<h4 class="mb-2 mt-2">
							&#8361; <fmt:formatNumber type="number" pattern="#,###" value="${month}" />
						</h4>
					</div>
				</div>
	
				<!-- Block item -->
				<div class="col-sm-6 col-xxl-6" >
					<div class="card card-body bg-light p-4 h-100">
						<h6 class="mb-0">업체명</h6>
						<br />
						<select class="form-select js-choice" aria-label=".form-select-sm" name="busiSearch" id="busiSearch" data-search-enabled="true">
							<option value="" >선택해주세요</option>
							<option value="B0100011" >몽산포 펜션</option>
							<c:forEach var="busiVO" items="${busiList}" varStatus="stat">
								<option value="${busiVO.busiId}" <c:if test="${busiVO.busiId==param.busiSearch}">selected</c:if>>${busiVO.busiNm }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<!-- Earning block END -->

			<!-- Payment history START -->
			<div class="card shadow mt-5">
				<!-- Card header -->
				<div class="card-header border-bottom" id="frm02">
					<div class="row g-4 align-items-center">
						<div class="col-lg-4">
							<h5 class="h4 mb-3 mb-sm-0">${param.busiNm} 정산 내역
								<a id="init" href="#s" class="h5 mb-0 text-body">
									<i class="bi bi-arrow-clockwise"></i>
								</a>
								&ensp;&ensp;<a id="downloadExcel" href="#" class="btn btn-outline-primary btn-round mb-0"><i class="bi bi-cloud-download"></i></a>
							</h5>
						</div>
						
						<div class="d-flex align-items-center col-md-6 col-lg-3">
						</div>
						
						<!-- 검색 -->
						<div class="d-flex align-items-center col-md-6 col-lg-3">
						</div>
						
						<!-- 정렬 -->
						<div class="col-md-6 col-lg-2">
							<select class="form-select js-choice" aria-label=".form-select-sm" name="sort" id="sort">
								<option value="" >선택해주세요</option>
								<option value="1" <c:if test="${param.sort=='1'}">selected</c:if>>1월</option>
								<option value="2" <c:if test="${param.sort=='2'}">selected</c:if>>2월</option>
								<option value="3" <c:if test="${param.sort=='3'}">selected</c:if>>3월</option>
								<option value="4" <c:if test="${param.sort=='4'}">selected</c:if>>4월</option>
								<option value="5" <c:if test="${param.sort=='5'}">selected</c:if>>5월</option>
								<option value="6" <c:if test="${param.sort=='6'}">selected</c:if>>6월</option>
								<option value="7" <c:if test="${param.sort=='7'}">selected</c:if>>7월</option>
								<option value="8" <c:if test="${param.sort=='8'}">selected</c:if>>8월</option>
								<option value="9" <c:if test="${param.sort=='9'}">selected</c:if>>9월</option>
								<option value="10" <c:if test="${param.sort=='10'}">selected</c:if>>10월</option>
								<option value="11" <c:if test="${param.sort=='11'}">selected</c:if>>11월</option>
								<option value="12" <c:if test="${param.sort=='12'}">selected</c:if>>12월</option>
							</select>
						</div>
					</div>
				</div>

				<!-- Card body START -->
				<div class="card-body">
					<!-- Table head -->
					<div class="bg-light rounded p-3 d-none d-sm-block">
						<div class="row row-cols-7 g-4">
							<div class="col" style="text-align: center;"><h6 class="mb-0">금액</h6></div>
							<div class="col" style="text-align: center;"><h6 class="mb-0">날짜</h6></div>
						</div>
					</div>

					<c:forEach var="adBusiSalesVO" items="${data.content}" varStatus="stat">
						<!-- Table data -->
						<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">

							<!-- Data item -->
							<div class="col" style="text-align: center; padding-left: 10px;">
								<small class="d-block d-sm-none">금액:</small>
								<h6 class="fw-light mb-0"><fmt:formatNumber value="${adBusiSalesVO.payPr}" pattern="#,###" /></h6>
							</div>	
	
							<!-- Data item -->
							<div class="col" style="text-align: center;">
								<small class="d-block d-sm-none">날짜:</small>
								<h6 class="mb-0 fw-normal"><fmt:formatDate value="${adBusiSalesVO.rsvDt}" pattern="yyyy/MM/dd" /></h6>
							</div>
	
						</div>
					</c:forEach>
				</div>
				<!-- Card footer START -->
				<div class="card-footer pt-0">
					<!-- Pagination and content -->
					<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
						<!-- Content -->
						<c:set var="endRow" value="${data.currentPage * data.size}" />
						<c:set var="startRow" value="${endRow - (data.size - 1)}" />
						<c:set var="total" value="${data.total}" />
						<c:if test="${endRow>total}">
							<c:set var="endRow" value="${total}" />
						</c:if>
						<p class="mb-sm-0 text-center text-sm-start">Showing ${startRow} to ${endRow} of ${total} entries</p>
						<!-- Pagination -->
						<nav class="mb-sm-0 d-flex justify-content-center" aria-label="navigation">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0 ">
								<li class="page-item <c:if test='${data.startPage < 6}'>disabled</c:if>" id="dataTable_previous">
									<a class="page-link" href="/admin/busi/busiSales?currentPage=${data.startPage-5}&sort=${param.sort}&busiSearch=${param.busiSearch}" aria-controls="dataTable" data-dt-idx="0"  tabindex="-1">Prev</a>
								</li>
								<c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage}">
									<li class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
										<a href="/admin/busi/busiSales?currentPage=${pNo}&sort=${param.sort}&busiSearch=${param.busiSearch}" aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0" class="page-link">${pNo}</a>
									</li>
								</c:forEach>
								<li class="page-item <c:if test='${data.endPage == data.totalPages}'>disabled</c:if>" id="dataTable_next">
									<a class="page-link" href="/admin/busi/busiSales?currentPage=${data.startPage+5}&sort=${param.sort}&busiSearch=${param.busiSearch}" aria-controls="dataTable" data-dt-idx="7"  tabindex="-1">Next</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
				<!-- Card footer END -->
			</div>
			<!-- Payment history END -->

		</div>
		<!-- Page main content END -->
	</form>
</main>
<!-- **************** MAIN CONTENT END **************** -->
