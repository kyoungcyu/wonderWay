<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
  HttpServletRequest requestFM = (HttpServletRequest) pageContext.getRequest();
  Principal principal = requestFM.getUserPrincipal();
  String username = (principal != null) ? principal.getName() : "Guest";
%>
<head>
	<title>Wonderway-메인페이지</title>
<style type="text/css">
.hi{
	height: 120px;
}
.image2{
  width: 200px;
  height: 100px;
  object-fit: cover;
  text-align: center;
   border-radius: 20px;
  }
  
</style>
</head>
<main>
<!-- =======================
메인광고배너 START -->
<section class="pt-0 ">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-11 mx-auto">
				
				<!-- 메인광고 START -->
				<div class="tiny-slider arrow-round arrow-blur arrow-hover rounded-3 overflow-hidden">
					<div class="tiny-slider-inner" data-gutter="0" data-arrow="true" data-dots="false" data-items="1">
						
						
						<!-- 1번째 광고이미지 START -->
						<div class="card overflow-hidden h-400px h-sm-600px rounded-0" style="background-image:url(/resources/booking/assets/images/advertise/main/005.png); background-position: center left; background-size: cover;">
							<!-- Card image overlay -->
							<div class="card-img-overlay d-flex align-items-center"> 
								<div class="container">
									<div class="row">
									</div>
								</div>
							</div>
						</div>
						<!-- 1번째 광고이미지 END -->
						<!-- 2번째 광고이미지 START -->
						<div class="card overflow-hidden h-400px h-sm-600px rounded-0" style="background-image:url(/resources/booking/assets/images/advertise/main/004.png); background-position: center left; background-size: cover;">
							<!-- Card image overlay -->
							<div class="card-img-overlay d-flex align-items-center"> 
								<div class="container">
									<div class="row">
									</div>
								</div>
							</div>
						</div>
						<!-- 2번째 광고이미지 END -->
						<!-- 3번째 광고이미지 START -->
						<div class="card overflow-hidden h-400px h-sm-600px rounded-0" style="background-image:url(/resources/booking/assets/images/advertise/main/001.png); background-position: center left; background-size: cover;">
							<!-- Card image overlay -->
							<div class="card-img-overlay d-flex align-items-center"> 
								<div class="container">
									<div class="row">
									</div>
								</div>
							</div>
						</div>
						<!-- 3번째 광고이미지 END -->
						<!-- 4번째 광고이미지 START -->
						<div class="card overflow-hidden h-400px h-sm-600px rounded-0" style="background-image:url(/resources/booking/assets/images/advertise/main/002.png); background-position: center left; background-size: cover;">
							<!-- Card image overlay -->
							<div class="card-img-overlay d-flex align-items-center"> 
								<div class="container">
									<div class="row">
									</div>
								</div>
							</div>
						</div>
						<!-- 4번째 광고이미지 END -->
						<!-- 5번째 광고이미지 START -->
						<div class="card overflow-hidden h-400px h-sm-600px rounded-0" style="background-image:url(/resources/booking/assets/images/advertise/main/003.png); background-position: center left; background-size: cover;">
							<!-- Card image overlay -->
							<div class="card-img-overlay d-flex align-items-center"> 
								<div class="container">
									<div class="row">
									</div>
								</div>
							</div>
						</div>
						<!-- 5번째 광고이미지 END -->

						

					</div>
				</div>
				<!-- 메인광고 END -->
			</div>
		</div>
	</div>
</section>
<!-- =======================
메인광고배너END -->


<!-- ======================= ai추천 START -->
<section class="pt-0 pt-md-5">
	<div class="container">
		<!-- Title -->
		<div class="row mb-3 mb-sm-4">
			<div class="col-12 text-center">
				<h2 class="mb-0">AI 추천 서비스를 경험해보세요!</h2>
				<h5>여러분의 선택을 더욱 쉽게 도와드릴게요</h5>
				<span style="opacity: 0.5; font-size: small;">*수집된 개인정보는 추천이외의 용도로는 사용되지 않습니다.</span>
			</div>
		</div>

		<div class="row g-4 g-xl-5">
			<!-- Category item -->
			<div class="col-sm-6 col-lg-4 col-xl-6 hi">
				<div class="row g-2 g-md-3 align-items-center position-relative">
					<!-- Image -->
					<div class="col-md-6">
						<img src="/resources/booking/assets/images/memmain/rcm/001.png" class="rounded-3" alt="">
					</div>
					<!-- Content -->
					<div class="col-md-6">
						<div class="p-2 p-md-0">
							<h5 class="mb-1"><a href="/member/rcm/styMbtiMain" class="stretched-link">mbti별 숙소 추천</a></h5>
							<span>나는 어떤 숙소랑 잘맞을까?</span>
						</div>
					</div>
				</div>
			</div>

			<!-- Category item -->
			<div class="col-sm-6 col-lg-4 col-xl-6 hi">
				<div class="row g-2 g-md-3 align-items-center position-relative">
					<!-- Image -->
					<div class="col-md-6">
						<img src="/resources/booking/assets/images/memmain/rcm/002.png" class="rounded-3" alt="">
					</div>
					<!-- Content -->
					<div class="col-md-6">
						<div class="p-2 p-md-0">
							<h5 class="mb-1"><a href="/member/rcm/mbtiTour" class="stretched-link">mbti별 여행지 추천</a></h5>
							<span>어디로 놀러가야 <br/>잘 놀러갔다 소문이나지?</span>
						</div>	
					</div>
				</div>
			</div>

			<!-- Category item -->
			<div class="col-sm-6 col-lg-4 col-xl-6 hi">
				<div class="row g-2 g-md-3 align-items-center position-relative">
					<!-- Image -->
					<div class="col-md-6">
						<img src="/resources/booking/assets/images/memmain/rcm/003.png" class="rounded-3" alt="">
					</div>
					<!-- Content -->
					<div class="col-md-6">
						<div class="p-2 p-md-0">
							<h5 class="mb-1"><a href="/member/rcm/sty" class="stretched-link<%if(principal == null){%> lginReq <%}%>">맞춤 숙소 추천</a></h5>
							<span>회원님의 정보에 따른<br/> 최적의 숙소추천!</span><br/>
							<span style="opacity: 0.5; font-size: small;">*로그인이 필요한 서비스입니다.</span>
						</div>	
					</div>
				</div>
			</div>

			<!-- Category item -->
			<div class="col-sm-6 col-lg-4 col-xl-6 hi">
				<div class="row g-2 g-md-3 align-items-center position-relative">
					<!-- Image -->
					<div class="col-md-6">
						<img src="/resources/booking/assets/images/memmain/rcm/004.png" class="rounded-3" alt="">
					</div>
					<!-- Content -->
					<div class="col-md-6">
						<div class="p-2 p-md-0">
							<h5 class="mb-1"><a href="/member/rcm/car" class="stretched-link<%if(principal == null){%> lginReq <%}%>">맞춤 렌터카 추천</a></h5>
							<span>내 나이와 성별에<br/>추천하는 렌터카 기종은?</span><br/>
							<span style="opacity: 0.5; font-size: small;">*로그인이 필요한 서비스입니다.</span>
						</div>
					</div>
				</div>
			</div>

			<!-- Category item -->
			<div class="col-sm-6 col-lg-4 col-xl-6 hi">
				<div class="row g-2 g-md-3 align-items-center position-relative">
					<!-- Image -->
					<div class="col-md-6">
						<img src="/resources/booking/assets/images/memmain/rcm/005.png" class="rounded-3" alt="">
					</div>
					<!-- Content -->
					<div class="col-md-6">
						<div class="p-2 p-md-0">
							<h5 class="mb-1"><a href="/member/rcm/psnlPrfr" class="stretched-link<%if(principal == null){%> lginReq <%}%>">선호도 조사 여행지 추천</a></h5>
							<span>여행 설문조사 후<br/> 여행지를 추천해드려요!</span><br/>
							<span style="opacity: 0.5; font-size: small;">*로그인이 필요한 서비스입니다.</span>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- Row END -->
	</div>
</section>
<!-- ======================= AI추천 END -->


<!-- ======================= 여행지 매거진 START -->
<section class="pt-0 pt-lg-5">
	<div class="container">

		<!-- Title -->
		<div class="row mb-4">
			<div class="col-12 text-center">
				<h2 class="mb-0">요즘 인기있는 여행지</h2>
			</div>
		</div>

		<div class="row g-4">
			<!-- 1번째 여행지  START -->
			<div class="col-sm-6 col-lg-3">
				<!-- Card START -->
				<div class="card card-img-scale overflow-hidden bg-transparent">	

					<!-- Image -->
					<div class="card-img-scale-wrapper rounded-3">
						<img src="/resources/booking/assets/images/memmain/tour/kyungju_land.jpg" class="card-img" alt="kyungju_land">
					</div>

					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<div class="d-flex justify-content-between align-items-center">
							<h5 class="card-title"><a href="/member/tripBoard/magazineDetail?brdId=D0520230720001" class="stretched-link">경주월드 어뮤즈먼트</a></h5>
						</div>
							<h6 class="mb-0">18명<span style="font-size: medium; opacity: 0.5;">의 회원이 다녀오셨어요</span><i class="bi bi-suit-heart-fill text-danger ms-1"></i></h6>
							<span style="font-size: small; opacity: 0.3;">*최근 30일 통계</span>
					</div>
				</div>
				<!-- Card END -->
			</div>
			<!-- 1번째 여행지  END -->

			<!-- 2번째 여행지  START -->
			<div class="col-sm-6 col-lg-3">
				<!-- Card START -->
				<div class="card card-img-scale overflow-hidden bg-transparent">
					<!-- Image -->
					<div class="card-img-scale-wrapper rounded-3">
						<img src="/resources/booking/assets/images/memmain/tour/jeju_dawon.jpg" class="card-img" alt="jeju_dawon">
					</div>
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<div class="d-flex justify-content-between align-items-center">
							<h5 class="card-title"><a href="/member/tripBoard/magazineDetail?brdId=D0520230721001" class="stretched-link">제주다원 녹차미로</a></h5>
						</div>
							<h6 class="mb-0">20명<span style="font-size: medium; opacity: 0.5;">의 회원이 다녀오셨어요</span><i class="bi bi-suit-heart-fill text-danger ms-1"></i></h6>
							<span style="font-size: small; opacity: 0.3;">*최근 30일 통계</span>
					</div>
				</div>
				<!-- Card END -->
			</div>
			<!-- 2번째 여행지 END -->

			<!-- 3번째 여행지 START -->
			<div class="col-sm-6 col-lg-3">
				<!-- Card START -->
				<div class="card card-img-scale overflow-hidden bg-transparent">

					<!-- Image -->
					<div class="card-img-scale-wrapper rounded-3">
						<img src="/resources/booking/assets/images/memmain/tour/hajodea.jpg" class="card-img" alt="hajodea">
						
					</div>

					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<div class="d-flex justify-content-between align-items-center">
							<h5 class="card-title"><a href="flight-list.html" class="stretched-link">하조대 둘레길</a></h5>
						</div>
							<h6 class="mb-0">22명<span style="font-size: medium; opacity: 0.5;">의 회원이 다녀오셨어요</span><i class="bi bi-suit-heart-fill text-danger ms-1"></i></h6>
							<span style="font-size: small; opacity: 0.3;">*최근 30일 통계</span>
					</div>
				</div>
				<!-- Card END -->
			</div>
			<!-- 3번째 여행지 END -->
			
			<!-- 4번째 여행지 START -->
			<div class="col-sm-6 col-lg-3">
				<!-- Card START -->
				<div class="card card-img-scale overflow-hidden bg-transparent">

					<!-- Image -->
					<div class="card-img-scale-wrapper rounded-3">
						<img src="/resources/booking/assets/images/memmain/tour/hea_un_dea.jpg" class="card-img" alt="hea_un_dea">
					</div>

					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<div class="d-flex justify-content-between align-items-center">
							<h5 class="card-title"><a href="flight-list.html" class="stretched-link">해운대 달맞이길</a></h5>
						</div>
							<h6 class="mb-0">18명<span style="font-size: medium; opacity: 0.5;">의 회원이 다녀오셨어요</span><i class="bi bi-suit-heart-fill text-danger ms-1"></i></h6>
							<span style="font-size: small; opacity: 0.3;">*최근 30일 통계</span>
					</div>
				</div>
				<!-- Card END -->
			</div>
			<!-- 4번째 여행지 END -->

		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
여행지 매거진 END -->





<!-- =======================
주간베스트 여행후기 START-->
<section class="pt-0 pt-md-5">
	<div class="container">
	<!-- Title -->
		<div class="row mb-4">
			<div class="col-12 text-center">
				<h2 class="mb-0">🔥2주간 인기 글🔥</h2>
			</div>
		</div>
			<div class="row g-4">

				<!-- Blog item START -->
				<div class="col-lg-6">
					<div class="card bg-transparent mb-4 mb-sm-0">
						<!-- Image -->
						<div class="position-relative">
							<img src="/resources/upload/tripBoard${like[0].savePath}" class="card-img" alt="">
							<!-- Badge -->
							<div id="/member/tripBoard/tripDetail?brdId=${like[0].brdId}"
								class="card-img-overlay d-flex align-items-start flex-column p-3 brdList">
								<a href="#" class="badge text-bg-warning"><i
									class="fa-solid fa-heart" style="color: #ffffff;">
										${like[0].brdLike}</i></a>
							</div>
						</div>
						<!-- Card body -->
						<div class="card-body px-3 pb-0">
							<span><i class="bi bi-calendar2-plus me-2"></i>${like[0].frstDt}</span>

							<!-- Title -->
							<h5 class="card-title">
								<a href="/member/tripBoard/tripDetail?brdId=${like[0].brdId}">${like[0].brdTt}</a>
							</h5>
							<!-- <p class="mb-0">Prospective agents should start broadly and then narrow their list down to.</p> -->

							<!-- Author name and button -->
							<div
								class="d-flex justify-content-between align-items-center mt-2">
								<h6 class="mb-0">
									By <a href="#">${like[0].frstWrtr}</a>
								</h6>
<%-- 								<a href="/member/tripBoard/tripDetail?brdId=${like[0].brdId}" --%>
<%-- 									class="btn btn-link p-0 mb-0 <%if(principal == null){%> brdList <%}%>">Read more <i --%>
<!-- 									class="bi bi-arrow-up-right"></i></a> -->
							</div>
						</div>
					</div>
				</div>
				<!-- Blog item END -->
				
				

				<!-- Blog list START -->
				<div class="col-lg-6 ps-lg-5">
					<div class="vstack gap-4">
					<!-- Blog item START -->
						<c:forEach var="brdVO" items="${like}" varStatus="stat" begin="1" end="3">
							<div class="card bg-transparent">
								<div class="row g-3 g-sm-4 align-items-sm-center">
									<div class="col-4">
							<c:choose>
							<c:when test="${brdVO.savePath eq null || brdVO.savePath eq ''}">
									<a href="/member/tripBoard/tripDetail"> 
									<img src="/resources/upload/2023/06/26/2962b8ed-e9f2-4e60-ba56-c9fe93595cb4_다운로드.jpg" class="image2" alt="">
								</a>
							</c:when>
							<c:otherwise>
								<a href="/member/tripBoard/tripDetail"> 
									<img src="/resources/upload/tripBoard${brdVO.savePath}" class="image2" alt="">
								</a>
							</c:otherwise>
							</c:choose>
										<!-- Badge -->
										<div class="card-img-overlay d-flex align-items-start flex-column p-3 brdList" id="/member/tripBoard/tripDetail?brdId=${brdVO.brdId}">
											<a href="#" class="badge text-bg-warning"><i class="fa-solid fa-heart" style="color: #ffffff;"> ${brdVO.brdLike}</i></a>
										</div>
									</div>
									<div class="col-8">
										<!-- card body -->
										<div class="card-body p-0">
											<h5 class="card-title mb-sm-3">
												<a href="/member/tripBoard/tripDetail?brdId=${brdVO.brdId}" class="stretched-link">${brdVO.brdTt}</a>
											</h5>
											<!-- Author name and button -->
											<span class="small">By <a href="/member/tripBoard/tripDetail?brdId=${brdVO.brdId}">${brdVO.frstWrtr}</a></span>
											<div class="d-flex justify-content-between align-items-center">
												<span class="small"> <i class="bi bi-calendar2-plus me-2"></i> 
												<fmt:formatDate var="frstDt" value="${brdVO.frstDt}" pattern="yyyy-MM-dd" />${frstDt}
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<hr class="my-0">
							<!-- Divider -->
						</c:forEach>
						<!-- Blog item END -->
						
						
					</div>
				</div>

			</div>




<script type="text/javascript">
  $(".brdList").on("click", function (e) {
    var username = "<%= username %>"; 

    if (username !== "Guest") {
      window.location.href = e.target.id;
      console.log(e.target.id);
    } else {
      alert("여행 후기 게시판은 로그인 후 이용 가능합니다.");
    }
  });
</script>



	</div>
</section>
<!-- =======================
주간베스트 여행후기  END-->
</main>


