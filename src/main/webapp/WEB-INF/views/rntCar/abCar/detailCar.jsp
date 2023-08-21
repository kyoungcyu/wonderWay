<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<head>
<title>Booking - main</title>
<script type="text/javascript">
$(function(){
	$("#input_imgs").on("change",handleImgFileSelect);
	function handleImgFileSelect(e){
		let files = e.target.files;
		//이미지가 여러개가 있을 수 있으므로 이미지들을 분리해서 배열로 만듦
		let fileArr = Array.prototype.slice.call(files);
		let cnt = 1;
		//파일 타입의 배열 반복. f : 배열 안에 들어있는 각각의 이미지 파일 객체
		fileArr.forEach(function(f){
			//이미지 파일이 아닌 경우 이미지 미리보기 실패처리
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다.");
				//함수 종료
				return;
			}
			
			let obj = $("#divImg0"+cnt);
			
			//이미지 객체를 읽을 자바스크립트의 reader 객체 생성
			let reader = new FileReader();
			//e : reader가 이미지 객체를 읽는 이벤트
			reader.onload = function(e){
				//e.target : 이미지 객체
				//e.target.result : reader가 이미지를 다 읽은 결과
// 				let img_html = "<img src=\"" + e.target.result + "\" />";
				//div 사이에 이미지가 렌더링되어 화면에 보임
				//객체.append : 누적, .html : 새로고침, innerHTML : J/S
				obj.css("background-image","url("+e.target.result+")");
			}
			//f : 이미지 파일 객체를 읽은 후 다음 이미지 파일(f)을 위해 초기화함
			reader.readAsDataURL(f);
			
			console.log("cnt : " + cnt);
			
			cnt++;
		});//end forEach
		
	}
	
	// 수정하기 
	$("#detail").on("click",function(){
		$("#p1").css("display", "none");
		//변경모드
		$("#p2").css("display", "block");
		$("#carCode").removeAttr("readOnly");
		$("#carKnd").removeAttr("readOnly");
		$("#carNum").removeAttr("readOnly");
		$("#carYr").removeAttr("readOnly");
		$("#carFee").removeAttr("readOnly");
		$("#maxPp").removeAttr("readOnly");
		$("#fuelTy").removeAttr("readOnly");
		$("#carOp").removeAttr("readOnly");
	});
	
	$("#ok").on("click",function(){
		var carCode= $("#carCode").val();
		var carKnd = $("#carKnd").val();
		var carYr = $("#carYr").val();
		var carFee = $("#carFee").val();
		var maxPp = $("#maxPp").val();
		var fuelTy = $("#fuelTy").val();
		var carOp = $("#carOp").val();
		
		var data ={
				"carCode":carCode,
				"carKnd":carKnd,
				"carYr":carYr,
				"carFee":carFee,
				"maxPp":maxPp,
				"fuelTy":fuelTy,
				"carOp":carOp
		}
		console.log("data:"+data);
		
		$.ajax({
			url:"/rntCar/abCar/detailCarPost",
			data:JSON.stringify(data),
			type:"POST",
			dataType:"json",
			contentType:"application/json;charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(data) {
				console.log("data: " + data);
				alert("성공적으로 변경되었습니다.");
				window.location = "detailCar?carNum="+$("#carNum").val();

				
			}
				
			
		});
		
		
	});
		
	
});
</script>

</head>
<style>
  /* 이미지 컨테이너를 최대 높이로 설정 */
  .col-md-6 {
    max-height: 400px; /* 원하는 최대 높이 값으로 변경 가능 */
  }
  
  /* 이미지가 컨테이너에 가득 차도록 설정 */
  .card-overlay-hover {
    width: 100%;
    height: 100%;
    background-position: center;
    background-size: cover;
  }
</style>
<body>

	<main>



		<!-- =======================
Main Title START -->
		<section class="py-0 pt-sm-5">
			<div class="container position-relative">
				<!-- Title and button START -->
				<div class="row mb-3">
					<div class="col-12">
						<!-- Meta -->
						<div class="d-lg-flex justify-content-lg-between mb-1">
							<!-- Title -->
							<c:set var="carVO" value="${data}"/>
							<div class="mb-2 mb-lg-0">
								<h1 class="fs-2">정보 관리</h1>
							</div>

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
		<section class="card-grid pt-0">
			<div class="container">
				<div class="row g-2">
					<!-- Image -->
<%-- 					<c:set var="img" value="${carVO.attachDeVOList}"/> --%>
					<div class="col-md-6">
							<div id="divImg01" 
								class="card card-grid-lg card-element-hover card-overlay-hover overflow-hidden"
								style="background-image: url(${carVO.carImg}); background-position: center ; background-size: cover;">
							</div>
					</div>

					<div class="col-md-6">
						<!-- Card item START -->
						<div class="row g-2">
							<!-- Image -->
							<div class="col-6">
									<div id="divImg02" 
										class="card card-grid-sm card-element-hover card-overlay-hover overflow-hidden"
										style="background-image: url(); background-position: center ; background-size: cover;">
										<!-- Card hover element -->
									</div>
							</div>
							<div class="col-md-6">
								<div  id="divImg03" class="card card-grid-sm card-overlay-hover overflow-hidden"
									style="background-image: url(); background-position: center ; background-size: cover;">
									<!-- Background overlay -->
									<!-- Overlay text -->
								</div>
							</div>

							<!-- Image -->
							<div class="col-md-6">
									<div id="divImg04" 
										class="card card-grid-sm card-element-hover card-overlay-hover overflow-hidden"
										style="background-image: url(); background-position: center ; background-size: cover;">
									</div>
								</a>
							</div>

							<!-- Images -->
							<div class="col-md-6">
								<div  id="divImg05" class="card card-grid-sm card-overlay-hover  overflow-hidden"
									style="background-image: url(); background-position: center; background-size: cover;">
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
About hotel START -->
		<section class="pt-0">
			<div class="container" data-sticky-container>

				<div class="card shadow">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="mb-0">렌터카 정보 변경</h5>
					</div> 

					<!-- Card body START -->
						<div class="card-body">
						<!-- Form START -->
							<form  class="row g-3" id="frm" >
							
							<label class="form-label"><span class="text-danger">차량
									사진을 등록해주세요*</span></label>
							<div style="display: flex; justify-content: space-between;">
								<div class="filebox " >
									<label class="btn btn-sm btn-primary-soft mb-0" for="input_imgs" >사진 등록</label>
									<input class="form-control d-none" type="file" name="uploads" id="input_imgs" multiple />
								</div>
							</div>
	
							<!-- Name -->
							<div class="col-md-6">
								<label class="form-label">렌터카 종류명<span class="text-danger">*</span></label>
								<input type="text"  class="form-control"
									placeholder="ex) 쏘나타  " id="carKnd" value="${carVO.carKnd}" readonly/>

							</div>

							<!-- Email -->
							<div class="col-md-6">
								<label class="form-label">분류<span class="text-danger">*</span></label>
								<input type="text"  class="form-control "id="carCode"  value="${carVO.carCode}" readonly/>
							</div>
							<div class="col-md-6">
								<label class="form-label">주차 번호판<span class="text-danger">*</span></label>
								<input type=""text""  class="form-control" id="carNum" value="${carVO.carNum}" readonly/>

							</div>
							<div class="col-md-6">
								<label class="form-label">금액/ Hour<span class="text-danger">*</span></label>
								<input type="number"  class="form-control" id="carFee" value="${carVO.carFee}" placeholcder="1시간 기준 비용" readonly/>
							</div>
							<div class="form-group col-md-2">
								<label for="inputEmail4">탑승 인원<span class="text-danger">*</span></label></label>
								<input type="text"  class="form-control" id="maxPp" value="${carVO.maxPp}"
									placeholder="ex) 5" readonly/>
							</div>
							<div class="form-group col-md-2">
								<label for="inputEmail4">연식<span class="text-danger">*</span></label></label>
								<input type="number"  class="form-control" id="carYr" value="${carVO.carYr}"
									placeholder="ex) 7" readonly/>
							</div>
							<div class="form-group col-md-2">
								<label for="inputEmail4">연료<span class="text-danger">*</span></label></label>
								<input type="text"  class="form-control" id="fuelTy" value="${carVO.fuelTy}" 
									placeholder="ex) 5000" readonly/>
							</div>

							<div class="form-group">
							    <label for="exampleFormControlTextarea1">옵션 정보</label>
							    <textarea class="form-control" id="carOp"  rows="3"  placeholder="방 상세정보입력 (10~200자 이내로 작성해주세요)" readonly>${carVO.carOp}</textarea>
						 	</div>

							<!-- Mobile -->
							<div class="col-12 text-end" id="p1">		
								<button type="button" id="detail" class="btn btn-primary">변경하기</button>
							</div>
							<div class="col-12 text-end" id="p2" style="display: none;">
								<button type="button" class="btn btn-primary mb-0" id="ok">확인</button>
								<button type="button" class="btn btn-primary mb-0" id="back"
										onclick="javascript:location.href='/rntCar/abCar/detailCar?carNum=${carVO.carNum}'">취소</button>
							</div>
							<sec:csrfInput />
						</form>

						<!-- Button -->
					</div>
					<!-- Form END -->
				</div>
				<!-- Card body END -->
			</div>
			</div>
		</section>
		<!-- =======================
About hotel END -->

	</main>

</body>
</html>