<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">


$(function(){
	$("#outAccount").on("click",function() {
		let withDraw = $("#money").val();
		let str = "&#8361;"
				+ withDraw.replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
				+ "원 을";
		$(".account").html(str);
		$("#wMoney").modal("show");
	});
	
	$("#withdrawWM").on("click",function() {
		let data = {
			"busiMny" : $("#money").val()
		}
		console.log(data)
		$.ajax({
			type : "POST",
			url : "/business/myPage/withDraw",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(data) {
				console.log(data)
					window.location.reload();
				if (data == 1) {
					$("#money").val("");
				} else if (data == 0) {
					alert("잔액이 부족합니다.");
					$("#money").text("").css("color", "red");
				}
			}
		});
	});
		//계좌번호 재설정
		$("#bankBtn").on("click",function() {
			let data = {
				"account" : $("#accnt").val()
			};
			console.log("data : " + JSON.stringify(data));
			$.ajax({
				type : "POST",
				url : "/business/myPage/updateBank",
				data : JSON.stringify(data),
				contentType : "application/json;charset=utf-8",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
				success : function(data) {
					console.log(data)
					if (data == 1) {
						alert("계좌번호가 등록 되었습니다.");
						$("#accnt").val("");

					} else {
						$("#accnt").text("등록 실패!").css("color", "red");
					}
				}
					})
				})
});
</script>





<body class="pt-0">
	<br />
	<br />
	<div class="container vstack gap-4">
		<!-- Title START -->
		<div class="row">
			<div class="col-12 card-header border-bottom">
				<h1 class="fs-4 mb-0">
					<i class="bi bi-currency-exchange"></i>계좌 관리
				</h1>
			</div>
		</div>
		<!-- Title END -->
		<c:set var="busiVO" value="${data}" />
		<form class="card-body">
			<div class="row">
			  <div class="col-md-6 card border h-100">
			    <label class="form-label"><span class="text-danger">은행 계좌*</span></label>
			      <select class="form-select js-choice " >
			        <option value="">KB국민은행</option>
			        <option value="">신한은행</option>
			        <option value="">카카오뱅크</option>
			        <option value="">농협은행</option>
			        <option value="">하나은행</option>
			        <option value="">기업은행</option>
			        <option value="">제주은행</option>
			        <option value="">케이뱅크</option>
			      </select> 
			      <input type="text" class="form-control form-control-user" value="${busiVO.account}" disabled="true"/>
			      <input type="text" class="form-control form-control-user" id="accnt" placeholder="계좌번호를 등록해주세요.">
			      
			      <div class="col-12 text-end">
			        <button class="btn btn-default" id="bankBtn">등록하기</button>
			      </div>
			  </div>
			  
			  <div class="col-md-6 card border h-100">
			    <label class="form-label"> 
			   	 <span class="text-danger">원더머니*</span>
			   	 </label>
					<input type="text" class="form-control"
						value="<fmt:formatNumber value="${busiVO.busiMny}" pattern="#,###,###"/>" disabled="true" /> 
					<input type="text" id="money" class="form-control" />
					<div class="col-12 text-end">
						<button type="button" id="outAccount"
							class="btn btn-default mb-0">출금하기</button>
					</div>
			  </div>
			</div>
		</form>
		<div class="modal fade" id="wMoney" tabindex="-1"
			aria-labelledby="mapmodalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-sm">
				<div class="modal-content">
					<!-- Title -->
					<div class="modal-header">
						<h5 class="modal-title" id="mapmodalLabel">원더머니 출금</h5>
					</div>

					<!--모달 바디-->
					<div class="modal-body p-3">
						<div class='tab-content mb-0'>해당 계좌 번호</div>
						<div class='tab-content mb-0'>"${busiVO.account}" 으로</div>
						<div class='tab-content mb-0 account'></div>
						<div class='tab-content mb-0'>출금 하시겠습니까 ?</div>
					</div>

					<!--확인 버튼 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-primary mb-0"
							data-bs-dismiss="modal" id="withdrawWM">확인</button>
					</div>
				</div>
			</div>
		</div>

		
		
		<!-- Graph END -->
	<br />
	<br />
	<br />


</body>

