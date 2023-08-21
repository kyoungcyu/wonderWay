<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<title>Booking - Multipurpose Online Booking Theme</title>

<script type="text/javascript">

$(function() {
	const today = new Date();
    const date3= new Date(today);
    date3.setDate(today.getDate() + 3);
	
	
	flatpickr(".period", {
		minDate: date3,
		local: "ko"
	})
	
	flatpickr(".birth", {
		maxDate: "today",
		local: "ko"
	})
});


</script>
<body>

<!-- **************** MAIN CONTENT START **************** -->
<main>

<!-- =======================
Main banner START -->
<section class="pt-0">
	<!-- Background and title -->
	<div class="container-fluid" style="background-image:url(/resources/booking/assets/images/bg/08.jpg); background-position: center left; background-size: cover;">
		<div class="row">
			<!-- Title -->
			<div class="col-md-6 mx-auto text-center pt-7 pb-9">
				<h1 class="text-white">여행자 보험과 함께<br/>안전한 여행을 즐기세요</h1>
			</div>
		</div> <!-- Row END -->
	</div>

	<!-- Search START -->
	<div class="container mt-n8">
		<div class="row">

			<!-- Tab content START -->
			<div class="col-12">
				<div class="tab-content" id="nav-tabContent">
					
					<!-- Tab content item START -->
					<div class="tab-pane fade show active" id="tab-1-1">
						<form class="card shadow p-0" action="/member/insurance/search" method="post">
						
							<!-- Card header -->
							<div class="card-header p-4">
								<h5 class="mb-0"><i class="fa-solid fa-hand-holding-medical fa-fw me-2"></i>여행자 보험</h5>
							</div>

							<!-- Card body -->
							<div class="card-body p-4 pt-0">
								<div class="row g-4">
									<!-- Location -->
									<div class="col-lg-6">
										<div class="form-icon-input form-size-lg form-fs-lg">
											<select class="form-select js-choice" name="nation" data-search-enabled="true">
												<option value="">여행국가</option>
												<option selected>미국</option>
												<option>캐나다</option>
												<option>일본</option>
												<option>중국</option>
											</select>
											<span class="form-icon"><i class="bi bi-search fs-5"></i></span>
										</div>
									</div>
									
									<!-- Date -->
									<div class="col-lg-6">
										<div class="form-icon-input form-fs-lg">
											<input type="text" name="period" class="form-control form-control-lg flatpickr period" data-date-format="Y/m/d" data-mode="range" placeholder="여행기간" >
											<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
										</div>
									</div>
									
									<!-- 성별 -->
									<div class="col-lg-4">
										<div class="form-icon-input form-size-lg form-fs-lg">
											<select class="form-select js-choice" name="sex" data-search-enabled="true" >
												<option value="">성별</option>
												<option <c:if test="${memVO.memGen == 'M'}">selected="selected"</c:if>>남성</option>
												<option <c:if test="${memVO.memGen == 'F'}">selected="selected"</c:if>>여성</option>
											</select>
											<span class="form-icon"><i class="bi bi-search fs-5"></i></span>
										</div>
									</div>

									

									<!-- Date -->
									<div class="col-lg-4">
										<div class="form-icon-input form-fs-lg">
											<input type="text" name="birth" class="form-control form-control-lg flatpickr birth" data-date-format="Y/m/d" placeholder="생년월일" value="${memVO.memBir }">
											<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
										</div>
									</div>
									
									
									<!--여행목적  -->
									<div class="col-lg-4">
										<div class="form-icon-input form-size-lg form-fs-lg">
											<select class="form-select js-choice" name="tripType" data-search-enabled="true">
												<option value="">여행목적</option>
												<option>일반관광</option>
												<option selected>비즈니스</option>
												<option>어학연수</option>
											</select>
											<span class="form-icon"><i class="bi bi-search fs-5"></i></span>
										</div>
									</div>

								</div> <!-- Row END -->

								<!-- Button -->
								<div class="text-center pt-0">
									<button type="submit" class="btn btn-lg btn-primary mb-n7">여행자보험 찾기 <i class="bi bi-arrow-right ps-3"></i></button>
								</div>
							</div>
							<sec:csrfInput />
						</form>
					</div>
					<!-- Tab content item END -->


				</div> 
			</div>
			<!-- Tab content END -->
		</div>
	</div>
	<!-- Search END -->
</section>
<!-- =======================
Main banner START -->


</main>
<!-- **************** MAIN CONTENT END **************** -->


</body>
</html>