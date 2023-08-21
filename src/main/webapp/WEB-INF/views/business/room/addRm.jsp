<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<head>
<title>Booking - main</title>
<script type="text/javascript">
$(function(){
	$("#input_imgs").on("change",handleImgFileSelect);
	function handleImgFileSelect(e){
		console.log("개똥이");
		let files = e.target.files;
		let fileArr = Array.prototype.slice.call(files);
		let cnt = 1;

		fileArr.forEach(function(f){
			//이미지 파일이 아닌 경우 이미지 미리보기 실패처리
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다.");
				//함수 종료
				return;
			}
			
			let obj = $("#divImg0"+cnt);
			
			let reader = new FileReader();
			reader.onload = function(e){
				
				obj.css("background-image","url("+e.target.result+")");
			}
			reader.readAsDataURL(f);
			
			console.log("cnt : " + cnt);
			
			cnt++;
		});//end forEach
		
	}
	
	$("#default1").val("");
	$("#default2").val("");
	$("#default3").val("");
	$("#default4").val("");
	$("#default5").val("");

	$("#success").on("click",function(){
		
		alert("성공적으로 방이 등록되었습니다.");
	});
	
		
	
});
</script>

</head>
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
							<div class="mb-2 mb-lg-0">
								<h1 class="fs-2">방 등록</h1>
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
					<div class="col-md-6">
							<div id="divImg01" 
								class="card card-grid-lg card-element-hover card-overlay-hover overflow-hidden"
								style="background-image: url(/resources/booking/assets/images/gallery/13.jpg); background-position: center ; background-size: cover;">
							</div>
					</div>

					<div class="col-md-6">
						<!-- Card item START -->
						<div class="row g-2">
							<!-- Image -->
							<div class="col-6">
									<div id="divImg02" 
										class="card card-grid-sm card-element-hover card-overlay-hover overflow-hidden"
										style="background-image: url(/resources/booking/assets/images/gallery/12.jpg); background-position: center ; background-size: cover;">
										<!-- Card hover element -->
									</div>
							</div>
							<div class="col-md-6">
								<div  id="divImg03" class="card card-grid-sm card-overlay-hover overflow-hidden"
									style="background-image: url(/resources/booking/assets/images/gallery/15.jpg); background-position: center ; background-size: cover;">
									<!-- Background overlay -->
									<!-- Overlay text -->
								</div>
							</div>

							<!-- Image -->
							<div class="col-md-6">
									<div id="divImg04" 
										class="card card-grid-sm card-element-hover card-overlay-hover overflow-hidden"
										style="background-image: url(/resources/booking/assets/images/category/hotel/resort/03.jpg); background-position: center ; background-size: cover;">
									</div>
								</a>
							</div>

							<!-- Images -->
							<div class="col-md-6">
								<div  id="divImg05" class="card card-grid-sm card-overlay-hover  overflow-hidden"
									style="background-image: url(/resources/booking/assets/images/gallery/16.jpg); background-position: center; background-size: cover;">
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
						<h5 class="mb-0">객실 등록</h5>
					</div>

					<!-- Card body START -->
					<div class="card-body">
						<!-- Form START -->
							
						<form:form  class="row g-3" modelAttribute="bsRmVO" action="/business/room/addRmPost?${_csrf.parameterName}=${_csrf.token}" method="post" id="regist"
						enctype="multipart/form-data">


							<!-- Profile photo -->
							<label class="form-label"><span class="text-danger">객실
									사진을 등록해주세요*</span></label>
							<div style="display: flex; justify-content: space-between;">
								<div class="filebox " >
									<label class="btn btn-sm btn-primary-soft mb-0" for="input_imgs" >사진 등록</label>
									<input class="form-control d-none" type="file" name="uploads" id="input_imgs" multiple />
								</div>
							</div>

							<!-- Name -->
							<div class="col-md-6">
								<label class="form-label">방 이름<span class="text-danger">*</span></label>
								<form:input path="rmNm"  class="form-control"
									placeholder="10글자 이내로 작성하세요" />

							</div>

							<!-- Email -->
							<div class="col-md-6">
								<label class="form-label">방 번호<span class="text-danger">*</span></label>
								<form:input path="rmNum"  class="form-control " id="default1" />
							</div>
							<div class="col-md-6">
								<label class="form-label">방 가격<span class="text-danger">*</span></label>
								<form:input path="rmPr"  class="form-control" id="default2"/>

							</div>
							<div class="col-md-6">
								<label class="form-label">침대 갯수<span class="text-danger">*</span></label>
								<form:input path="rmBed"  class="form-control"
									placeholder="ex)퀸 2, 싱글 2"/>
							</div>
							<div class="form-group col-md-2">
								<label for="inputEmail4">기본인원<span class="text-danger">*</span></label></label>
								<form:input path="stdPp"  class="form-control" id="default3"
									placeholder="ex) 5"/>
							</div>
							<div class="form-group col-md-2">
								<label for="inputPassword4">최대인원<span
									class="text-danger">*</span></label>
									 <form:input path="maxPp" 
									class="form-control" id="default4" placeholder="ex) 7"/>
							</div>
							<div class="form-group col-md-2">
								<label for="inputPassword4">추가비용(1인 기준)<span
									class="text-danger">*</span></label>
									<form:input path="ppExFee" 
									class="form-control" id="default5" placeholder="ex) 5000"/>
							</div>


							<div class="form-group">
								<label for="exampleFormControlTextarea1">방 정보</label>
								<form:textarea path="rmDc" class="form-control" id="rmDc" rows="3"
									placeholder="방 상세정보입력 (10~200자 이내로 작성해주세요)"/>
							</div>

							<!-- Mobile -->
							<button type="submit" id="success" class="btn btn-primary">등록하기</button>
							<sec:csrfInput />
						</form:form>

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