<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script
	src="/resources/booking/assets/vendor/flatpickr/js/flatpickr.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/flatpickr/css/flatpickr.min.css">

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
</style>
<body class="pt-0">
	<br />
	<div class="container vstack gap-4">
		<!-- Title START -->
		<div class="row">
			<div class="col-12">
				<h1 class="fs-4 mb-0">
					<div class="hi">
						<a href="/business/statis/bsStatis?priod=${param.period}" class="float-right"><i
							class="bi bi-grid fa-fw me-1"></i></a> <a
							href="/business/statis/bsStatisTab?priod=${param.period}" class="float-right"><i
							class="bi bi-collection fa-fw me-1"></i></a>
					</div>
					<i class="bi bi-graph-up-arrow fa-fw me-1"></i>통계
				</h1>
			</div>
		</div>
		<!-- Title END -->
		<!-- 기간설정 START -->

		<div class="row">
			<div class="col-12">
				<div class="card border h-100">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">기간 설정</h5>
					</div>

					<!-- Card body START -->
					<div class="card-body">

						<!-- 기간 설정 -->
						<form id="frm01" action="/business/statis/bsStatis"
							method="get">
							<div class="d-flex align-items-center col-md-6 col-lg-3">
								<i class="bi bi-calendar fs-5 me-2 mt-2"></i>
								<div class="d-flex">
									<!-- Icon -->
									<!-- Date input -->
									<div
										class="form-control-border form-control-transparent form-fs-md">
										<input id="calender" type="text"
											class="form-control flatpickr-input" data-mode="range"
											placeholder="Select date" name="period"
											value="<c:if test="${param.period!=''}">${param.period}</c:if>"
											readonly>
									</div>
								</div>
							</div>
							<input type="hidden" name="currentPage">
							<sec:csrfInput />
						</form>
					</div>
					<!-- Card body END -->
				</div>
			</div>
		</div>
		<!-- 기간설정 END -->

		<!-- Graph START -->
		<div class="row g-4">
			<!-- 1번째 그래프 -->
			<div class="col-lg-6">
				<div class="card border h-100">

					<!-- Card header -->
					<div
						class="card-header border-bottom d-flex justify-content-between align-items-center">
						<h5 class="card-header-title">방 예약 선호도</h5>
					</div>

					<!-- Card body START -->
					<div class="tab-content">
						<div class="tab-pane active show" id="tab-1" role="tabpanel">
							<div class="row g-4">
								<div class="card-body p-3">
									<!-- Chart -->
									<canvas id="myChart1"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 2번째 그래프 -->
			<div class="col-lg-6">
				<div class="card border h-100">

					<!-- Card header -->
					<div
						class="card-header border-bottom d-flex justify-content-between align-items-center">
						<h5 class="card-header-title">날짜별 찜 수</h5>
					</div>

					<!-- Card body START -->
					<div class="card-body p-3">
						<!-- Chart -->
						<canvas id="myChart22"></canvas>
					</div>
				</div>
			</div>
			<!-- 3번째 그래프 -->
			<div class="col-lg-6">
				<div class="card border h-100">

					<!-- Card header -->
					<div
						class="card-header border-bottom d-flex justify-content-between align-items-center">
						<h5 class="card-header-title">고객층 연령대 및 성별</h5>
					</div>

					<!-- Card body START -->
					<div class="card-body p-3">
						<!-- Chart -->
						<canvas id="myChart3"></canvas>
					</div>
				</div>
			</div>
			<!-- 4번째 그래프 -->
			<div class="col-lg-6">
				<div class="card border h-100">

					<!-- Card header -->
					<div
						class="card-header border-bottom d-flex justify-content-between align-items-center">
						<h5 class="card-header-title">많이 예약한 mbti</h5>
					</div>

					<!-- Card body START -->
					<div class="card-body p-3">
						<!-- Chart -->
						<br />
						<canvas id="myChart4"></canvas>
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
	
		// 변수 선언 부 
		const backgroundColorList = [ '#FFCCCC', '#FFE5CC', '#E5FFCC',
				'#CCFFCC', '#CCFFE5', '#CCFFFF', '#CCE5FF', '#CCCCFF',
				'#E5CCFF', '#FFCCFF', '#FFCCE5' ]

		const borderColorList = [ '#FF3333', '#FF9933', '#99FF33', '#00FF00',
				'#00FF80', '#00FFFF', '#0080FF', '#0000FF', '#9933FF',
				'#FF00FF', '#FF007F' ]
		//1
		var rmIdList1 = ${rmIdList1};
		var rsvCountList1 = ${rsvCountList1};
		console.log(rmIdList1);
		console.log(rsvCountList1);
		//2
		var wishList2 = ${wishList2};
		var rsvCountList2 = ${rsvCountList2};
		//22
// 		var rsvList22 = ${rsvList22};
// 		var rsvCountList22 = ${rsvCountList22};
		//3
// 		var femaleRsvCount3 = ${femaleRsvCount3};
// 		var maleRsvCount3 = ${maleRsvCount3};
		//4
		var mbtiList4 = ${mbtiList4};
		var rsvCountList4 = ${rsvCountList4};
		
//------------------------------------------------------------------------		

		// 1번차트 
		var ctx = document.getElementById('myChart1').getContext('2d');

		// 차트 데이터 정의하기
		var data = {
		    labels: rmIdList1,
		    datasets: [{
		    data: rsvCountList1,
		    backgroundColor: backgroundColorList,
		    }]
	    };

		// 차트 생성
	    var myChart = new Chart(ctx, {
		    type: 'pie',
		    data: data,
	    });
	    

		// 2번차트		
		var ctx = document.getElementById('myChart22').getContext('2d');

		// 차트 데이터 정의하기
		var data = {
			labels : wishList2,
			datasets : [ {
				label : '찜 수',
				data : rsvCountList2,
				backgroundColor : 'rgba(75, 192, 192, 0.2)',
				borderColor : 'rgba(75, 192, 192, 1)',
				borderWidth : 1
			} ]
		};

		// 차트 생성하기
		var myChart = new Chart(ctx, {
			type : 'line',
			data : data,
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});

		//3번째 그래프
		// 캔버스 엘리먼트 가져오기
		var ctx = document.getElementById('myChart3').getContext('2d');

		// 차트 데이터 정의하기
		var data = {
			labels : [ '10대', '20대', '30대', '40대', '50대 이상'],
			datasets : [ {
				label : 'Female',
				data : [1,15,5,8,1],
				backgroundColor : '#FFCCCC',
				borderColor : '#FF3333',
				borderWidth : 1
			}, {
				label : 'Male',
				data : [-1,-10,-15,-8,-2],
				backgroundColor : '#CCE5FF',
				borderColor : '#0080FF',
				borderWidth : 1
			} ]
		};

		// 차트 생성하기
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : data,
			options : {
				indexAxis : 'y',
				scales : {
					x : {
						beginAtZero : true,
						max : 20,
						min : -20,
						ticks : {
							stepSize : 200
						}
					}
				}
			}
		});

		// 4번 차트
		// 캔버스 엘리먼트 가져오기
		var ctx = document.getElementById('myChart4').getContext('2d');

		// 차트 데이터 정의하기
		var data = {
			labels : mbtiList4,
			datasets : [ {
				data : rsvCountList4,
				backgroundColor : backgroundColorList,
				borderColor : borderColorList,
				borderWidth : 1
			} ]
		};

		// 차트 생성하기
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : data,
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				},
				plugins : {
					legend : {
						display : false
					}
				}
			}
		});

		
		//캘린더 설정 시작
		let fp = $("#calender").flatpickr({
			enableTime : false,
			dateFormat : "Y/m/d"
		});

		fp.config.onClose.push(function() {
			let date = $("#calender").val();
			console.log("flag : " + date);
			$("#calender").val(date);
			$("#frm01").submit();
		});
		
		// 처음 진입시 날짜 선택안되어 있을 때 최근 30일을 기본으로 잡기
		$(function(){
			// 2023/06/01 to 2023/06/30
			if($("#calender").val()==""){
				
				const toDay = new Date();
				const preDay = new Date(toDay - 30 * 24 * 60 * 60 * 1000);
				
				let dayStr = preDay.getFullYear() + "/" + (preDay.getMonth()+1) + "/" + preDay.getDate() + " to " 
				+  toDay.getFullYear() + "/" + (toDay.getMonth()+1) + "/" + toDay.getDate();
				
				console.log("dayStr" + dayStr);
				
				$("#calender").val(dayStr);
				$("#frm01").submit();
			}
		});
		//캘린더 설정 끝
	</script>



</body>

