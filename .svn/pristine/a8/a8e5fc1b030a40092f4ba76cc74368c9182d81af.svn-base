<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#sort").on("change",function(){
		$("#frm01").submit();
	});
	
	$("#downloadExcel").on("click", function() {
		$.ajax({
			url : "/admin/rnt/downloadExcel",
			data : {
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
			    a.download = "전체 렌터카 업체.xlsx";
			    document.body.appendChild(a);
			    a.click();
			}
		});
	});
});

function sendMail(busiEmail) {
	$("#btn01").on("click",function(){
	    let text = $("#message-text").val();
	    let subject = $("#subject").val();
	    
	    if(subject == ""){
	    	alert("제목을 입력해주세요");
	    	return;
	    }
	    if(text == ""){
	    	alert("보낼 내용을 입력해주세요");
	    	return;
	    }
	    
	    let object = {"text":text, "subject":subject, "busiEmail":busiEmail};
	    console.log("object : " + JSON.stringify(object));
	    
	    $.ajax({
	    	url:"/admin/busi/sendMail",
	    	contentType:"application/json;charset=utf-8",
	    	data:JSON.stringify(object),
	    	type:"post",
	    	beforeSend : function (xhr) {
	    		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	    	},
	    	success:function(result){
	    		console.log("result : " + result);
				if (result === "success") {
					alert("메일보내기 성공");
					window.location.reload();
				} else {
					alert("실패 메시지");
				}
			},
			error: function () {
				alert("요청을 처리하는 동안 오류가 발생했습니다");
			}
	    });
	  });
}

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

<!-- Page main content START -->
	<div class="page-content-wrapper p-xxl-4">

		<!-- Title -->
		<div class="row">
			<div class="col-12 mb-4 mb-sm-5">
				<div class="d-sm-flex justify-content-between align-items-center">
					<h1 class="h3 mb-3 mb-sm-0">렌터카 업체 조회 &ensp;&ensp;<a id="downloadExcel" href="#" class="btn btn-outline-primary btn-round mb-0"><i class="bi bi-cloud-download"></i></a></h1>
				</div>
			</div>
		</div>

		<!-- Search and select START -->
		<form class="row g-4 align-items-center" id="frm01">
		<div class="row g-3 align-items-center justify-content-between mb-5">
			<!-- Search -->
			<div class="col-md-8">
					<input class="form-control pe-5" type="search" placeholder="Search" aria-label="Search" name="keyword" value="${param.keyword}">
					<button class="btn border-0 px-3 py-0 position-absolute top-50 end-0 translate-middle-y" type="submit"><i class="fas fa-search fs-6"></i></button>
			</div>

			<!-- Select option -->
			<div class="col-md-3">
				<!-- Short by filter -->
					<select class="form-select js-choice" aria-label=".form-select-sm" name="sort" id="sort">
						<option value="">Sort by</option>
						<option value="활성" <c:if test="${param.sort=='활성'}">selected</c:if>>활성화</option>
						<option value="비활성" <c:if test="${param.sort=='비활성'}">selected</c:if>>비활성화</option>
					</select>
			</div>
		</div>
		</form>
		<!-- Search and select END -->
		
		<div class="row g-4">
			<!-- Block item -->
			<div class="col-sm-6 col-xxl-6">
				<div class="card card-body bg-light p-4 h-100">
					<h6 class="mb-0">전체 렌터카 업체수</h6>
					<h4 class="mb-2 mt-2 text-end">
						<fmt:formatNumber type="number" pattern="#,###" value="${total}" />개
					</h4>
					<p class="mt-auto mb-0">활성 업체 <fmt:formatNumber type="number" pattern="#,###" value="${enable}" />개
					<p class="mt-auto mb-0">비활성 업체 <fmt:formatNumber type="number" pattern="#,###" value="${disable}" />개
				</div>
			</div>
		
			<!-- Block item -->
			<div class="col-sm-6 col-xxl-6">
				<div class="card card-body bg-light p-4 h-100">
					<h6>이번달 매출</h6>
					<h4 class="text-end">
						&#8361;<fmt:formatNumber type="number" pattern="#,###" value="${thisMth}" />
					</h4>
					<p class="mt-auto mb-0">전월 대비 
					<c:if test="${thisMth > lastMth}">
						<span class="badge bg-success bg-opacity-10 text-success"><fmt:formatNumber value="${increaseMth}" pattern=".00"/>% <i class="bi bi-graph-up"></i></span></p>
					</c:if>
					<c:if test="${thisMth < lastMth}">
						<span class="badge bg-danger bg-opacity-10 text-danger"><fmt:formatNumber value="${increaseMth}" pattern=".00"/>% <i class="bi bi-graph-up"></i></span></p>
					</c:if>
					<p class="mt-auto mb-0">전월 매출 <fmt:formatNumber type="number" pattern="#,###" value="${lastMth}" />
				</div>
			</div>
		</div>
		
		<div class="my-2"></div>

		<!-- agent list START -->
		<div class="row g-4">
			<!-- Card item -->
			<c:forEach var="busiVO" items="${data.content}" varStatus="stat">
				<div class="col-md-6 col-lg-4 col-xxl-3">
					<div class="card border h-100">
						<!-- Dropdown button -->
						<div class="dropdown position-absolute top-0 end-0 m-3">
							<a href="#" class="btn btn-sm btn-light btn-round small mb-0" role="button" id="dropdownShare1" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="bi bi-three-dots fa-fw"></i>
							</a>
							<!-- dropdown button -->
							<ul class="dropdown-menu dropdown-w-sm dropdown-menu-end min-w-auto shadow rounded" aria-labelledby="dropdownShare1">
								<li><a class="dropdown-item" href="#" onclick="abled('${busiVO.busiId}', `${busiVO.enabled == '1' ? '비활성화' : '활성화'}`)"><i class="bi bi-exclamation-triangle fa-fw me-2"></i>${busiVO.enabled == '1' ? '비활성화' : '활성화'}</a></li>
							</ul>
						</div>
						<!-- Card body -->
						<div class="card-body text-center pb-0">
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
							<h5 class="mb-1">${busiVO.busiNm}</h5>
							<small><i class="bi bi-geo-alt me-1"></i>${busiVO.busiLoc}</small>
							<!-- Info and rating -->
							<div class="d-flex justify-content-between mt-3">
								<h6 class="mb-0 small"><span class="fw-light">대표자명 : </span>${busiVO.rprsvNm}</h6>
								<h6 class="mb-0 small"><i class="fa-solid fa-star text-warning ms-1"></i>${busiVO.busiScr}</h6>
							</div>
							<div class="d-flex justify-content-between mt-3">
								<h6 class="mb-0 small"><span class="fw-light">상태 : </span>${busiVO.enabled == '1' ? '활성화' : '비활성화'}</h6>
							</div>
						</div>
						<!-- card footer -->
						<div class="card-footer d-flex gap-3 align-items-center">
							<a href="/admin/busi/rntDetail?busiId=${busiVO.busiId}" class="btn btn-sm btn-primary-soft mb-0 w-100">View detail</a>
							<a href="#" class="btn btn-sm btn-light flex-shrink-0 mb-0" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap" onclick="sendMail('${busiVO.busiEmail}')" ><i class="bi bi-envelope-open"></i></a>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- agent list END -->
	
			<!-- Pagination START -->
			<div class="d-sm-flex justify-content-sm-between align-items-sm-center mt-4">
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
							<a class="page-link" href="/admin/busi/rnt?currentPage=${data.startPage-5}&sort=${param.sort}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="0"  tabindex="-1">Prev</a>
						</li>
						<c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage}">
							<li class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
								<a href="/admin/busi/rnt?currentPage=${pNo}&sort=${param.sort}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0" class="page-link">${pNo}</a>
							</li>
						</c:forEach>
						<li class="page-item <c:if test='${data.endPage == data.totalPages}'>disabled</c:if>" id="dataTable_next">
							<a class="page-link" href="/admin/busi/rnt?currentPage=${data.startPage+5}&sort=${param.sort}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="7"  tabindex="-1">Next</a>
						</li>
					</ul>
				</nav>
			</div>
			<!-- Pagination END -->
	
		</div>
	<!-- Page main content END -->
</div>
<!-- Page content END -->
	
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-centered" >
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">메일 보내기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form name="frm01" id="frm01" action="/admin/mem/wrnStUpdate" method="POST">
          <div class="mb-3">
            <label for="message-text" class="col-form-label">제목:</label>
            <input type="text" class="form-control" id="subject"/>
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