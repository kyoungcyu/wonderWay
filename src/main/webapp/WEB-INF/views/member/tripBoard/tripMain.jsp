<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- Header START -->
<!-- **************** MAIN CONTENT START **************** -->
<style>
.image1{
  width: 654px;
  height: 453px;
  object-fit: cover;
  text-align: center;
  }
.image2{
  width: 200px;
  height: 100px;
  object-fit: cover;
  text-align: center;
   border-radius: 20px;
  }
  
.image3{
  width: 372px;
  height: 538px;
  object-fit: cover;
  text-align: center;
  border-radius: 20px;
  }

.target {
    display: inline-block;
    width: 350px;
    white-space: nowrap;
    overflow: hidden;
}
  
  
 
</style>
<main>
	<!-- ======================= Main banner START -->
	
	
	
	<section class="py-0">
	<div class="container-fluid px-0">
		<!-- Slider START -->
		<div class="tiny-slider arrow-round arrow-blur">
			<div class="tiny-slider-inner" data-autoplay="true" data-arrow="true" data-gutter="0" data-edge="0" data-dots="false" data-items="3" data-items-md="2" data-items-xs="1">
				<!-- Slider item -->
				<div>
					<a class="w-100 h-100" data-glightbox data-gallery="gallery" href="/resources/upload/tripBoard/image1.jpg">
						<div class="card card-element-hover card-overlay-hover rounded-0 overflow-hidden">
							<!-- Image -->
							<img src="/resources/upload/tripBoard/image1.jpg" class="image1" alt="">
							<!-- Full screen button -->
							<div class="hover-element w-100 h-100">
								<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
							</div>
						</div>
					</a>
				</div>

				<!-- Slider item -->
				<div>
					<a class="w-100 h-100" data-glightbox data-gallery="gallery" href="/resources/upload/tripBoard/image2.jpg">
						<div class="card card-element-hover card-overlay-hover rounded-0 overflow-hidden">
							<!-- Image -->
							<img src="/resources/upload/tripBoard/image2.jpg" class="image1" alt="">
							<!-- Full screen button -->
							<div class="hover-element w-100 h-100">
								<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
							</div>
						</div>
					</a>
				</div>

				<!-- Slider item -->
				<div>
					<a class="w-100 h-100" data-glightbox data-gallery="gallery" href="/resources/upload/tripBoard/image3.jpg">
						<div class="card card-element-hover card-overlay-hover rounded-0 overflow-hidden">
							<!-- Image -->
							<img src="/resources/upload/tripBoard/image3.jpg" class="image1" alt="">
							<!-- Full screen button -->
							<div class="hover-element w-100 h-100">
								<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
							</div>
						</div>
					</a>
				</div>

				<!-- Slider item -->
				<div>
					<a class="w-100 h-100" data-glightbox data-gallery="gallery" href="/resources/upload/tripBoard/image4.jpg">
						<div class="card card-element-hover card-overlay-hover rounded-0 overflow-hidden">
							<!-- Image -->
							<img src="/resources/upload/tripBoard/image4.jpg" class="image1" alt="">
							<!-- Full screen button -->
							<div class="hover-element w-100 h-100">
								<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<!-- Slider START -->
	</div>
</section>
	
	
	
	
	
	
	
	

	<section class="pt-4 pt-md-5">
		<div class="container">
			<!-- Title -->
			<div class="row mb-5">
				<div class="col-12 text-center">
					<h1 class="display-1 mb-0">여행후기</h1>
				</div>
			</div>

			<!-- Blog START -->
			<div class="row g-4">

				<div class="text mt-4">

					<!-- 로그인한 회원 -->
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.memVO" var="memVO" />
						<c:if test="${memVO.memId!=null}">
							<a href="/member/tripBoard/tripWrite" id="write"
								class="btn btn-primary mb-0"
								style="float: left; font-size: 18px; padding: 10px 20px;">등록</a>
						</c:if>
					</sec:authorize>
					<!-- 비로그인  -->
					<sec:authorize access="isAnonymous()">
						<button type="button" id="writeNoLogin"
							class="btn btn-primary mb-0"
							style="float: left; font-size: 18px; padding: 10px 20px;">등록</button>
					</sec:authorize>


				</div>
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
						<fmt:formatDate var="frstDt" value="${like[0].frstDt}" pattern="yyyy/MM/dd" />
							<span><i class="bi bi-calendar2-plus me-2"></i>${frstDt}</span>

							<!-- Title -->
							<h5 class="card-title">
								<a href="/member/tripBoard/tripDetail?brdId=${like[0].brdId}" class="target"> ${like[0].brdTt}</a>
							</h5>
							<!-- <p class="mb-0">Prospective agents should start broadly and then narrow their list down to.</p> -->

							<!-- Author name and button -->
							<div
								class="d-flex justify-content-between align-items-center mt-2">
								<h6 class="mb-0">
									By <a href="#">${like[0].frstWrtr}</a>
								</h6>
								<a href="/member/tripBoard/tripDetail?brdId=${like[0].brdId}"
									class="btn btn-link p-0 mb-0">더보기<i class="bi bi-arrow-up-right"></i></a>
							</div>
						</div>
					</div>
				</div>
				<!-- Blog item END -->
				
				

				<!-- Blog list START -->
				<div class="col-lg-6 ps-lg-5" onclick="handleDivClick()">
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
										<div id="/member/tripBoard/tripDetail?brdId=${brdVO.brdId}" 
											class="card-img-overlay d-flex align-items-start flex-column p-3 brdList">
											<a href="#" class="badge text-bg-warning"><i class="fa-solid fa-heart" style="color: #ffffff;">${brdVO.brdLike}</i></a>
										</div>
									</div>
									<div class="col-8">
										<!-- card body -->
										<div class="card-body p-0">
											<h5 class="card-title mb-sm-3">
												<a href="/member/tripBoard/tripDetail?brdId=${brdVO.brdId}" class="stretched-link target">${brdVO.brdTt}</a>
											</h5>
											<!-- Author name and button -->
											<span class="small">By <a href="/member/tripBoard/tripDetail?brdId=${brdVO.brdId}">${brdVO.frstWrtr}</a></span>
											<div class="d-flex justify-content-between align-items-center">
												<span class="small"> <i class="bi bi-calendar2-plus me-2"></i> 
												<fmt:formatDate var="frstDt" value="${brdVO.frstDt}" pattern="yyyy/MM/dd" />${frstDt}
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
		</div>
		<!-- Blog list END -->

		</div>
		<!-- Blog END -->
		</div>
	</section>
	<!-- =======================
Main banner START -->

<!--이슬 사진에서 물체 지우는 ai 시작 -->
	<section class="pt-0 pt-sm-5">
		<div class="container bg-primary bg-opacity-10 rounded-3 overflow-hidden mt-4 p-4">
			<div class="row g-4 align-items-center">
				<!-- Image -->
				<div class="col-6 col-md-3 text-center order-1">
					<img src="/resources/booking/assets/images/element/photo.png" class="mb-n5" alt="">
				</div>

				<!-- Content -->
				<div class="col-md-6 order-md-2 px-2">
					<!-- Title -->
					<h4>여행사진에서 지우고 싶은 부분이 있으신가요?</h4>
					<!-- Content -->
					<p class="mb-2">WonderWay의 AI기술을 이용하면 사진에서 특정 부분을 지울 수 있어요!</p>
					<!-- Button -->
					<a href="/member/tripBoard/tripPhoto" class="btn btn-sm btn-primary mb-0">사진 업로드</a>
				</div>

				<!-- Image -->
				<div class="col-6 col-md-3 text-center order-3">
					<img src="/resources/booking/assets/images/element/tower.svg" class="mb-n5" alt="">
				</div>
			</div>
		</div>
	
	</section>
<!--이슬 사진에서 물체 지우는 ai 끝-->
	
	<!-- =======================
Blog grid START -->
	<section class="pt-0 pt-sm-5">
		<div class="container">

			<!-- Title -->
			<div class="row mb-4">
				<div class="col-12 text-center">
					<h2 class="mb-0">여행후기 모음집</h2>
				</div>
			</div>

			<!-- 여행후기 모음집 > 최근순
		 -->
			<div class="row g-4">

				<c:forEach var="brdVO" items="${list}" varStatus="stat" begin="0" end="5">

					<!-- Blog item START -->
					<div class="col-md-6 col-lg-4">
						<div class="card bg-transparent">
							<!-- Image -->
							<div class="position-relative">
							<c:choose>
							<c:when test="${brdVO.savePath eq null || brdVO.savePath eq ''}">
									<a href="/member/tripBoard/tripDetail"> 
									<img src="/resources/upload/2023/06/26/2962b8ed-e9f2-4e60-ba56-c9fe93595cb4_다운로드.jpg" class="image3" alt="">
								</a>
							</c:when>
							<c:otherwise>
								<a href="/member/tripBoard/tripDetail"> 
									<img src="/resources/upload/tripBoard${brdVO.savePath}" class="image3" alt="">
								</a>
							</c:otherwise>
							</c:choose>
								<!-- Badge -->
								<div class="card-img-overlay p-3">
									<a class="badge text-bg-warning"><i
										class="fa-solid fa-heart" style="color: #ffffff;">
											${brdVO.brdLike}</i></a>
								</div>
							</div>

							<!-- Card body -->
							<div class="card-body p-3 pb-0">
								<!-- Title -->
								<span class="small"><i class="bi bi-calendar2-plus me-2"></i>
								<fmt:formatDate var="frstDt" value="${brdVO.frstDt}"
										pattern="yyyy/MM/dd" />&nbsp;${frstDt}</span>
								<h5 class="card-title mt-2">
									<a href="/member/tripBoard/tripDetail?brdId=${brdVO.brdId}" class="target">${brdVO.brdTt}</a>
								</h5>
								<div class="d-flex justify-content-between align-items-center">
									<h6 class="fw-light mb-0">
										By <a href="/member/tripBoard/tripDetail?brdId=${brdVO.brdId}" style="color: #0000FF;">${brdVO.frstWrtr}</a>
									</h6>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- Blog item END -->



			</div>

			<!-- Buttons -->
			<div class="text-center mt-4">
				<a href="/member/tripBoard/tripBoardList"
					class="btn btn-primary-soft mb-0">더보기<i
					class="fas fa-sync ms-2"></i></a>
			</div>
		</div>
	</section>
	<!-- =======================
Blog grid END -->



</main>
<!-- **************** MAIN CONTENT END **************** -->


<!-- Back to top -->
<div class="back-top"></div>

<!-- Bootstrap JS -->
<script src="/resources/booking/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- ThemeFunctions -->
<script src="/resources/booking/assets/js/functions.js"></script>

<script type="text/javascript">
	$("#writeNoLogin").click(function() {
		alert("로그인한 회원만 가능합니다.");
	});
	
	function handleDivClick(event) {
		  // 클릭된 요소를 가져옵니다.
		  const targetElement = event.target;

		  // 클릭된 요소가 "stretched-link" 클래스를 가지고 있는 앵커 태그(a)인지 확인합니다.
		  if (targetElement.tagName === 'A' && targetElement.classList.contains('stretched-link')) {
		    // 기본 링크 동작을 막기 위해 preventDefault()를 호출합니다.
		    event.preventDefault();

		    // 클릭된 앵커 태그의 href 속성을 가져옵니다.
		    const href = targetElement.getAttribute('href');

		    // href 속성에 지정된 URL로 이동합니다.
		    window.location.href = href;
		  }
		}
	
	
	$(".brdList").on("click",function(e){
		window.location.href = e.target.id;
		console.log(e.target.id);
	});
</script>

</body>
</html>