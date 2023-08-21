<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description"
	content="Booking - Multipurpose Online Booking Theme">


<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/choices/css/choices.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="/resources/booking/assets/vendor/choices/js/choices.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script type="text/javascript">
	const backgroundColorList = [ '#FFCCCC', '#FFE5CC', '#E5FFCC',
		'#CCFFCC', '#CCFFE5', '#CCFFFF', '#CCE5FF', '#CCCCFF',
		'#E5CCFF', '#FFCCFF', '#FFCCE5' ];
	
	const borderColorList = [ '#FF3333', '#FF9933', '#99FF33', '#00FF00',
		'#00FF80', '#00FFFF', '#0080FF', '#0000FF', '#9933FF',
		'#FF00FF', '#FF007F' ];
	
	$(function() {

		// 월 별 매출 통계
		var prLabels = ${prLabels};
		var prDatas = ${prDatas};
		console.log(prLabels);
		console.log(prDatas);
		
		
		var ctx1 = document.getElementById('myChart1').getContext('2d');

		var prChartData = {
			labels : prLabels,
			datasets : [ {
				label : '매출액 (단위: 원)',
				data : prDatas,
				backgroundColor : 'rgba(75, 192, 192, 0.2)',
				borderColor : 'rgba(75, 192, 192, 1)',
				borderWidth : 1
			} ]
		};
		
		var prChart = new Chart(ctx1, {
			type : 'line',
			data : prChartData,
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});

		// 월 별 가입 수
		var memLabels = ${memLabels};
		var memDatas = ${memDatas};
		console.log(memLabels);
		console.log(memDatas);
		
		
		var ctx2 = document.getElementById('myChart2').getContext('2d');
		
		var memChartData = {
			labels : memLabels,
			datasets : [ {
				data : memDatas,
				backgroundColor : backgroundColorList,
				borderColor : borderColorList,
				borderWidth : 1
			} ]
		};

		var memChart = new Chart(ctx2, {
			type : 'bar',
			data : memChartData,
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
		

		// 월 별 예약 통계
		var rsvLabels = ${rsvLabels};
		var rsvDatas = ${rsvDatas};
		console.log(rsvLabels);
		console.log(rsvDatas);
		
		
		var ctx3 = document.getElementById('myChart3').getContext('2d');

		var rsvChartData = {
			labels : rsvLabels,
			datasets : [ {
				label : '예약 수',
				data : rsvDatas,
				backgroundColor : 'rgba(75, 192, 192, 0.2)',
				borderColor : 'rgba(75, 192, 192, 1)',
				borderWidth : 1
			} ]
		};
		
		var rsvChart = new Chart(ctx3, {
			type : 'line',
			data : rsvChartData,
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});

		// 회원 연령비
		var memAgeLabels = ${memAgeLabels};
		var memAgeDatas = ${memAgeDatas};
		console.log(memAgeLabels);
		console.log(memAgeDatas);
		
		
		var ctx4 = document.getElementById('myChart4').getContext('2d');

		var memAgeChartData = {
		    labels: memAgeLabels,
		    datasets: [{
		    data: memAgeDatas,
		    backgroundColor: backgroundColorList,
		    }]
		};
		
		var memAgeChart = new Chart(ctx4, {
		    type: 'pie',
		    data: memAgeChartData,
		    options : {
		    	responsive: false
			}
		});
	});
</script>


</head>


<!-- **************** MAIN CONTENT START **************** -->
<main>
	<div class="page-content-wrapper p-xxl-4">
		<!-- Payment history START -->
		<div class="card shadow mt-5">
			<!-- Card header -->
			<div class="card-header border-bottom" id="frm01">
				<div class="row g-4 align-items-center">
					<div class="col-lg-4">
						<h5 class="h4 mb-3 mb-sm-0">
							매출 통계 
						</h5>
					</div>
				</div>
			</div>

			<!-- Card body START -->
			<div class="card-body">
				<!-- Table head -->
				<div class="row g-4">
					<!-- Booking Chart START -->
					<div class="col-xxl-6">
						<!-- Chart START -->
						<div class="card shadow h-100">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<div class="row">
									<div class="col-md-6">
										<h5 class="card-header-title">월 별 매출 통계</h5>
									</div>
									<div class="col-md-4">
										<div class="btn-group" style="margin-left: 100px;">
										  	<button class="btn btn-light btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
										    	연도를 선택하세요
										  	</button>
										  	<ul class="dropdown-menu">
											    <li>
											    	<a type="button" href="salesStats?prYear=2023&rsvYear=${param.rsvYear}&memYear=${param.memYear}" class="dropdown-item">2023</a>
											    </li>
											    <li>
											    	<a type="button" href="salesStats?prYear=2022&rsvYear=${param.rsvYear}&memYear=${param.memYear}" class="dropdown-item">2022</a>
											    </li>
											    <li>
											    	<a type="button" href="salesStats?prYear=2021&rsvYear=${param.rsvYear}&memYear=${param.memYear}" class="dropdown-item">2021</a>
											    </li>
											    <li>
											    	<a type="button" href="salesStats?prYear=2020&rsvYear=${param.rsvYear}&memYear=${param.memYear}" class="dropdown-item">2020</a>
											    </li>
											</ul>
										</div>
									</div>
								</div>
							</div>
	
							<!-- Card body -->
							<div class="card-body">
								<canvas id="myChart1"></canvas>
							</div>
						</div>
						<!-- Chart END -->
					</div>
					<!-- Booking Chart END -->
	
					<!-- Booking graph START -->
					<div class="col-xxl-6">
						<!-- Chart START -->
						<div class="card shadow h-100">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<div class="row">
									<div class="col-md-6">
										<h5 class="card-header-title">월 별 가입 수</h5>
									</div>
									<div class="col-md-4">
										<div class="btn-group" style="margin-left: 100px;">
										  	<button class="btn btn-light btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
										    	연도를 선택하세요
										  	</button>
										  	<ul class="dropdown-menu">
											    <li>
											    	<a type="button" href="salesStats?prYear=${param.prYear}&rsvYear=${param.rsvYear}&memYear=2023" class="dropdown-item">2023</a>
											    </li>
											    <li>
											    	<a type="button" href="salesStats?prYear=${param.prYear}&rsvYear=${param.rsvYear}&memYear=2022" class="dropdown-item">2022</a>
											    </li>
											    <li>
											    	<a type="button" href="salesStats?prYear=${param.prYear}&rsvYear=${param.rsvYear}&memYear=2021" class="dropdown-item">2021</a>
											    </li>
											    <li>
											    	<a type="button" href="salesStats?prYear=${param.prYear}&rsvYear=${param.rsvYear}&memYear=2020" class="dropdown-item">2020</a>
											    </li>
											</ul>
										</div>
									</div>
								</div>
							</div>
	
							<!-- Card body -->
							<div class="card-body">
								<canvas id="myChart2"></canvas>
							</div>
						</div>
						<!-- Chart END -->
					</div>
					<!-- Booking graph END -->
					
					<div class="col-xxl-6">
						<!-- Chart START -->
						<div class="card shadow h-100">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<div class="row">
									<div class="col-md-6">
										<h5 class="card-header-title">월 별 예약 통계</h5>
									</div>
									<div class="col-md-4">
										<div class="btn-group" style="margin-left: 100px;">
										  	<button class="btn btn-light btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
										    	연도를 선택하세요
										  	</button>
										  	<ul class="dropdown-menu">
											    <li>
											    	<a type="button" href="salesStats?prYear=${param.prYear}&rsvYear=2023&memYear=${param.memYear}" class="dropdown-item">2023</a>
											    </li>
											    <li>
											    	<a type="button" href="salesStats?prYear=${param.prYear}&rsvYear=2022&memYear=${param.memYear}" class="dropdown-item">2022</a>
											    </li>
											    <li>
											    	<a type="button" href="salesStats?prYear=${param.prYear}&rsvYear=2021&memYear=${param.memYear}" class="dropdown-item">2021</a>
											    </li>
											    <li>
											    	<a type="button" href="salesStats?prYear=${param.prYear}&rsvYear=2020&memYear=${param.memYear}" class="dropdown-item">2020</a>
											    </li>
											</ul>
										</div>
									</div>
								</div>
							</div>
	
							<!-- Card body -->
							<div class="card-body">
								<canvas id="myChart3"></canvas>
							</div>
						</div>
						<!-- Chart END -->
					</div>
					<div class="col-xxl-6">
						<!-- Chart START -->
						<div class="card shadow h-100">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<h5 class="card-header-title">회원 연령비</h5>
							</div>
	
							<!-- Card body -->
							<div class="card-body">
								<canvas id="myChart4" style="margin-left:110px"></canvas>
							</div>
						</div>
						<!-- Chart END -->
					</div>
				</div>
			</div>
		</div>
		<!-- Payment history END -->

	</div>
	<!-- Page main content END -->
</main>
<!-- **************** MAIN CONTENT END **************** -->
