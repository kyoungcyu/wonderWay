<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ page import="java.security.Principal" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>

<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00b9512c890219b30461ddb8688695ac"></script>

<head>
	<title>Wonderway-숙소</title>
	
<style>
.tiny-slider-inner{
  text-align: center; /* 사진을 가로 방향으로 중앙에 위치시킵니다. */
  align-items:center;
  overflow:hidden;
  height:12rem;
  
}
.tns-ovh{
  height:12rem;

}

.tns-item{
height:100%

}
.tiny-slider-inner img {
  width: 100%; /* 가로 방향으로 부모 요소에 맞게 확대합니다. */
  height:100%; /* 세로 방향으로 부모 요소에 맞게 확대합니다. */
  object-fit: cover; /* 이미지를 비율을 유지하면서 부모 요소에 꽉 채우도록 설정합니다. */
  overflow: hidden;
  
}

#sideBar{
	position: sticky;
}
.choices{
	width:6rem;	
}


/*토스트창  */
#toastRmNum{
  position: fixed;
  bottom: 50%;
  left: 45%;
  width:16rem;
  height:4rem;
  text-align:center;
  display:flex;
  align-items:center;
  justify-content:center;
  margin:auto 0;
  background-color:#EDECFB;
  opacity: 0;
  transition: opacity 0.5s ease;
}
#toastRmNum.show {
  opacity: 0.9;
} 

/*링크 복사 토스트창  */
#toastCopyLink{
  position: fixed;
  top: 30%;
  left: 50%;
  transform: translateX(-50%);
  width:20rem;
  text-align:center;
  background-color:#EDECFB;
  opacity: 0;
  transition: opacity 0.5s ease;
}
#toastCopyLink.show {
  opacity: 1;
} 

</style>

<script type="text/javascript">

$(function() {
	var mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${busiVO.lati}, ${busiVO.longi}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${busiVO.lati}, ${busiVO.longi}); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map); 

	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	
	$("#mapmodal").on('shown.bs.modal',function(){
		map.relayout()
		map.setCenter( new kakao.maps.LatLng(${busiVO.lati}, ${busiVO.longi}))
		
	});


	//객실 상세정보 보기
	$(".btnRoomDetail").on("click",function() {
		var rmId=$(this).data("value")
		
		$.ajax({
			type : "post",
			url : "/member/acm/rmDetail",
			data : {"rmId" : rmId},
			dataType : "json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(result) {
				var rmVO= result;
				$("#rmNm").html(rmVO[0].rmNm)
				$("#modal-rmDc").html(rmVO[0].rmDc)
				console.log("rmVO",rmVO)
				var html=''
					$.each(rmVO[0].attachDeVOList,function(i,v){
					
						html+= '<div><img src="/resources/upload/rm'+v.savePath+'" alt="Card image"></div>'
					
					})
				$(".rmImgs").html(html)	
				
				
				var slider = tns({
				    container: '.rmImgs',
				    items: 1,
				    slideBy: 'page',
				    autoplay: true,
				    autoplayButton: false,
	                autoplayButtonOutput: false,
	                arrowKeys: true,
	                controlsText: ['<', '>']
	           
				  });
				
			    slider.refresh(); // 슬라이더 갱신

			  }                              
		})
	});
	
	
	
	//캘린더 설정
	flatpickr(".flatpickr", {
		minDate: "today",
		dateFormat:"y/m/d",
		local: "ko"
	});
	
	

	
	
	//공유하기-카카오톡 공유
	$("#kakaoShare").on("click",function() {
		Kakao.init('92113e51809f8d4ec0f9375fd165983d');
		Kakao.isInitialized();
		
		Kakao.Share.sendCustom({
			templateId: ${95735},
			templateArgs: {
			    title: '${busiVO.busiNm}',
			    description: '${busiVO.busiLoc}',
			    busiId:'${busiVO.busiId}',
			  },
		});
	});
	
	//공유하기- url복사하기 기능
	$("#copyLink").on("click",function(){
		
		var url = window.document.location.href;
		var textarea = document.createElement("textarea");
		
		document.body.appendChild(textarea);
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		
		$('#toastCopyLink').toast('show');
		setTimeout(function() {
		    $('#toastCopyLink').toast('hide');
		  }, 2000);

	});
	
	
	//탭에 해시 부여
	$(".nav-link.mb-0").on("click",function(){
		var hash= $(this).attr("id")
		window.location.hash = hash
	});
	
	
	
	//해시탭 활성화 
	var hash = window.location.hash;
	if (hash) {
		var id = hash.slice(1);
		$(".nav-link").removeClass("active"); 
		$(".tab-pane").removeClass("show active");
		$("#"+id).addClass("active").addClass("border-0");
		$("#tour-pills-"+id).addClass("show active");
	}
	  
	  
	//객실 재검색 
	$("#btnSearch").on("click",function(){
		var data={
			"rsvSt":$("#chckIn").val(),
			"rsvEd":$("#chckOut").val(),
			"busiId":$()
		}
		
		$.ajax({
			type : "get",
			url : "/member/acm/detail/rmSearch",
			data : JSON.stringify(data),
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(result) {
				console.log("result : " + JSON.stringify(result));
			}
		})
	});
		
		
	//객실보기 버튼 클릭시 
	$("#btnRm").on("click",function(){
		$(".nav-link").removeClass("active"); 
		$(".tab-pane").removeClass("show active");
		$("#tab3").addClass("active").addClass("border-0");
		$("#tour-pills-tab3").addClass("show active");
	});
	
	
	//장바구니 버튼 클릭시
	$(".btnCart").on("click",function(){
		var selectedVal= $("#rmNumSelect",this.form).children("option:selected").val()
		//방번호를 선택 안했을경우- 토스트창 실행 
		if(selectedVal==""){
			event.preventDefault(); 
			$('#toastRmNum').find(".toast-body").text("방 번호를 선택해주세요");
			$('#toastRmNum').toast('show');
			setTimeout(function() {
			    $('#toastRmNum').toast('hide');
			  }, 2000);
		}else{
			$('#toastRmNum').find(".toast-body").text("장바구니 추가 완료!");
			$('#toastRmNum').toast('show');
			setTimeout(function() {
			    $('#toastRmNum').toast('hide');
			  }, 2000);
			
			
			
			var rmId =$("input[name=rmId]",this.form).val()
			var rmNm =$(this).data("rmnm");
			var rmPr =$(this).data("rmpr");
			console.log(rmNm)
			console.log(rmPr)
			
			var data={
					"busiId":`${busiVO.busiId}`,
					"busiNm":`${busiVO.busiNm}`,
					"rmId":rmId,
					"rmNm":rmNm,
					"rmNum":selectedVal,
					"rmPr":rmPr
			}
				
				$.ajax({
					type : "post",
					url : "/member/acm/addCart",
					data : JSON.stringify(data),
					dataType : "text",
					contentType : "application/json;charset=utf-8",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}",
								"${_csrf.token}");
					},
					success : function(result) {
						if(result.indexOf("이미")!=-1){
							console.log("result : " + result);

							$('#toastRmNum').find(".toast-body").text(result);
							
							$('#toastRmNum').toast('show');
							setTimeout(function() {
							    $('#toastRmNum').toast('hide');
							}, 2000);
						}else{
							
							
							
						}
					}
				})
		
		}
	})
	
	
		//예약하기 버튼 클릭시 
	$(".btnRsv").on("click",function(){
		var selectedVal= $("#rmNumSelect",this.form).children("option:selected").val()
		//방번호를 선택 안했을경우- 토스트창 실행 
		if(selectedVal==""){
			event.preventDefault(); 
			$('#toastRmNum').toast('show');
			setTimeout(function() {
			    $('#toastRmNum').toast('hide');
			  }, 2000);
			 
		//방번호 선택시 폼 제출 
		}else{
			$("#rmNum",this.form).val(selectedVal)
// 			$("#rsvForm").submit()	
			this.form.submit()
		}

	})
	
});

	//쪽지보내기
	function msgInsert() {

			var cntn = $("#ta").val();
			var getId = $("#val").html();

			var param = {
				"cntn" : cntn.trim(),
				"recvId" : "${busiVO.busiId}", 
				"recvNm" : "${busiVO.busiNm}"
			};
			console.log("아작스로 db저장하려고 쪽지 보낼때 param2" + JSON.stringify(param));

			$.ajax({
				url : "/member/acm/msgInsert",
				type : "post",
				data : JSON.stringify(param),
				dataType : "json",
				contentType : "application/json",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
				success : function(data) {
					console.log("ajax성공 " + data)



				<%
				  HttpServletRequest requestFM = (HttpServletRequest) pageContext.getRequest();
				  Principal principal = requestFM.getUserPrincipal();
				  String username = (principal != null) ? principal.getName() : "Guest";
				%>


			
					if (data >= 1) {
						alert("쪽지를 보냈습니다.");
						$("#ta").val("");

						//쪽지 알람 메세지 보내기
						var busiNm = "${busiVO.busiNm}";
						console.log("쪽지보내기 성공했을때 username" + "<%= username %>");
						let alm = {
							"sender" : "<%= username %>", //보낸사람
							"receiver" : busiNm, //받는사람
							"almCntn" : "<%= username %>" + "업체 사장님이 쪽지를 보냈습니다.",
							"almTt" : "쪽지가 도착했습니다. 알림창을 확인해주세요.",
							"almUrl" : "/business/inquiry/msgbox?tab=1"
						}
						console.log("쪽지보내기 성공했을때 alm" + JSON.stringify(alm));
						socketAlm.send(JSON.stringify(alm));

					} else {
						alert("쪽지보내기에 실패했습니다. 로그인 정보를 확인해 주세요.")
						
						$("#ta").val("");
					}
				},
				error : function(e) {
				}
			});

			$("#ta").val("");

		}

</script>	
</head>
<body>
<!-- **************** MAIN CONTENT START **************** -->
<main>
<!-- =======================
Main Title START -->
<section class="py-0 pt-sm-2">
	<div class="container position-relative">
		<!-- Title and button START -->
		<div class="row mb-3">
			<div class="col-12">
				<!-- Meta -->
				<div class="d-lg-flex justify-content-lg-between mb-1">
					<!-- Title -->
					<div class="mb-2 mb-lg-0">
						<h1 class="fs-2">${busiVO.busiNm}</h1>
						<!-- Location -->
						<p class="fw-bold mb-0"><i class="bi bi-geo-alt me-2"></i>${busiVO.busiLoc}
							<a id="btnKakaoMap" href="#" class="ms-2 text-decoration-underline" data-bs-toggle="modal" data-bs-target="#mapmodal">
								<i class="bi bi-eye-fill me-1"></i>지도에서 보기
							</a>
						</p>
					</div>

					<!-- Buttons -->
					<ul class="list-inline text-end">
						<!-- Heart icon -->
						<li class="list-inline-item">
							<a href="#" class="btn btn-sm btn-light px-2"><i class="fa-solid fa-fw fa-heart"></i></a>
						</li>
						<!-- Share icon -->
						<li class="list-inline-item dropdown">
							<!-- Share button -->
							<a href="#" class="btn btn-sm btn-light px-2" role="button" id="dropdownShare" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="fa-solid fa-fw fa-share-alt"></i>
							</a>
							<!-- dropdown button -->
							<ul class="dropdown-menu dropdown-menu-end min-w-auto shadow rounded" aria-labelledby="dropdownShare">
								<li><a id="kakaoShare" class="dropdown-item"><i class="fa fa-comment me-2"></i>카카오톡 공유하기</a></li>
								<li><a id ="copyLink" class="dropdown-item"><i class="fa-solid fa-copy me-2"></i>링크 복사하기</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Title and button END -->

	</div>
</section>
<!-- =======================
Main Title END -->

<!-- =======================
Image gallery START -->
<section class="card-grid pt-0 mb">
	<div class="container">
		<div class="row g-2">
			<!-- Image -->
			<div class="col-md-6">
				<a data-glightbox data-gallery="gallery" href="/resources/upload/busi${busiVO.busiImg}">
					<div class="card card-grid-lg card-element-hover card-overlay-hover overflow-hidden" style="background-image:url(/resources/upload/busi${busiVO.busiImg}); background-position: center left; background-size: cover;">
						<!-- Card hover element -->
						<div class="hover-element position-absolute w-100 h-100">
							<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6">
				<!-- Card item START -->
				<div class="row g-2"> 
					<!-- Image -->
					<div class="col-12">
						<a data-glightbox data-gallery="gallery" href="/resources/upload/busi${attachDeVOList[0].savePath}">
							<div class="card card-grid-sm card-element-hover card-overlay-hover overflow-hidden" style="background-image:url('/resources/upload/busi${attachDeVOList[0].savePath}'); background-position: center left; background-size: cover;">
								<!-- Card hover element -->
								<div class="hover-element position-absolute w-100 h-100">
									<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
								</div>
							</div>
						</a>	
					</div>

					<!-- Image -->
					<div class="col-md-6">
							<!--임시로직  -->
							<a data-glightbox data-gallery="gallery" href="/resources/upload/busi/2023/07/25/94f133bb-4355-4ee2-b958-b524b1cc2487_상세이미지02.jpg">
							<div class="card card-grid-sm card-element-hover card-overlay-hover overflow-hidden" style="background-image:url(/resources/upload/busi/2023/07/25/94f133bb-4355-4ee2-b958-b524b1cc2487_상세이미지02.jpg); background-position: center left; background-size: cover;">
							<!--원래 맞는 로직  -->
						<%-- 	<a data-glightbox data-gallery="gallery" href="/resources/upload/busi${attachDeVOList[1].savePath}"> 
							<div class="card card-grid-sm card-element-hover card-overlay-hover overflow-hidden" style="background-image:url(/resources/upload/busi${attachDeVOList[1].savePath}); background-position: center left; background-size: cover;"> --%>
								<!-- Card hover element -->
								<div class="hover-element position-absolute w-100 h-100">
									<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
								</div>
							</div>
						</a>	
					</div>

					<!-- Images -->
					<div class="col-md-6">
						<!--임시로직  -->
						<div class="card card-grid-sm overflow-hidden" style="background-image:url(/resources/upload/busi/2023/07/25/f353518d-4147-44dd-94c2-499c83fc371d_상세이미지03.jpg); background-position: center left; background-size: cover;">
						<!--원래 맞는 로직  -->
<%-- 						<div class="card card-grid-sm overflow-hidden" style="background-image:url(/resources/upload/busi${attachDeVOList[2].savePath}); background-position: center left; background-size: cover;"> --%>
							<!-- Background overlay -->
							<div class="bg-overlay bg-dark opacity-7"></div>

							<!-- Popup Images -->
							<a data-glightbox="" data-gallery="gallery" href="/resources/upload/busi${attachDeVOList[2].savePath}" class="stretched-link z-index-9"></a>
						 	<a data-glightbox="" data-gallery="gallery" href="/resources/upload/busi${attachDeVOList[3].savePath}"></a>
							<a data-glightbox="" data-gallery="gallery" href="/resources/upload/busi${attachDeVOList[4].savePath}"></a>

							<!-- Overlay text -->
							<div class="card-img-overlay d-flex h-100 w-100">
								<h6 class="card-title m-auto fw-light text-decoration-underline"><a href="#" class="text-white">더보기</a></h6>
							</div>
						</div>
					</div>
				</div>
				<!-- Card item END -->
			</div>
		</div>
	</div>
</section>
<!-- =======================
Image gallery END -->

<!-- =======================
탭 START-->
<section class="py-0 mt-0">
	<div class="container">
		<!-- 탭 START -->
		<div class="row">
			<div class="col-12">
				<!-- Outer tabs START -->
				<ul class="nav nav-pills nav-justified nav-responsive bg-primary bg-opacity-10 rounded p-2" id="tour-pills-tab" role="tablist">
					<!-- Tab item -->
					<li class="nav-item" role="presentation">
						<button class="nav-link active mb-0" id="tab1" data-bs-toggle="pill" data-bs-target="#tour-pills-tab1" type="button" role="tab" aria-controls="tour-pills-tab1" aria-selected="true">개요</button>
					</li>
					<!-- Tab item -->
					<li class="nav-item" role="presentation">
						<button class="nav-link mb-0" id="tab2" data-bs-toggle="pill" data-bs-target="#tour-pills-tab2" type="button" role="tab" aria-controls="tour-pills-tab2" aria-selected="false">편의시설/서비스</button>
					</li>
					<!-- Tab item -->
					<li class="nav-item" role="presentation">
						<button class="nav-link mb-0" id="tab3" data-bs-toggle="pill" data-bs-target="#tour-pills-tab3" type="button" role="tab" aria-controls="tour-pills-tab3" aria-selected="false">객실</button>
					</li>
					<!-- Tab item -->
					<li class="nav-item" role="presentation">
						<button class="nav-link mb-0" id="tab4" data-bs-toggle="pill" data-bs-target="#tour-pills-tab4" type="button" role="tab" aria-controls="tour-pills-tab4" aria-selected="false">이용 후기</button>
					</li>
					<!-- Tab item -->
					<li class="nav-item" role="presentation">
						<button class="nav-link mb-0" id="tab5" data-bs-toggle="pill" data-bs-target="#tour-pills-tab5" type="button" role="tab" aria-controls="tour-pills-tab5" aria-selected="false">숙소 정보 및 정책</button>
					</li>
				</ul> 
				<!-- Outer tabs END -->
			</div>
		</div>
		<!-- Tabs END -->
	</div>
</section>
<!-- =======================
탭 END -->


<!-- =======================
Tabs-content START -->
<section class="pt-4 pt-md-5">
	<div class="container">

		<div class="row g-4 g-md-5">
			<!-- Tabs Content START -->
			<div class="col-xl-8">
				<!-- Outer tabs contents START -->
				<div class="tab-content mb-0" id="tour-pills-tabContent">

					<!-- 개요 START -->
					<div class="tab-pane fade show active" id="tour-pills-tab1" role="tabpanel" aria-labelledby="tour-pills-tab1">
						<div class="card bg-transparent p-0">
						<!-- Card header -->
						<div class="card-header border-bottom bg-transparent px-0 pt-0">
							<h3 class="mb-0">숙소 개요</h3>
						</div>

						<!-- Card body START -->
						<div class="card-body pt-4 p-0">
							<h5 class="fw-light mb-2">주요 정보</h5>
							<ul class="list-group list-group-borderless mb-4">
								<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i><b>체크인 : &nbsp;</b> <a class="text-success">${busiVO.chckIn}</a>&nbsp;이후 &nbsp; <b>체크아웃 :&nbsp; </b> <a class="text-success">${busiVO.chckOut}</a>&nbsp;이전</li>
								<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i><b>평균별점 :</b>&nbsp;<i class="fa-solid fa-star text-warning"></i>${busiVO.avgSt}</li>
								<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i><b>흡연 관련 정책 :</b> &nbsp;
								<c:out value="${mapKPDS.SMOKING eq 'Y' ? '객실 내 흡연 가능' : '객실 내 금연'}"/></li>
								<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i><b>아동 동반가능 여부 :</b> &nbsp; 
								<c:out value="${mapKPDS.KID eq 'Y' ? '아동 출입 가능' : '아동 출입 불가'}"/></li>
								<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i><b>반려동물 동반가능 여부 :</b> &nbsp; 
								<c:out value="${mapKPDS.PET eq 'Y' ? '반려동물 출입 가능' : '반려동물 출입 불가'}"/></li>
								
							</ul>
							
							
							
							
							<h5 class="fw-light mb-2">간단 소개</h5>
							<p class="mb-3">${busiVO.busiInfo}</b></p>
							
						</div>
						<!-- Card body END -->
						</div>
					</div>		
					<!-- 개요 END -->

					<!-- Content item START -->
					<div class="tab-pane fade" id="tour-pills-tab2" role="tabpanel" aria-labelledby="tour-pills-tab2">
						<div class="card bg-transparent p-0">
							<!-- Card header -->
							<div class="card-header border-bottom bg-transparent px-0 pt-0">
								<h3 class="card-title mb-0">편의시설 및 서비스</h3>
							</div>
	
							<!-- Card body START -->
							<div class="card-body pt-4 p-0">
								
								<div class="row g-4">
									<h6><i class="fa-solid fa-check-circle text-success me-2"></i>아동/장애인/반려동물 관련</h6>
									<c:forEach var="cvfcVO" items="${cvfcVOList}" varStatus="stat">
									<c:if test = "${cvfcVO.cvfcType=='access'}">
										<div class="col-sm-2">
											<div class="icon-xl bg-light h5 rounded-2 mx-auto">
												<i class="fa-solid ${cvfcVO.icon}"></i>
											</div>
											<ul class="list-group list-group-borderless mt-2 mb-0">
												<li class="list-group-item pb-0 mx-auto">${cvfcVO.cvfcNm}</li>
											</ul>
										</div>
									</c:if>
									</c:forEach>
									
									
									<h6><i class="fa-solid fa-check-circle text-success me-2"></i>청결 및 안전</h6>
									<c:forEach var="cvfcVO" items="${cvfcVOList}" varStatus="stat">
									<c:if test = "${cvfcVO.cvfcType=='clean_safe'}">
										<div class="col-sm-2">
											<div class="icon-xl bg-light h5 rounded-2 mx-auto">
												<i class="fa-solid ${cvfcVO.icon}"></i>
											</div>
											<ul class="list-group list-group-borderless mt-2 mb-0 ">
												<li class="list-group-item pb-0 mx-auto">${cvfcVO.cvfcNm}</li>
											</ul>
										</div>
									</c:if>
									</c:forEach>
									
									
									<h6><i class="fa-solid fa-check-circle text-success me-2"></i>시설 및 서비스</h6>
									<c:forEach var="cvfcVO" items="${cvfcVOList}" varStatus="stat">
									<c:if test = "${cvfcVO.cvfcType=='facility'}">
										<div class="col-sm-2">
											<div class="icon-xl bg-light h5 rounded-2 mx-auto">
												<i class="fa-solid ${cvfcVO.icon}"></i>
											</div>
											<ul class="list-group list-group-borderless mt-2 mb-0">
												<li class="list-group-item pb-0 mx-auto">${cvfcVO.cvfcNm}</li>
											</ul>
										</div>
									</c:if>
									</c:forEach>
									
									<h6><i class="fa-solid fa-check-circle text-success me-2"></i>모든 객실에서 이용 가능</h6>
									<c:forEach var="cvfcVO" items="${cvfcVOList}" varStatus="stat">
									<c:if test = "${cvfcVO.cvfcType=='room'}">
										<div class="col-sm-2">
											<div class="icon-xl bg-light h5 rounded-2 mx-auto">
												<i class="fa-solid ${cvfcVO.icon}"></i>
											</div>
											<ul class="list-group list-group-borderless mt-2 mb-0">
												<li class="list-group-item pb-0 mx-auto">${cvfcVO.cvfcNm}</li>
											</ul>
										</div>
									</c:if>
									</c:forEach>	
									
									</div>
									
		
								</div>
						</div>
						<!-- Card body END -->
					</div>	
					<!-- Content item END -->

					<!-- 객실 START -->
					<div class="tab-pane fade" id="tour-pills-tab3" role="tabpanel" aria-labelledby="tour-pills-tab3">
						<div class="card bg-transparent p-0">
							<!-- Card header -->
						<div class="card-header border-bottom bg-transparent px-0 pt-0">
							<div class="d-sm-flex justify-content-sm-between align-items-center">
								<h3 class="mb-2 mb-sm-0">이용가능 객실</h3>
	
							</div>
						</div>
						<!-- Card body START -->
						<div class="card-body pt-4 p-0">
							<form class="row g-4 mb-4" action="/member/acm/detail/${busiVO.busiId}#tab3" method="get">
									
									<!-- Date -->
									<div class="col-lg-5">
										<div class="form-icon-input form-fs-lg">
											<input name="rsvSt" type="text" class="form-control form-control-lg flatpickr"  data-date-format="y/m/d" placeholder="체크 인:  ${rsvSt}">
											<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
										</div>
									</div>

									<!-- Date -->
									<div class="col-lg-5">
										<div class="form-icon-input form-fs-lg">
											<input name="rsvEd" type="text" class="form-control form-control-lg flatpickr"  data-date-format="y/m/d" placeholder="체크 아웃: ${rsvEd}">
											<span class="form-icon"><i class="bi bi-calendar fs-5"></i></span>
										</div>
									</div>

									<!-- 검색버튼 -->
									<div class="col-lg-2">
										<button type="submit" class="icon-lg btn btn-round btn-primary mb-0"><i class="bi bi-search fa-fw"></i></button>
									</div>
								
					<sec:csrfInput />
				</form>
						
						
							<div class="vstack gap-4">
								<c:forEach var="rmVO" items="${rmVOList}" varStatus="stat">
 								<form id="rsvForm" method="post" action="/member/acm/reserveRm">
								<!-- Room item START -->
								<div class="card shadow p-3 mb-3">
									<div class="row g-4">
										<!-- Card img -->
										<div class="col-md-5 position-relative">

											<!-- Overlay item -->
											<div class="position-absolute top-0 start-0 z-index-1 mt-3 ms-4">

											</div>

											<!-- Slider START -->
											<div class="tiny-slider arrow-round arrow-xs arrow-dark overflow-hidden rounded-2" style="height:12rem;">
												<div class="tiny-slider-inner" data-autoplay="true" data-arrow="true" data-dots="false" data-items="1">
													<c:forEach var="attachDeVO" items="${rmVO.attachDeVOList}" varStatus="stat"> 
														<!-- Image item -->
														<div><img src="/resources/upload/rm${attachDeVO.savePath}" alt="Card image"></div>
	
													</c:forEach>
													
												</div>
											</div>
											<!-- Slider END -->

										</div>

										<!-- Card body -->
										<div class="col-md-7">
											<div class="card-body d-flex flex-column h-100 p-0">
					
												<!-- Title -->
												<div class="d-flex justify-content-between mt-2">
													<h5 class="card-title"><a href="#">${rmVO.rmNm}</a></h5>
													<a class="btnRoomDetail" href="#" class="btn btn-link text-decoration-underline p-0 mb-0 mt-3" data-bs-toggle="modal" data-bs-target="#roomDetail" data-value="${rmVO.rmId}"><i class="bi bi-eye-fill me-1"></i>방 상세정보 보기</a>
												</div>

												<!-- Amenities -->
												<ul class="nav nav-divider mb-2">
													<li class="nav-item">${rmVO.rmBed}</li>
												</ul>

												<p class="text-success mb-0">적정 수용 인원: ${rmVO.stdPp}명</p>
												<p class="text-success mb-0">최대 수용 인원: ${rmVO.maxPp}명</p>
												<fmt:formatNumber var="formattedExFee" value="${rmVO.ppExFee}" pattern="#,###,###"/>
												<p class="text-success mb-0">1인당 추가 비용: ${formattedExFee}원</p>
												
												<!-- Price and Button -->
												<div class="d-sm-flex justify-content-sm-between align-items-center mt-auto">
													<!-- Price -->
													<div class="d-flex align-items-center">
													<fmt:formatNumber var="formattedRmPr" value="${rmVO.rmPr}" pattern="#,###,###"/>
														<h5 class="fw-bold mb-0 me-1">${formattedRmPr}원</h5>
														<span class="mb-0 me-2">/1박</span>
													</div>
													<!-- 버튼 -->
													<div class="col-7 d-flex align-items-center justify-content-end mt-3 mt-sm-0">
														<select id="rmNumSelect" class="js-choice border-0" >
															<option value="">방 번호</option>
															<c:forEach var="rmDeVO" items="${rmVO.rmDeVOList}" varStatus="stat">
															<option value="${rmDeVO.rmNum}">${rmDeVO.rmNum}호</option>
															</c:forEach>
														</select>
														<button type="button" class="btnCart btn btn-secondary mb-0 mx-1" data-rmnm="${rmVO.rmNm}" data-rmpr="${rmVO.rmPr}"><i class="bi bi-cart fa-fw"></i></button>   
														<button type="submit" class="btnRsv btn btn-primary mb-0">예약</button>    
													</div>                  
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--form에 넘겨주기 위해   -->
								<input type="hidden" value="${busiVO.busiId}" name="busiId">
								<input type="hidden" value="${rmVO.rmId}" name="rmId">
								<input type="hidden" id="rmNum" name="rmNum">
								<!-- Room item END -->
								<sec:csrfInput />
								</form>
								</c:forEach>
								
								<!--이미예약된 객실이지만  보여주기..  -->
								<c:forEach var="rsvedRmVO" items="${rsvedRmVOList}" varStatus="stat">
								<!-- Room item START -->
								<div class="card shadow p-3" style="background-color:#E6E6E6">
									<div class="row g-4" >
									
										<!-- Card img -->
										<div class="col-md-5 position-relative">

											<!-- Overlay item -->
											<div class="position-absolute top-0 start-0 z-index-1 mt-3 ms-4">

											</div>

											<!-- Slider START -->
											<div class="tiny-slider arrow-round arrow-xs arrow-dark overflow-hidden rounded-2" style="height:12rem;">
												<div class="tiny-slider-inner" data-autoplay="true" data-arrow="true" data-dots="false" data-items="1">
													<c:forEach var="attachDeVO" items="${rsvedRmVO.attachDeVOList}" varStatus="stat"> 
														<!-- Image item -->
														<div><img src="/resources/upload/rm${attachDeVO.savePath}" alt="Card image"></div>
	
													</c:forEach>
												</div>
											</div>
											<!-- Slider END -->

										</div>

										<!-- Card body -->
										<div class="col-md-7">
											<div class="card-body d-flex flex-column h-100 p-0">
					
												<!-- Title -->
												<div class="d-flex justify-content-between mt-2">
													<h5 class="card-title"><a href="#">${rsvedRmVO.rmNm}</a></h5>
													<a class="btnRoomDetail" href="#" class="btn btn-link text-decoration-underline p-0 mb-0 mt-3" data-bs-toggle="modal" data-bs-target="#roomDetail" data-value="${rmVO.rmId}"><i class="bi bi-eye-fill me-1"></i>방 상세정보 보기</a>
												</div>

												<!-- Amenities -->
												<ul class="nav nav-divider mb-2">
													<li class="nav-item">${rsvedRmVO.rmBed}</li>
												</ul>

												<p class="text-success mb-0">적정 수용 인원: ${rsvedRmVO.stdPp}명</p>
												<p class="text-success mb-0">최대 수용 인원: ${rsvedRmVO.maxPp}명</p>
												<p class="text-success mb-0">1인당 추가 비용: ${rsvedRmVO.ppExFee}원</p>
												
												
												<!-- Price and Button -->
												<div class="d-sm-flex justify-content-sm-between align-items-center mt-auto">
													<!-- Button -->
													<div class="d-flex align-items-center">
														<fmt:formatNumber var="formattedRsvedRmPr" value="${rsvedRmVO.rmPr}" pattern="#,###,###"/>
														<h5 class="fw-bold mb-0 me-1">${formattedRsvedRmPr}원</h5>
														<span class="mb-0 me-2">/1박</span>
													</div>
													<!-- Price -->
													<div class="col-6 d-flex align-items-center mt-3 mt-sm-0">
														<select id="rmNumSelect" class="js-choice border-0" >
															<option value="">방 번호</option>
															<c:forEach var="rmDeVO" items="${rsvedRmVO.rmDeVOList}" varStatus="stat">
															<option value="${rmDeVO.rmNum}">${rmDeVO.rmNum}호</option>
															</c:forEach>
														</select>
														<button type="button" class="btn btn-danger mb-0 mx-1" disabled="true">예약불가</button>    
														
													</div>                  
													
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Room item END -->
								
								</c:forEach>
								
							</div>
						</div>
						<!-- Card body END -->
						</div>
					</div>	
					<!-- 객실 END -->
					
					
					<!--리뷰 START -->
					<div class="tab-pane fade" id="tour-pills-tab4" role="tabpanel" aria-labelledby="tour-pills-tab4">
						<div class="card bg-transparent p-0">
						<!-- Card header -->
						<div class="card-header border-bottom bg-transparent px-0 pt-0">
							<h3 class="card-title mb-0">사용자 이용 후기</h3>
						</div>

						<!-- Card body START -->
						<div class="card-body pt-4 p-0">
							<!-- Progress bar and rating START -->
							<div class="card bg-light p-4 mb-4">
								<div class="row g-4 align-items-center">
									<!-- Rating info -->
									<div class="col-md-4">
										<div class="text-center">
											<!-- Info -->
											<h2 class="mb-0">${busiVO.avgSt}</h2>
											<p class="mb-2">${rvwTotal}개의 리뷰가 있습니다</p>
											<!-- Star -->
											<ul class="list-inline mb-0">
												<c:set var="avgStInt" value="${fn:split(busiVO.avgSt, '.')[0]}" />
												<c:set var="avgStDeci" value="${busiVO.avgSt-avgStInt}"/>
												<c:if test="${avgStInt>=1}">
													<c:forEach begin="1" end="${avgStInt}">
												   		<li class="list-inline-item me-0"><i class="fa-solid fa-star text-warning"></i></li>
													</c:forEach>
												</c:if>
												<c:if test="${avgStDeci >= 0.5 && avgStDeci<1}">
												    <li class="list-inline-item me-0"><i class="fa-solid fa-star-half-alt text-warning"></i></li>
												</c:if>
												<c:if test="${avgStDeci < 0.5  && avgStDeci>0}">
											   		<li class="list-inline-item me-0"><i class="fa-regular fa-star text-warning"></i></li>
												</c:if>
												<c:if test="${busiVO.avgSt==0}">
											   		<li class="list-inline-item me-0"><i class="fa-regular fa-star text-warning"></i></li>
												</c:if>
											</ul>
										</div>
									</div>

									<!-- Progress-bar START -->
									<div class="col-md-8">
										<div class="card-body p-0">
											<div class="row gx-3 g-2 align-items-center">
												<!-- Progress bar and Rating -->
												<div class="col-3 col-sm-2 text-end">
													<span class="h6 fw-light mb-0">4-5점</span>
												</div>
												<div class="col-6 col-sm-8">
													<!-- Progress item -->
													<div class="progress progress-sm bg-warning bg-opacity-15">
														<div class="progress-bar bg-warning" role="progressbar" style="width: ${ratioMap.get('ST4')}%" aria-valuenow="${ratioMap.get('ST4')}" aria-valuemin="0" aria-valuemax="100">
														</div>
													</div>
												</div>
												<!-- Percentage -->
												<div class="col-3 col-sm-2 text-end">
													<fmt:formatNumber var="ratioST4" value="${ratioMap.get('ST4')}" pattern="0.0"/>
													<span class="h6 fw-light mb-0">${ratioST4}%</span>
												</div>
												
												
												<div class="col-3 col-sm-2 text-end">
													<span class="h6 fw-light mb-0">3-4점</span>
												</div>
												<!-- Progress bar and Rating -->
												<div class="col-6 col-sm-8">
													<!-- Progress item -->
													<div class="progress progress-sm bg-warning bg-opacity-15">
														<div class="progress-bar bg-warning" role="progressbar" style="width: ${ratioMap.get('ST3')}%" aria-valuenow=" ${ratioMap.get('ST3')}" aria-valuemin="0" aria-valuemax="100">
														</div>
													</div>
												</div>
												<!-- Percentage -->
												<div class="col-3 col-sm-2 text-end">
													<fmt:formatNumber var="ratioST3" value="${ratioMap.get('ST3')}" pattern="0.0"/>
													<span class="h6 fw-light mb-0">${ratioST3}%</span>
												</div>
												
												<div class="col-3 col-sm-2 text-end">
													<span class="h6 fw-light mb-0">2-3점</span>
												</div>
												<!-- Progress bar and Rating -->
												<div class="col-6 col-sm-8">
													<!-- Progress item -->
													<div class="progress progress-sm bg-warning bg-opacity-15">
														<div class="progress-bar bg-warning" role="progressbar" style="width: ${ratioMap.get('ST2')}%" aria-valuenow="${ratioMap.get('ST2')}" aria-valuemin="0" aria-valuemax="100">
														</div>
													</div>
												</div>
												<!-- Percentage -->
												<div class="col-3 col-sm-2 text-end">
													<fmt:formatNumber var="ratioST2" value="${ratioMap.get('ST2')}" pattern="0.0"/>
													<span class="h6 fw-light mb-0">${ratioST2}%</span>												</div>

												<div class="col-3 col-sm-2 text-end">
													<span class="h6 fw-light mb-0">1-2점</span>
												</div>
												<!-- Progress bar and Rating -->
												<div class="col-6 col-sm-8">
													<!-- Progress item -->
													<div class="progress progress-sm bg-warning bg-opacity-15">
														<div class="progress-bar bg-warning" role="progressbar" style="width:${ratioMap.get('ST1')}%" aria-valuenow="${ratioMap.get('ST1')}" aria-valuemin="0" aria-valuemax="100">
														</div>
													</div>
												</div>
												<!-- Percentage -->
												<div class="col-3 col-sm-2 text-end">
													<fmt:formatNumber var="ratioST1" value="${ratioMap.get('ST1')}" pattern="0.0"/>
													<span class="h6 fw-light mb-0">${ratioST1}%</span>
												</div>

												<div class="col-3 col-sm-2 text-end">
													<span class="h6 fw-light mb-0">0-1점</span>
												</div>
												<!-- Progress bar and Rating -->
												<div class="col-6 col-sm-8">
													<!-- Progress item -->
													<div class="progress progress-sm bg-warning bg-opacity-15">
														<div class="progress-bar bg-warning" role="progressbar" style="width: ${ratioMap.get('ST0')}%" aria-valuenow="${ratioMap.get('ST0')}" aria-valuemin="0" aria-valuemax="100">
														</div>
													</div>
												</div>
												<!-- Percentage -->
												<div class="col-3 col-sm-2 text-end">
													<fmt:formatNumber var="ratioST0" value="${ratioMap.get('ST0')}" pattern="0.0"/>
													<span class="h6 fw-light mb-0">${ratioST0}%</span>												</div>
											</div> <!-- Row END -->
										</div>
									</div>
									<!-- Progress-bar END -->

								</div>
							</div>
							<!-- Progress bar and rating END -->
							
							


							<!-- 리뷰 item START -->
							<c:forEach var="rvwVO" items="${rvw.content}" varStatus="stat">
							<div class="d-md-flex my-4">
								<!-- Avatar -->
								<div class="avatar avatar-lg me-3 flex-shrink-0">
									<c:if test="${rvwVO.memImg!=null }">
										<img class="avatar-img rounded-circle" src="/resources/upload/mem${rvwVO.memImg}" alt="avatar">
									</c:if>
									<c:if test="${rvwVO.memImg==null }">
										<img class="avatar-img rounded-circle" src="/resources/booking/assets/images/avatar/user.png" alt="avatar">
									</c:if>
								</div>
								<!-- Text -->
								<div>
									<div class="d-flex justify-content-between mt-1 mt-md-0 "style="width:43rem;">
										<div>
											<h6 class="me-3 mb-0">${rvwVO.memId}</h6>
											<!-- Info -->
											<ul class="nav nav-divider small mb-2">
												<fmt:formatDate var="rsvDt" value="${rvwVO.rsvDt}" pattern="Y/M/d"/>
												<li class="nav-item">${rsvDt}</li>
											</ul>
										</div>
										<!-- Review star -->
										<div class="icon-lg rounded text-bg-warning fs-6"><i class="bi bi-star-fill"></i>${rvwVO.rvwStar}</div>
									</div>
									
									<p class="mb-2">${rvwVO.rvwCntn}</p>
								 	<c:if test="${not empty rvwVO.attachVO}">
									<div class="row g-4">
										<c:forEach var="attachDeVO" items="${rvwVO.attachVO.attachDeVOList}" varStatus="stat">
											<div class="col-4 col-sm-3 col-lg-2">
												<img src="/resources/upload/rvw${attachDeVO.savePath}" class="rounded" alt="">
											</div>
										</c:forEach> 
									</div>
									</c:if>
								</div>
							</div>
						
							<!-- 사장님 댓글 START -->
							<c:if test="${rvwVO.rvwCmt!=null}">
								<div class="my-4 ps-2 ps-md-3">
									<div class="d-md-flex p-3 bg-light rounded-3">
										<img class="avatar avatar-sm rounded-circle me-3" src="/resources/booking/assets/images/avatar/user.png" alt="avatar">
										<div class="mt-2 mt-md-0">
											<h6 class="mb-1">사장님 댓글</h6>
											<p class="mb-0">${rvwVO.rvwCmt}</p>
										</div>
									</div>
								</div>	
							</c:if>
							<!-- Child review END -->

							<!-- Divider -->
							<hr>
							<!-- Review item END -->
							</c:forEach>


							<!-- 페이지 번호 -->
							<nav class="d-flex justify-content-center" aria-label="navigation">
								<ul class="pagination pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
									<li class="page-item mb-0 <c:if test='${rvw.startPage < 6}'>disabled</c:if>"><a class="page-link" href="#" tabindex="-1"><i class="fa-solid fa-angle-left"></i></a></li>
									<c:forEach var="pNo" begin="${rvw.startPage}" end="${rvw.endPage}">
									<li class="page-item mb-0 <c:if test='${rvw.currentPage eq pNo}'>active</c:if>"><a class="page-link" href="/member/acm/detail/${busiVO.busiId}?currentPage=${pNo}#tab4">${pNo}</a></li>
									</c:forEach>
									<li class="page-item mb-0 <c:if test='${rvw.endPage == rvw.totalPages}'>disabled</c:if>"><a class="page-link" href="#"><i class="fa-solid fa-angle-right"></i></a></li>
								</ul>
							</nav>
						</div>
						<!-- Card body END -->
						</div>
					</div>		
					<!-- 리뷰 END -->

					<!-- 숙소정보 START -->
					<div class="tab-pane fade" id="tour-pills-tab5" role="tabpanel" aria-labelledby="tour-pills-tab5">
						<div class="card bg-transparent p-0">
								<!-- Card header -->
						<div class="card-header border-bottom bg-transparent px-0 pt-0">
							<h3 class="mb-0">숙소 정보 및 정책</h3>
						</div>

						<!-- Card body START -->
						<div class="card-body pt-4 p-0">
							<!-- List -->
							<ul class="list-group list-group-borderless mb-2">
								<li class="list-group-item d-flex">
									<i class="bi bi-check-circle-fill me-2"></i>사업자등록번호: ${busiVO.busiNo}
								</li>
								<li class="list-group-item d-flex">
								<c:set var="formattedTel" value="${busiVO.busiTel.substring(0, 3)}-${busiVO.busiTel.substring(3, 7)}-${busiVO.busiTel.substring(7)}" />
								
									<i class="bi bi-check-circle-fill me-2"></i>전화번호: ${formattedTel}
								</li>
								<li class="list-group-item d-flex">
									<i class="bi bi-check-circle-fill me-2"></i>이메일: ${busiVO.busiEmail}
								</li>
							</ul>

							<!-- List -->
							<ul class="list-group list-group-borderless mb-2">
								<li class="list-group-item h6 fw-light d-flex mb-0">
								<% pageContext.setAttribute("replaceChar", "\n"); %>
								<c:set var="formattedbusiPcy" value="${fn:replace(busiVO.busiPcy,replaceChar, '<br>')}"/>
								
									<i class="bi bi-arrow-right me-2"></i>${formattedbusiPcy}
								</li>
							</ul>

							<!-- Important note -->
							<div class="bg-danger bg-opacity-10 rounded-2 p-3 mb-3">
								<div class="row ">
									<div class="col-2">
										<p class="text-danger">환불 수수료</p>
									</div>
									<div class="col-5">
										<p class="text-danger">체크 인  한달 전: 환불 수수료 없음</br>
										체크 인  1주 전: 결제 금액의 50%</p>
									</div>
									<div class="col-5">
										<p class="text-danger">체크 인  2주 전: 환불 수수료 30%</br>
										체크 인 4일 전: 결제 금액의 70%</p>
									</div>
								</div>
							</div>
						</div>
						<!-- Card body END -->
						</div>
					</div>	
					<!-- Content item END -->

				</div>	
			</div>
			<!-- Tabs Content END -->

			<!-- Right side content START -->
			<aside id="sideBarContainer" class="col-xl-4">
				<div id="sideBar" class="row g-4">
					<!-- Book now item START -->
					<div class="col-md-6 col-xl-12">
						<div class="card card-body border bg-transparent">
							<!-- Title -->
							<div>가장 저렴한 객실</div>
							<div class="list-inline-item me-1 h6 mb-0">${rmVOList[0].rmNm}</div>
							<div class="hstack gap-2 mb-1 justify-content-end">
							<fmt:formatNumber var="cheapRmPr" value="${rmVOList[0].rmPr}" pattern="#,###,###"/>
								<h3 class="card-title mb-0">${cheapRmPr}원</h3>
								<span class="fs-5">/1박 </span>
							</div>
							<!-- Button -->
							<div class="d-grid gap-2">
								<a id="btnRm" class="btn btn-primary" href="/member/acm/detail/${busiVO.busiId}#tab3">객실 보기</a>
							</div>

						</div>
					</div>
					<!-- Book now item END -->
							
					<!-- Help item START -->
					<div class="col-md-6 col-xl-12">
						<div class="card card-body bg-light p-4"
						<%
						  boolean isLoggedIn = (principal != null);
						  if (!isLoggedIn) {
						%>
							  hidden
						<%
						  }
						%>
						
						>
							<!-- Title -->
							<h4 class="card-title">사장님과 연락하기</h4>

							<!-- List -->
							<ul class="list-group list-group-borderless">
								<li class="list-group-item py-3">
									<h6 class="mb-0">
										<i class="bi fa-fw bi-alarm text-primary fs-5 me-2"></i>
										<c:set var="chatSt_H" value="${fn:substring(busiVO.chatSt,0,2)}" />
										<c:set var="chatSt_O" value="${fn:substring(busiVO.chatSt,4,6)}" />
										<c:set var="chatEd_H" value="${fn:substring(busiVO.chatEd,0,2)}" />
										<c:set var="chatEd_O" value="${fn:substring(busiVO.chatEd,4,6)}" />
										<span class="h6 fw-light me-1 mb-0">채팅 가능시간:</span>${chatSt_H}:${chatSt_O} - ${chatEd_H}:${chatEd_O}
									</h6>
									
								</li>

								<li class="list-group-item py-0"><hr class="my-0"></li><!-- Divider -->

								<li class="list-group-item py-3">
									<a href="/member/acm/chatting?busiNm=${busiVO.busiNm}" class="h6 mb-0">
										<i class="bi fa-fw bi-chat-left-text text-primary fs-5 me-2"></i>실시간 채팅									</a>
								</li>

								<li class="list-group-item py-0"><hr class="my-0"></li><!-- Divider -->

								<li class="list-group-item py-3">
									<a href="#" class="h6 mb-0">
										<i class="bi fa-fw bi-headset text-primary fs-5 me-2"></i>실시간 화상채팅
									</a>
								</li>

								<li class="list-group-item py-0"><hr class="my-0"></li><!-- Divider -->

								<li class="list-group-item pt-3 pb-0">
									
									<a href="#" class="h6 mb-0" data-bs-toggle="modal" data-bs-target="#msgmodal">
										<i class="bi fa-fw bi-stickies text-primary fs-5 me-2"></i>쪽지 보내기
									</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- Help item END -->
				</div>
			</aside>
			<!-- Right side content END -->

		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Tabs-content END -->
</main>
<!-- Map modal START -->
<div class="modal fade" id="mapmodal" tabindex="-1" aria-labelledby="mapmodalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<!-- Title -->
			<div class="modal-header">
				<h5 class="modal-title" id="mapmodalLabel">지도에서 보기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<!-- Map -->
			<div id="kakaoMap" class="modal-body p-0" style="width:100%;height:350px;">
			
			</div>
			<!-- Button -->
			<div class="modal-footer">
				<a class="btn btn-sm btn-primary mb-0" href="https://map.kakao.com/link/map/${busiVO.lati},${busiVO.longi}"><i class="bi fa-fw bi-pin-map-fill me-2"></i>카카오 맵에서 보기</a>
			</div>
		</div>
	</div>
</div>
<!-- Map modal END -->


<!-- Room modal START -->
<div class="modal fade" id="roomDetail" tabindex="-1" aria-labelledby="roomDetailLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content p-0">

			<!-- Title -->
			<div class="modal-header p-3">
				<h5 class="modal-title mb-0" id="roomDetailLabel">방 상세정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body p-0">

				<!-- Card START -->
				<div class="card bg-transparent p-3">
				<!-- Slider START -->
					<div class="tiny-slider arrow-round arrow-dark overflow-hidden rounded-2">
						<div class="rmImgs tiny-slider-inner" data-autoplay="true" data-arrow="true" data-dots="false" data-items="1">
					
						</div>

					</div>
				<!--Slider END -->


					<!-- Card header -->
					<div class="card-header bg-transparent pb-0">
						<h3 id="rmNm" class="card-title mb-0"></h3>
					</div>

					<!-- Card body START -->
					<div class="card-body">
						<!-- Content -->
						<p id="modal-rmDc"></p>
						
					</div>
					<!-- Card body END -->
				</div>
				<!-- Card END -->
			</div>
		</div>
	</div>
</div>
<!-- Room modal END -->

<!-- 쪽지 모달 START -->
<div class="modal fade" id="msgmodal" tabindex="-1" aria-labelledby="msgmodalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-md">
		<div class="modal-content">
			<!-- Title -->
			<div class="modal-header">
				<h5 class="modal-title" id="msgmodalLabel">쪽지</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<!-- Map -->
			<div class="modal-body">
				<table>
					<tr>
						<td>받는 업체 :</td>
						<td id="val">${busiVO.busiNm}</td>
					</tr>
				</table>
				<br/>
				<textarea id="ta" cols="42" rows="10" placeholder="쪽지 내용을 입력해주세요."></textarea>
			</div>
			<!-- Button -->
			<div class="modal-footer">
					<button type="button" onclick="msgInsert()" class="btn btn-primary" data-dismiss="modal">쪽지 보내기</button>
					
				</div>
		</div>
	</div>
</div>
<!-- 쪽지 모달 END -->



<!--토스트 START  -->
 <div id="toastRmNum" class="toast" data-autohide="false">
    <div class="toast-body">
		방 번호를 선택해 주세요 
    </div>
</div>
<!--토스트 END  -->


<!--링크 복사 토스트 START  -->
<div id="toastCopyLink" class="toast"  data-autohide="false">
    <div class="toast-body">
		URL이 복사 되었습니다.
    </div>
</div>
<!--링크 복사 토스트 END  -->

<!-- 토스트 START  -->
<div id="toasttoast" class="toast" data-autohide="false">
    <div class="toast-body">
		안녕~~
    </div>
</div>
<!--토스트 END  -->

</body>
