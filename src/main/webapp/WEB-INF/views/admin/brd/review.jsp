<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
$(function(){
	$("#sort").on("change",function(){
		$("#frm01").submit();
	});
});
function blind(rsvId, rvwBlind) {
	console.log(rsvId);
	console.log(rvwBlind);
	if(rvwBlind == 'Y'){
		var txt = "차단 해제";
		var blind = 'N';
	}else {
		var txt = "차단";
		var blind = 'Y';
	}
	
	if(confirm(txt + "하시겠습니까?")){
		let object = {"rsvId":rsvId, "rvwBlind":blind};
		$.ajax({
	    	url:"/admin/brd/rvwBlind",
	    	contentType:"application/json;charset=utf-8",
	    	data:JSON.stringify(object),
	    	type:"post",
	    	beforeSend : function (xhr) {
	    		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	    	},
	    	success:function(result){
				if (result === "success") {
					alert(txt + "성공");
					window.location.reload();
				} else {
					alert("실패 메시지");
				}
			},
			error: function () {
				alert("요청을 처리하는 동안 오류가 발생했습니다");
			}
	    });
	} else {
		
	}
}
</script>

<!-- Page main content START -->
<div class="page-content-wrapper p-xxl-4">

	<!-- Filters START -->
	<form class="row g-4 align-items-center" id="frm01">
		<div class="col-lg-6">
			<h1 class="h3 mb-3 mb-sm-0">리뷰</h1>
		</div>

		<!-- 검색 -->
		<div class="col-md-6 col-lg-4">
			<input class="form-control bg-transparent" type="search" placeholder="Search" aria-label="Search" name="keyword" value="${param.keyword}">
			<button class="bg-transparent p-2 position-absolute top-50 end-0 translate-middle-y border-0 text-primary-hover text-reset" type="submit">
			</button>
		</div>
		
		<!-- 정렬 -->
		<div class="col-md-6 col-lg-2">
			<select class="form-select js-choice" aria-label=".form-select-sm" name="sort" id="sort">
				<option value="">Sort by</option>
				<option value="호텔" <c:if test="${param.sort=='호텔'}">selected</c:if>>호텔</option>
				<option value="모텔" <c:if test="${param.sort=='모텔'}">selected</c:if>>모텔</option>
				<option value="리조트" <c:if test="${param.sort=='리조트'}">selected</c:if>>리조트</option>
				<option value="게스트하우스" <c:if test="${param.sort=='게스트하우스'}">selected</c:if>>게스트하우스</option>
				<option value="펜션" <c:if test="${param.sort=='펜션'}">selected</c:if>>펜션</option>
				<option value="렌터카" <c:if test="${param.sort=='렌터카'}">selected</c:if>>렌터카</option>
			</select>
		</div>
	</form>
	<!-- Filters END -->
	
	<div class="card shadow mt-5">
		<!-- Card body START -->
		
			<div class="card-body">
				<c:forEach var="rvwListVO" items="${data.content}" varStatus="stat">
					<div class="bg-light rounded p-3">
						<!-- Review item START -->
						<div class="d-sm-flex justify-content-between">
							<!-- Avatar image -->
							<div class="d-sm-flex align-items-center mb-3">
								<c:if test="${not empty busiVO.busiImg}">
									<img class="avatar avatar-md rounded-circle float-start me-3" src="/resources/upload/mem${rvwListVO.savePath}" alt="avatar">
								</c:if>
								<c:if test="${empty busiVO.busiImg}">
									<img class="avatar avatar-md rounded-circle float-start me-3" src="/resources/booking/assets/images/avatar/user.png" alt="avatar">
								</c:if>
								<!-- Title -->
								<div>
									<a href="/admin/mem/detail?memId=${rvwListVO.memId}"><h6 class="m-0">${rvwListVO.memId}</h6></a>
									<span class="me-3 small"><fmt:formatDate value="${rvwListVO.rvwDt}" pattern="yyyy/MM/dd" /></span>
								</div>
							</div>
							<!-- Review star -->
							<ul class="list-inline mb-2 mb-sm-0">
								<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i>${rvwListVO.rvwStar}</li>
							</ul>	
						</div>
		
						<!-- Content -->
						<h6 class="fw-normal"><span class="text-body">Review (&rarr; ${rvwListVO.busiNm})</span></h6>
						<p>${rvwListVO.rvwCntn}</p>
						
						<!-- Image -->
						<div class="row g-4">
							<div class="col-4 col-sm-3 col-lg-2">
								<a href="assets/images/category/hotel/4by3/07.jpg" data-glightbox data-gallery="gallery">
									<img src="assets/images/category/hotel/4by3/07.jpg" class="rounded" alt="">
								</a>
							</div>
							<div class="col-4 col-sm-3 col-lg-2">
								<a href="assets/images/category/hotel/4by3/08.jpg" data-glightbox data-gallery="gallery">
									<img src="assets/images/category/hotel/4by3/08.jpg" class="rounded" alt="">
								</a>
							</div>
						</div>
						
						<!-- Buttons and collapse -->
						<div class="mt-3">
							<!-- Buttons -->
							<div class="d-flex justify-content-end align-items-center">
								<a href="#" class="text-primary-hover text-reset small mb-0" onclick="blind('${rvwListVO.rsvId}','${rvwListVO.rvwBlind}')"><i class="bi bi-info-circle me-1"></i>
									${rvwListVO.rvwBlind == 'N' ? '차단' : '차단해제'}
								</a>
							</div>
						</div>
						
						<c:if test="${not empty rvwListVO.rvwCmt}">
							<div class="collapse show" id="collapseComment">
								<div>
									<c:if test="${rvwListVO.busiCode == 'B01'}">
										<a href="/admin/busi/styDetail?busiId=${rvwListVO.busiId}"><h6 class="m-0">${rvwListVO.busiNm}</h6></a>
									</c:if>
									<c:if test="${rvwListVO.busiCode == 'B02'}">
										<a href="/admin/busi/rntDetail?busiId=${rvwListVO.busiId}"><h6 class="m-0">${rvwListVO.busiNm}</h6></a>
									</c:if>
								</div>
								<div class="d-flex mt-3">
									<textarea class="form-control mb-0" rows="2" spellcheck="false" readonly>${rvwListVO.rvwCmt}</textarea>
								</div>
							</div>
						</c:if>
						<!-- Review item END -->
					</div>
					<hr/>
				</c:forEach>
			</div>
		<!-- Card body END -->
	
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
							<a class="page-link" href="/admin/brd/list?currentPage=${data.startPage-5}&sort=${param.sort}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="0"  tabindex="-1">Prev</a>
						</li>
						<c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage}">
							<li class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
								<a href="/admin/brd/list?currentPage=${pNo}&sort=${param.sort}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0" class="page-link">${pNo}</a>
							</li>
						</c:forEach>
						<li class="page-item <c:if test='${data.endPage == data.totalPages}'>disabled</c:if>" id="dataTable_next">
							<a class="page-link" href="/admin/brd/list?currentPage=${data.startPage+5}&sort=${param.sort}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="7"  tabindex="-1">Next</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- Card footer END -->
	</div>
</div>
<!-- Page main content END -->



