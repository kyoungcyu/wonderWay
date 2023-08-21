<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script type="text/javascript">

$(document).ready(function() {
    $(".rounded-corner").on("click", function() {
      window.location.href = "/business/rcm/cvfc";
    });
  });
$(function(){
	$("#chatTime").on("click",function() {
		console.log(
			"시작 시간 :"  + 	$("#startH").val()  +  "시"  ,
			 			    $("#startM").val()  +  "분"  );
		console.log(
			"종료 시간 :"  + 	$("#finishH").val() +  "시"  ,
						    $("#finishM").val() +  "분"  );
		let data = {
			"chatSt" : $("#startH").val() + "시 " + $("#startM").val()  + "분",
			"chatEd" : $("#finishH").val()+ "시 " + $("#finishM").val() + "분"
			};
		console.log(JSON.stringify(data));
			$.ajax({
				type : "POST",
				url : "/business/myPage/chatTimePost",
				
				data : JSON.stringify(data),
				contentType : "application/json;charset=utf-8",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(
					"${_csrf.headerName}","${_csrf.token}");},
				success : function(data) {
					console.log(data)
					if (data == 1) {
						alert("채팅 시간을 설정하였습니다.")
						window.location.reload();
					} else {
						$("#chatTime").text("등록 실패!").css("color","red");
					};
			}
		});
	});
		

	$("input").on('click', function(e){
		if(e.target.checked){
			alert("항목을 추가하였습니다.");
			var id = e.target.id;
			console.log("insert:" +id);
			onclick = fn_insert(id);
		}else{
			alert("항목을 삭제하였습니다.");
			var id = e.target.id;
			console.log("delete:"+id);
			onclick = fn_delete(id);
		}
		
	});
	
});
	
	function fn_insert(id){
           data ={
           	"cvfcId" : id
           }
           console.log("data:", data);
           $.ajax({
   			type : "POST",
   			url : "/business/room/insertCvfc",
   			data : JSON.stringify(data),
   			contentType : "application/json;charset=utf-8",
   			beforeSend : function(xhr) {
   				xhr.setRequestHeader("${_csrf.headerName}",
   						"${_csrf.token}");
   			},
   			success : function(data) {
   				console.log(data);
   			}
   		});
 	}
	function fn_delete(id){
           data ={
           	"cvfcId" : id
           }
           console.log("data:", data);
           $.ajax({
   			type : "POST",
   			url : "/business/room/deleteCvfc",
   			data : JSON.stringify(data),
   			contentType : "application/json;charset=utf-8",
   			beforeSend : function(xhr) {
   				xhr.setRequestHeader("${_csrf.headerName}",
   						"${_csrf.token}");
   			},
   			success : function(data) {
   				console.log(data);
   			}
   		});
	
 	}
	
	
	
	
	
	
</script>





<style>
#myChart1 {
	width: 300px;
	height: 300px;
	margin: 0 auto;
}

#calender {
	width: 400px;
}

.hi {
	display: flex;
	justify-content: flex-end;
}
.rounded-corner {
  border-radius:30px;
}
</style>
<body class="pt-0">
	<br />
	<br />
	<div class="container vstack gap-4">
		<!-- Title START -->
		<div class="row">
			<div class="col-12">
				<h1 class="fs-4 mb-0">
					<i class="bi bi-graph-up-arrow fa-fw me-1"></i>편의시설 관리
				</h1>
			</div>
		</div>
		<!-- Title END -->

		<form class="card-body">


			<div class="form-group" style="display: flex;">
				<div class="card-columns" style="display: flex;">
					<div class="form-control-wrap">
						<div class="form-control" style="width: 585px; height: 100px; display: flex; justify-content: space-between; align-items: center;">
							<div class="text-success">채팅 시작시간*</div>
							<select class="form-select js-choice" id="startH" style="width: 180px; height: 50px;">
								<option value="">시간 &nbsp; &nbsp;</option>
								<option value="9">9&nbsp; &nbsp;</option>
								<option value="10">10&nbsp; &nbsp;</option>
								<option value="11">11&nbsp; &nbsp;</option>
								<option value="12">12&nbsp; &nbsp;</option>
								<option value="13">13&nbsp; &nbsp;</option>
								<option value="14">14&nbsp; &nbsp;</option>
								<option value="15">15&nbsp; &nbsp;</option>
								<option value="16">16&nbsp; &nbsp;</option>
								<option value="17">17&nbsp; &nbsp;</option>
								<option value="18">18&nbsp; &nbsp;</option>
							</select> 시 
							<select class="form-select js-choice" id="startM" style="width: 180px; height: 50px;">
								<option value="">분 &nbsp; &nbsp;</option>
								<option value="00">00&nbsp; &nbsp;</option>
								<option value="10">10&nbsp; &nbsp;</option>
								<option value="20">20&nbsp; &nbsp;</option>
								<option value="30">30&nbsp; &nbsp;</option>
								<option value="40">40&nbsp; &nbsp;</option>
								<option value="50">50&nbsp; &nbsp;</option>
							</select> 분
						</div>
					</div>
					<div class="form-control-wrap">
						<div class="form-control" style="width: 585px; height: 100px; display: flex; justify-content: space-between; align-items: center;">
							<div class="text-danger">채팅 종료시간*</div>
							<select class="form-select js-choice" id="finishH" style="width: 180px; height: 50px;">
								<option value="">시간 &nbsp; &nbsp;</option>
								<option value="12">12&nbsp; &nbsp;</option>
								<option value="13">13&nbsp; &nbsp;</option>
								<option value="14">14&nbsp; &nbsp;</option>
								<option value="15">15&nbsp; &nbsp;</option>
								<option value="16">16&nbsp; &nbsp;</option>
								<option value="17">17&nbsp; &nbsp;</option>
								<option value="18">18&nbsp; &nbsp;</option>
								<option value="19">19&nbsp; &nbsp;</option>
								<option value="20">20&nbsp; &nbsp;</option>
								<option value="21">21&nbsp; &nbsp;</option>
								<option value="22">22&nbsp; &nbsp;</option>
								<option value="23">23&nbsp; &nbsp;</option>
								<option value="24">24&nbsp; &nbsp;</option>
							</select> 시 
							<select class="form-select js-choice" id="finishM" style="width: 180px; height: 50px;">
								<option value="">분 &nbsp; &nbsp;</option>
								<option value="00">00&nbsp; &nbsp;</option>
								<option value="10">10&nbsp; &nbsp;</option>
								<option value="20">20&nbsp; &nbsp;</option>
								<option value="30">30&nbsp; &nbsp;</option>
								<option value="40">40&nbsp; &nbsp;</option>
								<option value="50">50&nbsp; &nbsp;</option>
							</select> 분
						</div>
					</div>
				</div>
			</div>
			<c:set var="busiVO" value="${busiVO}"/>
	<div class="col-14 text-end" style="display: flex; align-items: center;">
  <label class="form-label" style="margin-right: 10px;"></label>
  <input type="text" id="chat" class="form-control text-center" value="채팅 시작시간  : ${busiVO.chatSt} / 채팅 종료시간  : ${busiVO.chatEd}" disabled="true" />
  <button type="button" id="chatTime" class="btn btn-primary" style="margin-left: 10px; margin-top:3px; height: 42px; width: 100px !important; font-size: 14px;">저장하기</button>
</div>

		</form>

		<img class="rounded btn rounded-corner" alt="cvfcBanner" src="/resources/booking/assets/images/cvfcBanner.png">
		
		<c:set var="selectCvfc" value="${selectCvfc}"></c:set>
		<div class="row g-4">
			<!-- 1번째 카드 START -->
			<div class="col-md-3">
				<div class="card border h-100">

					<!-- Card header -->
					<div
						class="card-header border-bottom d-flex justify-content-between align-items-center">
						<h5 class="card-header-title">시설/서비스</h5>
					</div>

					<!-- Card body START -->
					<div class="tab-content">
						<div class="tab-pane active show" id="tab-1" role="tabpanel">
							<div class="row g-4">
								<div class="card-body p-3">
									<!-- 편의시설 나열 -->
									<ul class="  list-group-borderless mt-2 mb-0" id="checkboxList">
									  <c:forEach var="cvfcSer" items="${cvfcSerList}" varStatus="stat">
									    <li class="list-group-item pb-0 mx-auto cvfcSer">
									      <i class="fa-solid ${cvfcSer.icon}"></i>
									      <input type="checkbox" id="${cvfcSer.cvfcId}" name="accommodation" value="childAccompany" 
											  <c:forEach var="selectCvfc" items="${selectCvfc}" varStatus="stat">
										      	<c:if test="${cvfcSer.cvfcId eq selectCvfc.cvfcId}">
										          checked
										        </c:if>
												</c:forEach>
										      /> 
									      <label for="childAccompany">${cvfcSer.cvfcNm}</label>
									    </li>
									  </c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 2번째 그래프 -->
			<div class="col-md-3">
				<div class="card border h-100">

					<!-- Card header -->
					<div
						class="card-header border-bottom d-flex justify-content-between align-items-center">
						<h5 class="card-header-title">객실별</h5>
					</div>

					<!-- Card body START -->
					<div class="card-body p-3">
						<!-- 편의시설 나열 -->
						<ul class="  list-group-borderless mt-2 mb-0" id="checkboxList">
							<c:forEach var="cvfcRm" items="${cvfcRmList}" >
								<li class="list-group-item pb-0 mx-auto"><i
									class="fa-solid ${cvfcRm.icon}"></i> 
									<input type="checkbox" id="${cvfcRm.cvfcId}" name="accommodation" value="childAccompany"
										<c:forEach var="selectCvfc" items="${selectCvfc}" varStatus="stat">
										   <c:if test="${cvfcRm.cvfcId eq selectCvfc.cvfcId}">
										          checked
										    </c:if>
										</c:forEach>
									/>
									<label for="childAccompany">${cvfcRm.cvfcNm}</label></li>
							</c:forEach>
						</ul>



					</div>
				</div>
			</div>

			<!-- 3번째 그래프 -->
			<div class="col-md-3">
				<div class="card border h-100">

					<!-- Card header -->
					<div
						class="card-header border-bottom d-flex justify-content-between align-items-center">
						<h5 class="card-header-title">청결/안전</h5>
					</div>

					<!-- Card body START -->
					<div class="card-body p-3">
						<!-- 편의시설 나열 -->
						<ul class="  list-group-borderless mt-2 mb-0" id="checkboxList">
							<c:forEach var="cvfcIcon" items="${cvfcIconList}" >
								<li class="list-group-item pb-0 mx-auto"><i
									class="fa-solid ${cvfcIcon.icon}"></i> 
									<input type="checkbox" id="${cvfcIcon.cvfcId}" name="accommodation" value="childAccompany"
										<c:forEach var="selectCvfc" items="${selectCvfc}" varStatus="stat">
										   <c:if test="${cvfcIcon.cvfcId eq selectCvfc.cvfcId}">
										          checked
										    </c:if>
										</c:forEach>
									/>
									<label for="childAccompany">${cvfcIcon.cvfcNm}</label></li>
							</c:forEach>
						</ul>



					</div>
				</div>
			</div>

			<!-- 4번째 그래프 -->
			<div class="col-md-3">
				<div class="card border h-100">

					<!-- Card header -->
					<div
						class="card-header border-bottom d-flex justify-content-between align-items-start">
						<h5 class="card-header-title">접근성</h5>
					</div>

					<!-- Card body START -->
					<div class="card-body p-3">
						<!-- 편의시설 나열 -->
						<ul class="  list-group-borderless mt-2 mb-0" id="checkboxList">
							<c:forEach var="cvfcAcc" items="${cvfcAccList}" >
								<li class="list-group-item pb-0 mx-auto"><i
									class="fa-solid ${cvfcAcc.icon}"></i> <input type="checkbox"
									id="${cvfcAcc.cvfcId}" name="accommodation" value="childAccompany"
										<c:forEach var="selectCvfc" items="${selectCvfc}" varStatus="stat">
										   <c:if test="${cvfcAcc.cvfcId eq selectCvfc.cvfcId}">
										          checked
										    </c:if>
										</c:forEach>
									/>
									<label for="childAccompany">${cvfcAcc.cvfcNm}</label></li>
							</c:forEach>
						</ul>



					</div>
				</div>
			</div>
			<!-- Booking graph END -->
		</div>
		<!-- Graph END -->
	</div>
	<br />
	<br />
	<br />


	<script type="text/javascript">
		
	</script>



</body>

