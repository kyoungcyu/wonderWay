<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
$(function(){
	$("#sort").on("change",function(){
		$("#frm01").submit();
	});
});

function delet(faqId) {
	let object = {"faqId": faqId };
	
	// 확인 대화상자를 표시하여 사용자의 응답을 확인합니다.
	if (confirm("삭제하시겠습니까?")) {
		$.ajax({
			url: "/admin/brd/faqDelete",
			contentType: "application/json;charset=utf-8",
			data: JSON.stringify(object),
			type: "post",
			beforeSend: function (xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function (result) {
				console.log("result : " + result);
				if (result == "success") {
					window.location.href = "/admin/brd/faq";
				} else {
					alert("실패 메시지");
				}
			},
			error: function () {
				alert("요청을 처리하는 동안 오류가 발생했습니다");
			}
		});
	}
}

</script>

<!-- Page main content START -->
<div class="page-content-wrapper p-xxl-4">

	<!-- Filters START -->
	<form class="row g-4 align-items-center" id="frm01">
		<div class="col-lg-6">
			<h1 class="h3 mb-3 mb-sm-0">자주 묻는 질문</h1>
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
				<option value="F01" <c:if test="${param.sort=='F01'}">selected</c:if>>국내/해외숙소</option>
				<option value="F02" <c:if test="${param.sort=='F02'}">selected</c:if>>렌터카</option>
				<option value="F03" <c:if test="${param.sort=='F03'}">selected</c:if>>교통/항공</option>
				<option value="F04" <c:if test="${param.sort=='F04'}">selected</c:if>>쿠폰/포인트</option>
				<option value="F05" <c:if test="${param.sort=='F05'}">selected</c:if>>결제/영수증</option>
				<option value="F06" <c:if test="${param.sort=='F06'}">selected</c:if>>회원</option>
			</select>
		</div>
	</form>
	<!-- Filters END -->
	
	<div class="card shadow mt-5">
		<!-- Card body START -->
		<div class="card-body">
			<!-- Hotel room list START -->
			<div class="table-responsive border-0">
				<table class="table align-middle p-4 mb-0 table-hover table-shrink">
					<!-- Table head -->
					<thead class="table-light">
						<tr>
							<th scope="col" class="border-0 rounded-start text-center">게시글ID</th>
							<th scope="col" class="border-0  text-center">종류</th>
							<th scope="col" class="border-0  text-center">제목</th>
							<th scope="col" class="border-0  text-center">수정</th>
							<th scope="col" class="border-0 rounded-end  text-center">삭제</th>
						</tr>
					</thead>
					<c:forEach var="faqVO" items="${data.content}" varStatus="stat">
						<!-- Table body START -->
						<tbody class="border-top-0">
							<!-- Table item -->
							<tr>
								<td>
									<a href="/member/csc/faq"><h6 class="mb-0">${faqVO.faqId}</h6></a>
								</td>
								<td>
									${faqVO.faqCode == 'F01' ? '국내/해외숙소' : faqVO.faqCode == 'F02' ? '렌터카' : faqVO.faqCode == 'F03' ? '교통/항공' :
										faqVO.faqCode == 'F04' ? '쿠폰/포인트' : faqVO.faqCode == 'F05' ? '결제/영수증' : faqVO.faqCode == 'F06' ? '회원' : ''}
								</td>
								<td>
									<div>${faqVO.faqTt}</div>
								</td>
								<td class="text-center">
									<a href="/admin/brd/faqModify?faqId=${faqVO.faqId}" class="btn btn-sm btn-primary mb-0">수정</a>
								</td>
								<td class="text-center">
									<button type="button" onclick="delet('${faqVO.faqId}')" class="btn btn-sm btn-danger mb-0">삭제</button>
								</td>
							</tr>
						</tbody>
						<!-- Table body END -->
					</c:forEach>
				</table>
			</div>
			<!-- Hotel room list END -->
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
							<a class="page-link" href="/admin/brd/faq?currentPage=${data.startPage-5}&sort=${param.sort}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="0"  tabindex="-1">Prev</a>
						</li>
						<c:forEach var="pNo" begin="${data.startPage}" end="${data.endPage}">
							<li class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
								<a href="/admin/brd/faq?currentPage=${pNo}&sort=${param.sort}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0" class="page-link">${pNo}</a>
							</li>
						</c:forEach>
						<li class="page-item <c:if test='${data.endPage == data.totalPages}'>disabled</c:if>" id="dataTable_next">
							<a class="page-link" href="/admin/brd/faq?currentPage=${data.startPage+5}&sort=${param.sort}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="7"  tabindex="-1">Next</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="/admin/brd/faqRegistration">글작성</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- Card footer END -->
	</div>
</div>
<!-- Page main content END -->



