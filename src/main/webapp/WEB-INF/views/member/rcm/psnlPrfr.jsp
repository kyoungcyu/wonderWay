<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<style>
.card {
	margin-bottom: 20px;
}

.card-header {
	background-color: #f8f9fa;
	border-bottom: none;
}

.card-header .nav-tabs {
	border-bottom: none;
}

.card-header .nav-link {
	font-size: 16px;
	border: none;
	border-radius: 0;
	color: #6c757d;
}

.card-header .nav-link:hover {
	color: #495057;
}

.card-header .nav-link {
	font-weight: bold;
	color: #495057;
	border-bottom: 2px solid #007bff;
}

.card-body {
	background-color: #fff;
}
</style>
<script type="text/javascript">
	function fn_getId(getId) {
		console.log(getId);
		$("#val").html(getId);
	}

</script>
<script type="text/javascript">
	$(function() {
		let location = "";
		let active = "";
		let mood = "";
		let locaPrefer = "";
		let styCl = "";
		let tgrpn = "";
		let exprnc = "";
		let plan = "";
		let pvtCar = "";
		let formData = new FormData();
		
		$(".btn-check").on("click", function() {
			let obj = $(this).data("quest");
			if(obj == "q0") {
				location = $(this).data("loc");
			} else if(obj == "q1") {
				active = $(this).data("active");
			} else if(obj == "q2") {
				mood = $(this).data("mood");
			} else if(obj == "q3") {
				locaPrefer = $(this).data("locaPrefer");
			} else if(obj == "q4") {
				styCl = $(this).data("cl");
			} else if(obj == "q5") {
				tgrpn = $(this).data("tgrpn");
			} else if(obj == "q6") {
				exprnc = $(this).data("exprnc");
			} else if(obj == "q7") {
				plan = $(this).data("plan");
			} else if(obj == "q8") {
				pvtCar = $(this).data("pvtCar");
			}
			
			console.log("q : ", location, active, mood, locaPrefer, styCl, tgrpn, exprnc, plan, pvtCar);
		});
		
		$("#btnSubmit").on("click", function() {
			$.ajax({
				url : "/member/rcm/psnlPrfrPost",
				data : {
					"location" : location,
					"active" : active,
					"mood" : mood,
					"locaPrefer" : locaPrefer,
					"styCl" : styCl,
					"tgrpn" : tgrpn,
					"exprnc" : exprnc,
					"plan" : plan,
					"pvtCar" : pvtCar
				},
				type : "post",
				async : false,
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					console.log(result);
					formData.append("location", location);
					formData.append("active", active);
					formData.append("mood", mood);
					formData.append("locaPrefer", locaPrefer);
					formData.append("styCl", styCl);
					formData.append("tgrpn", tgrpn);
					formData.append("exprnc", exprnc);
					formData.append("plan", plan);
					formData.append("pvtCar", pvtCar);
					
					if(result != null) {
						formData.append("memId", result);
						$.ajax({
					  		url: "http://localhost:5000/recom.ajax",
					  		processData: false,
					  		contentType: false,
					  		data: formData,
					  		dataType:"json",
					  		type: "POST",
					  		success: function(response) {
					  			console.log(response[0]);
					  			
					  			$("input[name=predict1]").val(response[0]);
					  			$("input[name=predict2]").val(response[1]);
					  			$("input[name=predict3]").val(response[2]);

					  			console.log($("input[name=predict1]").val());
					  			console.log($("input[name=predict2]").val());
					  			console.log($("input[name=predict3]").val());
					  			
					  			$("#frm01").submit();
					  		}
	                	});
					}
				}
			});
		});
	
	});
	
	function next(tab) {
		console.log("tab : ", tab);
		
		if(tab == "0") {
			$("#tab-0").addClass("active").addClass("show");
			$("#tab-1").removeClass("active").removeClass("show");
			$("#aTab0").addClass("active");
			$("#aTab1").removeClass("active");
		} else if(tab == "1") {
			$("#tab-1").addClass("active").addClass("show");
			$("#tab-0").removeClass("active").removeClass("show");
			$("#tab-2").removeClass("active").removeClass("show");
			$("#aTab1").addClass("active");
			$("#aTab0").removeClass("active");
			$("#aTab2").removeClass("active");
		} else if(tab == "2") {
			$("#tab-2").addClass("active").addClass("show");
			$("#tab-1").removeClass("active").removeClass("show");
			$("#tab-3").removeClass("active").removeClass("show");
			$("#aTab2").addClass("active");
			$("#aTab1").removeClass("active");
			$("#aTab3").removeClass("active");
		} else if(tab == "3") {
			$("#tab-3").addClass("active").addClass("show");
			$("#tab-2").removeClass("active").removeClass("show");
			$("#tab-4").removeClass("active").removeClass("show");
			$("#aTab3").addClass("active");
			$("#aTab2").removeClass("active");
			$("#aTab4").removeClass("active");
		} else if(tab == "4") {
			$("#tab-4").addClass("active").addClass("show");
			$("#tab-3").removeClass("active").removeClass("show");
			$("#tab-5").removeClass("active").removeClass("show");
			$("#aTab4").addClass("active");
			$("#aTab3").removeClass("active");
			$("#aTab5").removeClass("active");
		} else if(tab == "5") {
			$("#tab-5").addClass("active").addClass("show");
			$("#tab-4").removeClass("active").removeClass("show");
			$("#tab-6").removeClass("active").removeClass("show");
			$("#aTab5").addClass("active");
			$("#aTab4").removeClass("active");
			$("#aTab6").removeClass("active");
		} else if(tab == "6") {
			$("#tab-6").addClass("active").addClass("show");
			$("#tab-5").removeClass("active").removeClass("show");
			$("#tab-7").removeClass("active").removeClass("show");
			$("#aTab6").addClass("active");
			$("#aTab5").removeClass("active");
			$("#aTab7").removeClass("active");
		} else if(tab == "7") {
			$("#tab-7").addClass("active").addClass("show");
			$("#tab-6").removeClass("active").removeClass("show");
			$("#tab-8").removeClass("active").removeClass("show");
			$("#aTab7").addClass("active");
			$("#aTab6").removeClass("active");
			$("#aTab8").removeClass("active");
		} else if(tab == "8") {
			$("#tab-8").addClass("active").addClass("show");
			$("#tab-7").removeClass("active").removeClass("show");
			$("#aTab8").addClass("active");
			$("#aTab7").removeClass("active");
		}
	}
</script>
</head>
<body>
	<div class="page-content-wrapper p-xxl-4">
		<div class="col-xl-10 mx-auto text-center">
			<!--  이쁘게 저장  -->
			<h3 class="h3 mb-3 mb-sm-0"><span class="position-relative z-index-9">여행 선호도 조사</span></h3>
		</div>
		<br />
		<br />
	
		<div class="container">
			<form id="frm01" method="get" action="/member/rcm/result" >
				<input type="hidden" name="predict1" value="">
				<input type="hidden" name="predict2" value="">
				<input type="hidden" name="predict3" value="">
			</form>
			<!-- 탭메뉴 -->
			<div class="bg-light pb-0 px-2 px-lg-0 rounded-top">
				<ul id="tabs" class="nav nav-tabs nav-bottom-line nav-responsive border-0 nav-justified" role="tablist">
					<li class="nav-item" role="presentation">
						<a class="nav-link mb-0 active" id="aTab0" data-bs-toggle="tab" href="#tab-0" 
						   aria-selected="true" role="tab" tabindex="-1">
							지역
						</a>
					</li>
					<li class="nav-item" role="presentation">
						<a class="nav-link mb-0" id="aTab1" data-bs-toggle="tab" href="#tab-1"
						   aria-selected="false" role="tab" tabindex="-1">
							Q.1
						</a>
					</li>
					<li class="nav-item" role="presentation">
						<a class="nav-link mb-0" id="aTab2" data-bs-toggle="tab" href="#tab-2"
						   aria-selected="false" role="tab" tabindex="-1">
							Q.2
						</a>
					</li>
					<li class="nav-item" role="presentation">
						<a class="nav-link mb-0" id="aTab3" data-bs-toggle="tab" href="#tab-3"
						   aria-selected="false" role="tab" tabindex="-1">
							Q.3
						</a>
					</li>
					<li class="nav-item" role="presentation">
						<a class="nav-link mb-0" id="aTab4" data-bs-toggle="tab" href="#tab-4"
						   aria-selected="false" role="tab" tabindex="-1">
							Q.4
						</a>
					</li>
					<li class="nav-item" role="presentation">
						<a class="nav-link mb-0" id="aTab5" data-bs-toggle="tab" href="#tab-5"
						   aria-selected="false" role="tab" tabindex="-1">
							Q.5
						</a>
					</li>
					<li class="nav-item" role="presentation">
						<a class="nav-link mb-0" id="aTab6" data-bs-toggle="tab" href="#tab-6"
						   aria-selected="false" role="tab" tabindex="-1">
							Q.6
						</a>
					</li>
					<li class="nav-item" role="presentation">
						<a class="nav-link mb-0" id="aTab7" data-bs-toggle="tab" href="#tab-7"
						   aria-selected="false" role="tab" tabindex="-1">
							Q.7
						</a>
					</li>
					<li class="nav-item" role="presentation">
						<a class="nav-link mb-0" id="aTab8" data-bs-toggle="tab" href="#tab-8"
						   aria-selected="false" role="tab" tabindex="-1">
							Q.8
						</a>
					</li>
	
				</ul>
			</div>
	
			<!-- cart시작 -->
	
			<div class="tab-content">
				<!-- Tab content 1 START -->
				<div class="tab-pane active show" id="tab-0" role="tabpanel">
					<div class="row g-4">
						<div class="col-12">
							<div class="card border">
								<div class="card shadow">
									<!-- Card body -->
									<div class="card-body">
											<!-- Information item -->
											<div class="col-md-6" style="text-align: center; margin-left: 283px;">
												<br />
												<h3>지역을 선택해주세요</h3>
											</div>
											<div class="row">
												<!-- Information item -->
												<div class="col-6" style="margin-left: 443px; margin-top: 50px;">
													<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
														<input type="radio" class="btn-check" name="btnradio" id="btnradio1" data-quest="q0" data-loc="SL">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee1"  for="btnradio1">&nbsp;&nbsp;&nbsp;&nbsp;서울&nbsp;&nbsp;&nbsp;</label>
														
														<input type="radio" class="btn-check" name="btnradio" id="btnradio2" data-quest="q0" data-loc="KW">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee2"  for="btnradio2">&nbsp;&nbsp;&nbsp;&nbsp;강원&nbsp;&nbsp;&nbsp;</label>
													</div>
													<br />
													<br />
													<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
														<input type="radio" class="btn-check" name="btnradio" id="btnradio3" data-quest="q0" data-loc="DGCC">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee1"  for="btnradio3">대전, 충청</label>
														
														<input type="radio" class="btn-check" name="btnradio" id="btnradio4" data-quest="q0" data-loc="DGKS">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee2"  for="btnradio4">대구, 경상</label>
													</div>
													<br />
													<br /> 
													<div class="btn-group" role="group" aria-label="Basic radio toggle button group" >
														<input type="radio" class="btn-check" name="btnradio" id="btnradio5" data-quest="q0" data-loc="KJJL">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee1"  for="btnradio5">광주, 전라</label>
														
														<input type="radio" class="btn-check" name="btnradio" id="btnradio6" data-quest="q0" data-loc="BS">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee2"  for="btnradio6">&nbsp;&nbsp;&nbsp;&nbsp;부산&nbsp;&nbsp;&nbsp;</label>
													</div>
													<br />
													<br /> 
													<div class="btn-group" role="group" aria-label="Basic radio toggle button group" style="margin-left: 80px;">
														<input type="radio" class="btn-check" name="btnradio" id="btnradio7" data-quest="q0" data-loc="JEJU">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee1"  for="btnradio7">제주</label>
													</div>
													<br />
													<br /> 
												</div>
					
												<!-- Information item -->
												<div class="col-12">
													<ul class="list-group list-group-borderless">
														<li class="list-group-item">
															<span></span>
														</li>
													</ul>
												</div>
											</div>
											
											<!-- Information item -->
											<div class="col-12" style="text-align: center;">
												<span><button onclick="javascript:next(1)" class="btn btn-primary">다음</button></span>
											</div>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="tab-pane" id="tab-1" role="tabpanel">
					<div class="row g-4">
						<div class="col-12">
							<div class="card border">
								<div class="card shadow">
									<!-- Card body -->
									<div class="card-body">
											<!-- Information item -->
											<div class="col-md-6" style="text-align: center; margin-left: 293px;">
												<br />
												<h3>당신은 활동적인 사람인가요?</h3>
											</div>
											<div class="row">
												<!-- Information item -->
												<div class="col-6" style="margin-left: 459px; margin-top: 100px; margin-bottom: 100px;">
													<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
														<input type="radio" class="btn-check" name="btnradio" id="btnradioActive1" data-quest="q1" data-active="0">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee1"  for="btnradioActive1">&nbsp;&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;</label>
														
														<input type="radio" class="btn-check" name="btnradio" id="btnradioActive2" data-quest="q1" data-active="1">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee2"  for="btnradioActive2">&nbsp;아니오&nbsp;</label>
													</div>
													<br />
													<br />
												</div>

					
												<!-- Information item -->
												<div class="col-12">
													<ul class="list-group list-group-borderless">
														<li class="list-group-item">
															<span></span>
														</li>
													</ul>
												</div>
											</div>
											
											<!-- Information item -->
											<div class="col-12" style="text-align: center;">
												<span><button onclick="javascript:next(0)" class="btn btn-primary">이전</button></span>
												<span><button onclick="javascript:next(2)" class="btn btn-primary">다음</button></span>
											</div>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="tab-pane" id="tab-2" role="tabpanel">
					<div class="row g-4">
						<div class="col-12">
							<div class="card border">
								<div class="card shadow">
									<!-- Card body -->
									<div class="card-body">
											<!-- Information item -->
											<div class="col-md-8" style="text-align: center; margin-left: 220px;">
												<br />
												<h3>당신은 어떤 분위기를 좋아하시나요?</h3>
											</div>
											<div class="row">
												<!-- Information item -->
												<div class="col-6" style="margin-left: 437px; margin-top: 100px; margin-bottom: 100px;">
													<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
														<input type="radio" class="btn-check" name="btnradio" id="btnradioMood1" data-quest="q2" data-mood="0">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee1"  for="btnradioMood1">&nbsp;&nbsp;&nbsp;활기찬&nbsp;&nbsp;</label>
														
														<input type="radio" class="btn-check" name="btnradio" id="btnradioMood2" data-quest="q2" data-mood="1">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee2"  for="btnradioMood2">&nbsp;&nbsp;&nbsp;조용한&nbsp;&nbsp;</label>
													</div>
													<br />
													<br />
												</div>
					
												<!-- Information item -->
												<div class="col-12">
													<ul class="list-group list-group-borderless">
														<li class="list-group-item">
															<span></span>
														</li>
													</ul>
												</div>
											</div>
											
											<!-- Information item -->
											<div class="col-12" style="text-align: center;">
												<span><button onclick="javascript:next(1)" class="btn btn-primary">이전</button></span>
												<span><button onclick="javascript:next(3)" class="btn btn-primary">다음</button></span>
											</div>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="tab-pane" id="tab-3" role="tabpanel">
					<div class="row g-4">
						<div class="col-12">
							<div class="card border">
								<div class="card shadow">
									<!-- Card body -->
									<div class="card-body">
											<!-- Information item -->
											<div class="col-md-8" style="text-align: center; margin-left: 190px;">
												<br />
												<h3>산과 바다 중 어느 것을 더 선호하시나요?</h3>
											</div>
											<div class="row">
												<!-- Information item -->
												<div class="col-6" style="margin-left: 457px; margin-top: 100px; margin-bottom: 100px;">
													<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
														<input type="radio" class="btn-check" name="btnradio" id="btnradioLoca1" data-quest="q3" data-loca-prefer="0">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee1"  for="btnradioLoca1">&nbsp;&nbsp;&nbsp;&nbsp;산&nbsp;&nbsp;&nbsp;</label>
														
														<input type="radio" class="btn-check" name="btnradio" id="btnradioLoca2" data-quest="q3" data-loca-prefer="1">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee2"  for="btnradioLoca2">&nbsp;&nbsp;&nbsp;바다&nbsp;&nbsp;</label>
													</div>
													<br />
													<br />
												</div>
					
												<!-- Information item -->
												<div class="col-12">
													<ul class="list-group list-group-borderless">
														<li class="list-group-item">
															<span></span>
														</li>
													</ul>
												</div>
											</div>
											
											<!-- Information item -->
											<div class="col-12" style="text-align: center;">
												<span><button onclick="javascript:next(2)" class="btn btn-primary">이전</button></span>
												<span><button onclick="javascript:next(4)" class="btn btn-primary">다음</button></span>
											</div>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="tab-pane" id="tab-4" role="tabpanel">
					<div class="row g-4">
						<div class="col-12">
							<div class="card border">
								<div class="card shadow">
									<!-- Card body -->
									<div class="card-body">
											<!-- Information item -->
											<div class="col-md-8" style="text-align: center; margin-left: 190px;">
												<br />
												<h3>어떤 유형의 숙소를 더 선호하시나요?</h3>
											</div>
											<div class="row">
												<!-- Information item -->
												<div class="col-6" style="margin-left: 429px; margin-top: 100px; margin-bottom: 100px;">
													<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
														<input type="radio" class="btn-check" name="btnradio" id="btnradioCl1" data-quest="q4" data-cl="0">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee1"  for="btnradioCl1">&nbsp;호텔/펜션&nbsp;</label>
														
														<input type="radio" class="btn-check" name="btnradio" id="btnradioCl2" data-quest="q4" data-cl="1">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee2"  for="btnradioCl2">&nbsp;&nbsp;&nbsp;&nbsp;풀빌라&nbsp;&nbsp;&nbsp;&nbsp;</label>
													</div>
													<br />
													<br />
												</div>
					
												<!-- Information item -->
												<div class="col-12">
													<ul class="list-group list-group-borderless">
														<li class="list-group-item">
															<span></span>
														</li>
													</ul>
												</div>
											</div>
											
											<!-- Information item -->
											<div class="col-12" style="text-align: center;">
												<span><button onclick="javascript:next(3)" class="btn btn-primary">이전</button></span>
												<span><button onclick="javascript:next(5)" class="btn btn-primary">다음</button></span>
											</div>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="tab-pane" id="tab-5" role="tabpanel">
					<div class="row g-4">
						<div class="col-12">
							<div class="card border">
								<div class="card shadow">
									<!-- Card body -->
									<div class="card-body">
											<!-- Information item -->
											<div class="col-md-6" style="text-align: center; margin-left: 283px;">
												<br />
												<h3>함께 여행을 간다면?</h3>
											</div>
											<div class="row">
												<!-- Information item -->
												<div class="col-6" style="margin-left: 445px; margin-top: 100px; margin-bottom: 100px;">
													<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
														<input type="radio" class="btn-check" name="btnradio" id="btnradioTgprn1" data-quest="q5" data-tgrpn="0">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee1"  for="btnradioTgprn1">&nbsp;&nbsp;여럿이&nbsp;&nbsp;</label>
														
														<input type="radio" class="btn-check" name="btnradio" id="btnradioTgprn2" data-quest="q5" data-tgrpn="1">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee2"  for="btnradioTgprn2">&nbsp;&nbsp;&nbsp;&nbsp;혼자&nbsp;&nbsp;&nbsp;</label>
													</div>
													<br />
													<br />
												</div>
					
												<!-- Information item -->
												<div class="col-12">
													<ul class="list-group list-group-borderless">
														<li class="list-group-item">
															<span></span>
														</li>
													</ul>
												</div>
											</div>
											
											<!-- Information item -->
											<div class="col-12" style="text-align: center;">
												<span><button onclick="javascript:next(4)" class="btn btn-primary">이전</button></span>
												<span><button onclick="javascript:next(6)" class="btn btn-primary">다음</button></span>
											</div>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="tab-pane" id="tab-6" role="tabpanel">
					<div class="row g-4">
						<div class="col-12">
							<div class="card border">
								<div class="card shadow">
									<!-- Card body -->
									<div class="card-body">
											<!-- Information item -->
											<div class="col-md-6" style="text-align: center; margin-left: 283px;">
												<br />
												<h3>자연 경관과 문화/역사 중에</h3>
												<h3>어떤 것을 경험하고 싶으신가요?</h3>
											</div>
											<div class="row">
												<!-- Information item -->
												<div class="col-6" style="margin-left: 442px; margin-top: 100px; margin-bottom: 100px;">
													<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
														<input type="radio" class="btn-check" name="btnradio" id="btnradioExprnc1" data-quest="q6" data-exprnc="0">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee1"  for="btnradioExprnc1">&nbsp;자연경관&nbsp;</label>
														
														<input type="radio" class="btn-check" name="btnradio" id="btnradioExprnc2" data-quest="q6" data-exprnc="1">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee2"  for="btnradioExprnc2">&nbsp;문화/역사&nbsp;</label>
													</div>
													<br />
													<br />
												</div>
					
												<!-- Information item -->
												<div class="col-12">
													<ul class="list-group list-group-borderless">
														<li class="list-group-item">
															<span></span>
														</li>
													</ul>
												</div>
											</div>
											
											<!-- Information item -->
											<div class="col-12" style="text-align: center;">
												<span><button onclick="javascript:next(5)" class="btn btn-primary">이전</button></span>
												<span><button onclick="javascript:next(7)" class="btn btn-primary">다음</button></span>
											</div>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="tab-pane" id="tab-7" role="tabpanel">
					<div class="row g-4">
						<div class="col-12">
							<div class="card border">
								<div class="card shadow">
									<!-- Card body -->
									<div class="card-body">
											<!-- Information item -->
											<div class="col-md-10" style="text-align: center; margin-left: 100px;">
												<br />
												<h3>여행을 계획할 때 어떤 것이 더 중요시하시나요?</h3>
											</div>
											<div class="row">
												<!-- Information item -->
												<div class="col-6" style="margin-left: 420px; margin-top: 100px; margin-bottom: 100px;">
													<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
														<input type="radio" class="btn-check" name="btnradio" id="btnradioPlan1" data-quest="q7" data-plan="0">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee1"  for="btnradioPlan1">&nbsp;특별한 경험&nbsp;</label>
														
														<input type="radio" class="btn-check" name="btnradio" id="btnradioPlan2" data-quest="q7" data-plan="1">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee2"  for="btnradioPlan2">맛있는 먹거리</label>
													</div>
													<br />
													<br />
												</div>
					
												<!-- Information item -->
												<div class="col-12">
													<ul class="list-group list-group-borderless">
														<li class="list-group-item">
															<span></span>
														</li>
													</ul>
												</div>
											</div>
											
											<!-- Information item -->
											<div class="col-12" style="text-align: center;">
												<span><button onclick="javascript:next(6)" class="btn btn-primary">이전</button></span>
												<span><button onclick="javascript:next(8)" class="btn btn-primary">다음</button></span>
											</div>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="tab-pane" id="tab-8" role="tabpanel">
					<div class="row g-4">
						<div class="col-12">
							<div class="card border">
								<div class="card shadow">
									<!-- Card body -->
									<div class="card-body">
											<!-- Information item -->
											<div class="col-md-8" style="text-align: center; margin-left: 200px;">
												<br />
												<h3>자가용 자동차를 가져갈 계획이신가요?</h3>
											</div>
											<div class="row">
												<!-- Information item -->
												<div class="col-6" style="margin-left: 458px; margin-top: 100px; margin-bottom: 100px;">
													<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
														<input type="radio" class="btn-check" name="btnradio" id="btnradioPvtCar1" data-quest="q8" data-pvt-car="0">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee1"  for="btnradioPvtCar1">&nbsp;&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;</label>
														
														<input type="radio" class="btn-check" name="btnradio" id="btnradioPvtCar2" data-quest="q8" data-pvt-car="1">
														<label class="btn btn-lg btn-light btn-dark-bg-check mb-0 radioFee2"  for="btnradioPvtCar2">&nbsp;아니오&nbsp;</label>
													</div>
													<br />
													<br />
												</div>
					
												<!-- Information item -->
												<div class="col-12">
													<ul class="list-group list-group-borderless">
														<li class="list-group-item">
															<span></span>
														</li>
													</ul>
												</div>
											</div>
											
											<!-- Information item -->
											<div class="col-12" style="text-align: center;">
												<span><button onclick="javascript:next(7)" class="btn btn-primary">이전</button></span>
												<span><button id="btnSubmit" class="btn btn-primary">결과</button></span>
											</div>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
