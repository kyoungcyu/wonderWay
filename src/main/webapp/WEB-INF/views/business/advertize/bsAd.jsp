<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.myAnnotation {
	font-size: small;
	opacity: 0.5;
}

table {
	margin-left: auto;
	margin-right: auto;
}

th, td {
	text-align: center;
}
</style>
<body>
	<br />
	<br />
	<div class="container vstack gap-4">
		<!-- Title START -->
		<div class="row">
			<div class="col-12">
				<h1 class="fs-4 mb-0">
					<i class="bi bi-badge-ad fa-fw me-1"></i>광고
				</h1>
			</div>
		</div>
		<!-- Title END -->

		<!-- Counter START -->
		<div class="row">
			<div class="col-12">
				<div class="card border h-100">

					<!-- Card header START -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">
							광고 신청 <span class="myAnnotation">*이미 신청한 광고는 노출 되지 않습니다.</span>
						</h5>
					</div>

					<!-- Card header END -->

					<!-- 광고리스트 시작 -->
					<div class="card-body">
						<div class="row g-4">
							<div class="row g-4">


								<!-- 메인배너 광고 START -->
								<div class="col-sm-6 col-xl-4" id="V01">

									<!-- Card START -->
									<div class="card card-img-scale overflow-hidden bg-transparent">
										<!-- Image and overlay -->
										<div class="card-img-scale-wrapper rounded-3">
											<!-- Image -->
											<img src="/resources/upload/advertise/main.png" class="main"
												alt="main image">
										</div>

										<!-- Card body -->
										<div class="card-body px-2">
											<!-- Title -->
											<h5 class="card-title">
												<a data-toggle="modal" data-target="#exampleModal2"
													class="stretched-link">메인 배너</a>
											</h5>
											<!-- Price and rating -->
											<div
												class="d-flex justify-content-between align-items-center">
												<h6 class="text-success mb-0">
													200,000원 <small class="fw-light">/1개월</small>
												</h6>
												<a class="btn btn-sm btn-primary-soft mb-0"> <i
													class="bi bi-check-lg me-1"></i>광고 신청하기
												</a>
											</div>
										</div>
									</div>
								</div>
								<!--  메인배너 광고 END -->

								<!-- 하단배너 광고 START -->
								<div class="col-sm-6 col-xl-4" id="V02">
									<!-- Card START -->
									<div class="card card-img-scale overflow-hidden bg-transparent">
										<!-- Image and overlay -->
										<div class="card-img-scale-wrapper rounded-3 data-toggle="
											modal" data-target="#exampleModal">
											<!-- Image -->
											<img src="/resources/upload/advertise/bottom.png"
												class="bottom" alt="side image">
										</div>

										<!-- Card body -->
										<div class="card-body px-2">
											<!-- Title -->
											<h5 class="card-title">
												<a class="stretched-link" data-toggle="modal"
													data-target="#exampleModal1">하단 배너</a>
											</h5>
											<!-- Price and rating -->
											<div
												class="d-flex justify-content-between align-items-center">
												<h6 class="text-success mb-0">
													70,000원 <small class="fw-light">/1개월</small>
												</h6>
												<a class="btn btn-sm btn-primary-soft mb-0"
													data-toggle="modal" data-target="#exampleModal"> <i
													class="bi bi-check-lg me-1"></i>광고 신청하기
												</a>
											</div>
										</div>
									</div>
								</div>
								<!-- 하단배너 광고 END -->



								<!--  최상단 노출 광고 START -->
								<div class="col-sm-6 col-xl-4" id="V03">
									<!-- Card START -->
									<div class="card card-img-scale overflow-hidden bg-transparent">
										<!-- Image and overlay -->
										<div class="card-img-scale-wrapper rounded-3">
											<!-- Image -->
											<img src="/resources/upload/advertise/search.png"
												class="search" alt="research image">
										</div>

										<!-- Card body -->
										<div class="card-body px-2">
											<!-- Title -->
											<h5 class="card-title">
												<a class="stretched-link" data-toggle="modal"
													data-target="#exampleModal3">검색 시 최상단 노출</a>
											</h5>
											<!-- Price and rating -->
											<div
												class="d-flex justify-content-between align-items-center">
												<h6 class="text-success mb-0">
													50,000원 <small class="fw-light">/1개월</small>
												</h6>
												<a class="btn btn-sm btn-primary-soft mb-0"
													data-toggle="modal" data-target="#exampleModal"> <i
													class="bi bi-check-lg me-1"></i>광고 신청하기
												</a>
											</div>
										</div>
									</div>
									<!-- 최상단 노출 광고 END -->

								</div>
							</div>
						</div>
					</div>
					<!-- Card body END -->
				</div>
			</div>
		</div>
		<!-- Counter END -->

		<!-- Review START -->
		<div class="row">
			<div class="col-12">
				<div class="card border rounded-3">
					<!-- Card header START -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">진행중인 광고</h5>
					</div>
					<!-- Card header END -->

					<!-- Card body START -->
					<div class="card-body">
						<table
							class="table align-middle p-4 mb-0 table-hover table-shrink">
							<!-- Table head -->
							<thead class="table-light">
								<tr>
									<th>광고명</th>
									<th>광고 신청일</th>
									<th>광고 기간</th>
									<th>승인일자</th>
									<th>상태</th>
									<th>환불</th>

								</tr>
							</thead>

							<!-- Table body START -->
							<tbody>
								<c:if test="${empty advReqList}">
									<tr>
										<td colspan="6">사용중인 광고가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="list" items="${advReqList}" varStatus="stat">
									<tr>
										<td>${list.adDc}</td>
										<td><fmt:formatDate value="${list.adReqTm}"
												pattern="yyyy/MM/dd HH:mm:ss" /></td>
										<td><fmt:formatDate value="${list.adSt}"
												pattern="yyyy/MM/dd" /> ~ <fmt:formatDate
												value="${list.adEd}" pattern="yyyy/MM/dd" /></td>
										<td><c:if test="${list.cnfmDt eq null}"> - </c:if> <c:if
												test="${list.cnfmDt != null}">
												<fmt:formatDate value="${list.cnfmDt}" pattern="yyyy/MM/dd" />
											</c:if></td>
										<td><c:if test="${list.cnfm == 'Y'}">
												<div class="badge bg-success bg-opacity-10 text-success">진행중
												</div>
											</c:if> <c:if test="${empty list.cnfm}">
												<div class="btn badge bg-warning bg-opacity-10 text-info">광고요청
												</div>
											</c:if> <c:if test="${list.cnfm == 'N'}">
												<div class="badge bg-danger bg-opacity-10 text-danger">거절됨
												</div>
											</c:if></td>
										<td><div
												class="btn badge bg-danger bg-opacity-10 text-danger"
												onclick="fnRefund(this)" id="${list.adReqId}" >환불요청</div></td>
									</tr>
								</c:forEach>
							</tbody>


						</table>
					</div>
				</div>
			</div>
		</div>
		<br /> <br /> <br />

		<!-- Review END -->
	</div>


	<!-- 메인 배너 모달 Modal  -->
	<div class="modal fade" id="exampleModal2" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel2">메인 배너 광고 신청하기</h5>
					<button type="button" class="btn" data-dismiss="modal"
						style="font-size: 1.5rem; font-weight: 700; line-height: 1; color: #000; text-shadow: 0 1px 0 #fff;"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ">
					<span class="myAnnotation">*광고는 다음달 첫째날 부터 시작합니다.</span> <br />
					<table>
						<tr>
							<br />
							<td><select style="height: 28px;" id="sel3"
								onchange="fnShowprice(this)">
									<option value="">개월 수 선택</option>
									<option value="200000" id="V01001" data-period="1">1개월</option>
									<option value="600000" id="V01002" data-period="3">3개월</option>
									<option value="1000000" id="V01003" data-period="6">6개월</option>
									<option value="1500000" id="V01004" data-period="12">12개월</option>
							</select></td>
							<td><input class="price" style="width: 150px;" type="text"
								value="" readonly /></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="myAnnotation">광고 시작 날짜</td>
							<td><input class="startDt" style="width: 150px;" type="text"
								value="" readonly /></td>
						</tr>
						<tr>
							<td class="myAnnotation">광고 만료 날짜</td>
							<td><input class="endDt" style="width: 150px;" type="text"
								value="" readonly /></td>
						</tr>
					</table>

				</div>
				<br />
				<div class="modal-footer">
					<button type="button" class="btn btn-primary adreq"
						data-dismiss="modal">광고 신청하기</button>
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 사이드 배너 모달 Modal  -->
	<div class="modal fade" id="exampleModal1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel1">하단 배너 광고 신청하기</h5>
					<button type="button" class="btn" data-dismiss="modal"
						style="font-size: 1.5rem; font-weight: 700; line-height: 1; color: #000; text-shadow: 0 1px 0 #fff;"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ">
					<span class="myAnnotation">*광고는 다음달 첫째날 부터 시작합니다.</span> <br />
					<table>
						<tr>
							<br />
							<td><select style="height: 28px;" id="sel3"
								onchange="fnShowprice(this)">
									<option value="">개월 수 선택</option>
									<option value="70000" id="V02001" data-period="1">1개월</option>
									<option value="200000" id="V02002" data-period="3">3개월</option>
									<option value="350000" id="V02003" data-period="6">6개월</option>
									<option value="600000" id="V02004" data-period="12">12개월</option>
							</select></td>
							<td><input class="price" style="width: 150px;" type="text"
								value="" readonly /></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="myAnnotation">광고 시작 날짜</td>
							<td><input class="startDt" style="width: 150px;" type="text"
								value="" readonly /></td>
						</tr>
						<tr>
							<td class="myAnnotation">광고 만료 날짜</td>
							<td><input class="endDt" style="width: 150px;" type="text"
								value="" readonly /></td>
						</tr>
					</table>

				</div>
				<br />
				<div class="modal-footer">
					<button type="button" class="btn btn-primary adreq"
						data-dismiss="modal">광고 신청하기</button>
					</button>
				</div>
			</div>
		</div>
	</div>





	<!-- 검색 시 상단 노출  Modal  -->
	<div class="modal fade" id="exampleModal3" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel3">검색시 상단 노출 광고
						신청</h5>
					<button type="button" class="btn" data-dismiss="modal"
						style="font-size: 1.5rem; font-weight: 700; line-height: 1; color: #000; text-shadow: 0 1px 0 #fff;"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ">
					<span class="myAnnotation">*광고는 다음달 첫째날 부터 시작합니다.</span> <br />
					<table>
						<tr>
							<br />
							<td><select style="height: 28px;"
								onchange="fnShowprice(this)">
									<option value="">개월 수 선택</option>
									<option value="50000" id="V03001" data-period="1">1개월</option>
									<option value="150000" id="V03002" data-period="3">3개월</option>
									<option value="300000" id="V03003" data-period="6">6개월</option>
									<option value="500000" id="V03004" data-period="12">12개월</option>
							</select></td>
							<td><input class="price" style="width: 150px;" type="text"
								value="" readonly /></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="myAnnotation">광고 시작 날짜</td>
							<td><input class="startDt" style="width: 150px;" type="text"
								value="" readonly /></td>
						</tr>
						<tr>
							<td class="myAnnotation">광고 만료 날짜</td>
							<td><input class="endDt" style="width: 150px;" type="text"
								value="" readonly /></td>
						</tr>
					</table>

				</div>
				<br />
				<div class="modal-footer">
					<button type="button" class="btn btn-primary adreq"
						data-dismiss="modal">광고 신청하기</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function fnShowprice(e) {
			var selectElement = e;
			var price = selectElement.value;
			var formattedPrice = parseInt(price).toLocaleString();
			var period = parseInt(selectElement.options[selectElement.selectedIndex]
					.getAttribute('data-period'));

			//start dt 구하기
			var today = new Date(); // 현재 날짜 가져오기
			var startDtBefore = new Date(today.getFullYear(),
					today.getMonth() + 1, 1); // 다음 달의 첫 번째 날짜 설정
			var year = startDtBefore.getFullYear();
			var month = String(startDtBefore.getMonth() + 1).padStart(2, '0');
			var day = String(startDtBefore.getDate()).padStart(2, '0');

			var startDt = year + "/" + month + "/" + day;

			//마지막 날짜 구하기
			var endDtBefore = new Date(startDtBefore.getFullYear(),
					startDtBefore.getMonth() + period, 0); // 다음 달의 0일을 지정하여 현재 달의 마지막 날짜를 구함

			var year = endDtBefore.getFullYear();
			var month = String(endDtBefore.getMonth() + 1).padStart(2, '0');
			var day = String(endDtBefore.getDate()).padStart(2, '0');

			var endDt = year + "/" + month + "/" + day;

			var priceInput = selectElement.parentElement.nextElementSibling
					.querySelector('.price');
			var startDtInput = $(selectElement).closest('table').find(
					'.startDt');
			var endDtInput = $(selectElement).closest('table').find('.endDt');

			priceInput.value = formattedPrice;
			startDtInput.val(startDt);
			endDtInput.val(endDt);
		}

		//----------------------------------------------------

		$(".adreq").on( "click", function(e) {

			var parents = e.target.parentElement.parentElement;
			var selectElement = parents.querySelector('select');
			var selectedOption = selectElement.selectedOptions[0];
			var startDtObj = parents.querySelector('.startDt');
			var endDtObj = parents.querySelector('.endDt');

			var adId = selectedOption.id;
			var startDt = startDtObj.value;
			var endDt = endDtObj.value;
			var adPr = selectElement.value;

			console.log(adId);
			console.log(startDt);
			console.log(endDt);
			console.log(adPr);

			param = {
				"adId" : adId,
				"startDt" : startDt,
				"endDt" : endDt,
				"adPr" : adPr
			};

			$.ajax({
				url : '/business/advertize/adajax',
				method : 'POST',
				data : param,
				// 				dataType : "json",
				success : function(response) {
					// 요청이 성공한 경우 처리할 콜백 함수
					console.log(response);
					alert("광고신청이 완료되었습니다.")
					window.location.href = "/business/advertize/bsAd";
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
				error : function(xhr, status, error) {
					console.log('Error:', error);
					console.log('Status:', status);
					console.log('Response Text:', xhr.responseText);
					console.log('Status Text:', xhr.statusText);
				}
			});

		});

		// 주어진 리스트에서 id와 비교할 값을 가져옵니다. (이 예제에서는 임의의 리스트로 가정)
		const codeList = ${codeList};

		// 요소를 찾아 hidden 속성을 추가하는 함수
		function addHidden(list) {
			const elements = document.querySelectorAll('div[id^="V"]');
			console.log(elements);
			for ( var element of elements) {
				// element의 id 속성 값이 list에 포함되어 있다면 hidden 속성 추가
				if (codeList.includes(element.id)) {
					element.setAttribute('hidden', true);
				}
			}
		}

		// addHidden함수 호출
		addHidden(codeList);
		
		//환불요청
		function fnRefund(element){
			 if (confirm("정말 환불을 진행하시겠습니까??") == true){    //확인
				var adReqId = element.id;
			 	console.log("adReqId"+adReqId);
			 	param = {"adReqId":adReqId};

	
				$.ajax({
					url : '/business/advertize/adRfdAjax',
					method : 'POST',
					data : param,
					// 				dataType : "json",
					success : function(response) {
						// 요청이 성공한 경우 처리할 콜백 함수
						console.log(response);
						alert("환불요청이 완료되었습니다.")
						window.location.href = "/business/advertize/bsAd";
					},
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}",
								"${_csrf.token}");
					},
					error : function(xhr, status, error) {
						console.log('Error:', error);
						console.log('Status:', status);
						console.log('Response Text:', xhr.responseText);
						console.log('Status Text:', xhr.statusText);
					}
				});
				 
				 
			 }else{   //취소
			     return false;
			 }
		}
		
		
		
	</script>
</body>


